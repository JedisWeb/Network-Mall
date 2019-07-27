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
<link href="css/personage.css" rel="stylesheet" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

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
			<li><a href="indexx_ctlr/indexx.do">首页<span>&gt;</span>个人中心
			</a></li>
		</ul>
	</div>
	<!--我的订单内容区域 #container-->
	<div id="container" class="clearfix">
		<!-- 左边栏-->
		<component-left-sidebar></component-left-sidebar>

		<!-- 右边栏-->
		<div class="rightsidebar_box rt">
			<!--标题栏-->
			<div class="rs_header">
				<span class="address_title">收获地址管理</span>
			</div>
			<!--收货人信息填写栏-->
			<div class="rs_content">
				<form method="post" action="">
					<!--收货人姓名-->
					<div class="recipients">
						<span class="red">*</span><span class="kuan">收货人：</span><input
							type="text" name="receiverName" id="receiverName" />
					</div>
					<!--收货人所在城市等信息-->
					<div data-toggle="distpicker" class="address_content">
						<span class="red">*</span><span class="kuan">省&nbsp;&nbsp;份：</span><select
							data-province="---- 选择省 ----" id="receiverState"></select> 城市：<select
							data-city="---- 选择市 ----" id="receiverCity"></select> 区/县：<select
							data-district="---- 选择区 ----" id="receiverDistrict"></select>
					</div>


					<!--收货人详细地址-->
					<div class="address_particular">
						<span class="red">*</span><span class="kuan">详细地址：</span>
						<textarea name="receiverAddress" id="receiverAddress" cols="60"
							rows="3" placeholder="建议您如实填写详细收货地址"></textarea>
					</div>
					<!--收货人地址-->
					<div class="address_tel">
						<span class="red">*</span><span class="kuan">手机号码：</span><input
							type="tel" id="receiverMobile" name="receiverMobile" />固定电话：<input
							type="text" name="receiverPhone" id="receiverPhone" />
					</div>
					<!--邮政编码-->
					<div class="address_postcode">
						<span class="red">&nbsp;</span class="kuan"><span>邮政编码：</span>&nbsp;<input
							type="text" name="receiverZip" />
					</div>
					<!--地址名称-->
					<div class="address_name">
						<span class="red">&nbsp;</span class="kuan"><span>地址名称：</span>&nbsp;<input
							type="text" id="addressName" name="addressName" />如：<span
							class="sp">家</span><span class="sp">公司</span><span class="sp">宿舍</span>
					</div>
					<!--保存收货人信息-->
					<div class="save_recipient">保存收货人信息</div>

				</form>
				<!--已有地址栏-->
				<div class="address_information_manage">
					<div class="aim_title">
						<span class="dzmc dzmc_title">地址名称</span><span
							class="dzxm dzxm_title">姓名</span><span class="dzxq dzxq_title">地址详情</span><span
							class="lxdh lxdh_title">联系电话</span><span
							class="operation operation_title">操作</span>
					</div>
					<div class="aim_content_one aim_active">
						<span class="dzmc dzmc_active">办公室</span> <span
							class="dzxm dzxm_normal">杨洋</span> <span class="dzxq dzxq_normal">北京市海淀区北下关街道中鼎大厦B座331</span>
						<span class="lxdh lxdh_normal">18435110514</span> <span
							class="operation operation_normal"> <span
							class="aco_change">修改</span>|<span class="aco_delete">删除</span>
						</span> <span class="swmr swmr_normal"></span>
					</div>
					<div class="aim_content_two">
						<span class="dzmc dzmc_normal">家里</span> <span
							class="dzxm dzxm_normal">杨洋</span> <span class="dzxq dzxq_normal">北京市大兴区西红门镇瑞海家园</span>
						<span class="lxdh lxdh_normal">13788882346</span> <span
							class="operation operation_normal"> <span
							class="aco_change">修改</span>|<span class="aco_delete">删除</span>
						</span> <span class="swmr swmr_normal">设为默认</span>
					</div>
					<div class="aim_content_three">
						<span class="dzmc dzmc_normal">宿舍</span> <span
							class="dzxm dzxm_normal">杨洋</span> <span class="dzxq dzxq_normal">山西省小店区山西大学商务学院</span>
						<span class="lxdh lxdh_normal">13799992347</span> <span
							class="operation operation_normal"> <span
							class="aco_change">修改</span>|<span class="aco_delete">删除</span>
						</span> <span class="swmr swmr_normal">设为默认</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 页面底部-->
	<div id="foot">
		<component-foot></component-foot>
	</div>
</body>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script src="js/jquery.page.js"></script>
<script type="text/javascript" src="js/orders.js"></script>
<script type="text/javascript" src="js/distpicker.data.js"></script>
<script type="text/javascript" src="js/distpicker.js"></script>
<script type="text/javascript" src="js/personal.js"></script>
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
		el : "#foot"
	})
</script>
<script type="text/javascript">
	$(".lxdh_normal").each(function(i, e) {
		var phone = $(e).html();
		$(e).html(changePhone(phone));
	});
</script>

</html>