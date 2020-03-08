<?php
namespace app\admin\controller;
use \think\Controller;
use \think\Request;
use \think\Db;
use \think\Session;
use app\admin\model\Years;
use app\admin\model\Calendar;

class Attendance extends Base
{
    public function attendance_list()
    {
    	return $this->fetch('attendance_list');
    }

    //考勤记录
    public function attendance_list_info()
    {
		$page=input("get.page")?input("get.page"):1;
		$page=intval($page);
		$limit=input("get.limit")?input("get.limit"):1;
		$limit=intval($limit);
		$limit=input('limit');

		$where=[];
		//判断搜索
		$post = $this->request->param();

		if(isset($post['keywords']) && isset($post['modules'])){

		    if(empty($post['keywords']) && empty($post['modules'])){
		        unset($post['keywords']);
		        unset($post['modules']);
		        $data['status']=0;
		        $data['msg']="暂无数据...";
		        return json($data);
		    }
		    
		    if($post['modules']=="status"){
		        if($post['keywords']=="已启用"){
		            $post['keywords']=1;
		        }elseif($post['keywords']=="未启用"){
		            $post['keywords']=0;
		        }else{
		           $data['status']=0;
		           $data['msg']="暂无数据...";
		           return json($data); 
		        }
		        
		    }

		    $where[$post['modules']] = ['like', '%' . $post['keywords'] . '%'];
		    
		}

		$count=Db::name('full_years_dates')->where($where)->whereTime('dates', 'between', [Session::get('login.create_time'),date("Y-m-d",time())])->count();

		$list=Db::name('full_years_dates')->page($page,$limit)->where($where)->whereTime('dates', 'between', [Session::get('login.create_time'),date("Y-m-d",time())])->order('id desc')->select();

		if(empty($list)){
		    $data['status']=0;
		    $data['msg']="暂无数据...";
		    return json($data);
		}

        //时间间隔
		$start_intval=60*60*9;
		$end_intval=60*60*18;

        $attendance=Db::name('attendance')->where(['admin_id'=>Session::get('login.id')])->select();

        //请假日期
        $leave=Db::name('leave')->where(['admin_id'=>Session::get('login.id'),'status'=>'2'])->select();

		foreach ($list as $key => $value) {
            $start=intval($list[$key]['dates'])+$start_intval;
            $end=intval($list[$key]['dates'])+$end_intval;
            //获取部门
            $department=Db::name('department')->where('id',Session::get('login.department_id'))->find();
            $list[$key]['department']=$department['name'];
            //获取名称
            $admin=Db::name('admin')->where('id',Session::get('login.id'))->find();
            $list[$key]['admin']=$admin['name'];
            
            foreach ($attendance as $k => $v) {
                
                if($value['dates']==$v['dates']){
                    
                    if(isset($v['start']) && isset($v['end']) && $v['start']!="" && $v['end']!=""){
                        //迟到时间
                        $late=$v['start']-$start;
                        //早退时间
                        $ago=$end-$v['end'];
                        
                        if($v['start'] <= $start && $v['end'] >= $end){
                            $list[$key]['status']="正常";
                            $list[$key]['desc']="正常上下班打卡";
                        }elseif($v['start'] >= $start && $v['end'] >= $end){
                            
                            $list[$key]['status']="异常";
                            $list[$key]['desc']="迟到".Years::time2string($late);
                        }elseif($v['start'] <= $start && $v['end'] <= $end){

                            $list[$key]['status']="异常";
                            $list[$key]['desc']="早退".Years::time2string($ago);
                        }else{
                            $list[$key]['status']="异常";
                            $list[$key]['desc']="迟到".Years::time2string($late)."早退".Years::time2string($ago);
                        }
                    }

                    //获取上班日期
                    if(isset($v['start']) && $v['start']!="" && $v['start']!=null){
                        $arr=explode(" ", date('Y-m-d H:i:s',$v['start']));
                        $list[$key]['start']=$arr[1];
                        
                    }else{
                        $list[$key]['start']="";
                    }

                    //获取下班日期
                    if(isset($v['end']) && $v['end']!="" && $v['end']!=null){

                        $arr=explode(" ", date('Y-m-d H:i:s',$v['end']));
                        $list[$key]['end']=$arr[1];

                    }else{
                        $list[$key]['end']="";
                    }
                }
            }

            if(!isset($list[$key]['start']) || $list[$key]['start']==""){

                $list[$key]['start']="未打卡";
                $list[$key]['desc']="未在规定时间打卡";
                $list[$key]['status']="异常";

            }

            if(!isset($list[$key]['end']) || $list[$key]['end']==""){

                $list[$key]['end']="未打卡";
                $list[$key]['desc']="未在规定时间打卡";
                $list[$key]['status']="异常";

            }

            //转化今日时间
            $list[$key]['dates']=date('Y-m-d',$value['dates']);

            //判断是否休息日
            if($value['is_holiday']=='1'){
                $list[$key]['status']="休息日";
                $list[$key]['desc']="休息日无需打卡";
            }

            //判断是否请假
            if($list[$key]['status']=="异常"){

                foreach ($leave as $vv) {
                    # code...
                    if(strtotime($list[$key]['dates']) >= $vv['start_date'] && strtotime($list[$key]['dates']) <= $vv['end_date']){
                        $list[$key]['status']="已请假";
                        $list[$key]['desc']="工作日已请假";
                    }
                }
            }

        }


		$arr=array();
		$arr['code']=0;
		$arr['msg']="";
		$arr['count']=$count;
		$arr['data']=$list;
		
		return json_decode(json_encode($arr));
    }

