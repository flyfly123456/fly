<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:41:"../app/admin/view/wechat\menu_custom.html";i:1547994581;}*/ ?>
<!DOCTYPE html>
<html lang="zn_CH">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>微信公众号自定义菜单设置</title>
	
	<meta name="keywords" content="微信公众号,自定义菜单" />
	<meta name="description" content="" /> 
	<link rel="stylesheet" href="/static/admin/css/bootstrap.min.css">
	<link rel="stylesheet" href="/static/admin/css/font-awesome.min.css">
	<!-- 自定义样式 -->
  <link rel="stylesheet" href="/static/admin/css/wx-custom.css">
	<link rel="stylesheet" href="/static/admin/css/xadmin.css">

	<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
</head>
<body class="layui-anim layui-anim-up">
    <div class="x-nav"> 
        <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">微信管理</a>
            <a><cite>菜单配置</cite></a>
        </span> 
        <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新"> <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a> 
    </div>
  	<div class="custom-menu-edit-con">
      <div class="hbox">
        <div class="inner-left">
          <div class="custom-menu-view-con">
            <div class="custom-menu-view">
              <div class="custom-menu-view__title"><?php echo $wechat_config['name']; ?></div>
              <div class="custom-menu-view__body">
                <div class="weixin-msg-list"><ul class="msg-con"></ul></div>
              </div>
              <div id="menuMain" class="custom-menu-view__footer">
                <div class="custom-menu-view__footer__left"></div>
                <div class="custom-menu-view__footer__right" ></div>
              </div>
            </div>
          </div>
        </div>
        <div class="inner-right">
          <div class="cm-edit-after">
            <div class="cm-edit-right-header b-b"><span id="cm-tit"></span> <a id="delMenu" class="pull-right" href="javascript:;">删除菜单</a></div>
            <form class="form-horizontal wrapper-md" name="custom_form">
              <div class="form-group">
                <label class="col-sm-2 control-label">菜单名称:</label>
                <div class="col-sm-5">
                  <input name="custom_input_title" type="text" class="form-control" ng-model="menuname" value="" placeholder="" ng-maxlength="5">
                </div>
                <div class="col-sm-5 help-block">
                  <div ng-show="custom_form.custom_input_title.$dirty&&custom_form.custom_input_title.$invalid-maxlength">字数不超过5个汉字或16个字符</div>
                  <div class="font_sml" style="display: none;">若无二级菜单，可输入20个汉字或60个字符</div>
                </div>
              </div>
              <div class="form-group" id="radioGroup">
                <label class="col-sm-2 control-label">菜单内容:</label>
                <div class="col-sm-10 LebelRadio">
                  <label class="checkbox-inline"><input type="radio" name="radioBtn" value="sendmsg" checked> 发送消息</label>
                  <label class="checkbox-inline"><input type="radio" name="radioBtn" value="link"> 跳转网页</label>
                </div>
              </div>
            </form>    

            <div class="cm-edit-content-con" id="editMsg">
              <div class="editTab">
                <div class="editTab-heading">
                  <ul class="msg-panel__tab">
                    <li class="msg-tab_item on">
                      <span class="msg-icon msg-icon-tuwen"></span>
                      图文消息
                    </li>
                  </ul>
                </div>
                <div class="editTab-body">
                  <div class="msg-panel__context">
                    <div class="msg-context__item">
                      <div class="msg-panel__center msg-panel_select"  data-toggle="modal" data-target="#selectModal"><span class="message-plus">+</span><br>从素材库中选择</div>
                    </div>
                    <div class="msg-template"></div>
                  </div>
                </div>
              </div>
            </div>
            <div class="cm-edit-content-con" id="editPage">
              <div class="cm-edit-page">
                <div class="row">
                  <label class="col-sm-6 control-label" style="text-align: left;">粉丝点击该菜单会跳转到以下链接:</label>
                </div>
                <div class="row">
                  <label class="col-sm-2 control-label" style="text-align: left;">页面地址:</label>
                  <div class="col-sm-5">
                    <input type="text" name="url" class="form-control" placeholder="认证号才可手动输入地址"> 
                    <span class="help-block">必填,必须是正确的URL格式</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="cm-edit-before"><h5>点击左侧菜单进行操作</h5></div>
        </div>
      </div>
    </div>
    <div class="cm-edit-footer">
      <button id="sortBtn" type="button" class="btn btn-default">菜单排序</button>
      <button id="sortBtnc" type="button" class="btn btn-default">完成排序</button>
      <button id="saveBtns" type="button" class="btn btn-info1">保存</button>
    </div>

  	<script src="/static/admin/js/jquery-1.11.1.min.js"></script>
  	<script src="/static/admin/js/bootstrap.min.js"></script>
  	<script type="text/javascript" src="/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/static/admin/js/xadmin.js"></script>
  	<!-- 自定义菜单排序 -->
  	<script src="/static/admin/js/Sortable.js"></script>
  	
  	<div id="selectModal" class="modal fade" tabindex="-1" role="dialog">
  		<div class="modal-dialog modal-lg">
  			<div class="modal-content">
  				<div class="modal-header">
  					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span>×</span></button>
  					<h4 class="modal-title">
  						选择图片
  					</h4>
  				</div>
  				<div class="modal-body">
  					<div class="row">
  						<div id="col_1" class="col-xs-4">
  							<div class="panel panel-default">
  								<div class="panel-heading msg-date">
  									08月12日
  								</div>
  								<div class="panel-body">
  									<h5 class="msg-title">微信缴费使用指南1</h5>
  									<div class="msg-img"><img src="/static/admin/images/20170831595cf16beb634972a65adb6b14abca9b.jpg" alt=""></div>
  									<p class="msg-text">微信缴费使用指南</p>
  								</div>
  								<div class="mask-bg"><div class="mask-icon"><i class="icon-ok"></i></div></div>
  							</div>
  						</div>
  						<div id="col_2" class="col-xs-4">
  							<div class="panel panel-default">
  								<div class="panel-heading msg-date">
  									08月31日
  								</div>
  								<div class="panel-body">
  									<h5 class="msg-title">微信缴费使用指南2</h5>
  									<div class="msg-img"><img src="/static/admin/images/1.png" alt=""></div>
  									<p class="msg-text">微信缴费使用指南</p>
  								</div>
  								<div class="mask-bg"><div class="mask-icon"><i class="icon-ok"></i></div></div>
  							</div>
  						</div>
  					</div>
  				</div>
  				<div class="modal-footer">
  					<button type="button" class="btn btn-info ensure">确定</button>
  					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
  				</div>
  			</div>
  		</div>
  	</div>
  	<div id="reminderModal" class="modal fade" tabindex="-1" role="dialog">
  		<div class="modal-dialog">
  			<div class="modal-content">
  				<div class="modal-header">
  					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span>×</span></button>
  					<h4 class="modal-title">
  						温馨提示
  					</h4>
  				</div>
  				<div class="modal-body">
  					<h5>添加子菜单后，一级菜单的内容将被清除。确定添加子菜单？</h5>
  				</div>
  				<div class="modal-footer">
  					<button type="button" class="btn btn-info reminder">确定</button>
  					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
  				</div>
  			</div>
  		</div>
  	</div>

  	<div id="abnormalModal" class="modal fade" tabindex="-1" role="dialog">
  		<div class="modal-dialog">
  			<div class="modal-content">
  				<div class="modal-header">
  					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span>×</span></button>
  					<h4 class="modal-title">
  						温馨提示
  					</h4>
  				</div>
  				<div class="modal-body">
  					<h5>数据异常</h5>
  				</div>
  				<div class="modal-footer">
  					<!-- <button type="button" class="btn btn-info reminder">确定</button> -->
  					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
  				</div>
  			</div>
  		</div>
  	</div>
