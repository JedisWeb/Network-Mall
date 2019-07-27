$(function () {

	if (!$(".imfor")) {
		$('#section').hide();
		$('.none').show();
	}

	adddel();
	$('.imfor').each(function () {
		var price = parseFloat($(this).children('.pices').children('.pices_information').children('span').html());
		var amount = parseFloat($(this).children('.num').children('input').val());
		var amountPrice = price * amount;
		$(this).children('.totle').children('.totle_information').html(amountPrice.toFixed(2));
	});
	//全选
	$(".all").click(function () {
		if ($('.all span').hasClass('normal')) {
			$('.all span').addClass('true').removeClass('normal');
			$(".Each span").each(function () {
				$(this).addClass('true').removeClass('normal');
				$(this).prev().prop("checked", true);
			})
			totl();
		} else {
			$('.all span').addClass('normal').removeClass('true');
			$(".Each span").each(function () {
				$(this).addClass('normal').removeClass('true');
				$(this).prev().prop("checked", false);
				$(this).prev().removeAttr("checked");
			});
			$(".susum").text(0.00);
			$(".susumOne").text(0.00);
			$('.total').text(0);
			$('.totalOne').text(0);
		}
	})

	//单选
	$('.Each span').click(function () {
		$('.all span').addClass('normal').removeClass('true');
		if ($(this).hasClass('normal')) {
			$(this).addClass('true').removeClass('normal');
			var amount = Number($('.total').text());
			var sum = Number($('.susum').text());
			console.log(amount);
			console.log(sum);
			amount++;
			sum += Number($(this).parents('.check').siblings('.totle').children('.totle_information').text());
			console.log(amount);
			console.log(sum);
			$('.total').text(amount);
			$('.totalOne').text(amount);
			$(".susum").text(sum.toFixed(2));
			$(".susumOne").text(sum.toFixed(2));
		} else {
			$(this).addClass('normal').removeClass('true');
			var amount = Number($('.total').text());
			var sum = Number($('.susum').text());
			console.log(amount);
			console.log(sum);
			amount--;
			sum -= Number($(this).parents('.check').siblings('.totle').children('.totle_information').text());
			console.log(amount);
			console.log(sum);
			$('.total').text(amount);
			$('.totalOne').text(amount);
			$(".susum").text(sum.toFixed(2));
			$(".susumOne").text(sum.toFixed(2));
		}
	})


	//删除当前行
	$('.del_d').click(function () {
		var id = $(this).parent().siblings('.pudc').children('.pudc_information').attr('id');
		console.log(id);
		$('.modal').fadeIn();
		$('.no').click(function () {
			$('.modal').fadeOut();
		});
		$('.yes').click(function () {
			var url = '/delCartItem.html?itemId=' + id;
			window.location.href = url;
		})
	});

	// 批量删除
	$(".foot_del").click(function () {
		var str = [];
		$('.Each span').each(function () {
			if ($(this).hasClass('true')) {
				var id = $(this).parents('.check').next().children('.pudc_information').attr('id');
				str.push(id);

			}
		});
		console.log(str);
		if (str.length > 0) {
			$('.modal').fadeIn();
			$('.no').click(function () {
				$('.modal').fadeOut();
			});
			$('.yes').click(function () {
				var url = '/delCartItems.html?&itemIds=' + str;
				window.location.href = url;

			});
		} else {
			$('.modalNo').fadeIn();
			$('.close').click(function () {
				$('.modalNo').fadeOut();
			})
		}
	})
})
// 合计
function totl() {
	var sum = 0.00;
	var amount = 0;
	$(".totle_information").each(function () {
		sum += parseInt($(this).text());
		$(".susum").text(sum.toFixed(2));
		$(".susumOne").text(sum.toFixed(2));
		amount++;
		$('.total').text(amount);
		$('.totalOne').text(amount);
	})
}
// 单独
// function amount(str) {
// 	var amount = Number($('.total').text());
// 	var sum = Number($('.susum').text());
// 	console.log(amount);
// 	console.log(sum);
// 	if (str === "+") {
// 		amount++;
// 		sum += Number($(this).parents('.check').siblings('.totle').children('.totle_information').text());
// 	} else {
// 		amount--;
// 		sum -= Number($(this).parents('.check').siblings('.totle').children('.totle_information').text());
// 	}
// 	console.log(amount);
// 	console.log(sum);
// 	$('.total').text(amount);
// 	$('.totalOne').text(amount);
// 	$(".susum").text(sum.toFixed(2));
// 	$(".susumOne").text(sum.toFixed(2));
// }

function adddel() {
	//小计和加减
	//加
	$(".add").each(function () {
		$(this).click(function () {
			var $multi = 0;
			var vall = $(this).prev().val();
			vall++;
			$(this).prev().val(vall);
			$multi = (parseInt(vall).toFixed(2) * parseInt($(this).parent().prev().children().eq(1).children().eq(1).text()));
			$(this).parent().next().children().eq(1).text(Math.round($multi).toFixed(2));
			amountadd();
			var id = $(this).parent().siblings('.pudc').children('.pudc_information').attr('id');
			var num = $(this).prev().val();
			// $.ajax({
			// 	type: "GET",
			// 	url: "/changeCartNum.html",
			// 	data: { itemId: id, num: num },
			// 	success: function (data) {
			// 	}
			// });
			axios.get("/changeCartNum.html", {
				itemId: id,
				num: num
			}).then(function (response) {

			})
		})
	})
	//减
	$(".reduc").each(function () {
		$(this).click(function () {
			var $multi1 = 0;
			var vall1 = $(this).next().val();
			vall1--;
			if (vall1 <= 0) {
				vall1 = 1;
			}
			$(this).next().val(vall1);
			$multi1 = parseInt(vall1) * parseInt($(this).parent().prev().children().eq(1).children().eq(1).text());
			$(this).parent().next().children().eq(1).text(Math.round($multi1).toFixed(2));
			amountadd();
			var id = $(this).parent().siblings('.pudc').children('.pudc_information').attr('id');
			var num = $(this).next().val();
			// $.ajax({
			// 	type: "GET",
			// 	url: "/changeCartNum.html",
			// 	data: { itemId: id, num: num },
			// 	success: function (data) {

			// 	}
			// });
			axios.get("/changeCartNum.html", {
				itemId: id,
				num: num
			}).then(function (response) {

			})
		})
	})
}

//去结算
var str = [];
var totalPrice = 0;
$('.foot_cash').click(function () {
	$('.Each span').each(function () {
		if ($(this).hasClass('true')) {
			var id = $(this).parents('.check').next().children('.pudc_information').attr('id');
			var num = $(this).parents('.check').siblings('.num').children('input').val();
			//str.push(id);
		}
	});
	totalPrice = $('.susumOne').html();
	console.log(totalPrice);
	console.log(str);
	if (str.length > 0) {
		var url = '/CartToOrder.html?itemIds=' + str;
		window.location.href = url;
	} else {
		$('.modalBalance').fadeIn();
		$('.close').click(function () {
			$('.modalBalance').fadeOut();
		})
	}

})

