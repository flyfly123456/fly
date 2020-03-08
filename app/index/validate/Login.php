<?php

namespace app\index\validate;

use think\Validate;

class Login extends Validate
{
    protected $rule = [
            'email'  =>  'require|checkEmpty|email',
            'password'  =>  'require|checkEmpty|max:32',
            'repassword'=>'require|checkEmpty|confirm:password',
        ];
        
    protected $message = [
        'email.require'  =>  '邮箱不能为空',
        'email.checkEmpty'  =>  '邮箱不能为空',
        'email'  =>  '邮箱格式不正确',

        'password.require'  =>  '密码不能为空',
        'password.checkEmpty'  =>  '密码不能为空',

        'repassword.require'  =>  '两次密码不一致',
        'repassword.checkEmpty'  =>  '两次密码不一致',
        'repassword.confirm'  =>  '两次密码不一致',
    ];
    
    protected $scene = [
        'add'   =>  ['email','password','repassword'],
        'edit'  =>  ['email','password','repassword'],
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
    
}