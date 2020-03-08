<?php
/**
 * Created by flyfly.
 * User: fly
 * mail: 1719847255@qq.com
 * Locator: http://www.flyfly.com
 * Date: 2018/12/01
 * Time: 11:58
 */
namespace app\admin\model;

use think\Model;

class SystemInfo extends Model {
	/**
	 * 判断指定路径下指定文件是否存在，如不存在则创建
	 * @param string $fileName 文件名
	 * @param string $content 文件内容
	 * @return string 返回文件路径
	 */
	private function getFilePath($fileName, $content)
	{
	 $path = dirname(__FILE__) . "\\$fileName";
	 if (!file_exists($path)) {
	  file_put_contents($path, $content);
	 }
	 return $path;
	}
	/**
	 * 获得cpu使用率vbs文件生成函数
	 * @return string 返回vbs文件路径
	 */
	private function getCupUsageVbsPath()
	{
	 return $this->getFilePath(
	  'cpu_usage.vbs',
	  "On Error Resume Next
	   Set objProc = GetObject(\"winmgmts:\\\\.\\root\cimv2:win32_processor='cpu0'\")
	   WScript.Echo(objProc.LoadPercentage)"
	 );
	}
	/**
	 * 获得总内存及可用物理内存JSON vbs文件生成函数
	 * @return string 返回vbs文件路径
	 */
	private function getMemoryUsageVbsPath()
	{
	 return $this->getFilePath(
	  'memory_usage.vbs',
	  "On Error Resume Next
	   Set objWMI = GetObject(\"winmgmts:\\\\.\\root\cimv2\")
	   Set colOS = objWMI.InstancesOf(\"Win32_OperatingSystem\")
	   For Each objOS in colOS
	    Wscript.Echo(\"{\"\"TotalVisibleMemorySize\"\":\" & objOS.TotalVisibleMemorySize & \",\"\"FreePhysicalMemory\"\":\" & objOS.FreePhysicalMemory & \"}\")
	   Next"
	 );
	}
	/**
	 * 获得CPU使用率
	 * @return Number
	 */
	public function getCpuUsage()
	{
	 $path = $this->getCupUsageVbsPath();
	 exec("cscript -nologo $path", $usage);
	 return $usage[0].'%';
	}
	/**
	 * 获得内存使用率数组
	 * @return array
	 */
	public function getMemoryUsage()
	{
	 $path = $this->getMemoryUsageVbsPath();
	 exec("cscript -nologo $path", $usage);
	 $memory = json_decode($usage[0], true);
	 $memory['usage'] = Round((($memory['TotalVisibleMemorySize'] - $memory['FreePhysicalMemory']) / $memory['TotalVisibleMemorySize']) * 100);
	 return $memory;
	}


	//Linux环境下使用
	public function get_used_status(){
		
		$get_memory_usage=$this->get_memory_usage();//内存使用率

		$get_cpu_usage=$this->get_cpu_usage();//cpu使用率

		$get_disk=$this->get_disk();//硬盘情况

		//内存
		$str= @file("/proc/meminfo");
		if(!$str)return false;
		$str= implode("",$str);
		preg_match_all("/MemTotal\s{0,}\:+\s{0,}([\d\.]+).+?MemFree\s{0,}\:+\s{0,}([\d\.]+).+?Cached\s{0,}\:+\s{0,}([\d\.]+).+?SwapTotal\s{0,}\:+\s{0,}([\d\.]+).+?SwapFree\s{0,}\:+\s{0,}([\d\.]+)/s",$str, $buf);
		preg_match_all("/Buffers\s{0,}\:+\s{0,}([\d\.]+)/s",$str, $buffers);
		$resmem['memTotal'] =round($buf[1][0]/1024, 2);
		$resmem['memFree'] =round($buf[2][0]/1024, 2);
		$resmem['memBuffers'] =round($buffers[1][0]/1024, 2);
		$resmem['memCached'] =round($buf[3][0]/1024, 2);
		$resmem['memUsed'] =$resmem['memTotal']-$resmem['memFree'];
		$resmem['memPercent'] = (floatval($resmem['memTotal'])!=0)?round($resmem['memUsed']/$resmem['memTotal']*100,2):0;
		$resmem['memRealUsed'] =$resmem['memTotal'] -$resmem['memFree'] -$resmem['memCached'] -$resmem['memBuffers'];//真实内存使用
		$resmem['memRealFree'] =$resmem['memTotal'] -$resmem['memRealUsed'];//真实空闲
		$resmem['memRealPercent'] = (floatval($resmem['memTotal'])!=0)?round($resmem['memRealUsed']/$resmem['memTotal']*100,2):0;//真实内存使用率
		$resmem['memCachedPercent'] = (floatval($resmem['memCached'])!=0)?round($resmem['memCached']/$resmem['memTotal']*100,2):0;//Cached内存使用率
		$resmem['swapTotal'] =round($buf[4][0]/1024, 2);
		$resmem['swapFree'] =round($buf[5][0]/1024, 2);
		$resmem['swapUsed'] =round($resmem['swapTotal']-$resmem['swapFree'], 2);
		$resmem['swapPercent'] = (floatval($resmem['swapTotal'])!=0)?round($resmem['swapUsed']/$resmem['swapTotal']*100,2):0;
		$resmem= $this->formatmem($resmem);//格式化内存显示单位
		
		return ['cpu'=>$get_cpu_usage,'memory'=>$get_memory_usage,'get_disk'=>$get_disk,'resmem'=>$resmem];
		
	}

	private function get_memory_usage(){
		$str=shell_exec("more /proc/meminfo");
		$mode="/(.+):\s*([0-9]+)/";
		preg_match_all($mode,$str,$arr);
		$pr=bcdiv($arr[2][1],$arr[2][0],3);//bcdiv()函数需要PHP安装bcmath扩展配置
		$pr=1-$pr;
		$pr=$pr*100;
		return $pr."%";
	}


	private function get_cpu_usage(){
		$mode = "/(cpu)[\s]+([0-9]+)[\s]+([0-9]+)[\s]+([0-9]+)[\s]+([0-9]+)[\s]+([0-9]+)[\s]+([0-9]+)[\s]+([0-9]+)[\s]+([0-9]+)/";
		$string=shell_exec("more /proc/stat");
		preg_match_all($mode,$string,$arr);
		//print_r($arr);
		$total1=$arr[2][0]+$arr[3][0]+$arr[4][0]+$arr[5][0]+$arr[6][0]+$arr[7][0]+$arr[8][0]+$arr[9][0];
		$time1=$arr[2][0]+$arr[3][0]+$arr[4][0]+$arr[6][0]+$arr[7][0]+$arr[8][0]+$arr[9][0];

		sleep(1);
		$string=shell_exec("more /proc/stat");
		preg_match_all($mode,$string,$arr);
		$total2=$arr[2][0]+$arr[3][0]+$arr[4][0]+$arr[5][0]+$arr[6][0]+$arr[7][0]+$arr[8][0]+$arr[9][0];
		$time2=$arr[2][0]+$arr[3][0]+$arr[4][0]+$arr[6][0]+$arr[7][0]+$arr[8][0]+$arr[9][0];
		$time=$time2-$time1;
		$total=$total2-$total1;
		//echo "CPU amount is: ".$num;
		$percent=bcdiv($time,$total,3);
		$percent=$percent*100;

		return $percent."%";
	}


	private function get_disk(){ //获取硬盘情况
	    $d['t'] =round(@disk_total_space(".")/(1024*1024*1024),3);
	    $d['f'] =round(@disk_free_space(".")/(1024*1024*1024),3);
	    $d['u'] =$d['t']-$d['f'];
	    $d['PCT'] = (floatval($d['t'])!=0)?round($d['u']/$d['t']*100,2):0;
	    return$d;
	}


	private function formatmem($mem){//格试化内存显示单位
	    if(!is_array($mem))return $mem;
	    $tmp= array(
	        'memTotal','memUsed', 'memFree', 'memPercent',
	        'memCached','memRealPercent',
	        'swapTotal','swapUsed', 'swapFree', 'swapPercent'
	    );
	    foreach($mem as $k=>$v) {
	        if(!strpos($k,'Percent')){
	            $v= $v<1024?$v.' M':$v.' G';
	        }
	        $mem[$k] =$v;
	    }
	    foreach($tmp as $v) {
	        $mem[$v] =$mem[$v]?$mem[$v]:0;
	    }
	    return$mem;
	}
}