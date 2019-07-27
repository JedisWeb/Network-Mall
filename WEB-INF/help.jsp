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
<title></title>
<link href="css/header.css" rel="stylesheet" />
<link href="css/footer.css" rel="stylesheet" />
<link href="css/animate.css" rel="stylesheet" />
<style>
#forward {
	width: 1000px;
	height: 500px;
	margin: 0px auto;
	text-align: center;
	vertical-align: middle;
}

#forward img {
	position: relative;
	top: 193px;
}

#forward p {
	font-size: 20px;
	position: relative;
	top: 218px;
	font-weight: inherit;
	opacity: 0.3;
}
</style>
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

	<!--敬请期待页面-->
	<div id="forward">
		<img src="images/lookforward/lookforward_img1.png" alt=""
			class="animated bounce" />
		<p class="animated slideInDown">服务暂未上线 敬请期待!!</p>
	</div>
	<!-- 页面底部-->
	<div id="foot">
		<component-foot></component-foot>
	</div>
	<script src="js/jquery-3.1.1.min.js"></script>
	<script src="js/index.js"></script>
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
</body>

</html>