    //上下班打卡
    public function clock()
    {
    	$post = $this->request->param();

    	if(isset($post['clock']) && $post['clock']=='1'){

    		$rest=Db::name('attendance')->where(['dates'=>strtotime(date("Y-m-d"),time()),'admin_id'=>Session::get('login.id')])->find();
    		if($rest && $rest['end']==""){
    			//下班打卡
    			$arr['end']=strtotime('now');
    			$rows=Db::name('attendance')->where(['dates'=>strtotime(date("Y-m-d"),time()),'admin_id'=>Session::get('login.id')])->update($arr);
    			if($rows){
    				$data['status']=1;
                    $data['msg']="打卡成功...";
    				$data['working']=0;
    				return json($data);
    			}else{
    				$data['status']=0;
    				$data['msg']="打卡失败，请重试...";
    				return json($data);
    			}

    		}elseif(!$rest){
    			//上班打卡
    			$arr['admin_id']=Session::get('login.id');
    			$arr['department_id']=Session::get('login.department_id');
    			$arr['dates']=strtotime(date("Y-m-d"),time());
    			$arr['start']=strtotime('now');
    			$rows=Db::name('attendance')->insert($arr);
    			if($rows){
    				$data['status']=1;
    				$data['msg']="打卡成功...";
                    $data['working']=1;
    				return json($data);
    			}else{
    				$data['status']=0;
    				$data['msg']="打卡失败，请重试...";
    				return json($data);
    			}
    		}else{
    			$data['status']=1;
    			$data['msg']="打卡成功...";
    			return json($data);
    		}
    		
    	}

    	$rest=Db::name('attendance')->where(['dates'=>strtotime(date("Y-m-d"),time()),'admin_id'=>Session::get('login.id')])->find();

    	$this->assign('rest',$rest);
        
        return $this->fetch('clock');
    }

    //清除异常
    public function clear_exception()
    {
        $dates=strtotime(input('dates'));
        
        $rows=Db::name('admin')->where('id','<>',Session::get('login.id'))->select();
        
        $post = $this->request->param();

        if(isset($post['title']) && isset($post['dates']) && isset($post['remark'])){
            $arr['title']=$post['title'];
            $arr['desc']=$post['remark'];
            $arr['status']='0';
            $arr['create_time']=time();
            $arr['dates']=$post['dates'];
            $arr['admin_id']=Session::get('login.id');
            $arr['department_id']=Session::get('login.department_id');

            $rows=Db::name('apply_clock')->insertGetId($arr);

            if($rows){
                $data['status']=1;
                $data['msg']="操作成功...";
                $data['id']=$rows;
                return json($data);
            }else{
                $data['status']=0;
                $data['msg']="操作失败...";
                return json($data);
            }
        }

        $info=Db::name('attendance')->where(['dates'=>$dates,'admin_id'=>Session::get('login.id')])->find();

        $this->assign('id',$info['id']);
        $this->assign('dates',$dates);
        $this->assign('name','apply_clock');
        $this->assign('title','清除考勤异常');

        $this->assign('rows',$rows);

        return $this->fetch('clear_exception');
    }


