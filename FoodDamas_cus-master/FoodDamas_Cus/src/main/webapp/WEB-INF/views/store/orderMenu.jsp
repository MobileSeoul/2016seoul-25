<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<html>
<head>
<title>푸드다마스</title>
<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css'>

<base href="../resources/">

<link rel="stylesheet" media="screen" href="css/app.css">
<link rel="stylesheet" media="screen" href="css/fooddamas.css">
<link rel="stylesheet" href="css/menuStyle.css">

</head>


<body>
	<div class="nav-bar">
		<div class="LeeBack">← 뒤로</div>
		<div class=" leer">우리청년컵밥</div>
	</div>
			<%@include file="../headersub.jsp"%>

	<div class="cart-wrap">
		<div class="sub-title">
			<span>주문표</span> </a>
		</div>
		<div class="cart">
			<div class="restaurant-name">청년컵밥</div>
			<ul class="list-group">

				<li class="list-group-item clearfix">
<a class="btn " style="float: right; font-size: 16px; font-weight: bold">X</a> 
					<div style="clear: both">
					<div style="width: 20% ;float: left;">
						<img src="img/11.png" style="width: 100%;">
					</div>
										<div style="width: 78% ;float: right;">
					
					<div class="row" >
						
						<div class="menu-name">참치+스팸 갈릭마요 컵밥</div>
						<div>
							<div class="col-xs-5 pull-left">
								<span class="order-price">7,000원</span>
							</div>
							<div class="col-xs-7 text-right">
								<button class="btn btn-del-menu" style="width: 40px; font-size: 30px; height: 40px;" >-</button>
								<span class="order-num" style="margin-right: 10px; margin-left: 10px">1</span>
								<button class="btn btn-del-menu" style="width: 40px; font-size: 30px; height: 40px;" >+</button>
								
							</div>
						</div>
					</div>
					</div>
					</div>
				
			</ul>


			<div class="clearfix">
				
				 <span class="list-group-item cart-total-order-price ">
					합계: 7,000원 </span>
			</div>

			<div class="cart-btn clearfix">
				<a class="btn btn-lg btn-ygy2 btn-left"  href="/menu">메뉴추가</span>
				</a> <a class="btn btn-lg btn-ygy1 btn-right"  href="/charge">주문하기</a>
			</div>
		</div>
	</div>

	<!-- 하단 영역 -->
	<footer class="footer">
		<div class="inner" style="font-size: 16px;">

			<div style="color: #ffffff; margin-bottom: 15px;">푸드다마스</div>
			<nav class="links-external">
				<ul class="list-links">
					<li><a href="/">회사소개</a></li>
					<li><a href="/">직원내용</a></li>
					<li><a href="/">이용약관</a></li>
					<li><a class="only-desktop" href="/">브랜드</a></li>
				</ul>
			</nav>
			<div class="language-copyrights">
				<p class="select-language">
					<a href="/" class="selected">한국어</a> <a href="/">English</a>
				</p>
				<small>
					<p>
						푸드다마스 대표이사: 이성현 | 사업자 등록번호: 000-00-0000 <br class="only-smobile">
						서울특별시 강남구 역삼동 12, 8층<br> <span class="copyrights">©
							2016 zzennam. All rights reserved.</span>
					</p>
				</small>
			</div>
		</div>
	</footer>
</body>
</html>