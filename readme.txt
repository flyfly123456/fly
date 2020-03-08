更改过的系统文件
1.View.php(模板字符串替换部分)
2.APP.php(错误页面跳转)
3.入口文件隐藏针对php7：修改php.ini cgi.force_redirect = 0,.htaccess文件index.php后面加"?"号
注意事项：
1.tcpdf需要关闭调试模式
2.上线之前要开启Base.php中的admin_priv方法中的注释，开启权限验证