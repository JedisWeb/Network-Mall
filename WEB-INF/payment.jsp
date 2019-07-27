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
  <link href="css/payment.css" rel="Stylesheet" />
  <link href="css/header.css" rel="Stylesheet" />
  <link href="css/footer.css" rel="Stylesheet" />
  <style>
    .okPay a {
      color: #FFFFFF;
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
    <component-fix-nav user-id="${nowuser.id}" user-name="${nowuser.username}"></component-fix-nav>
  </div>
  <div id="navlist">
    <ul>
      <li class="navlist_gray_left"></li>
      <li class="navlist_gray">确认订单信息</li>
      <li class="navlist_gray_arro"><canvas id="canvas_gray" width="20" height="38"></canvas></li>
      <li class="navlist_blue">支付订单<b></b></li>
      <li class="navlist_blue_arro"><canvas id="canvas_blue" width="20" height="38"></canvas></li>
      <li class="navlist_gray">支付完成<b></b></li>
      <li class="navlist_gray_right"></li>
    </ul>
  </div>
  <!--订单确认-->
  <form action="pay_success.html" method="post" id="pay_form">
    <div id="container" class="clearfix">
      <!-- 支付订单信息-->
      <div class="pay_info">
        <b>支付金额：<i>{{ orderTotal }}元</i></b><input type="hidden" name="payment" value="0.01" />
        <span>支付订单：{{ orderNumber}}
          收款方：网络商城</span><input type="hidden" name="orderId" />
      </div>
      <!--支付方式-->
      <div id="pay_type">
        <!-- 支付方式头-->
        <div class="pay_type_title">
          <b>网上银行支付</b>
        </div>
        <div id="dnBank">
          <ul>
            <li><input type="radio" name="bankId" value="BOC-NET-B2C" id="02zg"> <label for="02zg"><img
                  src="images/pay/pay_img1.jpg" alt="" /></label></li>
            <li><input type="radio" name="bankId" value="ICBC-NET-B2C" id="03gs"> <label for="03gs"><img
                  src="images/pay/pay_img2.jpg" alt="" /></label></li>
            <li><input type="radio" name="bankId" value="CMBCHINA-NET-B2C" id="04zs"> <label for="04zs"><img
                  src="images/pay/pay_img3.jpg" alt="" /></label></li>
            <li><input type="radio" name="bankId" value="CCB-NET-B2C" id="05js"> <label for="05js"><img
                  src="images/pay/pay_img4.jpg" alt="" /></label></li>
            <li><input type="radio" name="bankId" value="ABC-NET-B2C" id="06ny"> <label for="06ny"><span><img
                    src="images/pay/pay_img5.jpg" alt="" /></span></label></li>

          </ul>
          <ul>
            <li><input type="radio" name="bankId" value="" id="07al"> <label for="07al"><img src="images/pay/alipay.jpg"
                  alt="" /></label></li>
            <li><input type="radio" name="bankId" value="" id="08wx"> <label for="08wx"><span><img
                    src="images/pay/WePayLogo.png" alt="" /></span></label></li>
          </ul>
        </div>

      </div>
      <!--结算条-->
      <div id="count_bar">
        <span class="pay_leftTime"> 剩余付款时间：<b>{{ minute }} : {{ seconds }}</b>
          <!--获取待支付时间并更改订单状态-->
        </span> <span class="okPay"><a href="pay_success">确认支付</a></span>
        <!-- <input type="submit" value="立即付款"> -->
      </div>

    </div>
  </form>
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
    var pay_form_vm = new Vue({
      el: '#pay_form',
      data() {
        return {
          orderTotal: 0,
          orderNumber: '',
          minute: 14,
          seconds: 59
        }
      },
      mounted() {
        this.orderTotal = localStorage.getItem('orderTotal');
        console.log(this.orderTotal);
        for (var i = 0; i < 10; i++) {
          this.orderNumber += (Math.floor(Math.random() * 10) + '');
        }
        setInterval(() => {
          this.seconds--;
          if (this.seconds < 10) {
            this.seconds = '0' + this.seconds;
            if ((this.seconds + '').substring(1) < 0) {
              this.minute--;
              this.seconds = 59;
            }
          }
          if (this.minute < 0) {
            alert("超时");
            window.location.href = "cart";
            this.minute = 14;
            this.seconds = 59;
          }
        }, 1000);
        localStorage.setItem('orderNumber', this.orderNumber);
      }
    })
  </script>
  <script>
    var vm = new Vue({
      el: "#foot"
    })
  </script>
  <script>
    $("#count_bar .okPay").css("display", "none");
    $("#dnBank>ul>li img").click(
      function () {
        $(this).addClass("hover");
        $(this).parent().parent().siblings().children('label')
          .children('img').removeClass('hover');
        $("#count_bar .okPay").show("3000");
      });
    /* $(":not(#count_bar .okPay)").css("display","none"); */
  </script>
  <script type="text/javascript">
    function payment() {
      $("#pay_form").submit();
      // document.getElementById('pay_form').submit();
      alert(11);
    }
  </script>
  <script>
    $(".okPay").click(function () {
      window.location.href = "pay_success";
    })
  </script>
  <script>
    var canvas = document.getElementById("canvas_gray");
    var cxt = canvas.getContext("2d");
    var gray = cxt.createLinearGradient(10, 0, 10, 38);
    gray.addColorStop(0, '#f5f4f5');
    gray.addColorStop(1, '#e6e6e5');
    cxt.beginPath();
    cxt.fillStyle = gray;
    cxt.moveTo(20, 19);
    cxt.lineTo(0, 38);
    cxt.lineTo(0, 0);
    cxt.fill();
    cxt.closePath();
  </script>
  <script>
    var canvas = document.getElementById("canvas_blue");
    var cxt = canvas.getContext("2d");
    var blue = cxt.createLinearGradient(10, 0, 10, 38);
    blue.addColorStop(0, '#27b0f6');
    blue.addColorStop(1, '#0aa1ed');
    cxt.beginPath();
    cxt.fillStyle = blue;
    cxt.moveTo(20, 19);
    cxt.lineTo(0, 38);
    cxt.lineTo(0, 0);
    cxt.fill();
    cxt.closePath();
  </script>
</body>

</html>