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
	<link rel="stylesheet" type="text/css" href="css/icon/css/bootstrap.min.css">
	<link href="css/icon/css/cropper.min.css" rel="stylesheet">
	<link href="css/icon/css/sitelogo.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/icon/css/font-awesome.min.css">
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
	<!--我的订单导航栏-->
	<div id="nav_order">
		<ul>
			<li>
				<a href="indexx_ctlr/indexx.do">首页<span></a>&gt;</span>个人中心
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
				<span class="rs_header_active"><a href="person_age_ctlr/person_age.do">我的信息</a></span> <span><a
						href="personal_password_ctlr/personal_password.do">安全管理</a></span>
			</div>
			<form action="loginctlr/updateuser.do" method="post" enctype="multipart/form-data">
				<!--个人信息具体内容 -->
				<div class="rs_content">
					<!--头像-->
					<input type="hidden" name="id" value="${user.id }">
					<div class="rs_content_headPortrait">
						<span class="same">我的头像：</span>
						<input type="hidden" name="createdUser" value="${user.createdUser }">
						<!-- <img src="images/${user.createdUser}" width="50px" height="50px" /> -->
						<div style="position: absolute; top: 20px; left: 250px">
							<input type="file" name="upload" value="更改头像">
						</div>

					</div>
					<!--用户名-->
					<div class="rs_content_sex">

						<span class="same">用户名：</span> <input type="text" name="username" value="${user.username }">
						<input type="hidden" name="password" value="${user.password }">
					</div>
					<!--性别-->
					<div class="rs_content_sex">
						<span class="same">性别：</span> <select id="quest" name="modifiedUser"
							style="position: relative; left: 35px">
							<option value="男">男</option>
							<option value="女">女</option>
						</select>
					</div>
					<!--绑定电话-->
					<div class="rs_content_tel">
						<span class="same">绑定电话：</span> <input type="text" name="phone" value="${user.phone }" />
					</div>
					<!--绑定邮箱-->
					<div class="rs_content_mail">
						<span class="same">绑定邮箱：</span> <input type="text" name="email" value="${user.email }" />
					</div>
					<!--保存按钮-->
					<input type="submit" value="保存更改">

				</div>
		</div>

		</form>
	</div>
	</div>


	<div class="modal fade" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog"
		tabindex="-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<!--<form class="avatar-form" action="upload-logo.php" enctype="multipart/form-data" method="post">-->
				<form class="avatar-form">
					<div class="modal-header">
						<button class="close" data-dismiss="modal" type="button">×</button>
						<h4 class="modal-title" id="avatar-modal-label">上传图片</h4>
					</div>
					<div class="modal-body">
						<div class="avatar-body">
							<div class="avatar-upload">
								<input class="avatar-src" name="avatar_src" type="hidden">
								<input class="avatar-data" name="avatar_data" type="hidden">
								<label for="avatarInput" style="line-height: 35px;">图片上传</label>
								<button class="btn btn-info" type="button" style="height: 35px;"
									onClick="$('input[id=avatarInput]').click();">请选择图片</button>
								<span id="avatar-name"></span> <input class="avatar-input hide" id="avatarInput"
									name="avatar_file" type="file">
							</div>
							<div class="row">
								<div class="col-md-9">
									<div class="avatar-wrapper"></div>
								</div>
								<div class="col-md-3">
									<div class="avatar-preview preview-lg" id="imageHead"></div>
									<!--<div class="avatar-preview preview-md"></div> 
                        <div class="avatar-preview preview-sm"></div>-->
								</div>
							</div>
							<div class="row avatar-btns">
								<div class="col-md-4">
									<div class="btn-group">
										<button class="btn btn-info fa fa-undo" data-method="rotate" data-option="-90"
											type="button" title="Rotate -90 degrees">
											向左旋转</button>
									</div>
									<div class="btn-group">
										<button class="btn  btn-info fa fa-repeat" data-method="rotate" data-option="90"
											type="button" title="Rotate 90 degrees">向右旋转</button>
									</div>
								</div>
								<div class="col-md-5" style="text-align: right;">
									<button class="btn btn-info fa fa-arrows" data-method="setDragMode"
										data-option="move" type="button" title="移动">
										<span class="docs-tooltip" data-toggle="tooltip" title=""
											data-original-title="$().cropper(" setDragMode", "move" )">
										</span>
									</button>
									<button type="button" class="btn btn-info fa fa-search-plus" data-method="zoom"
										data-option="0.1" title="放大图片">
										<span class="docs-tooltip" data-toggle="tooltip" title=""
											data-original-title="$().cropper(" zoom", 0.1)">
											<!--<span class="fa fa-search-plus"></span>-->
										</span>
									</button>
									<button type="button" class="btn btn-info fa fa-search-minus" data-method="zoom"
										data-option="-0.1" title="缩小图片">
										<span class="docs-tooltip" data-toggle="tooltip" title=""
											data-original-title="$().cropper(" zoom", -0.1)">
											<!--<span class="fa fa-search-minus"></span>-->
										</span>
									</button>
									<button type="button" class="btn btn-info fa fa-refresh" data-method="reset"
										title="重置图片">
										<span class="docs-tooltip" data-toggle="tooltip" title=""
											data-original-title="$().cropper(" reset")"
											aria-describedby="tooltip866214">
									</button>
								</div>
								<div class="col-md-3">
									<button id="button_save" class="btn btn-info btn-block avatar-save fa fa-save"
										type="button" data-dismiss="modal">保存修改</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 页面底部-->
	<div id="foot">
		<component-foot></component-foot>
	</div>
