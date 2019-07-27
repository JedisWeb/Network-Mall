Vue.component('component-left-sidebar',{
    template:
        '<div id="leftsidebar_box" class="lf">' +
            '<div class="line"></div>' +
            '<dl class="my_order">' +
                '<dt>' +
                    '我的订单 <img src="images/myOrder/myOrder2.png">' +
                '</dt>' +
                '<dd class="first_dd">' +
                    '<a href="orders">全部订单</a>' +
                '</dd>' +
                '<dd>' +
                    '<a> 待付款 <span>' +
                        '</span>' +
                    '</a>' +
                '</dd>' +
                '<dd>' +
                    '<a> 待收货 <span>1' +
                        '</span>' +
                    '</a>' +
                '</dd>' +
                '<dd>' +
                    '<a> 待评价<span>' +
                        '</span>' +
                    '</a>' +
                '</dd>' +
                '<dd>' +
                    '<a>退货退款</a>' +
                '</dd>' +
            '</dl>' +
            '<dl class="footMark">' +
                '<dt>' +
                    '我的优惠卷<img src="images/myOrder/myOrder1.png">' +
                '</dt>' +
            '</dl>' +
            '<dl class="address">' +
                '<dt>' +
                    '收货地址<img src="images/myOrder/myOrder1.png">' +
                '</dt>' +
                '<dd>' +
                    '<a href="address_admin_ctlr/address_admin.do">地址管理</a>' +
                '</dd>' +
            '</dl>' +
            '<dl class="count_managment">' +
                '<dt>' +
                    '帐号管理<img src="images/myOrder/myOrder1.png">' +
                '</dt>' +
                '<dd class="first_dd">' +
                    '<a href="person_age_ctlr/person_age.do">我的信息</a>' +
                '</dd>' +
                '<dd>' +
                    '<a href="personal_password_ctlr/personal_password.do">安全管理</a>' +
                '</dd>' +
            '</dl>' +
        '</div>'
})