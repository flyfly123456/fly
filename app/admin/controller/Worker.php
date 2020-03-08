<?php

namespace app\admin\controller;

use think\worker\Server;
use Workerman\Lib\Timer;

use app\admin\controller\Test;

class Worker extends Server
{
    protected $socket = 'websocket://localhost:2346';

    protected $processes=1;

    /**
     * 收到信息
     * @param $connection
     * @param $data
     */
    public function onMessage($connection, $data)
    {
        // $connection->send($data);
        foreach($connection->worker->connections as $con)
        {
            $con->send($data.'已上线');
        }

        $timer_id = Timer::add(1, function()use($connection, $data,&$timer_id)
        {
            // $connection->send('timer_id='.$timer_id);
            // $connection->send($data.'已上线');
        });
        
    }

    /**
     * 当连接建立时触发的回调函数
     * @param $connection
     */
    public function onConnect($connection)
    {
        // var_dump($connection->getRemoteIp());
        // echo $connection->id;
        // $connection->send($connection->id.'已上线');

    }

    /**
     * 当连接断开时触发的回调函数
     * @param $connection
     */
    public function onClose($connection)
    {
        var_dump($connection->getRemoteIp());

    }

    /**
     * 当客户端的连接上发生错误时触发
     * @param $connection
     * @param $code
     * @param $msg
     */
    public function onError($connection, $code, $msg)
    {
        echo "error $code $msg\n";
    }

    /**
     * 每个进程启动
     * @param $worker
     */
    public function onWorkerStart($worker)
    {
        $handle=new Test();
        $handle->add_timer();
    }

}