    //初始化全年日期和节假日
    public function calendar()
    {
    	$year="2019";
    	$date="0101";
    	$dates_info=Years::get_dates_info($year,$date);
        $Calendar=new Calendar();
        $get_festival=Years::get_festival();
        
        $arr=array();
        foreach ($dates_info as $key => $value) {
            
            $array=explode('@', $value);
            $arr['dates']=$array[0];
            $arr['weeks']=$array[1];
            
            $dates_info[$key]=$arr;
            
            $calendar=explode('-', $dates_info[$key]['dates']);
            
            $arr['calendar']=$Calendar->convertSolarToLunar($calendar[0],$calendar[1],$calendar[2]);
            $arr['calendar']=$arr['calendar'][1].$arr['calendar'][2];
            if($dates_info[$key]['weeks']=="星期六" || $dates_info[$key]['weeks']=="星期日"){
                $arr['is_holiday']=1;
            }elseif(in_array($arr['calendar'], $get_festival) || in_array(substr($arr['dates'], strpos($arr['dates'], '-')+1), $get_festival)){
                $arr['is_holiday']=1;
            }else{
                $arr['is_holiday']=0;
            }

            $dates_info[$key]=$arr;
            $dates_info[$key]['dates']=strtotime($dates_info[$key]['dates']);
            
        }

        $rest=Db::name('full_years_dates')->select();

        if(empty($rest)){
            $rows=Db::name('full_years_dates')->insertAll($dates_info);
            if($rows){

                $data['status']=1;
                $data['msg']='初始化成功...';
                return json($data);
            }else{
                $data['status']=0;
                $data['msg']='初始化失败...';
                return json($data);
            }

        }else{

            $data['status']=1;
            $data['msg']='初始化成功...';
            return json($data);
        }

    }

    //请假类型
    public function leave_type()
    {
        return $this->fetch('leave_type');
    }

    //请假类型信息
    public function leave_type_info()
    {
        $page=input("get.page")?input("get.page"):1;
        $page=intval($page);
        $limit=input("get.limit")?input("get.limit"):1;
        $limit=intval($limit);
        $limit=input('limit');

        $where=[];
        $where['is_available']=1;
        //判断搜索
        $post = $this->request->param();

        if(isset($post['keywords']) && isset($post['modules'])){

            if(empty($post['keywords']) && empty($post['modules'])){
                unset($post['keywords']);
                unset($post['modules']);
                $data['status']=0;
                $data['msg']="暂无数据...";
                return json($data);
            }
            
            if($post['modules']=="status"){
                if($post['keywords']=="已启用"){
                    $post['keywords']=1;
                }elseif($post['keywords']=="未启用"){
                    $post['keywords']=0;
                }else{
                   $data['status']=0;
                   $data['msg']="暂无数据...";
                   return json($data); 
                }
                
            }

            $where[$post['modules']] = ['like', '%' . $post['keywords'] . '%'];
            
        }

        $count=Db::name('leave_type')->where($where)->count();

        $list=Db::name('leave_type')->page($page,$limit)->where($where)->select();

        if(empty($list)){
            $data['status']=0;
            $data['msg']="暂无数据...";
            return json($data);
        }
        
        foreach ($list as $key => $value) {
            # code...
            if($value['is_available']=='1'){
                $list[$key]['status']="正常";
            }else{
                $list[$key]['status']="删除";
            }

        }

        $arr=array();
        $arr['code']=0;
        $arr['msg']="";
        $arr['count']=$count;
        $arr['data']=$list;
        
        return json_decode(json_encode($arr));
    }

    //请假类型添加
    public function leave_type_add()
    {
        $post = $this->request->param();
        if(isset($post['name'])){
            $arr['name']=$post['name'];
            $result = $this->validate($arr,'Department');
            if(true !== $result){
                // 验证失败 输出错误信息
                $data['status']=0;
                $data['msg']="参数错误";
                return json($data);
            }
            
            $rows=Db::name('leave_type')->insert($arr);
            if($rows){
                $data['status']=1;
                $data['msg']="添加成功...";
                return json($data);
            }else{
                $data['status']=0;
                $data['msg']="添加失败...";
                return json($data);
            }
        }
        return $this->fetch();
    }

    public function leave_list()
    {
        return $this->fetch();
    }

