<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <base href="<%=basePath%>">
    <title>500页面</title>
    <link href="css/header.css" rel="Stylesheet" />
    <link href="css/footer.css" rel="Stylesheet" />
    <link href="css/404.css" rel="Stylesheet" />
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">


</head>

<body>
        <!-- 页面顶部-->
    <div id="header">
        <component-fix-nav user-id="${nowuser.id}" user-name="${nowuser.username}"></component-fix-nav>
    </div>

    <!--500-->
    <div id="container">
        <div class="rightsidebar_box rt">
            <div class="sys_err">
                <img src="images/500/500_img1.png" alt="" />
                <p>
                    <img src="images/500/500_img2.png" alt="" />服务器发生了错误！
                </p>
                <span>快去看看别的吧！<b><a href="#">回首页&gt;&gt;</a></b></span>
                <br />
            </div>
        </div>
    </div>
    <!--为你推荐-->
    <div id="recommended">
        <p>为你推荐<span>大家都在看</span></p>
        <div id="demo" style="width:1000px;overflow:hidden;">
            <!-- 外面的大框 -->
            <div id="indemo" style="float: left;width: 200%;">
                <!-- 宽度特别大 -->
                <div id="demo1" style="float:left">
                    <!-- 第一个宽度显示 -->
                    <div class="detail_1 lf">
                        <div class="detail_img1">
                            <img src="images/recommend/recommend_img1.png" border="0">
                        </div>
                        <p>ThinkPad New S2 (20GUA00QCD)13.3英寸超霸笔记本电脑</p>
                    </div>
                    <div class="detail_1 lf">
                        <div class="detail_img1">
                            <img src="images/recommend/recommend_img2.png" border="0">
                        </div>
                        <p>戴尔 DELL燃7000 R1605S 超霸笔记本电脑</p>
                    </div>
                    <div class="detail_1 lf">
                        <div class="detail_img1">
                            <img src="images/recommend/recommend_img3.png" border="0">
                        </div>
                        <p>戴尔(DELL)魔方15MF Pro-R2505TSS灵越超霸笔记本电脑</p>
                    </div>
                    <div class="detail_1 lf">
                        <div class="detail_img1">
                            <img src="images/recommend/recommend_img4.png" border="0">
                        </div>
                        <p>联想(Lenovo) YOGA900 (YOGA4 PRO)多彩版超霸笔记本电脑</p>
                    </div>
                    <!--</div>-->
                </div>
                <div id="demo2" style="float:left">
                </div>
            </div>
            <!-- 宽度超大 -->
        </div>
        <!-- 外面大框 -->
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
        var foot_vm = new Vue({
            el: "#foot"
        })
    </script>
    <!--图片轮播悬停进入详情页效果-->
    <script>
        var recommended_vm = new Vue({
            el: "#recommended",
            data: function () {
                return {
                    timer: '',
                    speed: 20,
                    tab: '',
                    tab1: '',
                    tab2: ''
                }
            },
            created: function () {
                this.tab = $('#demo');
                this.tab1 = $('#demo1');
                this.tab2 = $('#demo2');
                this.tab2.innerHTML = this.tab1.innerHTML;
            },
            methods: {
                marquee: function () {
                    console.log('1');
                    if (this.tab2.offsetWidth - this.tab.scrollLeft <= 0) {
                        this.tab.scrollLeft -= this.tab1.offsetWidth;
                    } else {
                        this.tab.scrollLeft++;
                    }
                },
                mouseover: function () {
                    console.log(this.tab1);
                    clearInterval(this.timer);
                },
                mouseout: function () {
                    this.timer = setInterval(this.marquee, this.speed);
                }
            },
            mounted: function () {
                this.timer = setInterval(this.marquee, this.speed);
            }
        })
        // var speed = 20;
        // var tab = document.getElementById("demo");
        // var tab1 = document.getElementById("demo1");
        // var tab2 = document.getElementById("demo2");
        // tab2.innerHTML = tab1.innerHTML;
        // function Marquee() {
        //     if (tab2.offsetWidth - tab.scrollLeft <= 0)
        //         tab.scrollLeft -= tab1.offsetWidth
        //     else {
        //         tab.scrollLeft++;
        //     }
        // }
        // var MyMar = setInterval(Marquee, speed);
        // tab.onmouseover = function () {
        //     clearInterval(MyMar)
        // };
        // tab.onmouseout = function () {
        //     MyMar = setInterval(Marquee, speed)
        // };
    </script>
</body>

</html>