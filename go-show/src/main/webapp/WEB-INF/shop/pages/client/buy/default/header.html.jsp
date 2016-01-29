<%@page language="Java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jstl/core_rt'%>
<%@ taglib uri="/fis" prefix="fis"%>
<div class="header-wrap">
  <header class="public-head-layout wrapper">
    <h1 class="site-logo"><a href="#"><img class="pngFix" src="${S_URL}/res/img/logo.png"></a></h1>
    <div class="head-search-bar">
      <form class="search-form" method="get" action="#">
        <input type="hidden" value="search" id="search_act" name="act">
        <input type="text" lang="zh-CN" x-webkit-grammar="builtin:search" placeholder="请输入您要搜索的商品关键字" onwebkitspeechchange="foo()" x-webkit-speech="" maxlength="60" value="" class="input-text" id="keyword" name="keyword">
        <input type="submit" class="input-submit" value="搜索" id="button">
      </form>
      <div class="keyword">热门搜索：        <ul>
                    <li><a href="#">周大福</a></li>
                    <li><a href="#">内衣</a></li>
                    <li><a href="#">金史密斯</a></li>
                    <li><a href="#">手机</a></li>
                  </ul>
      </div>
    </div>
    <div class="head-user-menu">
      <dl class="my-mall">
        <dt><span class="ico"></span>我的商城<i class="arrow"></i></dt>
        <dd>
          <div class="sub-title">
            <h4></h4>
            <a class="arrow" href="#">我的用户中心<i></i></a></div>
          <div class="user-centent-menu">
            <ul>
              <li><a href="#">站内消息(<span>0</span>)</a></li>
              <li><a class="arrow" href="#">我的订单<i></i></a></li>
              <li><a href="#">咨询回复(<span id="member_consult">0</span>)</a></li>
              <li><a class="arrow" href="#">我的收藏<i></i></a></li>
                            <li><a href="#">代金券(<span id="member_voucher">0</span>)</a></li>
                                          <li><a class="arrow" href="#">我的积分<i></i></a></li>
                          </ul>
          </div>
          <div class="browse-history">
            <div class="part-title">
              <h4>最近浏览的商品</h4>
            </div>
            <ul><li class="no-goods">暂无商品</li></ul>
          </div>
        </dd>
      </dl>
      <dl class="my-cart">
                <dt><span class="ico"></span>购物车结算<i class="arrow"></i></dt>
        <dd>
          <div class="sub-title">
            <h4>最新加入的商品</h4>
          </div>
          <div class="incart-goods-box">
            <div class="incart-goods"><div class="no-order"><span>您的购物车中暂无商品，赶快选择心爱的商品吧！</span></div></div>
          </div>
          <div class="checkout"> <span class="total-price"></span><a class="btn-cart" href="#">结算购物车中的商品</a> </div>
        </dd>
      </dl>
    </div>
  </header>
</div>
<fis:script>
  var PRICE_FORMAT = '&yen;%s';
  $(function(){
    //首页左侧分类菜单
    $(".category ul.menu").find("li").each(
            function() {
              $(this).hover(
                      function() {
                        var cat_id = $(this).attr("cat_id");
                        var menu = $(this).find("div[cat_menu_id='"+cat_id+"']");
                        menu.show();
                        $(this).addClass("hover");
                        if(menu.attr("hover")>0) return;
                        menu.masonry({itemSelector: 'dl'});
                        var menu_height = menu.height();
                        if (menu_height < 60) menu.height(80);
                        menu_height = menu.height();
                        var li_top = $(this).position().top;
                        if ((li_top > 60) && (menu_height >= li_top)) $(menu).css("top",-li_top+50);
                        if ((li_top > 150) && (menu_height >= li_top)) $(menu).css("top",-li_top+90);
                        if ((li_top > 240) && (li_top > menu_height)) $(menu).css("top",menu_height-li_top+90);
                        if (li_top > 300 && (li_top > menu_height)) $(menu).css("top",60-menu_height);
                        if ((li_top > 40) && (menu_height <= 120)) $(menu).css("top",-5);
                        menu.attr("hover",1);
                      },
                      function() {
                        $(this).removeClass("hover");
                        var cat_id = $(this).attr("cat_id");
                        $(this).find("div[cat_menu_id='"+cat_id+"']").hide();
                      }
              );
            }
    );
    $(".head-user-menu dl").hover(function() {
              $(this).addClass("hover");
            },
            function() {
              $(this).removeClass("hover");
            });
    $('.head-user-menu .my-mall').mouseenter(function(){// 最近浏览的商品
      load_history_information();
      $(this).unbind('mouseover');
    });
    $('.head-user-menu .my-cart').mouseenter(function(){// 运行加载购物车
      load_cart_information();
      $(this).unbind('mouseenter');
    });
    $('#button').click(function(){
      if ($('#keyword').val() == '') {
        return false;
      }
    });

  load_cart_information();
  });
</fis:script>