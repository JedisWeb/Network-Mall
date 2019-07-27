Vue.component('component-fix-nav',{
    name: "component-fix-nav",
    props:['userId','userName'],
    data: function() {
        return{
            userid: 'loginctlr/userxinx.do?id=' + this.userId,
            username: this.userName
        }
    },
    template:
    '<div>' +
        '<header id="top" class="fixed_nav">' +
            '<div id="logo" class="lf"> ' +
                '<a href="indexx_ctlr/indexx.do" title="首页">' +
                    '<img class="animated jello" src="images/header/logo.png" alt="logo" /> ' +
                '</a>' +
            '</div>' +
            '<div id="top_input" class="lf">' +
                '<input id="input" type="text" placeholder="请输入您要搜索的内容" />' +
                '<a href="search_ctlr/search.do" class="rt">' +
                    '<img id="search" src="images/header/search.png" alt="搜索" />' +
                '</a>' +
            '</div >' +
            '<div class="rt">' + 
                '<ul class="lf">' +
                    '<li><a href="favorite_ctlr/favorite.do" title="我的收藏"><img src="images/header/care.png" alt="" /></a><b>|</b></li>' +
                    '<li><a :href="userid" title="我的信息"><img src="images/header/order.png" alt="" /></a><b>|</b></li>' +
                    '<li><a href="cartctlr/cart.do" title="我的购物车"><img src="images/header/shop_car.png" alt="" /></a><b>|</b></li>' +
                    '<li><a href="help_ctlr/help.do">帮助</a><b>|</b></li>' +
                    '<li><a href="loginctlr/login.do">'+ '{{username}}' + ',欢迎你</a></li>' +
                '</ul>' +
            '</div>' +
        '</header>' +
        '<nav id="nav">' +
            '<ul>' +
                '<li><a href="indexx_ctlr/indexx.do" class="acti">首页</a></li>' +
                '<li><a href="indexx_ctlr/indexx.do#computer">电脑办公</a></li>' +
                '<li><a href="indexx_ctlr/indexx.do#stationery">办公文具</a></li>' +
            '</ul>' +
        '</nav>' +
    '</div>'
});