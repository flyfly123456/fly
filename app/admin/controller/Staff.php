<?php
namespace app\admin\controller;
use \think\Controller;
use \think\Request;
use \think\Db;
use \think\Session;

class Staff extends Base
{

	public function _initialize()//_initialize与__construct有区别
	{
	    $request= Request::instance();
	    $module_name=$request->module();
	    $action=$request->action();
	    $controller=$request->controller();
	    $action=$module_name."/".$controller."/".$action;
	    parent::admin_priv($action);
	    parent::check_admin_log($action);
	    
	}

    //员工档案列表
    public function archives_list()
    {
        return $this->fetch('archives_list');
    }

    public function archives_info()
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

    	$count=Db::name('staff')->where($where)->count();

    	$list=Db::name('staff')->page($page,$limit)->where($where)->select();

    	if(empty($list)){
    	    $data['status']=0;
    	    $data['msg']="暂无数据...";
    	    return json($data);
    	}
    	
    	foreach ($list as $key => $value) {
    	    # code...
            //获取工作年限
            $list[$key]['working_life']=$this->get_working_life($value['join_time']);
            //获取入职时间
            $list[$key]['join_time']=date('Y-m-d',$value['join_time']);
            //获取学历
            $education=Db::name('education')->where('id',$value['education_id'])->find();
    	    $list[$key]['education']=$education['name'];
            //获取部门
            $department=Db::name('department')->where('id',$value['department_id'])->find();
            $list[$key]['department']=$department['name'];
            //获取职称
            $titles=Db::name('titles')->where('id',$value['titles_id'])->find();
            $list[$key]['titles']=$titles['name'];

            if($value['sex']=="0"){
    	        $list[$key]['sex']="女";
    	    }else{
    	        $list[$key]['sex']="男";
    	    }

            if($value['status']=="0"){
                $list[$key]['status']="离职";
            }else{
                $list[$key]['status']="在职";
            }

    	}

    	$arr=array();
    	$arr['code']=0;
    	$arr['msg']="";
    	$arr['count']=$count;
    	$arr['data']=$list;
    	
