<?php
return [
    'template' => [
        // 模板引擎类型 支持 php think 支持扩展
        'type' => 'Think',
        // 模板路径
        'view_path' => '../app/admin/view/',
        // 模板后缀
        'view_suffix' => 'html',
        // 模板文件名分隔符
        'view_depr' => DS,
        // 模板引擎普通标签开始标记
        'tpl_begin' => '{',
        // 模板引擎普通标签结束标记
        'tpl_end' => '}',
        // 标签库标签开始标记
        'taglib_begin' => '<',
        // 标签库标签结束标记
        'taglib_end' => '>',
    ],
    
    //默认错误跳转对应的模板文件
    'dispatch_error_tmpl' => 'public:dispatch_jump',
    //默认成功跳转对应的模板文件
    'dispatch_success_tmpl' => 'public:dispatch_jump',
    // URL伪静态后缀
    'url_html_suffix'        => '',  


    //PHPMailer配置
    'THINK_PHPMAILER' =>[

        'SMTP_HOST' => 'smtp.qq.com', //SMTP服务器

        'SMTP_PORT' => '465', //SMTP服务器端口

        'SMTP_USER' => '1719847255@qq.com', //SMTP服务器用户名

        'SMTP_PASS' => 'gpfnatajjnmcdcac', //SMTP服务器密码

        'FROM_EMAIL' => '1719847255@qq.com', //发件人EMAIL

        'FROM_NAME' => 'flyfly~~~', //发件人名称

        'REPLY_EMAIL' => '1719847255@qq.com', //回复EMAIL（留空则为发件人EMAIL）

        'REPLY_NAME' => 'flyfly', //回复名称（留空则为发件人名称）

    ],

    //分页配置  
   'paginate'      => [  
       'type'      => 'BootstrapDetailed',//分页类  
       'var_page'  => 'page',  
       'list_rows' => 15,  
   ],
   
]
?>