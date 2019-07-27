<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
	<base href="<%=basePath%>">

	<title>我的订单 - 网络商城</title>
	<link href="css/orders.css" rel="stylesheet" />
	<link href="css/header.css" rel="stylesheet" />
	<link href="css/footer.css" rel="stylesheet" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<!-- 页面顶部-->
	<div id="header">
		<component-fix-nav user-id="${nowuser.id}" user-name="${nowuser.username}"></component-fix-nav>
	</div>
	<!-- 我的订单导航栏-->
	<div id="nav_order">
		<ul>
			<li><a href="indexx_ctlr/indexx.do">首页</a><span>&gt;</span>订单管理
				</li>
		</ul>
	</div>
	<!--我的订单内容区域 #container-->
	<div id="container" class="clearfix">
		<!-- 左边栏-->
		<component-left-sidebar></component-left-sidebar>

		<!-- 右边栏-->
		<div class="rightsidebar_box rt">
			<!-- 商品信息标题-->
			<table id="order_list_title" cellpadding="0" cellspacing="0">
				<tr>
					<th width="345">商品</th>
					<th width="82">单价（元）</th>
					<th width="50">数量</th>
					<th width="82">售后</th>
					<th width="100">实付款（元）</th>
					<th width="90">交易状态</th>
					<th width="92">操作</th>
				</tr>
			</table>
			<!-- 订单列表项 -->
			<div id="orderItem">
				<p class="orderItem_title">
					<span id="order_id"> &nbsp;&nbsp;订单编号:<a>12345678910</a>
					</span> &nbsp;&nbsp;成交时间：2016-01-04 18:00&nbsp;&nbsp; <span> <a class="servie"> 联系客服<img
								src="images/myOrder/kefuf.gif" />
						</a>
					</span>
				</p>
			</div>
			<div id="orderItem_detail">
				<ul>
					<li class="product"><b><a><img src="images/myOrder/product_img1.png" /></a></b> <b
							class="product_name lf"> <a>联想(Lenovo)YoGA5 PRO
								标配版电脑 (I5-7200U 8G 512G SSD IPS)</a> <br />
						</b> <b class="product_color "> 颜色：深空灰 </b></li>
					<li class="unit_price">专属价 <br /> ￥8800
					</li>
					<li class="count">1件</li>
					<li class="sale_support">退款/退货 <br /> 我要维权
					</li>
					<li class=" payments_received">￥1222.00</li>
					<li class="trading_status"><img src="images/myOrder/car.png" alt="" />已发货 <br /> <a
							href="order_info_ctlr/order_info.do">订单详情</a> <br /> <a href="order_info_ctlr/order_info.do" class="view_logistics">查看物流</a></li>
					<li class="operate"><a>确认收货</a></li>
				</ul>
			</div>

			<div id="orderItem">
				<p class="orderItem_title">
					<span id="order_id"> &nbsp;&nbsp;订单编号:<a>12345678910</a>
					</span> &nbsp;&nbsp;成交时间：2016-01-04 18:00&nbsp;&nbsp; <span> <a class="servie"> 联系客服<img
								src="images/myOrder/kefuf.gif" />
						</a>
					</span>
				</p>
			</div>
			<div id="orderItem_detail">
				<ul>
					<li class="product"><b><a><img src="images/myOrder/product_img1.png" /></a></b> <b
							class="product_name lf"> <a>联想(Lenovo)YoGA5 PRO
								标配版电脑 (I5-7200U 8G 512G SSD IPS)</a> <br />
						</b> <b class="product_color "> 颜色：深空灰 </b></li>
					<li class="unit_price">专属价 <br /> ￥8800
					</li>
					<li class="count">1件</li>
					<li class="sale_support">退款/退货 <br /> 我要维权
					</li>
					<li class=" payments_received">￥1222.00</li>
					<li class="trading_status"><img src="images/myOrder/car.png" alt="" />已发货 <br />
						<a href="order_info_ctlr/order_info.do">订单详情</a> <br />
						<a href="order_info_ctlr/order_info.do" class="view_logistics">查看物流</a></li>
					<li class="operate"><a>确认收货</a></li>
				</ul>
			</div>

			<div id="orderItem">
				<p class="orderItem_title">
					<span id="order_id"> &nbsp;&nbsp;订单编号:<a>12345678910</a>
					</span> &nbsp;&nbsp;成交时间：2016-01-04 18:00&nbsp;&nbsp; <span>
						<a class="servie"> 联系客服<img src="images/myOrder/kefuf.gif" />
						</a>
					</span>
				</p>
			</div>
			<div id="orderItem_detail">
				<ul>
					<li class="product"><b><a><img src="images/myOrder/product_img1.png" /></a></b> <b
							class="product_name lf">
							<a>联想(Lenovo)YoGA5 PRO
								标配版电脑 (I5-7200U 8G 512G SSD IPS)</a> <br />
						</b> <b class="product_color "> 颜色：深空灰 </b></li>
					<li class="unit_price">专属价 <br /> ￥8800
					</li>
					<li class="count">1件</li>
					<li class="sale_support">退款/退货 <br /> 我要维权
					</li>
					<li class=" payments_received">￥1222.00</li>
					<li class="trading_status"><img src="images/myOrder/car.png" alt="" />已发货 <br /> <a
							href="order_info_ctlr/order_info.do">订单详情</a> <br /> <a href="order_info_ctlr/order_info.do" class="view_logistics">查看物流</a></li>
					<li class="operate"><a>确认收货</a></li>
				</ul>
			</div>


			<!--分页器-->
			<div class="tcdPageCode"></div>

		</div>
	</div>
	<!-- 页面底部-->
	<div id="foot">
		<component-foot></component-foot>
	</div>
</body>
<script type="text/javascript" src="/smsmxm/js/jquery-3.1.1.min.js"></script>
<script src="/smsmxm/js/index.js"></script>
<script src="/smsmxm/js/jquery.page.js"></script>
<script type="text/javascript" src="/smsmxm/js/orders.js"></script>
<script src="https://cdn.bootcss.com/vue/2.6.10/vue.min.js"></script>
<script src="/smsmxm/js/component-fix-nav.js"></script>
<script src="/smsmxm/js/component-left-sidebar.js"></script>
<script src="/smsmxm/js/component-foot.js"></script>
<script>
	var header_vm = new Vue({
		el: "#header",
	})
</script>
<script>
	var container_vm = new Vue({
		el: "#container",
	})
</script>
<script>
	var vm = new Vue({
		el: "#foot"
	})
</script>

</html>