    	return json_decode(json_encode($arr));
    }

    //计算员工工作年限
    public function get_working_life($join_time)
    {
        $working_life=time()-$join_time;
        if($working_life<31536000){
            if($working_life<2628000){
                $working_life="未满一个月";
            }elseif($working_life<15768000){
                $working_life="未满半年";
            }else{
                $working_life=round($working_life/2628000).'个月'; 
            }
            
        }else{
            $years=round($working_life/31536000).'年';
            $month=round(($working_life%31536000)/2628000).'月';
            if($month<1){
                $working_life=$years;
            }else{
                $working_life=$years.$month;
            }
        }
        return $working_life;

    }

    //新增员工档案
    public function archives_add()
    {
    	if(Request::instance()->isAjax()){
    	    $data=Request::instance()->post();
    	    if(!empty($data)){
                $arr['full_name']=$data['full_name'];
                $arr['id_card']=$data['id_card'];
                $arr['bank_card']=$data['bank_card'];
                $arr['sex']=$data['sex'];
                $arr['education_id']=$data['education_id'];
                $arr['department_id']=$data['department_id'];
                $arr['titles_id']=$data['titles_id'];
                $arr['join_time']=strtotime($data['join_time']);
    	    	$arr['try_used']=$data['try_used'];
                $arr['status']=$data['status'];
                $arr['email']=$data['email'];
                $arr['address']=$data['address'];
                $arr['telephone']=$data['telephone'];
                $arr['job_number']=$data['job_number'];
    	    	$arr['salary_id']=$data['salary_id'];
    	    	$arr['is_available']=1;
    	    	$rows=Db::name('staff')->insert($arr);
    	    	if($rows){
    	    		$data['status']="1";
    	    		$data['msg']="档案新建成功！";
    	    		return json($data);
    	    	}else{
    	    		$data['status']="0";
    	    		$data['msg']="档案新建失败！";
    	    		return json($data);
    	    	}
    	    }
    	}
        //获取所有学历
        $rest=Db::name('education')->select();
        //获取所有职称
        $rows=Db::name('titles')->select();
        //获取所有部门
        $department=Db::name('department')->where('is_available',1)->select();
        //获取薪资制
        $salary=Db::name('salary')->select();

        $this->assign('rest',$rest);
        $this->assign('rows',$rows);
        $this->assign('department',$department);
        $this->assign('salary',$salary);
    	return $this->fetch('archives_add');
    }


    public function archives_edit()
    {
        if(Request::instance()->isAjax()){
            $data=Request::instance()->post();
            if(!empty($data)){
                $arr['id']=$data['id'];
                $arr['full_name']=$data['full_name'];
                $arr['id_card']=$data['id_card'];
                $arr['bank_card']=$data['bank_card'];
                $arr['sex']=$data['sex'];
                $arr['education_id']=$data['education_id'];
                $arr['department_id']=$data['department_id'];
                $arr['titles_id']=$data['titles_id'];
                $arr['join_time']=strtotime($data['join_time']);
                $arr['try_used']=$data['try_used'];
                $arr['status']=$data['status'];
                $arr['email']=$data['email'];
                $arr['address']=$data['address'];
                $arr['telephone']=$data['telephone'];
                $arr['job_number']=$data['job_number'];
                $arr['salary_id']=$data['salary_id'];
                $arr['is_available']=1;
                $rows=Db::name('staff')->where('id',$arr['id'])->update($arr);
                if($rows){
                    $data['status']="1";
                    $data['msg']="档案修改成功！";
                    return json($data);
                }else{
                    $data['status']="0";
                    $data['msg']="档案修改失败！";
                    return json($data);
                }
            }
        }
        
        //获取所有学历
        $rest=Db::name('education')->select();
        //获取所有职称
        $rows=Db::name('titles')->select();
        //获取所有部门
        $department=Db::name('department')->where('is_available',1)->select();
        //获取薪资制
        $salary=Db::name('salary')->select();

        $id=input('id');
        $staff=Db::name('staff')->where('id',$id)->find();
        $staff['join_time']=date('Y-m-d',$staff['join_time']);
        
        $this->assign('staff',$staff);
        $this->assign('id',$id);
        $this->assign('rest',$rest);
        $this->assign('rows',$rows);
        $this->assign('department',$department);
        $this->assign('salary',$salary);
        return $this->fetch('archives_edit');
    }

    //删除离职员工档案
    public function delete_archives()
    {
        if (Request::instance()->isAjax()){
            $data=Request::instance()->post();
            if(!empty($data)){
                $rows=Db::name('staff')->where('id',$data['id'])->find();
                if($rows['status']==1){
                    $data['status']='0';
                    $data['msg']='删除失败，不能删除在职人员档案！';
                    return json($data);
                }else{
                    $rest=Db::name('staff')->where('id',$data['id'])->update(['is_available'=>0]);
                    if($rest){
                        $data['status']='1';
                        $data['msg']='数据删除成功！';
                        return json($data);
                    }else{
                        $data['status']='0';
                        $data['msg']='数据删除失败！';
                        return json($data);
                    }
                }
            }
        }
    }

    //导入电子版档案
    public function import_word()
    {
        $id=input('id');
        $rows=Db::name('staff')->where('id',$id)->find();
        $post = $this->request->param();
        if(isset($post['id']) && isset($post['full_name']) && isset($post['word'])){
            $arr['word_path']=$post['word'];
            $rest=Db::name('staff')->where('id',$post['id'])->update($arr);
            if($rest){
                $data['status']='1';
                $data['msg']='Word导入成功！';
                return json($data);
            }else{
                $data['status']='0';
                $data['msg']='Word导入失败！';
                return json($data);
            }
        }

        $this->assign('id',$id);
        $this->assign('rows',$rows);
        return $this->fetch('import_word');
    }


    //获得上传Word文件路径
    public function get_word_path()
    {
        if(Request::instance()->isAjax()){
            $file=Request::instance()->file('file');

            if($file){

                $info = $file->validate(['size'=>83886080,'ext'=>'doc,docx'])->move(ROOT_PATH . 'public' . DS . 'uploads/word');
                if($info){

                    return json_encode(['status' => 1, 'message' => $info->getSaveName()]);
                
                }else{
               
                    return json_encode(['status' => 0, 'message' => $file->getError()]);
                }
            }
        }
    }


    //查看Word版电子档案
    public function view_word()
    {
        $id=input('id');
        $rows=Db::name('staff')->where('id',$id)->find();
        if($rows['word_path']){

            $path=explode('.', $rows['word_path']);
            
            $this->word2pdf($path[0],$path[1]);

        }else{

            return '该员工暂无Word版档案，请上传后再试...';
        }
        
    }

    //下载Word版电子档案
    public function word_export()
    {
        if (Request::instance()->isAjax()){

            $data=Request::instance()->post();
            $arr=array();
            foreach ($data as $key => $value) {
                # code...
                $arr['id']=$value;
            }
            $rows=Db::name('staff')->where('id',$arr['id'])->find();
            if($rows['word_path']){
                $filenamedoc = ROOT_PATH.'public/uploads/word/'.$rows['word_path'];
                $data['status']='1';
                $data['msg']=$filenamedoc;
                return json($data);
            }else{
                $data['status']='0';
                $data['msg']='该员工暂无Word版档案，请上传后再试...';
                return json($data);
            }
        }
    }


    public function download_word()
    {
        header("Content-type:text/html;charset=utf-8"); 
        $file_path=urldecode(input('filenamedoc'));
        //用以解决中文不能显示出来的问题 
        // $file_name=iconv("utf-8","gb2312",$file_name);
        //首先要判断给定的文件存在与否 
        if(!file_exists($file_path)){
            echo "没有该文件..."; 
            return ;
        }
        $fp=fopen($file_path,"r");
        $file_size=filesize($file_path);
        
        //下载文件需要用到的头
        Header("Content-type: application/octet-stream");
        Header("Accept-Ranges: bytes");
        Header("Accept-Length:".$file_size);
        Header("Content-Disposition: attachment; filename=".time().'.doc');
        $buffer=1024;
        $file_count=0;
        //向浏览器返回数据
        while(!feof($fp) && $file_count<$file_size){
            $file_con=fread($fp,$buffer);
            $file_count+=$buffer;
            echo $file_con;
        }
        fclose($fp);
    }

    //Word转换PDF
    public function word2pdf($word_path,$word_ext)
    {
        //获取word文件名
        $filenamedoc = ROOT_PATH.'public/uploads/word/'.$word_path.'.'.$word_ext;
        
        //转化的PDF文件
        $filenamepdf = ROOT_PATH.'public/uploads/word/'.$word_path.'.pdf';
                
        $word = new \COM("Word.Application") or die ("Could not initialise Object.");
        
        //把它的可见性设置为0（假），如果要使它在最前端打开，使用1（真）
        $word->Visible = 0;
        
        $word->DisplayAlerts = 0;
        
        $word->Documents->Open($filenamedoc);

        //判断要生成的文件名是否存在
        if(file_exists($filenamepdf)) {
            //存在就删除
            unlink ($filenamepdf);
        }
        
        $word->ActiveDocument->ExportAsFixedFormat($filenamepdf, 17, false, 0, 0, 0, 0, 7, true, true, 2, true, true, false);
        // quit the Word process
        $word->Quit(false);
        // clean up
        unset($word);

        header('Content-type: application/pdf');
        header('filename='.$filenamepdf);
        // readfile($filenamepdf);
        return readfile($filenamepdf);
        
    }


}
