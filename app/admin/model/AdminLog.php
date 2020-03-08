<?php
namespace app\admin\model;

use \think\Model;
use \think\Db;

class AdminLog extends Model
{
    /**
     * @param $admin_id管理员ID,$operation操作名称,$info操作内容
     */
    public function admin_log($admin_id,$operation)
    {
        $logarr['admin_id']=$admin_id;

        $logarr['operation']=$operation;
        
        $logarr['create_time']=time();
        
        $rows=Db::name('admin_log')->insert($logarr);
        if($rows){
            return true;
        }else{
            return false;
        }
    }

}