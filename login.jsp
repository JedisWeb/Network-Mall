<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <base href="<%=basePath%>">
    <title>网络商城页面</title>
    <link href="css/header.css" rel="stylesheet" />
    <link href="css/footer.css" rel="stylesheet" />
    <link href="css/animate.css" rel="stylesheet" />
    <link href="css/login.css" rel="stylesheet" />
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

</head>
<script type="text/javascript">
    var s = "${param.isfail}";
    if(s=="error")
  {
  alert("用户名或密码错误！请重新输入~");
  }
  else if(s=="yess"){
    alert("用户注册成功，请登录~");
  }
  </script>

<body>
    <!-- 页面顶部-->
    <header id="top">
        <div class="top">
            <!-- <span class="title">网络商城</span> -->
            <a href="index.jsp"><img class="logo" src="images/header/logo.png" alt="logo" /></a>
            <span>欢迎登录</span>
        </div>
    </header>
    <div id="container">
        <div id="cover" class="rt">
            <form action="loginctlr/login.do" id="login-form" method="post" name="form1">
                <div class="txt">
                    <p>
                        登录网络商城<span><a href="register.jsp">新用户注册</a></span>
                    </p>
                    <div class="text">
                        <input type="text" v-model="username" @blur="validateUname" placeholder="请输入您的用户名"
                            name="username" id="username" required>
                        <span><img src="images/login/yhm.png"></span>
                    </div>
                    <!--错误提示-->
                    <div id="showResult"></div>
                    <div class="text">
                        <input type="password" v-model="password" id="password" placeholder="请输入您的密码" name="password"
                            required minlength="6" maxlength="15">
                        <span><img src="images/login/mm.png"></span>
                    </div>
                    <div class="chose">
                        <input type="checkbox" class="checkbox" id="ck_rmbUser" value="0">自动登录
                        <span>忘记密码？</span>
                    </div>
                    <input class="button_login" @click="login()" type="submit" value="登录" />
                </div>
            </form>
        </div>
    </div>
    <!-- 页面底部-->
    <div id="foot">
        <component-foot></component-foot>
    </div>

    <script src="https://cdn.bootcss.com/vue/2.6.10/vue.min.js"></script>
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="jquery/jquery.cookie.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="js/component-foot.js"></script>
    <script>
        var vm = new Vue({
            el: "#foot"
        })
    </script>

    <script>
        var container_vm = new Vue({
            el: '#container',
            data: function () {
                return {
                    username: '',
                    password: ''
                }
            },
            create: function () {
                if ($.cookie("rmbUser") == "true") {
                    $("#ck_rmbUser").attr("checked", true);
                    $("#username").val($.cookie("username"));
                    $("#password").val($.cookie("password"));
                }
            },
            methods: {
                unameRemind: function () {

                },
                validateUname: function () {
                    var data = $("#username").val();
                    if (data == null || data == "") {
                        $("#showResult").text("用户名不能为空！");
                        $("#showResult").css("color", "red");
                        return false;
                    }
                    $("#showResult").css("color", "white");
                    $.ajax({
                        type: "POST",
                        url: "loginctlr/checkName.do",
                        data: "username=" + data,
                        beforeSend: function (XMLHttpRequest) {
                            $("#showResult").text("正在查询");

                        },
                        success: function (msg) {
                            var j = JSON.parse(msg);
                            if (j.state == 1) {
                                $("#showResult").text("该用户名可以被使用");
                            } else if (j.state == -1) {
                                $("#showResult").text("该用户名不存在");
                                $("#showResult").css("color", "red");
                            } else {
                                $("#showResult").text("系统异常！");
                                $("#showResult").css("color", "red");
                            }
                        },
                        error: function () {
                            //错误处理
                            //location.href='404';
                        }
                    });
                    // axios.post("loginctlr/checkName.do",{

                    // }).then(function (response){
                    //     username: data
                    // })
                },
                login: function () {
                    var inputData = $('#login-form').serialize();
                }
            }
        })
    </script>

    <!-- <script>
        $("#username").blur(function () {
            var data = $("#username").val();
            if (data == null || data == "") {
                $("#showResult").text("用户名不能为空！");
                $("#showResult").css("color", "red");
                return false;
            }
            $("#showResult").css("color", "white");
            $.ajax({
                type: "POST",
                url: "loginctlr/checkName.do",
                data: "username=" + data,
                beforeSend: function (XMLHttpRequest) {
                    $("#showResult").text("正在查询");

                },
                success: function (msg) {
                    var j = JSON.parse(msg);
                    if (j.state == 1) {
                        $("#showResult").text("该用户名可以被使用");
                    } else if (j.state == -1) {
                        $("#showResult").text("该用户名不存在");
                        $("#showResult").css("color", "red");
                    } else {
                        $("#showResult").text("系统异常！");
                        $("#showResult").css("color", "red");
                    }
                },
                error: function () {
                    //错误处理
                    //location.href='404';
                }
            });
        });
    </script> -->


    <!-- <script>
        $('#bt-login').click(function () {
            //读取用户的输入——表单序列化
            var inputData = $('#login-form').serialize();
            //异步提交请求，进行验证

            /*		$.ajax({
                        type: 'POST',
                        url: 'loginctlr/login.do',
                        data: inputData,
                        success: function(txt,msg,xhr){
                            alert(txt);
                            if(txt!=null&&!txt==""){  //登录成功
                                console.log("成功");
                                var loginName = $('[name="uname"]').val();
                                sessionStorage['loginName']=loginName;
                                console.log(loginName);
                                //location.href='indexx';
                              // 	 window.location='indexx';	
                            }else{ //登录失败
                                $('#showResult').html('登录失败！错误消息为：'+txt);
                            }
                        }
                    }); 
                    */
        });
    </script> -->
    <!-- <script type="text/javascript">

        $(document).ready(function () {
            if ($.cookie("rmbUser") == "true") {
                $("#ck_rmbUser").attr("checked", true);
                $("#username").val($.cookie("username"));
                $("#password").val($.cookie("password"));
            }
        });

        //记住用户名密码
        function Save() {
            if ($("#ck_rmbUser").attr("checked")) {
                var str_username = $("#username").val();
                console.log(str_username);
                var str_password = $("#password").val();
                $.cookie("rmbUser", "true", { expires: 7 }); //存储一个带7天期限的cookie
                $.cookie("username", str_username, { expires: 7 });
                $.cookie("password", str_password, { expires: 7 });
            }
            else {
                $.cookie("rmbUser", "false", { expire: -1 });
                $.cookie("username", "", { expires: -1 });
                $.cookie("password", "", { expires: -1 });
            }
        };
    </script> -->

</body>

</html>