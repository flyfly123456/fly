<?php
namespace app\admin\controller;
use \think\Controller;
use \think\Request;
use \think\Db;
use \think\Session;
use app\admin\model\Years;
use app\admin\model\Calendar;

class Report extends Base
{
    public function attendance_report()
    {
        return $this->fetch('attendance_report');
    }

    //考勤报表
    public function attendance_report_info()
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

        $list=Db::name('full_years_dates')->whereTime('dates', '<', date("Y-m-d",time()))->order('id desc')->select();

        //请假日期
        $leave=Db::name('leave')->where(['status'=>'2'])->select();

        if(empty($list)){
            $data['status']=0;
            $data['msg']="暂无数据...";
            return json($data);
        }

        //时间间隔
        $start_intval=60*60*9;
        $end_intval=60*60*18;

        $all_admin=Db::name('admin')->where('is_available','1')->select();
        $info=array();

        foreach ($all_admin as $kk => $vv) {
            # code...
            $attendance=Db::name('attendance')->where(['admin_id'=>$vv['id']])->select();

            foreach ($list as $key => $value) {
                $start=intval($list[$key]['dates'])+$start_intval;
                $end=intval($list[$key]['dates'])+$end_intval;
                //获取部门
                $department=Db::name('department')->where('id',$vv['department_id'])->find();

                $list[$key]['department']=$department['name'];
                //获取名称
                $admin=Db::name('admin')->where('id',$vv['id'])->find();
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
                                $list[$key]['desc']="在正常时间内打卡";
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
                if(isset($value['dates'])){
                    $list[$key]['dates']=$value['dates'];
                }

                //判断是否休息日
                if($value['is_holiday']=='1'){
                    $list[$key]['status']="休息日";
                    $list[$key]['desc']="休息日无需打卡";
                }

                //判断是否请假
                if($list[$key]['status']=="异常"){

                    foreach ($leave as $vvv) {
                        # code...
                        if($list[$key]['dates'] >= $vvv['start_date'] && $list[$key]['dates'] <= $vvv['end_date']){
                            $list[$key]['status']="已请假";
                            $list[$key]['desc']="工作日已请假";
                        }
                    }
                }
                

            }

            array_push($info, $list);
        }

        $report=array();
        foreach ($info as $key => $value) {
            # code...
            foreach ($value as $k => $v) {
                # code...
                array_push($report, $v);
            }
        }

        foreach ($report as $key => $value) {
            # code...
            unset($report[$key]['id']);
            unset($report[$key]['admin_id']);
            $report[$key]['id']=$key+1;
            $report[$key]['dates']=$value['dates'];
        }

        //开启事务
        Db::startTrans();
        try{
            
            $delete_all=Db::name('attendance_report')->where('id','>=','0')->delete();

            foreach ($report as $key => $value) {
                # code...
                $rows=Db::name('attendance_report')->insert($value);
            }

            if(!$delete_all || !$rows){

                //  抛出异常
                throw new \Exception("初始化失败，请稍后再试...");
            }else{
                // 提交事务
                Db::commit();
            }

        }catch(\Exception $e){
            // 回滚事务
            Db::rollback();
            $data['status']="0";
            $data['msg']=$e->getMessage();
            return json($data);
        }

        $count=Db::name('attendance_report')->where($where)->count();

        $report=Db::name('attendance_report')->page($page,$limit)->where($where)->order('id desc,dates desc')->select();

        foreach ($report as $key => $value) {
            # code...
            $report[$key]['dates']=date('Y-m-d',$value['dates']);
        }

        $arr=array();
        $arr['code']=0;
        $arr['msg']="";
        $arr['count']=$count;
        $arr['data']=$report;
        
        return json_decode(json_encode($arr));
    }

    
}
