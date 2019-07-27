<%@ page language="java" import="java.util.*,com.sc.entity.*"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<meta charset="UTF-8">
<title>商城购物车</title>
<link rel="stylesheet" href="css/header.css" />
<link rel="stylesheet" href="css/footer.css" />
<link rel="stylesheet" href="css/cart.css" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


</head>

<body>
	<!-- 页面顶部-->
	<header id="top" class="fixed_nav">
	<div id="logo" class="lf">
		<img class="animated jello" src="images/header/logo.png" alt="logo" />
	</div>
	<div id="top_input" class="lf">
		<input id="input" type="text" placeholder="请输入您要搜索的内容" /> <a
			href="search" class="rt"><img id="search"
			src="images/header/search.png" alt="搜索" /></a>
	</div>
	<div class="rt">
		<ul class="lf">
			<li><a href="favorites" title="我的收藏"><img
					src="images/header/care.png" alt="" /></a><b>|</b></li>
			<li><a href="orders" title="我的订单"><img
					src="images/header/order.png" alt="" /></a><b>|</b></li>
			<li><a href="cart" title="我的购物车"><img
					src="images/header/shop_car.png" alt="" /></a><b>|</b></li>
			<li><a href="help">帮助</a><b>|</b></li>
			<li><a href="login.jsp">${nowuser.username },欢迎你</a></li>
		</ul>
	</div>
	</header>
	<!-- nav主导航-->
	<nav id="nav">
	<ul>
		<li><a href="index.jsp" class="acti">首页</a></li>
		<li><a href="index.jsp#computer">电脑办公</a></li>
		<li><a href="index.jsp#stationery">办公文具</a></li>
	</ul>
	</nav>
	<div class="modal" style="display: none">
		<div class="modal_dialog">
			<div class="modal_header">删除提醒</div>
			<div class="modal_information">
				<img src="images/model/model_img2.png" alt="" /> <span>确定删除您的这个宝贝吗？</span>
			</div>
			<div class="yes">
				<span>删除</span>
			</div>
			<div class="no">
				<span>不删除</span>
			</div>
		</div>
	</div>
	<div class="modalNo" style="display: none">
		<div class="modal_dialog">
			<div class="modal_header">
				删除提示 <img src="images/model/model_img1.png" alt="" class="rt close" />
			</div>
			<div class="modal_information">
				<img src="images/model/model_img2.png" alt="" /> <span>请选择商品</span>
			</div>
		</div>
	</div>
	<div class="big">
		<form name="" action="" method="post">
			<section id="section">
			<div id="title">
				<b>购物车</b>
				<p>
					已选<span class="total color">0</span>件商品<span class="interval"></span>合计(不含运费):<span
						class="totalPrices color susum">0.00</span><span
						class="unit color">元</span>
				</p>
			</div>
			<div id="box">
				<div id="content_box">
					<div class="imfor_top">
						<div class="check_top">
							<div class="all">
								<span class="normal"> <!-- <img src="images/cart/product_normal.png" alt="" /> -->
								</span> <input type="hidden" name="" value="">全选
							</div>
						</div>
						<div class="pudc_top">商品</div>
						<div class="pices_top">单价(元)</div>
						<div class="num_top">数量</div>
						<div class="totle_top">金额</div>
						<div class="del_top">操作</div>
					</div>
					<%
						List<Order> orders = (List) session.getAttribute("order");
						for (int i = 0; i < orders.size(); i++) {
					%>
					<div class="imfor">
						<div class="check">
							<div class="Each">
								<label> <input type="checkbox" class="checkbox">
									<span class="normal"></span>
								</label>
							</div>
						</div>
						<!-- ${orders.get(i).getIphoto() } -->
						<div class="pudc">
							<div class="pudc_information" id="pudcId3">
								<!--<img src="images/product_detail/product_detail_2.png" class="lf" />-->
								<img src=<%=orders.get(i).getIphoto()%> class="lf" /> <input
									type="hidden" name="" value=""> <span class="des lf">
									<%=orders.get(i).getIname()%> <input type="hidden" name=""
									value="">
								</span>
								<p class="col lf">
									<span>颜色：</span><span class="color_des">深空灰 <input
										type="hidden" name="" value=""></span>
								</p>
							</div>
						</div>
						<div class="pices">
							<p class="pices_des">专享价</p>
							<p class="pices_information">
								<b>￥</b><span><%=orders.get(i).getIprice()%> <input
									type="hidden" name="" value=""></span>
							</p>
						</div>
						<div class="num">
							<span class="reduc">&nbsp;-&nbsp;</span><input type="text"
								value="1"><span class="add">&nbsp;+&nbsp;</span>
						</div>
						<div class="totle">
							<span>￥</span> <span class="totle_information"><%=orders.get(i).getIprice()%></span>
						</div>
						<div class="del">
							<!-- <div>
                            <img src="img/true.png" alt=""/>
                            <span>已移入收藏夹</span>
                        </div>
                         <a href="javascript:;" class="del_yr">移入收藏夹</a>
                        -->
							<aclass="del_d">删除</a>
						</div>
					</div>

					<%
						}
					%>
					<div class="foot">
						<div class="foot_check">
							<div class="all">
								<span class="normal"> </span> 
								<input type="hidden" name="" value="">全选
							</div>
						</div>
						<a class="foot_del">删除</a>
						<!--<a href="javascript:;" class="foot_yr">移入收藏夹</a>-->
						<div class="foot_qk">清空失效商品</div>
						<div class="foot_cash" id="go-buy">去结算</div>
						<div class="foot_tol">
							<span>合计(不含运费):</span><span class="foot_pices susumOne">0.00</span><span
								class='foot_des'>元</span>
						</div>
						<div class="foot_selected">
							已选<span class="totalOne color">0</span>件商品
						</div>
					</div>
				</div>
			</section>
		</form>
		<div class="none" style="display: none">
			<p class="none_title">购物车</p>
			<div class="none_top"></div>
			<div class="none_content">
				<!-- <img src="images/30.png" alt="" class="lf" /> -->
				<p class="lf">您的购物车竟然还是空哒( ⊙ o ⊙ )</p>
				<span class="lf">赶快去下单吧！</span> <a href="#" class="lf">去购物>></a>
			</div>

		</div>
	</div>
	<!-- 页面底部-->
	<div id="foot">
		<component-foot></component-foot>
	</div>
	<script src="js/jquery-3.1.1.min.js"></script>
	<script src="https://cdn.bootcss.com/vue/2.6.10/vue.min.js"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<script src="js/cart.js"></script>
	<script src="js/index.js"></script>
	<script src="js/component-fix-nav.js"></script>
	<script src="js/component-foot.js"></script>
	<script>
		var header_vm = new Vue({
			el : "#header",
		})
	</script>
	<script>
    var vm = new Vue({
      el: "#foot",
      mounted() {
        $(".Each span").each(function () {
          $(this).addClass('normal').removeClass('true');
          $(this).prev().prop("checked", false);
          $(this).prev().removeAttr("checked");
        });
      }
    })
  </script>
  <script>
    // 显示空购物车页面
    $(() => {
      if (!$(".imfor")) {
        $('#section').hide();
        $('.none').show();
      }
    })
    $("#go-buy").click(() => {
      var i = 0;
      var orders = [];
      $('.Each span').each(function () {
        if ($(this).hasClass('true')) {
          i++;
          var img = $(this).parents('.imfor').children('.pudc').find('.pudc_information>img.lf').attr(
            'src');
          var title = $(this).parents('.imfor').children('.pudc').find('.pudc_information>span.des').text();
          var color = $(this).parents('.imfor').children('.pudc').find('.pudc_information span.color_des')
            .text();
          var price = $(this).parents('.imfor').children('.pices').find('span').text();
          var count = $(this).parents('.imfor').children('.num').children('input').val();
          var order = {
            'img': img,
            'title': title,
            'color': color,
            'price': price,
            'count': count
          }
          // console.log(img);
          // console.log(title);
          // console.log(color);
          // console.log(price);
          // console.log(count);

          orders.push(order);
        }
      })
      if (i <= 0) {
        alert('请选择商品！');
      } else {
        localStorage.setItem('orders', JSON.stringify(orders));
        // console.log(JSON.parse(localStorage.getItem('orders')));
        window.location.href = "orderConfirm";
      }
    })
  </script>
</body>

</jsp>