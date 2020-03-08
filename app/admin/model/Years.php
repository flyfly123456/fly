<?php
namespace app\admin\model;

use \think\Model;

class Years extends Model
{
    /**
     * @param $year 参数格式：$year=2019
     */
    private static function get_total_days($year=null)
    {
        //公元年数可被4整除为闰年,但是整百（个位和十位均为0）的年数必须是可以被400整除的才是闰年（比如1900年不是闰年），其他都是平年。例如：1997年是平年，2002年是平年；1996年是闰年，2000年是闰年。平年二月有28天，而闰年二月有29天。
        $year?$year:$year=intval(date('Y',time()));
        
        if($year%4==0){
            if($year%100==0){
                if($year%400==0){
                    // echo '闰年';
                    // $days=366;
                    return 366;
                }else{
                    // echo '平年';
                    // $days=365;
                    return 365;
                }
            }else{
                // echo '闰年';
                // $days=366;
                return 366;
            }
        }else{
            // echo '平年';
            // $days=365;
            return 365;
        }
    }

    public static function get_dates_info($year,$date)
    {
        // $date="2018-01-01";
        $date=$year.$date;
        $total_days=self::get_total_days($year);
        $arr=array();

        for ($i=0; $i < $total_days; $i++) { 
            
            // echo '今天的日期是：'.date("Y-m-d",strtotime("+$i day",strtotime($date))).',今天是星期'.date('w',strtotime("+$i day",strtotime($date))).'<br>';

            $dates=date("Y-m-d",strtotime("+$i day",strtotime($date)));
            $week=self::capitals(date('w',strtotime("+$i day",strtotime($date))));

            array_push($arr, $dates.'@'.$week);

        }

        return $arr;
    }

    //转换为大写星期
    private static function capitals($number)
    {
        $weekarray=array("日","一","二","三","四","五","六"); //先定义个数组

        return "星期".$weekarray[$number];

    }

    //获得节假日
    public static function get_festival()
    {
        //农历节假日
        $arr=array(
            '腊月三十',
            '正月初一',
            '正月初二',
            '正月初三',
            '正月初四',
            '正月初五',
            '正月初六',
            '五月初五',
            '五月初六',
            '五月初七',
            '八月十五',
            '八月十六',
            '八月十七',
            );

        //阳历节假日
        $arr1=array(
            '12-31',
            '01-01',
            '04-05',
            '04-06',
            '04-07',
            '05-01',
            '10-01',
            '10-02',
            '10-03',
            '10-04',
            '10-05',
            '10-06',
            '10-07',
            );

        return array_merge($arr,$arr1);
    }

    //时间戳转换时间
    public static function time2string($second){
        $day = floor($second/(3600*24));
        $second = $second%(3600*24);
        $hour = floor($second/3600);
        $second = $second%3600;
        $minute = floor($second/60);
        $second = $second%60;
        
        if($day<=0){
            return $hour.'小时'.$minute.'分'.$second.'秒';
        }elseif($hour<=0){
            return $minute.'分'.$second.'秒';
        }elseif($second<=0){
            return $second.'秒';
        }else{
            return $day.'天'.$hour.'小时'.$minute.'分'.$second.'秒';
        }
        
    }

}