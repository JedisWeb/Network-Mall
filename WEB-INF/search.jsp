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

	<title>商品搜索页面</title>
	<link rel="stylesheet" href="css/header.css" />
	<link rel="stylesheet" href="css/search.css" />
	<link rel="stylesheet" href="css/footer.css" />
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

	<body>
		<div class="big">
			<form name="" action="" method="post">
				<section id="section">
					<p class="header">全部结果>笔记本</p>
					<div id="wrap">
						<div class="lf box" id="d1">
							<div class="info">
								<div class="img pic">
									<img src="images/search/product_img.png" alt="" onclick="toItemInfo(${item.id})" />
								</div>
								<div class="describe">
									<p onclick="toItemInfo(${item.id})">联想(Lenovo) YOGA900 (YOGA4
										PRO)多彩版</p>
									<span class="price"><b>￥</b><span class="priceContent">4399.00</span></span>
									<span class="addCart"><img id="collect" src="images/search/care.png" alt="" /><a
											href="javascript:void(0);" class="add_cart">加入购物车</a></span>
									<!--<span class="succee" style="display: none"> 
								<img src="/images/search/product_true.png" alt="" /> 
								<span>已移入购物车</span>
							</span>-->
								</div>
							</div>
						</div>
						<div class="lf" id="d1">
							<div class="img">
								<img src="images/search/product_img1.png" alt="" onclick="toItemInfo(${item.id})" />
							</div>
							<div class="describe">
								<p onclick="toItemInfo(${item.id})">联想(Lenovo) YOGA900 (YOGA4
									PRO)多彩版</p>
								<span class="price"><b>￥</b><span class="priceContent">4399.00</span></span>
								<span class="addCart"><img id="collect" src="images/search/care.png" alt="" /><a
										href="javascript:void(0);" class="add_cart">加入购物车</a></span>
								<!--<span class="succee" style="display: none"> 
								<img src="/images/search/product_true.png" alt="" /> 
								<span>已移入购物车</span>
							</span>-->
							</div>
						</div>
						<div class="lf" id="d1">
							<div class="img">
								<img src="images/search/product_img2.png" alt="" onclick="toItemInfo(${item.id})" />
							</div>
							<div class="describe">
								<p onclick="toItemInfo(${item.id})">联想(Lenovo) YOGA900 (YOGA4
									PRO)多彩版</p>
								<span class="price"><b>￥</b><span class="priceContent">4399.00</span></span>
								<span class="addCart"><img id="collect" src="images/search/care.png" alt="" /><a
										href="javascript:void(0);" class="add_cart">加入购物车</a></span>
								<!--<span class="succee" style="display: none"> 
								<img src="/images/search/product_true.png" alt="" /> 
								<span>已移入购物车</span>
							</span>-->
							</div>
						</div>
						<div class="lf" id="d1">
							<div class="img">
								<img src="images/search/product_img3.png" alt="" onclick="toItemInfo(${item.id})" />
							</div>
							<div class="describe">
								<p onclick="toItemInfo(${item.id})">联想(Lenovo) YOGA900 (YOGA4
									PRO)多彩版</p>
								<span class="price"><b>￥</b><span class="priceContent">4399.00</span></span>
								<span class="addCart"><img id="collect" src="images/search/care.png" alt="" /><a
										href="javascript:void(0);" class="add_cart">加入购物车</a></span>
								<!--<span class="succee" style="display: none"> 
								<img src="/images/search/product_true.png" alt="" /> 
								<span>已移入购物车</span>
							</span>-->
							</div>
						</div>
						<div class="lf" id="d1">
							<div class="img">
								<img src="images/search/product_img4.png" alt="" onclick="toItemInfo(${item.id})" />
							</div>
							<div class="describe">
								<p onclick="toItemInfo(${item.id})">联想(Lenovo) YOGA900 (YOGA4
									PRO)多彩版</p>
								<span class="price"><b>￥</b><span class="priceContent">4399.00</span></span>
								<span class="addCart"><img id="collect" src="images/search/care.png" alt="" /><a
										href="javascript:void(0);" class="add_cart">加入购物车</a></span>
								<!--<span class="succee" style="display: none"> 
								<img src="/images/search/product_true.png" alt="" /> 
								<span>已移入购物车</span>
							</span>-->
							</div>
						</div>
						<div class="lf" id="d1">
							<div class="img">
								<img src="images/search/product_img5.png" alt="" onclick="toItemInfo(${item.id})" />
							</div>
							<div class="describe">
								<p onclick="toItemInfo(${item.id})">联想(Lenovo) YOGA900 (YOGA4
									PRO)多彩版</p>
								<span class="price"><b>￥</b><span class="priceContent">4399.00</span></span>
								<span class="addCart"><img id="collect" src="images/search/care.png" alt="" /><a
										href="javascript:void(0);" class="add_cart">加入购物车</a></span>
								<!--<span class="succee" style="display: none"> 
								<img src="/images/search/product_true.png" alt="" /> 
								<span>已移入购物车</span>
							</span>-->
							</div>
						</div>
						<div class="lf" id="d1">
							<div class="img">
								<img src="images/search/product_img6.png" alt="" onclick="toItemInfo(${item.id})" />
							</div>
							<div class="describe">
								<p onclick="toItemInfo(${item.id})">联想(Lenovo) YOGA900 (YOGA4
									PRO)多彩版</p>
								<span class="price"><b>￥</b><span class="priceContent">4399.00</span></span>
								<span class="addCart"><img id="collect" src="images/search/care.png" alt="" /><a
										href="javascript:void(0);" class="add_cart">加入购物车</a></span>
								<!--<span class="succee" style="display: none"> 
								<img src="/images/search/product_true.png" alt="" /> 
								<span>已移入购物车</span>
							</span>-->
							</div>
						</div>
						<div class="lf" id="d1">
							<div class="img">
								<img src="images/search/product_img1.png" alt="" onclick="toItemInfo(${item.id})" />
							</div>
							<div class="describe">
								<p onclick="toItemInfo(${item.id})">联想(Lenovo) YOGA900 (YOGA4
									PRO)多彩版</p>
								<span class="price"><b>￥</b><span class="priceContent">4399.00</span></span>
								<span class="addCart"><img id="collect" src="images/search/care.png" alt="" /><a
										href="javascript:void(0);" class="add_cart">加入购物车</a></span>
								<!--<span class="succee" style="display: none"> 
								<img src="/images/search/product_true.png" alt="" /> 
								<span>已移入购物车</span>
							</span>-->
							</div>
						</div>
						<div class="lf" id="d1">
							<div class="img">
								<img src="images/search/product_img2.png" alt="" onclick="toItemInfo(${item.id})" />
							</div>
							<div class="describe">
								<p onclick="toItemInfo(${item.id})">联想(Lenovo) YOGA900 (YOGA4
									PRO)多彩版</p>
								<span class="price"><b>￥</b><span class="priceContent">4399.00</span></span>
								<span class="addCart"><img id="collect" src="images/search/care.png" alt="" /><a
										href="javascript:void(0);" class="add_cart">加入购物车</a></span>
								<!--<span class="succee" style="display: none"> 
								<img src="/images/search/product_true.png" alt="" /> 
								<span>已移入购物车</span>
							</span>-->
							</div>
						</div>
						<div class="lf" id="d1">
							<div class="img">
								<img src="images/search/product_img3.png" alt="" onclick="toItemInfo(${item.id})" />
							</div>
							<div class="describe">
								<p onclick="toItemInfo(${item.id})">联想(Lenovo) YOGA900 (YOGA4
									PRO)多彩版</p>
								<span class="price"><b>￥</b><span class="priceContent">4399.00</span></span>
								<span class="addCart"><img id="collect" src="images/search/care.png" alt="" /><a
										href="javascript:void(0);" class="add_cart">加入购物车</a></span>
								<!--<span class="succee" style="display: none"> 
								<img src="/images/search/product_true.png" alt="" /> 
								<span>已移入购物车</span>
							</span>-->
							</div>
						</div>
						<div class="lf" id="d1">
							<div class="img">
								<img src="images/search/product_img4.png" alt="" onclick="toItemInfo(${item.id})" />
							</div>
							<div class="describe">
								<p onclick="toItemInfo(${item.id})">联想(Lenovo) YOGA900 (YOGA4
									PRO)多彩版</p>
								<span class="price"><b>￥</b><span class="priceContent">4399.00</span></span>
								<span class="addCart"><img id="collect" src="images/search/care.png" alt="" /><a
										href="javascript:void(0);" class="add_cart">加入购物车</a></span>
								<!--<span class="succee" style="display: none"> 
								<img src="/images/search/product_true.png" alt="" /> 
								<span>已移入购物车</span>
							</span>-->
							</div>
						</div>
						<div class="lf" id="d1">
							<div class="img">
								<img src="images/search/product_img5.png" alt="" onclick="toItemInfo(${item.id})" />
							</div>
							<div class="describe">
								<p onclick="toItemInfo(${item.id})">联想(Lenovo) YOGA900 (YOGA4
									PRO)多彩版</p>
								<span class="price"><b>￥</b><span class="priceContent">4399.00</span></span>
								<span class="addCart"><img id="collect" src="images/search/care.png" alt="" /><a
										href="javascript:void(0);" class="add_cart">加入购物车</a></span>
								<!--<span class="succee" style="display: none"> 
								<img src="/images/search/product_true.png" alt="" /> 
								<span>已移入购物车</span>
							</span>-->
							</div>
						</div>
					</div>
				</section>
			</form>
		</div>
		<!-- 尾部-->
		<!-- 页面底部-->
		<div id="foot">
			<component-foot></component-foot>
		</div>
		<div class="modal" style="display: none">
			<div class="modal_dialog">
				<div class="modal_header">操作提醒</div>
				<div class="modal_information">
					<img src="images/model/model_img2.png" alt="" /> <span>将您的宝贝加入购物车？</span>
				</div>
				<div class="yes" @click="addCart">
					<span>确定</span>
				</div>
				<div class="no" @click="cancelCart">
					<span>取消</span>
				</div>
			</div>
		</div>
		<script src="js/jquery-3.1.1.min.js"></script>
		<script src="js/index.js"></script>
		<script src="js/jquery.page.js"></script>
		<script src="https://cdn.bootcss.com/vue/2.6.10/vue.min.js"></script>
		<script src="js/component-fix-nav.js"></script>
		<script src="js/component-foot.js"></script>
		<script>
			var header_vm = new Vue({
				el: "#header",
			})
		</script>
		<script>
			var wrap_vm = new Vue({
				el: "#wrap",
				mounted: function () {
					$(".addCart").click(function () {
						$(".modal").show();
						$(".modal .modal_information span").html("将您的宝贝加入购物车?");
					});
				}
			})
		</script>
		<script>
			var foot_vm = new Vue({
				el: "#foot",
			})
		</script>
		<script>
			var modal_dialog_vm = new Vue({
				el: ".modal_dialog",
				methods: {
					addCart: function () {
						$(".modal").hide();
						$('#collect').attr("src", "images/search/care1.png");
					},
					cancelCart: function () {
						$('.modal').hide();
					}
				}
			})
		</script>
	</body>

</html>