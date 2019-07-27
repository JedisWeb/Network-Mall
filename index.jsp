<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <base href="<%=basePath%>">
    <title>网络商城</title>
    <link href="css/header.css" rel="stylesheet" />
    <link href="css/footer.css" rel="stylesheet" />
    <link href="css/animate.css" rel="stylesheet" />
    <link href="css/login.css" rel="stylesheet" />
    <style>
        #cover ul {
            padding: 15px;
        }

        #cover a {
            color: #fff;
            line-height: 1.8em;
            font-size: 18px;
        }
    </style>
</head>

<body>
    <!-- 页面顶部-->
    <header id="top">
        <div class="top">
            <!-- <span class="title">网络商城</span> -->
            <a href="index.jsp"><img class="logo" src="images/header/logo.png" alt="logo" /></a>
            <div>
                <span id="login"><a href="login.jsp">登录</a></span>
                <span id="register"><a href="register.jsp">注册</a></span>
            </div>
        </div>
    </header>
    <div id="container">
        <!-- <div id="cover" class="rt"> -->
        <!-- <ul> -->
        <!-- <li><a href="login.jsp">登录页 login.jsp</a></li> -->
        <!-- <li><a href="index.jsp">首页 index.html</a></li> -->
        <!-- <li><a href="register.jsp">注册 register.html</a></li>
		   <li><a href="web/404.html">404错误 404.html</a></li>
		   <li><a href="web/500.html">500错误 500.html</a></li>
		   <li><a href="pages.zip">下载全部资料 pages.zip</a></li> -->
        <!-- </ul> -->
        <!-- </div> -->
    </div>
    <!-- 页面底部 -->
    <div id="foot">
        <component-foot></component-foot>
    </div>
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="jquery/jquery.cookie.js"></script>
    <script src="https://cdn.bootcss.com/vue/2.6.10/vue.min.js"></script>
    <script src="js/component-foot.js"></script>
    <script>
        var vm = new Vue({
            el:"#foot"
        })
    </script>

</body>

</html>