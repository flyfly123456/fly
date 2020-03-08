<?php

namespace app\admin\validate;

use think\Validate;

class Article extends Validate
{
    protected $rule = [
            'title'  =>  'require|checkEmpty',
            'desc' =>  'require|checkEmpty',
            'content' =>  'require|checkContent',
        ];
        
    protected $message = [
        'title.require'  =>  '标题不能为空',
        'desc.require' =>  '描述不能为空',
        'content.require' =>  '内容不能为空',
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