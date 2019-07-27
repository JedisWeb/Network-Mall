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
	<link href="css/personage.css" rel="stylesheet" />
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
			<li><a href="indexx_ctlr/indexx.do">首页<span></a>&gt;</span>个人中心
			</li>
		</ul>
	</div>
	<!--我的订单内容区域 #container-->
	<div id="container" class="clearfix">
		<!-- 左边栏-->
		<component-left-sidebar></component-left-sidebar>

		<!-- 右边栏-->
		<!--个人信息头部-->
		<div class="rightsidebar_box rt">
			<div class="rs_header">
				<span><a href="person_age_ctlr/person_age.do">我的信息</a></span> <span class="rs_header_active"><a
						href="personal_password_ctlr/personal_password.do">安全管理</a></span>
			</div>

			<!--安全管理 -->
			<div class="rs_content">
				<p class="change_password_title">更改密码</p>
				<div class="new_password">
					<span class="word">输入旧密码：</span><input type="password" /><span class="change_hint"></span>
				</div>
				<div class="new_password">
					<span class="word">输入新密码：</span><input type="password" /><span class="change_hint"></span>
				</div>
				<div class="confirm_password">
					<span class="word">确认新密码：</span><input type="password" /><span class="confirm_hint"></span>
				</div>
				<div class="save_password">保存更改</div>
			</div>


		</div>
	</div>
	<!-- 页面底部-->
	<div id="foot">
		<component-foot></component-foot>
	</div>
</body>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script src="js/index.js"></script>
<script src="js/jquery.page.js"></script>
<script type="text/javascript" src="js/orders.js"></script>
<script src="https://cdn.bootcss.com/vue/2.6.10/vue.min.js"></script>
<script src="js/component-fix-nav.js"></script>
<script src="js/component-left-sidebar.js"></script>
<script src="js/component-foot.js"></script>
<script>
	var header_vm = new Vue({
		el: "#header",
	})
</script>
<script>
	var header_vm = new Vue({
		el: "#container",
	})
</script>
<script>
	var vm = new Vue({
		el: "#foot"
	})
</script>

</html>