</body>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="js/index.js"></script>
<script src="js/jquery.page.js"></script>
<script type="text/javascript" src="js/orders.js"></script>
<script type="text/javascript" src="js/personal.js"></script>
<script src="js/icon/bootstrap.min.js"></script>
<script src="js/icon/cropper.js"></script>
<script src="js/icon/sitelogo.js"></script>
<script src="js/icon/html2canvas.min.js" type="text/javascript" charset="utf-8"></script>
<script src="https://cdn.bootcss.com/vue/2.6.10/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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
<script type="text/javascript">
	//做个下简易的验证  大小 格式  
	$('#avatarInput').on('change', function (e) {
		var filemaxsize = 1024 * 5;//5M 
		var target = $(e.target);
		var Size = target[0].files[0].size / 1024;
		if (Size > filemaxsize) {
			alert('图片过大，请重新选择!');
			$(".avatar-wrapper").childre().remove;
			return false;
		}
		if (!this.files[0].type.match(/image.*/)) {
			alert('请选择正确的图片!')
		} else {
			var filename = document.querySelector("#avatar-name");
			var texts = document.querySelector("#avatarInput").value;
			var teststr = texts; //你这里的路径写错了 
			testend = teststr.match(/[^\\]+\.[^\(]+/i); //直接完整文件名的 
			filename.innerHTML = testend;
		}

	});

	$(".avatar-save").on("click", function () {
		var img_lg = document.getElementById('imageHead');
		// 截图小的显示框内的内容 
		html2canvas(img_lg, {
			allowTaint: true,
			taintTest: false,
			onrendered: function (canvas) {
				canvas.id = "mycanvas";
				//生成base64图片数据 
				var dataUrl = canvas.toDataURL("image/png");
				var newImg = document.createElement("img");
				newImg.src = dataUrl;
				imagesAjax(dataUrl)
			}
		});
	})
	function imagesAjax(src) {
		var data = {};
		data.img = src;
		axios.post("", {
			data: {
				img: src
			}
		}).then(function (response) {
			if (response) {
				if (response.status == 200) {
					$('#icon').attr('src', response.data.url);
					$('#iconPic').val(response.data.url);
				} else {
					alert("上传失败")
				}

			}
		})
		// $.ajax({
		// 	url: "",
		// 	data: data,
		// 	type: "POST",
		// 	dataType: 'json',
		// 	success: function (re) {
		// 		if (re) {
		// 			if (re.status == 200) {
		// 				$('#icon').attr('src', re.data.url);
		// 				$('#iconPic').val(re.data.url);
		// 			} else {
		// 				alert("上传失败")
		// 			}

		// 		}
		// 	}
		// });
	}
</script>
<!-- <script type="text/javascript">
	$("#icon").click(function () {
		window.open($(this).attr("src"));
	})
</script> -->
<!--<script>
	$(".x").click(function(){
		$(".modal").hide();
	})
	$(".change_headPortrait").click(function(){
		$(".modal").show();
	})
</script>-->
<!-- <script>
	$("#button_save").click(function () {
		var url = $("#imageHead img").attr("src");
		$('#icon').attr('src', url);
	})
</script> -->

</html>