</body>
<script>
  layui.use(['layer'], function(){
      $ = layui.jquery
      ,layer = layui.layer;
      var mId = null;
      //显示自定义按钮组
      var obj = <?php echo session('jsonmenu'); ?>;
  //     var obj = {
  //   "menu": {
  //     "button": [{
  //       "type": "click",
  //       "name": "今日歌曲",
  //       "key": "col_2",
  //       "sub_button": []
  //     }, {
  //       "name": "百度一下",
  //       "sub_button": [{
  //         "type": "click",
  //         "name": "笑话",
  //         "key": "col_2",
  //         "sub_button": []
  //       }]
  //     }, {
  //       "name": "菜单",
  //       "sub_button": [{
  //         "type": "view",
  //         "name": "搜索",
  //         "url": "http:\/\/www.soso.com\/",
  //         "sub_button": []
  //       }, {
  //         "type": "view",
  //         "name": "视频",
  //         "url": "http:\/\/v.qq.com\/",
  //         "sub_button": []
  //       }, {
  //         "type": "click",
  //         "name": "赞我们一下",
  //         "key": "col_1",
  //         "sub_button": []
  //       }]
  //     }]
  //   }
  // };
      var tempObj = {}; //存储HTML对象
      var button = obj.menu.button; //一级菜单
      //显示异常
      if (obj.errcode) {
        $('#abnormalModal').modal('show');
      }
      //一级菜单对象
      function parents(param) {
        this.name = param;
        this.sub_button = [];
      }
      //二级菜单对象
      function subs(param) {
        this.name = param;
      }
      var objp = new parents();
      var objs = new subs();
      var ix = button.length; //一级菜单数量
      var menu = '<div class="custom-menu-view__menu"><div class="text-ellipsis"></div></div>';
      var customBtns = $('.custom-menu-view__footer__right');
      if (button.length > 0) {
        showMenu();
        //$('.cm-edit-before').hide();
        $('.cm-edit-after').hide();
      } else {
        addMenu();
        $('.cm-edit-before').siblings().hide();
      }
      //显示第一级菜单
      function showMenu() {
        if (button.length == 1) {
          appendMenu(button.length);
          showBtn();
          $('.custom-menu-view__menu').css({
            width: '50%',
          });
        }
        if (button.length == 2) {
          appendMenu(button.length);
          showBtn();
          $('.custom-menu-view__menu').css({
            width: '33.3333%',
          });
        }
        if (button.length == 3) {
          appendMenu(button.length);
          showBtn();
          $('.custom-menu-view__menu').css({
            width: '33.3333%',
          });
        }
        for (var b = 0; b < button.length; b++) {
          $('.custom-menu-view__menu')[b].setAttribute('alt', b);
        }
      }
      //显示子菜单
      function showBtn() {
        for (var i = 0; i < button.length; i++) {
          var text = button[i].name;
          var list = document.createElement('ul');
          list.className = "custom-menu-view__menu__sub";
          $('.custom-menu-view__menu')[i].childNodes[0].innerHTML = text;
          $('.custom-menu-view__menu')[i].appendChild(list);
          for (var j = 0; j < button[i].sub_button.length; j++) {
            var text = button[i].sub_button[j].name;
            var li = document.createElement("li");
            var tt = document.createTextNode(text);
            var div = document.createElement('div');
            li.className = 'custom-menu-view__menu__sub__add';
            li.id = 'sub_' + i + '_' + j; //设置二级菜单id
            div.className = "text-ellipsis";
            div.appendChild(tt);
            li.appendChild(div);
            $('.custom-menu-view__menu__sub')[i].appendChild(li);
          }
          var ulBtnL = button[i].sub_button.length;
          var iLi = document.createElement("li");
          var ii = document.createElement('i');
          var iDiv = document.createElement("div");
          ii.className = "glyphicon glyphicon-plus text-info";
          iDiv.className = "text-ellipsis";
          iLi.className = 'custom-menu-view__menu__sub__add';
          iDiv.appendChild(ii);
          iLi.appendChild(iDiv);
          if (ulBtnL < 5) {
            $('.custom-menu-view__menu__sub')[i].appendChild(iLi);
          }

        }
      }
      //显示添加的菜单
      function appendMenu(num) {
        var menuDiv = document.createElement('div');
        var mDiv = document.createElement('div');
        var mi = document.createElement('i');
        mi.className = 'glyphicon glyphicon-plus text-info iBtn';
        mDiv.className = 'text-ellipsis';
        menuDiv.className = 'custom-menu-view__menu';
        mDiv.appendChild(mi);
        menuDiv.appendChild(mDiv)
        switch (num) {
          case 1:
            customBtns.append(menu);
            customBtns.append(menuDiv);
            break;
          case 2:
            customBtns.append(menu);
            customBtns.append(menu);
            customBtns.append(menuDiv);
            break;
          case 3:
            customBtns.append(menu);
            customBtns.append(menu);
            customBtns.append(menu);
            break;
        }
      }
      //初始化菜单按钮
      function addMenu() {
        var menuI = '<div class="custom-menu-view__menu"><div class="text-ellipsis"><i class="glyphicon glyphicon-plus text-info iBtn"></i></div></div>';
        var sortIndex = true;
        customBtns.append(menuI);
        var customFirstBtns = $('.custom-menu-view__menu');
        var firstBtnsLength = customFirstBtns.length;
        if (firstBtnsLength <= 1) {
          customFirstBtns.css({
            width: '100%',
          })
        }
      }
      //添加菜单按钮
      var customEl = '<div class="custom-menu-view__menu"><div class="text-ellipsis">新建菜单</div></div>'
      var customUl = '<ul class="custom-menu-view__menu__sub"><li class="custom-menu-view__menu__sub__add"><div class="text-ellipsis"><i class="glyphicon glyphicon-plus text-info"></i></div></li></ul>';
      var customLi = '<li class="custom-menu-view__menu__sub__add"><div class="text-ellipsis">新建子菜单</div></li>';
      $('.iBtn').parent().on('click', function() {
        var num = $('.custom-menu-view__footer__right').find('.custom-menu-view__menu').length;
        var ulNum = $(this).parents('.custom-menu-view__menu').prev().find('.custom-menu-view__menu__sub').length;
        ix++;
        if (ix < 4) {
          $(this).parent().before(customEl);
          $(this).parent().prev().append(customUl);

          $('.custom-menu-view__footer__right').find('.subbutton__actived').removeClass('subbutton__actived');
          $(this).parent().prev().addClass('subbutton__actived');

          //一级菜单列数
          var buttonIndex = $(this).parents('.custom-menu-view__menu').index() - 1;
          $('.custom-menu-view__menu').eq(buttonIndex).on('click', (function(buttonIndex) {
            var txt = $('.custom-menu-view__menu').eq(buttonIndex).text();
            setMenuText(txt);
          })(buttonIndex));

          if (ix == 1) {
            $('.custom-menu-view__menu').css({
              width: '50%'
            });
            $('.custom-menu-view__menu')[ix - 1].setAttribute('alt', ix - 1);
          }
          if (ix == 2) {
            $('.custom-menu-view__menu').css({
              width: '33.3333%'
            });
            $('.custom-menu-view__menu')[ix - 1].setAttribute('alt', ix - 1);
          }
          var divText = $(this).parent().prev().find('.text-ellipsis').text();
          button.push(new parents(divText));
        }
        if (ix == 3) {
          $(this).parents('.custom-menu-view__menu').remove();
          $(this).parent().append(customUl);
          $('.custom-menu-view__menu')[ix - 1].setAttribute('alt', ix - 1);
        }
        $('.cm-edit-after').show().siblings().hide();

      });
      var setMenuText = function(value) {
        setInput(value);
        updateTit(value);

        radios[0].checked = true;
        $('#editMsg').show();
        $('#editPage').hide();
        $('.msg-context__item').show();
        $('.msg-template').hide();
      }

      function setSubText() {
        var actived = $('.custom-menu-view__menu__sub__add').hasClass('subbutton__actived');
        var activedTxt = $('.subbutton__actived').text();
        if (actived) {
          setInput(activedTxt);
          updateTit(activedTxt);

          radios[0].checked = true;
          $('#editMsg').show();
          $('#editPage').hide();
          $('.msg-context__item').show();
          $('.msg-template').hide();
        }
      }
      //添加子菜单
      var colIndex; //一级菜单列数
      customBtns.on('click', 'li>.text-ellipsis>i', function() {
        //绑定删除事件
        $('.msg-panel__del').on('click', delClick);
        colIndex = $(this).parents('.custom-menu-view__menu').attr('alt');
        var liNum = $(this).parents('.custom-menu-view__menu').find('li').length;

        if (liNum <= 1) {
          $('#reminderModal').modal('show');
        } else {
          if (liNum < 6) {
            $(this).parent().parent().before(customLi);
            setLiId();
          }
          if (liNum == 5) {
            $(this).parents('li').remove();
          }
        }
        $('#radioGroup').show();
        setSubText()
      });
      //确定添加子菜单事件
      $('.reminder').click(function() {
        var ul = $('.custom-menu-view__menu')[colIndex].getElementsByTagName('ul')[0];
        var li = document.createElement('li');
        var div = document.createElement('div');
        var Text = document.createTextNode('新建子菜单');
        li.className = "custom-menu-view__menu__sub__add";
        div.className = "text-ellipsis";
        div.appendChild(Text);
        li.appendChild(div);
        ul.insertBefore(li, ul.childNodes[0]);
        setLiId();
        delete button[colIndex].type;
        delete button[colIndex].key;
        delete button[colIndex].url;
        $('#reminderModal').modal('hide');

        setSubText()
      });
      //对新添加二级菜单添加id
      function setLiId() {
        var prev = $('.custom-menu-view__menu')[colIndex].getElementsByTagName('i')[0].parentNode.parentNode.previousSibling;
        var divText = prev.childNodes[0].innerHTML;
        button[colIndex].sub_button.push(new subs(divText));
        var id = button[colIndex].sub_button.length - 1;
        prev.setAttribute('id', 'sub_' + colIndex + '_' + id);

        $('.custom-menu-view__footer__right').find('.subbutton__actived').removeClass('subbutton__actived');
        $('.custom-menu-view__menu').eq(colIndex).find('i').parent().parent().prev().addClass('subbutton__actived');
      }
      //点击菜单
      customBtns.on('click', '.text-ellipsis', function() {
        $('.cm-edit-after').show().siblings().hide();
        if ($(this).parent().attr('id') || $(this).parent().attr('alt')) {
          $(this).parents('.custom-menu-view__footer__right').find('.subbutton__actived').removeClass('subbutton__actived');
          $(this).parent().addClass('subbutton__actived');
        }
        //一级菜单列数
        var buttonIndex = $(this).parents('.custom-menu-view__menu').index();
        if ($('.msg-context__item').is(':hidden')) {
          $('.msg-template').show();
        } else if ($('.msg-context__item').is(':visible')) {
          $('.msg-template').hide();
        }
        //点击在一级菜单上
        if ($(this).parent().attr('alt')) {

          if ($('.custom-menu-view__menu').hasClass('subbutton__actived')) {
            var current = $('.subbutton__actived');
            var alt = current.attr('alt');
            var lis = current.find('ul>li');
            setInput(button[buttonIndex].name);
            updateTit(button[buttonIndex].name);
            if (lis.length > 1) {
              $('#editMsg').hide();
              $('#editPage').hide();
              $('#radioGroup').hide();
            } else {
              if (button[buttonIndex].type == 'click') {
                radios[0].checked = true;
                $('#editMsg').show();
                $('#editPage').hide();
                $('#radioGroup').show();

                //拿key换取mediaId         
                subKey = button[buttonIndex].key;
                $('.msg-template').html($('#' + subKey).html());
                delElement();
                //绑定删除事件
                $('.msg-panel__del').on('click', delClick);

                $('.msg-template').html(tempObj[button[buttonIndex].key]);
              } else if (button[buttonIndex].type == 'view') {
                $('input[name="url"]').val(button[buttonIndex].url);
                radios[1].checked = true;
                $('#editMsg').hide();
                $('#editPage').show();
                $('#radioGroup').show();
              } else if (!button[buttonIndex].type) {
                radios[0].checked = true;
                $('#editMsg').show();
                $('#editPage').hide();
                $('#radioGroup').show();
              }
              if (button[buttonIndex].key) {
                $('.msg-context__item').hide();
                $('.msg-template').show();
              } else {
                $('.msg-context__item').show();
                $('.msg-template').hide();
              }
            }

          }

        }
        //点击在二级菜单上
        if ($(this).parent().attr('id')) {
          var substr = $(this).parent().attr('id').lastIndexOf('_') + 1;
          var subIndex = $(this).parent().attr('id').substring(substr);
          var subText = button[buttonIndex].sub_button[subIndex].name;
          var subUrl = button[buttonIndex].sub_button[subIndex].url;
          var subType = button[buttonIndex].sub_button[subIndex].type;
          var subKey = button[buttonIndex].sub_button[subIndex].key;

          if ($('.custom-menu-view__menu__sub__add').hasClass('subbutton__actived')) {
            setInput(subText);
            updateTit(subText);
            $('#radioGroup').show();
            if (subType == 'click') {
              radios[0].checked = true;
              $('#editMsg').show();
              $('#editPage').hide();

              //拿key换取图文消息    
              $('.msg-template').html($('#' + subKey).html());
              delElement();
              //绑定删除事件
              $('.msg-panel__del').on('click', delClick);
              $('.msg-template').html(tempObj[subKey]);
            } else if (subType == 'view') {
              radios[1].checked = true;
              $('#editMsg').hide();
              $('#editPage').show();
              $('input[name="url"]').val(subUrl);
            } else if (!subType) {
              radios[0].checked = true;
              $('#editMsg').show();
              $('#editPage').hide();
              $('input[name="url"]').val('');
            }
            if (subKey) {
              $('.msg-context__item').hide();
              $('.msg-template').show();
            } else {
              $('.msg-context__item').show();
              $('.msg-template').hide();
            }
          }
        }
        //绑定删除事件
        $('.msg-panel__del').on('click', delClick);
      });
      //设置右边input的value
      function setInput(val) {
        $('input[name="custom_input_title"]').val(val);
      }
      //实时更新右侧顶部标题
      function updateTit(text) {
        $('#cm-tit').html(text);
      }
      //保存右侧菜单名称
      $('input[name="custom_input_title"]').keyup(function() {
        var val = $(this).val();
        var current = $('.subbutton__actived');
        if ($('.custom-menu-view__menu__sub__add').hasClass('subbutton__actived')) {
          var row = current.attr('id').lastIndexOf('_') - 1;
          var col = current.attr('id').lastIndexOf('_') + 1;
          var sub_row = current.attr('id').substr(row, 1);
          var sub_col = current.attr('id').substring(col);
          button[sub_row].sub_button[sub_col].name = val;
          current.find('.text-ellipsis').text(val);
          updateTit(val);
        } else if ($('.custom-menu-view__menu').hasClass('subbutton__actived')) {
          var alt = current.attr('alt');
          button[alt].name = val;
          current.children('.text-ellipsis').text(val);
          updateTit(val)
        }

      });
      //保存右侧跳转页面的url
      $('input[name="url"]').keyup(function() {
        var val = $(this).val();
        var current = $('.subbutton__actived');
        if ($('.custom-menu-view__menu__sub__add').hasClass('subbutton__actived')) {
          var row = current.attr('id').lastIndexOf('_') - 1;
          var col = current.attr('id').lastIndexOf('_') + 1;
          var sub_row = current.attr('id').substr(row, 1);
          var sub_col = current.attr('id').substring(col);
          button[sub_row].sub_button[sub_col].url = val;
          button[sub_row].sub_button[sub_col].type = 'view';
          if (button[sub_row].sub_button[sub_col].url == '') {
            delete button[sub_row].sub_button[sub_col].url;
          }
        } else if ($('.custom-menu-view__menu').hasClass('subbutton__actived')) {
          var alt = current.attr('alt');
          button[alt].url = val;
          button[alt].type = 'view';
          if (button[alt].url == '') {
            delete button[alt].url;
          }
        }

      });
      //自定义菜单排序
      $('#sortBtnc').click(function() {
        var btnWrap = $('.custom-menu-view__footer__right').find('.custom-menu-view__menu');
        var numBtn = btnWrap.length;
        $('#sortBtnc').hide();
        $('#sortBtn').show();
        $('#saveBtns').show();
        $('.iBtn').parents('.custom-menu-view__menu').show();
        if (button.length > 0) {
          $('.cm-edit-after').show().siblings().hide();
        } else {
          $('.cm-edit-before').show().siblings().hide();
        }

        for (var n = 0; n < numBtn; n++) {
          var ul = btnWrap[n].getElementsByTagName('ul')[0];
          if (ul) {
            (function(n) {
              ul.setAttribute('id', 'menuStage_2_' + (n + 1));
              sortIndex = false;
              sortable(n + 1, sortIndex);
              //$('.text-ellipsis>i').parents('li').show();
              var i_el = '<li class="custom-menu-view__menu__sub__add"><div class="text-ellipsis"><i class="glyphicon glyphicon-plus text-info"></i></div></li>';
              $('.custom-menu-view__menu__sub').eq(n).append(i_el);
            })(n);
            if (ix == 1) {
              $('.custom-menu-view__menu').css({
                width: '50%'
              })
            }
            if (ix == 2) {
              $('.custom-menu-view__menu').css({
                width: '33.3333%'
              });
            }

          }
        }
      });
      $('#sortBtn').click(function() {
        var btnWrap = $('.custom-menu-view__footer__right').find('.custom-menu-view__menu');
        var numBtn = btnWrap.length;
        $('#sortBtnc').show();
        $('#sortBtn').hide();
        $('#saveBtns').hide();
        $('.iBtn').parents('.custom-menu-view__menu').hide();
        $('.cm-drag-before').show().siblings().hide();
        for (var n = 0; n < numBtn; n++) {
          var ul = btnWrap[n].getElementsByTagName('ul')[0];
          if (ul) {
            (function(n) {
              ul.setAttribute('id', 'menuStage_2_' + (n + 1));
              sortIndex = true;
              sortable(n + 1, sortIndex);
              $('.text-ellipsis>i').parents('li').remove();
            })(n);
            if (ix == 1) {
              $('.custom-menu-view__menu').css({
                width: '100%'
              })
            }
            if (ix == 2) {
              $('.custom-menu-view__menu').css({
                width: '50%'
              });
            }

          }
        }

      });

      function sortable(m, sortIndex) {
        if (sortIndex) {
          Sortable.create(document.getElementById('menuStage_2_' + m), {
            animation: 300, //动画参数
            disabled: false,
          });
        } else {
          var el = document.getElementById('menuStage_2_' + m);
          var sortable = Sortable.create(el, {
            disabled: true,
          });
          sortable.destroy();

        }
      }

      //tab切换
      $('.msg-panel__tab>li').click(function() {
        $('.msg-panel__tab>li').eq($(this).index()).addClass('on').siblings().removeClass('on');
        $('.msg-panel__context').eq($(this).index()).removeClass('hide').siblings().addClass('hide')
      });

      //菜单内容跳转
      var radios = document.getElementsByName("radioBtn");
      for (var n = 0; n < radios.length; n++) {
        radios[n].index = n;
        radios[n].onchange = function() {
          if (radios[this.index].checked == true) {
            if (radios[this.index].value == 'link') {
              $('#editMsg').hide();
              $('#editPage').show();
            } else {
              $('#editMsg').show();
              $('#editPage').hide();
            }
          }
        };
      }
      //id为selectModal弹框选中遮罩层
      $('#selectModal .modal-body .panel').click(function() {
        $(this).find('.mask-bg').show();
        $(this).parent().siblings().find('.mask-bg').hide();
        mId = $(this).parent().attr('id');
      });
      //id为selectModal弹框确定按钮事件
      $('#selectModal .ensure').on('click', function() {
        var msgTemp = $('.msg-template');
        var delEl = '<span class="msg-panel__del del-tuwen">删除</span>';
        if (mId != null) {
          msgTemp.html($('#' + mId).html());
          delElement();
          msgTemp.find('.mask-bg').hide();
          msgTemp.siblings().hide();
          msgTemp.show();
          tempObj[mId] = msgTemp.html();
          //绑定删除事件
          $('.msg-panel__del').on('click', delClick);
          var current = $('.subbutton__actived');
          var input_name = $('input[name="custom_input_title"]');
          if ($('.custom-menu-view__menu__sub__add').hasClass('subbutton__actived')) {
            var row = current.attr('id').lastIndexOf('_') - 1;
            var col = current.attr('id').lastIndexOf('_') + 1;
            var sub_row = current.attr('id').substr(row, 1);
            var sub_col = current.attr('id').substring(col);

            button[sub_row].sub_button[sub_col].name = input_name.val();
            button[sub_row].sub_button[sub_col].key = mId;
            button[sub_row].sub_button[sub_col].type = 'click';
          } else if ($('.custom-menu-view__menu').hasClass('subbutton__actived')) {
            var alt = current.attr('alt');
            button[alt].name = input_name.val();
            button[alt].key = mId;
            button[alt].type = 'click';
          }

        }
        $('#selectModal').modal('hide');
      });
      //type为click时添加删除按钮元素
      function delElement() {
        var msgTemp = $('.msg-template');
        var delEl = '<span class="msg-panel__del del-tuwen">删除</span>';
        msgTemp.append(delEl);
        if (msgTemp.find('span').length == 0) {
          msgTemp.append(delEl);
        }
      };
      var delClick = function() {
        $('.msg-template').empty();
        $('.msg-context__item').show();
        $('.mask-bg').hide();

        var current = $('.subbutton__actived');
        if ($('.custom-menu-view__menu__sub__add').hasClass('subbutton__actived')) {
          var row = current.attr('id').lastIndexOf('_') - 1;
          var col = current.attr('id').lastIndexOf('_') + 1;
          var sub_row = current.attr('id').substr(row, 1);
          var sub_col = current.attr('id').substring(col);
          delete button[sub_row].sub_button[sub_col].key;
        } else if ($('.custom-menu-view__menu').hasClass('subbutton__actived')) {
          var alt = current.attr('alt');
          delete button[alt].key;
        }
      };
      //删除菜单按钮
      $('#delMenu').click(function() {
        var is_Actived = $('.custom-menu-view__menu').hasClass('subbutton__actived'); //一级菜单选择项
        var is_actived = $('.custom-menu-view__menu__sub__add').hasClass('subbutton__actived'); //二级菜单选中项
        var rowIndex = 0;
        var colIndex = 0;

        if (is_Actived) {
          rowIndex = $('.subbutton__actived').attr('alt');
          //删除顶级菜单
          $('.subbutton__actived').remove();
          
          button.splice(rowIndex,1);
          // delete button[rowIndex];
          
        } else if (is_actived) {
          rowIndex = $('.subbutton__actived').attr('id').substr($('.subbutton__actived').attr('id').lastIndexOf('_') - 1, 1);
          
          colIndex = $('.subbutton__actived').attr('id').substr($('.subbutton__actived').attr('id').lastIndexOf('_') + 1, 1);

          $('.subbutton__actived').remove();
          
          button[rowIndex].sub_button.splice(colIndex,1);
          
          // delete button[rowIndex].sub_button[colIndex];//delete不能彻底删除
          
        }
        //清除右边数据
        $('.cm-edit-before').show().siblings().hide();
        updateTit('');
        setInput('');
        $('input[name="url"]').val('');
        $('.msg-template').children().remove();
        $('.msg-context__item').show();
      })
      //保存自定义菜单
      $('#saveBtns').click(function() {
        console.log(obj)
        var activeBtn = $('.custom-menu-view__menu').hasClass('subbutton__actived');
        var activeSubBtn = $('.custom-menu-view__menu__sub__add').hasClass('subbutton__actived');
        var rowIndex = 0;
        var colIndex = 0;
        var url = null;
        var strRegex = '(https?|ftp|file)://[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@#/%=~_|]';
        var re = new RegExp(strRegex);

        if (activeBtn) {
          rowIndex = $('.subbutton__actived').attr('alt');
        } else if (activeSubBtn) {
          rowIndex = $('.subbutton__actived').attr('id').substr($('.subbutton__actived').attr('id').lastIndexOf('_') - 1, 1);
          colIndex = $('.subbutton__actived').attr('id').substr($('.subbutton__actived').attr('id').lastIndexOf('_') + 1, 1);
        }

        if (activeBtn) {
          //一级菜单
          if (button[rowIndex].hasOwnProperty('url')) {
            url = button[rowIndex].url;
            if (!re.test(url)) {
              layer.msg("请输入正确的url地址！");
              return false;
            }
            saveAjax();
          } else if (button[rowIndex].hasOwnProperty('key')) {
            saveAjax();
          } else {
            layer.msg("菜单内容不能为空！");
          }
        } else if (activeSubBtn) {
          //二级菜单
          if (button[rowIndex].sub_button[colIndex].hasOwnProperty('url')) {
            url = button[rowIndex].sub_button[colIndex].url;
            if (!re.test(url)) {
              layer.msg("请输入正确的url地址！");
              return false;
            }
            saveAjax();
          } else if (button[rowIndex].sub_button[colIndex].hasOwnProperty('key')) {
            //layer.msg("请选择图文信息！");
            saveAjax();
          } else {
            layer.msg("菜单内容不能为空！");
          }
        } else {
          saveAjax();
        }
      });


      //保存
      function saveAjax() {
        // console.log(JSON.stringify(obj))
        post = {
          'menu': JSON.stringify(obj)
        };
        layer.msg("正在操作中，请稍后...",{icon:1});
        $.ajax({
          type: "POST",
          // url: "<%=path%>/menu/saveButton.html",
          url: "menu_custom",
          data: post,
          dataType: "json",
          success: function(data) {

            if (data.status == 1) {
              // console.log(data.msg);
              layer.msg(data.msg,{icon:1});
              location.reload();
            } else {
              // console.log(data.msg);
              layer.msg(data.msg,{icon:1});
            }
          }
        });
      }
    });
</script>
</html>