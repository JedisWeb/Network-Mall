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

	<title>网络商城注册页面</title>
	<link href="css/header.css" rel="stylesheet" />
	<link href="css/footer.css" rel="stylesheet" />
	<link href="css/animate.css" rel="stylesheet" />
	<link href="css/login.css" rel="stylesheet" />
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
	<header id="top">
		<div class="top">
			<!-- <span class="title">网络商城</span> -->
			<a href="index.jsp"><img class="logo" src="images/header/logo.png" alt="logo" /></a>
			<span>欢迎注册</span>
		</div>
	</header>
	<!-- <div class="parent"> -->
	<!--<video src="audio/snow.mp4" width="100%" autoplay loop muted></video>-->
	<div class="container">
		<div class="panel rt">
			<form id="form-register" method="post" action="loginctlr/insertuser.do">
				<div class="txt">
					<p>
						新用户注册 <span> <a href="login.jsp">直接登录</a>
						</span>
					</p>
				</div>
				<div class="form-group">
					<label for="uname">用户名：</label>
					<input v-model="uname" @focus="unameRemind" @blur="validateUname" type="text" placeholder="请输入用户名"
						autofocus id="uname" name="username" />
					<span class="msg-default">用户名长度在6到9位之间</span>
				</div>
				<div class="form-group">
					<label for="upwd">登录密码：</label>
					<input v-model="upwd" @focus="upwdRemind" @blur="validateUpwd" required type="password"
						placeholder="请输入密码" name="password" autofocus id="upwd" /> <span
						class="msg-default hidden">密码长度在6到12位之间</span>
				</div>
				<div class="form-group">
					<label for="upwdconfirm">确认密码：</label>
					<input v-model="upwdconfirm" @focus="upwdconfirmRemind" @blur="validateUpwdconfirm" required
						type="password" placeholder="请确认密码" name="passwordtwo" autofocus id="upwdconfirm" /> <span
						class="msg-default hidden">密码长度在6到12位之间</span>
				</div>
				<div class="form-group">
					<label for="email">邮箱：</label>
					<input v-model="email" @focus="emailRemind" @blur="validateEmail" autocomplete required type="email"
						placeholder="请输入邮箱地址" name="email" id="email" /> <span
						class="msg-default hidden">请输入合法的邮箱地址</span>
				</div>
				<div class="form-group">
					<label for="phone">手机号：</label>
					<input v-model="phone" @focus="phoneRemind" @blur="validatePhone" id="phone" name="phone"
						placeholder="请输入您的手机号"
						pattern="(\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$"
						required type="text" /> <span class="msg-default hidden">请输入合法的手机号</span>
				</div>
				<div class="form-group">
					<label></label> <input @click="register" type="submit" value="提交注册信息" />
				</div>
			</form>
		</div>
	</div>

	<!-- 页面底部-->
	<div id="foot">
		<component-foot></component-foot>
	</div>

	<!--弹出的小广告-->
	<script src="js/jquery-3.1.1.min.js"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<script src="https://cdn.bootcss.com/vue/2.6.10/vue.min.js"></script>
	<script src="js/component-foot.js"></script>
	<script>
		var foot_vm = new Vue({
			el: "#foot"
		})
	</script>

	<script>
		var container_vm = new Vue({
			el: ".container",
			data: function () {
				return {
					uname: '',
					upwd: '',
					upwdconfirm: '',
					email: '',
					phone: ''
				}
			},
			methods: {
				unameRemind: function (e) {
					e.target.nextElementSibling.innerHTML = '用户名长度在6到9位之间';
					e.target.nextElementSibling.className = 'msg-default';
				},
				validateUname: function (e) {
					if (this.uname === "") {
						e.target.nextElementSibling.innerHTML = '用户名不能为空';
						e.target.nextElementSibling.className = 'msg-error';
						e.target.setCustomValidity('用户名不能为空');
					} else if (this.uname.length < 6 || this.uname.length > 9) {
						e.target.nextElementSibling.innerHTML = '用户名不能少于6位,大于9位';
						e.target.nextElementSibling.className = 'msg-error';
						e.target.setCustomValidity('用户名不能少于6位,大于9位');
					} else {
						e.target.nextElementSibling.innerHTML = '用户名格式正确';
						e.target.nextElementSibling.className = 'msg-success';
						e.target.setCustomValidity('');
						this.postUname();
					}
				},
				postUname() {
					var url = "loginctlr/checkName.do";
					axios.post(url, {
						username: this.uname
					}).then(function (response) {
						var j = JSON.parse(response.data);
						var css = j.state == 1 ? "msg-error" : "msg-success";
						var message = j.state == 1 ? "该用户已被注册" : "该用户未被注册";
						var hintTag = $("#uname").next();
						hintTag.attr("class", css);
						hintTag.text(message);
					})
				},
				upwdRemind: function (e) {
					e.target.nextElementSibling.innerHTML = '密码长度在6到12位之间';
					e.target.nextElementSibling.className = 'msg-default';
				},
				validateUpwd: function (e) {
					if (this.upwd === "") {
						e.target.nextElementSibling.innerHTML = '密码不能为空';
						e.target.nextElementSibling.className = 'msg-error';
						e.target.setCustomValidity('密码不能为空');
					} else if (this.upwd.length < 6 || this.upwd.length > 12) {
						e.target.nextElementSibling.innerHTML = '密码长度在尽量别少于6位';
						e.target.nextElementSibling.className = 'msg-error';
						e.target.setCustomValidity('密码长度在尽量别少于6位');
						// } else if (this.upwd != this.upwdconfirm) {
						// 	this.nextElementSibling.innerHTML = '两次密码不一致';
						// 	this.nextElementSibling.className = 'msg-error';
						// 	this.setCustomValidity('两次密码不一致');
					} else {
						e.target.nextElementSibling.innerHTML = '密码格式正确';
						e.target.nextElementSibling.className = 'msg-success';
						e.target.setCustomValidity('');
					}
				},
				upwdconfirmRemind: function (e) {
					e.target.nextElementSibling.innerHTML = '密码长度在6到12位之间';
					e.target.nextElementSibling.className = 'msg-default';
				},
				validateUpwdconfirm: function (e) {
					if (this.upwdconfirm === "") {
						e.target.nextElementSibling.innerHTML = '密码不能为空';
						e.target.nextElementSibling.className = 'msg-error';
						e.target.setCustomValidity('密码不能为空');
					} else if (this.upwdconfirm.length < 6 || this.upwdconfirm.length > 12) {
						e.target.nextElementSibling.innerHTML = '密码长度在尽量别少于6位';
						e.target.nextElementSibling.className = 'msg-error';
						e.target.setCustomValidity('密码长度在尽量别少于6位');
					} else if (this.upwd != this.upwdconfirm) {
						e.target.nextElementSibling.innerHTML = '两次密码不一致';
						e.target.nextElementSibling.className = 'msg-error';
						e.target.setCustomValidity('两次密码不一致');
					} else {
						e.target.nextElementSibling.innerHTML = '密码格式正确';
						e.target.nextElementSibling.className = 'msg-success';
						e.target.setCustomValidity('');
					}
				},
				emailRemind: function (e) {
					e.target.nextElementSibling.innerHTML = '请输入合法的邮箱地址';
					e.target.nextElementSibling.className = 'msg-default';
				},
				validateEmail: function (e) {
					if (this.email == '') {
						e.target.nextElementSibling.innerHTML = '邮箱不能为空';
						e.target.nextElementSibling.className = 'msg-error';
						e.target.setCustomValidity('邮箱不能为空');
					} else {
						e.target.nextElementSibling.innerHTML = '邮箱格式正确';
						e.target.nextElementSibling.className = 'msg-success';
						e.target.setCustomValidity('');
						this.postEmail();
					}
				},
				postEmail: function (e) {
					var url = "loginctlr/checkEmail.do";
					axios.post(url, {
						email: this.email
					}).then(function (response) {
						var j = JSON.parse(response.data);
						var css = j.state == 1 ? "msg-error" : "msg-success";
						var message = j.state == 1 ? "该邮箱未被注册" : "该邮箱已被注册";
						var hintTag = $("#email").next();
						hintTag.attr("class", css);
						hintTag.text(message);
					})
				},
				phoneRemind: function (e) {
					e.target.nextElementSibling.innerHTML = '请输入合法的手机号';
					e.target.nextElementSibling.className = 'msg-default';
				},
				validatePhone: function (e) {
					if (this.phone === "") {
						e.target.nextElementSibling.innerHTML = '手机号不能为空';
						e.target.nextElementSibling.className = 'msg-error';
						e.target.setCustomValidity('手机号不能为空');
					} else {
						e.target.nextElementSibling.innerHTML = '手机号格式正确';
						e.target.nextElementSibling.className = 'msg-success';
						e.target.setCustomValidity('');
						this.postPhone();
					}
				},
				postPhone: function (e) {
					var url = "loginctlr/checkPhone.do";
					axios.post(url, {
						phone: this.phone
					}).then(function (response) {
						var j = JSON.parse(response.data);
						var css = j.state == 1 ? "msg-error" : "msg-success";
						var message = j.state == 1 ? "该电话未被使用" : "该电话已被使用";
						var hintTag = $("#phone").next();
						hintTag.attr("class", css);
						hintTag.text(message);
					})
				},
				register: function () {
					var lengths = 0;
					$('.form-group').each(function () {
						if ($(this).find('span').hasClass('msg-success')) {
							lengths++;
						}
						if (lengths == 4) {
							$('.modal').fadeIn();
							setTimeout(function () {
								window.location.href = 'login.html';
							}, 2000);
						}
					});
				}
			}
		})

	</script>
	<!-- <script>
		$('#bt-register').click(function () {
			var lengths = 0;
			$('.form-group').each(function () {
				if ($(this).find('span').hasClass('msg-success')) {
					lengths++;
				}
				if (lengths == 4) {
					$('.modal').fadeIn();
					setTimeout(function () {
						window.location.href = 'login.html';
					}, 2000);
				}
			});
		})
	</script> -->

	<script>
		/*1.对用户名进行验证*/
		// uname.onblur = function (e) {
		// 	if (this.validity.valueMissing) {
		// 		this.nextElementSibling.innerHTML = '用户名不能为空';
		// 		this.nextElementSibling.className = 'msg-error';
		// 		this.setCustomValidity('用户名不能为空');
		// 	} else if (this.validity.tooShort) {
		// 		this.nextElementSibling.innerHTML = '用户名不能少于6位';
		// 		this.nextElementSibling.className = 'msg-error';
		// 		this.setCustomValidity('用户名不能少于6位');
		// 	} else {
		// 		this.nextElementSibling.innerHTML = '用户名格式正确';
		// 		this.nextElementSibling.className = 'msg-success';
		// 		this.setCustomValidity('');
		// 		var data = document.getElementById("uname").value;
		// 		if (!data) { //用户没有输入任何内容
		// 			return;
		// 		}
		/**发起异步GET请求，询问服务器用户名是否已经存在**/
		// // console.log("chenkName");
		// var name = $("#uname").val();
		// var url = "loginctlr/checkName.do";
		// axios.post(url, {
		// 	username: name
		// }).then(function (response) {
		// 	var j = JSON.parse(json);
		// 	var css = j.state == 1 ? "msg-error" : "msg-success";
		// 	var message = j.state == 1 ? "该用户已被注册" : "该用户未被注册";
		// 	var hintTag = $("#uname").next();
		// 	hintTag.attr("class", css);
		// 	hintTag.text(message);
		// })
		// $.ajax({
		// 	"url": url,
		// 	"data": "username=" + name,
		// 	"type": "post",
		// 	"async": false,
		// 	"datatype": "json",
		// 	"success": function (json) {
		// 		//alert(json);
		// 		var j = JSON.parse(json);
		// 		var css = j.state == 1 ? "msg-error" : "msg-success";
		// 		var message = j.state == 1 ? "该用户已被注册" : "该用户未被注册";
		// 		var hintTag = $("#uname").next();
		// 		hintTag.attr("class", css);
		// 		hintTag.text(message);
		// 	}
		// });

		// 	}
		// }

		// uname.onfocus = function () {
		// 	this.nextElementSibling.innerHTML = '用户名长度在6到9位之间';
		// 	this.nextElementSibling.className = 'msg-default';
		// }
		// upwd.onfocus = function () {
		// 	this.nextElementSibling.innerHTML = '密码长度在6到12位之间';
		// 	this.nextElementSibling.className = 'msg-default';
		// }
		// upwd.onblur = function () {
		// 	var pwd = $("#upwd").val();
		// 	var pwdc = $("#upwdconfirm").val();
		// 	if (this.validity.valueMissing) {
		// 		this.nextElementSibling.innerHTML = '密码不能为空';
		// 		this.nextElementSibling.className = 'msg-error';
		// 		this.setCustomValidity('密码不能为空');
		// 	} else if (this.validity.tooShort) {
		// 		this.nextElementSibling.innerHTML = '密码长度在尽量别少于6位';
		// 		this.nextElementSibling.className = 'msg-error';
		// 		this.setCustomValidity('密码长度在尽量别少于6位');
		// 	} else if (pwd != pwdc) {
		// 		this.nextElementSibling.innerHTML = '两次密码不一致';
		// 		this.nextElementSibling.className = 'msg-error';
		// 		this.setCustomValidity('两次密码不一致');
		// 	} else {
		// 		this.nextElementSibling.innerHTML = '密码格式正确';
		// 		this.nextElementSibling.className = 'msg-success';
		// 		this.setCustomValidity('');
		// 	}
		// }


		// upwdconfirm.onfocus = function () {
		// 	this.nextElementSibling.innerHTML = '密码长度在6到12位之间';
		// 	this.nextElementSibling.className = 'msg-default';
		// }
		// upwdconfirm.onblur = function () {
		// 	if (this.validity.valueMissing) {
		// 		this.nextElementSibling.innerHTML = '密码不能为空';
		// 		this.nextElementSibling.className = 'msg-error';
		// 		this.setCustomValidity('密码不能为空');
		// 	} else if (this.validity.tooShort) {
		// 		this.nextElementSibling.innerHTML = '密码长度在尽量别少于6位';
		// 		this.nextElementSibling.className = 'msg-error';
		// 		this.setCustomValidity('密码长度在尽量别少于6位');
		// 	} else {
		// 		this.nextElementSibling.innerHTML = '密码格式正确';
		// 		this.nextElementSibling.className = 'msg-success';
		// 		this.setCustomValidity('');
		// 	}
		// }

		/*3.对邮箱地址进行验证*/
		// email.onblur = function () {
		// 	if (this.validity.valueMissing) {
		// 		this.nextElementSibling.innerHTML = '邮箱不能为空';
		// 		this.nextElementSibling.className = 'msg-error';
		// 		this.setCustomValidity('邮箱不能为空');
		// 	} else if (this.validity.typeMismatch) {
		// 		this.nextElementSibling.innerHTML = '邮箱格式不正确';
		// 		this.nextElementSibling.className = 'msg-error';
		// 		this.setCustomValidity('邮箱格式不正确');
		// 	} else {
		// 		this.nextElementSibling.innerHTML = '邮箱格式正确';
		// 		this.nextElementSibling.className = 'msg-success';
		// 		this.setCustomValidity('');

		// 		var data = document.getElementById("email").value;
		// 		if (!data) { //用户没有输入任何内容
		// 			return;
		// 		}
		// 		/**发起异步GET请求，询问服务器用户名是否已经存在**/
		// 		var email = $("#email").val();
		// 		var url = "loginctlr/checkEmail.do";
		// 		axios.post(url, {
		// 			email: email
		// 		}).then(function (response) {
		// 			var j = JSON.parse(json);
		// 			var css = j.state == 1 ? "msg-error" : "msg-success";
		// 			var message = j.state == 1 ? "该邮箱未被注册" : "该邮箱已被注册";
		// 			var hintTag = $("#email").next();
		// 			hintTag.attr("class", css);
		// 			hintTag.text(message);
		// 		})
		// $.ajax({
		// 	"url": url,
		// 	"data": "Email=" + email,
		// 	"type": "post",
		// 	"async": false,
		// 	"datatype": "json",
		// 	"success": function (json) {
		// 		//alert(json);
		// 		var j = JSON.parse(json);
		// 		var css = j.state == 1 ? "msg-error" : "msg-success";
		// 		var message = j.state == 1 ? "该邮箱未被注册" : "该邮箱已被注册";
		// 		var hintTag = $("#email").next();
		// 		hintTag.attr("class", css);
		// 		hintTag.text(message);
		// 	}
		// });
		// 	}
		// }
		// email.onfocus = function () {
		// 	this.nextElementSibling.innerHTML = '请输入合法的邮箱地址';
		// 	this.nextElementSibling.className = 'msg-default';
		// }
		/*3.对手机号进行验证*/
		// phone.onblur = function () {
		// 	if (this.validity.valueMissing) {
		// 		this.nextElementSibling.innerHTML = '手机号不能为空';
		// 		this.nextElementSibling.className = 'msg-error';
		// 		this.setCustomValidity('手机号不能为空');
		// 	} else if (this.validity.patternMismatch) {
		// 		this.nextElementSibling.innerHTML = '手机号格式不正确';
		// 		this.nextElementSibling.className = 'msg-error';
		// 		this.setCustomValidity('手机号格式不正确');
		// 	} else {
		// 		this.nextElementSibling.innerHTML = '手机号格式正确';
		// 		this.nextElementSibling.className = 'msg-success';
		// 		this.setCustomValidity('');

		// 		var data = document.getElementById("phone").value;
		// 		if (!data) { //用户没有输入任何内容
		// 			return;
		// 		}
		// 		/**发起异步GET请求，询问服务器用户名是否已经存在**/
		// 		var email = $("#phone").val();
		// 		var url = "loginctlr/checkPhone.do";
		// 		axios.post(url, {
		// 			phone: phone
		// 		}).then(function (response) {
		// 			response.json;
		// 			var j = JSON.parse(json);
		// 			var css = j.state == 1 ? "msg-error" : "msg-success";
		// 			var message = j.state == 1 ? "该电话未被使用" : "该电话已被使用";
		// 			var hintTag = $("#phone").next();
		// 			hintTag.attr("class", css);
		// 			hintTag.text(message);
		// 		})
		// 		$.ajax({
		// 			"url": url,
		// 			"data": "Phone=" + phone,
		// 			"type": "post",
		// 			"async": false,
		// 			"datatype": "json",
		// 			"success": function (json) {
		// 				//alert(json);
		// 				var j = JSON.parse(json);
		// 				var css = j.state == 1 ? "msg-error" : "msg-success";
		// 				var message = j.state == 1 ? "该电话未被使用" : "该电话已被使用";
		// 				var hintTag = $("#phone").next();
		// 				hintTag.attr("class", css);
		// 				hintTag.text(message);
		// 			}
		// 		});
		// 	}
		// }
		// phone.onfocus = function () {
		// 	this.nextElementSibling.innerHTML = '请输入合法的手机号';
		// 	this.nextElementSibling.className = 'msg-default';
		// }
	</script>
</body>

</html>