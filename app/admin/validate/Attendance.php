<?php

namespace app\admin\validate;

use think\Validate;

class Attendance extends Validate
{
    protected $rule = [
            'title'  =>  'require|checkEmpty',
            'type'  =>  'require|checkEmpty',
            'start_date'  =>  'require|checkEmpty',
            'end_date'  =>  'require|checkEmpty',
            'start_time'  =>  'require|checkEmpty',
            'end_time'  =>  'require|checkEmpty',
            'duration'  =>  'require|checkEmpty',
            'reason'  =>  'require|checkEmpty',
        ];
        
    protected $message = [
        'title.require'  =>  '必填项不能为空',
        'type.require'  =>  '必填项不能为空',
        'start_date.require'  =>  '必填项不能为空',
        'end_date.require'  =>  '必填项不能为空',
        'start_time.require'  =>  '必填项不能为空',
        'end_time.require'  =>  '必填项不能为空',
        'duration.require'  =>  '必填项不能为空',
        'reason.require'  =>  '必填项不能为空',
        'title.checkEmpty'  =>  '必填项不能为空',
        'type.checkEmpty'  =>  '必填项不能为空',
        'start_date.checkEmpty'  =>  '必填项不能为空',
        'end_date.checkEmpty'  =>  '必填项不能为空',
        'start_time.checkEmpty'  =>  '必填项不能为空',
        'end_time.checkEmpty'  =>  '必填项不能为空',
        'duration.checkEmpty'  =>  '必填项不能为空',
        'reason.checkEmpty'  =>  '必填项不能为空',
    ];
    
    protected $scene = [
        'add'   =>  ['title','type','start_date','end_date','start_time','end_time','duration','reason'],
        'edit'  =>  ['title','type','start_date','end_date','start_time','end_time','duration','reason'],
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