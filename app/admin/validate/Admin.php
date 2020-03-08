<?php

namespace app\admin\validate;

use think\Validate;

class Admin extends Validate
{
    protected $rule = [
            'name|登入名'  =>  'require|checkEmpty',
            'password|密码' =>  'require|checkEmpty|confirm:repassword',
            'email|邮箱' =>  'email',
            'telephone|电话' =>  'require|number|length:11',
            'role_group_id|角色' =>  'require|checkEmpty',
            'department_id|部门' =>  'require|checkEmpty',
            'status|状态' =>  'require|checkEmpty',
            'create_time|系统' =>  'require|checkEmpty',
            // 'sex|性别' =>  'require|checkEmpty',
            'is_super|角色' =>  'require',
        ];
        
    protected $message = [
        'name.require'  =>  '标题不能为空',
        'password.require' =>  '描述不能为空',
        'email.email' =>  '邮箱格式不正确',
        'telephone.require' =>  '内容不能为空',
        'role_group_id.require' =>  '内容不能为空',
        'department_id.require' =>  '内容不能为空',
        'status.require' =>  '内容不能为空',
        'create_time.require' =>  '内容不能为空',
        'sex.require' =>  '内容不能为空',
        'is_super.require' =>  '内容不能为空',
    ];
    
    protected $scene = [
        'add'   =>  ['name','password','email','telephone','role_group_id','department_id','status','create_time','sex','is_super'],
        'edit'  =>  ['name','password','email','telephone','role_group_id','department_id','status','create_time','sex','is_super'],
    ];

    protected function checkEmpty($value)
    {
        if (is_string($value)) {
            $value = trim($value);
        }
        if (empty($value)) {
            return false;
        }
        return true;
    }
    
    protected function checkContent($value)
    {
        $value = strip_tags($value);
        $value = str_replace('&nbsp;', '', $value);
        $value = trim($value);
        if (empty($value)) {
            return false;
        }
        return true;
    }

}