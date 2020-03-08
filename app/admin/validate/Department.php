<?php

namespace app\admin\validate;

use think\Validate;

class Department extends Validate
{
    protected $rule = [
            'name'  =>  'require|checkEmpty',
        ];
        
    protected $message = [
        'name.require'  =>  '名称不能为空',
        'name.checkEmpty'  =>  '名称不能为空',
    ];
    
    protected $scene = [
        'add'   =>  ['title','desc','content'],
        'edit'  =>  ['title','desc','content'],
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