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
<link href="css/orders.css" rel="Stylesheet" />
<link href="css/header.css" rel="Stylesheet" />
<link href="css/footer.css" rel="Stylesheet" />
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
		<component-fix-nav user-id="${nowuser.id}"
			user-name="${nowuser.username}"></component-fix-nav>
	</div>
	<!-- 我的订单导航栏-->
	<div id="nav_order">
		<ul>
			<li><a href="indexx_ctlr/indexx.do">首页<span>&gt;</span>订单管理
			</a></li>
		</ul>
	</div>
	<!--我的订单内容区域 #container-->
	<div id="container" class="clearfix">
		<!-- 左边栏-->
		<div id="leftsidebar_box" class="lf">
			<div class="line"></div>
			<dl class="my_order">
				<dt>
					我的订单 <img src="images/myOrder/myOrder2.png">
				</dt>
				<dd class="first_dd">
					<a href="#">全部订单</a>
				</dd>
				<dd>
					<a href="#"> 待付款 <span> <!--待付款数量--></span>
					</a>
				</dd>
				<dd>
					<a href="#"> 待收货 <span> <!--待收货数量-->1
					</span>
					</a>
				</dd>
				<dd>
					<a href="#"> 待评价<span> <!--待评价数量--></span>
					</a>
				</dd>
				<dd>
					<a href="#">退货退款</a>
				</dd>
			</dl>

			<dl class="footMark">
				<dt>
					我的优惠卷<img src="images/myOrder/myOrder1.png">
				</dt>
			</dl>

			<dl class="address">
				<dt>
					收货地址<img src="images/myOrder/myOrder1.png">
				</dt>
			</dl>

			<dl class="count_managment">
				<dt>
					帐号管理<img src="images/myOrder/myOrder1.png">
				</dt>
				<dd class="first_dd">
					<a href="#">我的信息</a>
				</dd>
				<dd>
					<a href="#">安全管理</a>
				</dd>
			</dl>
		</div>
		<!-- 右边栏-->
		<div class="rightsidebar_box rt">
			<div class="order_empty">
				<img src="images/myOrder/myOrder3.png" alt="" />
				<p>你可能还没有订单(⊙o⊙)</p>
				<span>赶紧去下单吧 <b>去购物</b></span>
			</div>
		</div>
	</div>
	<!-- 页面底部-->
	<div id="foot">
		<component-foot></component-foot>
	</div>
</body>
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/index.js"></script>
<script src="js/jquery.page.js"></script>
<script type="text/javascript" src="js/orders.js"></script>
<script src="https://cdn.bootcss.com/vue/2.6.10/vue.min.js"></script>
<script src="js/component-fix-nav.js"></script>
<script src="js/component-foot.js"></script>
<script>
	var header_vm = new Vue({
		el : "#header",
	})
</script>
<script>
	var vm = new Vue({
		el : "#foot"
	})
</script>

</html>