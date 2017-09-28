<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>푸드다마스</title>
<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css'>

<base href="../resources/">

<link rel="stylesheet" media="screen" href="css/app.css">
<link rel="stylesheet" media="screen" href="css/fooddamas.css">
<link rel="stylesheet" href="css/menuStyle.css">

<style type="text/css">

#price{
	margin-left:5px; 
	font-weight:bold; 
	color:#000080;
}
#delete{
	float: right;
	 font-size: 16px; 
	 font-weight: bold;
}
#quantity{
	margin: 0 10px;
}
.dottedP{
 	border-bottom: 1px dotted #cccccc; 
 	margin:20px 0 0 0;
}

</style>
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.1.js"></script>

<script src="js/cart.js"></script>

<body>
	<div class="nav-bar">
		<div class="LeeBack">← 뒤로</div>
		
		<div class=" leer">${login.c_id}님의 장바구니</div>
	</div>
			<%@include file="../headersub.jsp"%>

	<div class="cart-wrap">
		<div class="sub-title">
			<span>장바구니</span> </a>
		</div>
		<div class="cart">
<!-- 			<div class="restaurant-name"></div>
 -->			<ul class="list-group">

				<li class="list-group-item clearfix">
				<div class= "menuList">
	
				</li>
			</ul>


			<div class="clearfix">
				
				 <span class="list-group-item cart-total-order-price" id="totalPrice">
					</span>
				<input id='total' hidden>
			</div>
			
			<div style="margin-top: 10px;  width: 100%">
				<textarea class= "c_msg" style="height: 46px; float: left; width: 100%; padding: 5px; font-size: 14px;" placeholder="요청사항을 입력해주세요"></textarea>			
			</div>
			
			<div class="cart-btn clearfix" style="margin-top: 80px;">
				<a id='orderCart' class="btn btn-lg btn-ygy1 btn-right">주문하기</a>
			</div>
		</div>
	</div>
	<input value="${u_id}" class='u_id' hidden>
	<input value="${sno}" id= 'sno' hidden>
	<input value="${login.c_id}" id= 'c_id' hidden>

	<!-- 하단 영역 -->
				<%@include file="../footersub.jsp"%>

	<script type="text/javascript">
	

	$(document).ready(function(){
		var c_id= $("#c_id").val();
		//var sno=$("#sno").val();
		cartManager.cartList(c_id,display);
		var sno= sessionStorage.getItem('sno');
			console.log("-----------------sno");
		console.log(sno);
		function display(data) {
			console.log(data);
			var menuList="";
			var totalPrice=0;
			for(var i=0; i<data.length; i++){
				menuList+=
					"<a class='btn' id='delete'  data-cno='"+data[i].cno+"'>X</a><div class='row'><div class='m_name' style='margin-left: 20px;clear:both'>"
					+data[i].m_name	+ "</div><br><div><div class='col-xs-6 pull-left'>"
				  /*   + "<a class='btn btn-del-menu'>삭제</a>"  */
				    + "<span class='order-price ' id= 'price'>" +data[i].m_price+" 원</span>"+
				"</div><div class='col-xs-6 text-right'><a id ='minus' class='btn-minus' data-cno='"+data[i].cno+"' data-quantity='"+data[i].quantity+"'> - </a><span  id= 'quantity' >"+data[i].quantity+"</span>"+
				"<a class='btn-plus' id=plus data-cno='"+data[i].cno+"' data-quantity='"+data[i].quantity+"'>+</a></div></div></div><p class='dottedP'></p>";
				totalPrice+=(data[i].quantity)*(data[i].m_price);
			}
			$(".menuList").html(menuList);
			$("#total").val(totalPrice);

			totalPrice=totalPrice.toLocaleString();

			$("#totalPrice").text(totalPrice+"원");
		}
		$(".menuList").on("click","#minus", function () {	
			var $this=$(this);
			var cnt=Number($this.attr("data-quantity"))-1;
			var cno=$this.attr("data-cno");
			var obj="";
			if(cnt==0){
				if (confirm("0개이하입니다. 삭제할까요?")){
					deleteCart(cno);
			}else{
					return false;
				}
			}
			
		
			obj={cno:cno ,quantity:cnt};
			updateQuantity(obj)
//			$(this, "#quantity").text(cnt);
		});
		$(".menuList").on("click","#plus", function () {	
			var $this=$(this);
			var cnt=Number($this.attr("data-quantity"))+1;
			var cno=$this.attr("data-cno");
			var obj="";
			obj={cno:cno ,quantity:cnt};
			updateQuantity(obj);
	
		});
		
		
		$(".menuList").on("click", "#delete", function() {
			var $this=$(this);
			var cno=$this.attr("data-cno");
			deleteCart(cno);
		});
		
		$("#orderCart").on("click", function () {
			var total=$("#total").val();
			order(34.12121,127.1231213);
//////////////////////////////this////////////////////////////////////////////
//////////////////////////////this////////////////////////////////////////////
//////////////////////////////this////////////////////////////////////////////
//////////////////////////////this////////////////////////////////////////////
/* 			if (navigator.geolocation) {
				// GeoLocation을 이용해서 접속 위치를 얻어옵니다
				navigator.geolocation.getCurrentPosition(function(position) {
					var lat = position.coords.latitude;// 위도
					var lng = position.coords.longitude; // 경도
					order(lng,lat);
							
				});

			} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
				console.log("Geolocation 사용 불가");
			} */
//////////////////////////////this////////////////////////////////////////////
//////////////////////////////this////////////////////////////////////////////
//////////////////////////////this////////////////////////////////////////////
//////////////////////////////this////////////////////////////////////////////
			var pay;
			 function pay(data) {	
				 console.log(data);
				 var IMP = window.IMP;
				IMP.init('imp23562032'); //'iamport' 대신 부여받은 "가맹점 식별코드"를 사용.		
				console.log(data);
				  IMP.request_pay({
				    pg : 'kakao', // version 1.1.0부터 지원.
				    pay_method : 'card', // 'card' : 신용카드 | 'trans' : 실시간계좌이체 | 'vbank' : 가상계좌 | 'phone' : 휴대폰소액결제
				    merchant_uid : 'merchant_' + new Date().getTime(),
				    name : 'FoodDamas',
				    amount : data.total_price,
				 //   buyer_email : 'iamport@siot.do',
				    buyer_name : data.c_id,
				    /*  buyer_tel : '010-1234-5678',
				    buyer_addr : '서울특별시 강남구 삼성동',
				    buyer_postcode : '123-456',  */
				    app_scheme : 'iamporttest' //in app browser결제에서만 사용 
				}, function(rsp) {
				    if ( rsp.success ) {
				        var msg = '결제가 완료되었습니다.';
				        msg += '고유ID : ' + rsp.imp_uid;
				        msg += '상점 거래ID : ' + rsp.merchant_uid;
				        msg += '결제 금액 : ' + rsp.paid_amount;
				        msg += '카드 승인번호 : ' + rsp.apply_num;
				        
						cartManager.insertOrder(data);

				    } else {
				        var msg = '결제에 실패하였습니다.';
				        msg += '에러내용 : ' + rsp.error_msg;
				    }
		            alert(msg);

				});  
			}
	
 			function order(lng,lat) {
				obj={
						total_price:total,
						c_msg: $(".c_msg").val(),
						sno: sno,
						c_id:c_id,
						lat:lat,
						lng:lng 
				}
				pay(obj);
				
			}
			 
			
		});
		
		function updateQuantity(obj) {
			cartManager.quantity(obj, function() {
				cartManager.cartList(c_id,display);
			});
		}
		
		function deleteCart(cno) {
			cartManager.deleteCart(cno, function() {
				cartManager.cartList(c_id,display);
			});
			
		}
	});
	
	</script>
</body>
</html>