    //请假记录
    public function leave_list_info()
    {
        $page=input("get.page")?input("get.page"):1;
        $page=intval($page);
        $limit=input("get.limit")?input("get.limit"):1;
        $limit=intval($limit);
        $limit=input('limit');

        $where=[];
        $where['admin_id']=Session::get('login.id');
        //判断搜索
        $post = $this->request->param();

        if(isset($post['keywords']) && isset($post['modules'])){

            if(empty($post['keywords']) && empty($post['modules'])){
                unset($post['keywords']);
                unset($post['modules']);
                $data['status']=0;
                $data['msg']="暂无数据...";
                return json($data);
            }
            
            if($post['modules']=="status"){
                if($post['keywords']=="已启用"){
                    $post['keywords']=1;
                }elseif($post['keywords']=="未启用"){
                    $post['keywords']=0;
                }else{
                   $data['status']=0;
                   $data['msg']="暂无数据...";
                   return json($data);
                }
                
            }

            $where[$post['modules']] = ['like', '%' . $post['keywords'] . '%'];
            
        }

        $count=Db::name('leave')->where($where)->count();

        $list=Db::name('leave')->page($page,$limit)->where($where)->select();

        if(empty($list)){
            $data['status']=0;
            $data['msg']="暂无数据...";
            return json($data);
        }
        
        foreach ($list as $key => $value) {
            
            $list[$key]['start_time']=date('Y-m-d H:i:s',$value['start_time']);
            $list[$key]['end_time']=date('Y-m-d H:i:s',$value['end_time']);
            $list[$key]['create_time']=date('Y-m-d',$value['create_time']);

            if($value['status']=='0'){
                $list[$key]['status']="未送审";
            }elseif($value['status']=='1'){
                $list[$key]['status']="已送审";
            }elseif($value['status']=='2'){
                $list[$key]['status']="已审核";
            }elseif($value['status']=='3'){
                $list[$key]['status']="已驳回";
            }elseif($value['status']=='4'){
                $list[$key]['status']="已取回";
            }

        }

        $arr=array();
        $arr['code']=0;
        $arr['msg']="";
        $arr['count']=$count;
        $arr['data']=$list;
        
        return json_decode(json_encode($arr));
    }

    //新开假条
    public function leave_add()
    {
        $rows=Db::name('leave_type')->where('is_available','1')->select();

        $post = $this->request->param();
        if(isset($post['title']) && isset($post['type']) && isset($post['start_date']) && isset($post['end_date']) && isset($post['start_time']) && isset($post['end_time']) && isset($post['duration']) && isset($post['reason'])){
            //时间间隔
            $start_intval=60*60*intval($post['start_time']);
            $end_intval=60*60*intval($post['end_time']);

            $arr['title']=$post['title'];
            $arr['type']=$post['type'];
            $arr['start_date']=strtotime($post['start_date']);
            $arr['end_date']=strtotime($post['end_date']);
            $arr['start_time']=strtotime($post['start_date'])+$start_intval;
            $arr['end_time']=strtotime($post['end_date'])+$end_intval;
            $arr['duration']=$post['duration'];
            $arr['reason']=$post['reason'];
            $arr['create_time']=time();
            $arr['admin_id']=Session::get('login.id');
            $result = $this->validate($arr,'Attendance');
            if(true !== $result){
                // 验证失败 输出错误信息
                $data['status']=0;
                $data['msg']="参数错误";
                return json($data);
            }

            $rows=Db::name('leave')->insert($arr);
            if($rows){
                $data['status']=1;
                $data['msg']="新开成功...";
                return json($data);
            }else{
                $data['status']=0;
                $data['msg']="新开失败，请稍后再试...";
                return json($data);
            }
        }

        $this->assign('rows',$rows);
        return $this->fetch();
    }

    //送审申请补卡
    public function apply_clock()
    {
        
        $post = $this->request->param();
        if(isset($post['title']) && isset($post['dates']) && isset($post['reason'])){
            $arr['title']=$post['title'];
            $arr['desc']=$post['reason'];
            $arr['status']='0';
            $arr['create_time']=time();
            $arr['dates']=strtotime($post['dates']);
            $arr['admin_id']=Session::get('login.id');
            $arr['department_id']=Session::get('login.department_id');

            $rows=Db::name('apply_clock')->insertGetId($arr);

            if($rows){
                $data['status']=1;
                $data['msg']="操作成功...";
                $data['id']=$rows;
                return json($data);
            }else{
                $data['status']=0;
                $data['msg']="操作失败...";
                return json($data);
            }

        }

        $admin=Db::name('admin')->where('is_available',1)->select();
        $this->assign('admin',$admin);
        return $this->fetch('apply_clock');
    }

    //出差记录
    public function business_list()
    {

        return $this->fetch('business_list');
    }



}
