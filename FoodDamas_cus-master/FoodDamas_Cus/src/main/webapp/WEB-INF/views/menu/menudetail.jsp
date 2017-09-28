<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<html>
<head>
<title>푸드다마스</title>
<!-- <base href="../resources/"> -->
<link rel='stylesheet prefetch'
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css'>

<base href="../resources/">
<link rel="stylesheet" media="screen" href="css/app.css">
<link rel="stylesheet" media="screen" href="css/fooddamas.css">
<link rel="stylesheet" href="css/menuStyle.css">
<link rel='stylesheet prefetch'
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css'>

</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/menu.js"></script>
<script>
$(document).ready(function(){
	var co_name=sessionStorage.getItem('co_name');

	$(".leer").html(co_name);
	var count=1; //수량
	var obj=[];
	var totalprice = $(".order-price").html();
	console.log(totalprice);
	
	////////plus 클릭하면////////
	$("#plus").on("click", function(){
		count++;
		//totalprice = totalprice * count;
		$("#ordernum").html(count);
		//$("#totalprice").html(totalprice);
	});
	////////minus 클릭하면////////
	$("#minus").on("click", function(){
		count--;
		//totalprice = totalprice * count;
		if(count<0){
			count=0;
			return;
		}
		$("#ordernum").html(count);
		//$("#totalprice").html(totalprice);
	});
	
	
	/////////메뉴주문 클릭하면////////
	$("#order").on("click",function(){
		console.log($("#mno").html());
		console.log($("#ordernum").text());
		obj={
			mno : $("#mno").html(),
			quantity : $("#ordernum").html(),
			c_id : "1"
		}
		console.log(obj);
		//menucart로 가서 obj를 집어넣어준다
		menuManager.menucart(obj,function(){
			 window.location = "http://14.32.7.115:4449/menu/menulist";
			 
		});
		
	});
	
	
	
	
	
	
});//end document


</script>

<body>
	<div class="nav-bar">
		<div class="LeeBack">
			<a href="javascript:history.back()"><img src="img/back.png"
				style="height: 50%; width: 35%"></a>
		</div>
		<div class=" leer"></div>
	</div>
	<%@include file="../headersub.jsp"%>

	<div class="cart-wrap">
		<div class="sub-title">
			<span>주문표</span> </a>
		</div>
		<div class="cart">
			<div class="restaurant-name"></div>
			<ul class="list-group">

				<li class="list-group-item clearfix">
					<!-- <a class="btn " style="float: right; font-size: 16px; font-weight: bold">X</a>  -->
					<div style="clear: both">
						<div style="width: 20%; float: left; margin-top: 5px;">
							<img src="	http://14.32.7.115:4040/displayFile?fileName=${view.m_img}"
								style="width: 100%;">
						</div>
						<div style="width: 76%; float: right;">
							<div class="row">
								<div class="menu-name">${view.m_name}</div>
								<div class="menu-info">${view.m_info}</div>
							</div>
						</div>
					</div>


						<div class="col-xs-1" style="margin-left: -5px;">
							<span class="">${view.m_price}</span> 
							<span style="display: none;" id="mno">${view.mno}</span>
						</div>
						<div class="col-xs-7" style="float: right; text-align: right;">
							<button class="btn btn-del-menu" style="width: 40px; font-size: 30px; height: 40px;" id="minus">-</button>
							<span class="order-num"	style="margin-right: 10px; margin-left: 10px" id="ordernum">1</span>
							<button class="btn btn-del-menu" style="width: 40px; font-size: 30px; height: 40px;" id="plus">+</button>
						</div>
					
					</li>
			</ul>


			<div class="clearfix">

				<span class="list-group-item cart-total-order-price "
					id="totalprice"> ${view.m_price} </span>
			</div>

			<div class="cart-btn clearfix">
				<a class="btn btn-lg btn-ygy2 btn-left" id="order"
					href="javascript:history.back()">메뉴추가</span>
				</a> <a class="btn btn-lg btn-ygy1 btn-right" href="/store/cart">장바구니</a>
			</div>
		</div>
	</div>

				<%@include file="../footersub.jsp"%>

</body>
</html>