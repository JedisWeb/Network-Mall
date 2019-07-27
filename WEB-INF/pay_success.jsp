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

  <title>网络商城——支付页面</title>
  <link rel="stylesheet" href="css/header.css" />
  <link rel="stylesheet" href="css/footer.css" />
  <link href="css/payment.css" rel="Stylesheet" />
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

  <div id="navlist">
    <ul>
      <li class="navlist_gray_left"></li>
      <li class="navlist_gray">确认订单信息</li>
      <li class="navlist_gray_arrow"></li>
      <li class="navlist_gray">支付订单<b></b></li>
      <li class="navlist_gray_arrow"></li>
      <li class="navlist_blue">支付完成<b></b></li>
      <li class="navlist_blue_right"></li>
    </ul>
  </div>
  <div id="container">
    <div>
      <h1>
        <i>支付结果</i><span class="rt">支付订单：{{ orderNumber }} &nbsp; 支付金额：<b>{{ orderTotal }}元</b></span>
      </h1>
    </div>
    <div class="rightsidebar_box rt">
      <div class="pay_result">
        <img src="images/pay/pay_succ.png" alt="" />
        <p>支付成功</p>
        <span><a>查看订单状态？ </a><b><a>查看订单&gt;&gt;</a></b></span>
        <br /> 网络商城不会以系统异常、订单升级为由，要求你点击任何链接进行退款操作！
      </div>
    </div>
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
      el: "#header",
    })
  </script>
  <script>
    var container_vm = new Vue({
      el: '#container',
      data() {
        return {
          orderNumber: '',
          orderTotal: 0
        }
      },
      mounted() {
        this.orderNumber = localStorage.getItem('orderNumber');
        this.orderTotal = localStorage.getItem('orderTotal');
      }
    })
  </script>
  <script>
    var vm = new Vue({
      el: "#foot"
    })
  </script>
</body>

</html>