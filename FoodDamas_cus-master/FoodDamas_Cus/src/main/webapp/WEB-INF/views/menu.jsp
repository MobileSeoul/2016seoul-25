<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>푸드다마스</title>
<base href="resources/">
<link rel="stylesheet" media="screen" href="css/app.css">
<link rel="stylesheet" media="screen" href="css/fooddamas.css">
</head>
<style>
    li {border: 1px solid #cccccc; list-style:none; width: 48%;float: left; margin: 2px; text-align: center}
</style>

<body>
	 <%@include file="headersub.jsp"%>


		<div class="restaurant-detail">
			<ul class="nav nav-tabs">
				<li ><a href="../../info">정 보</a></li>
				<li  class="active"><a href="../../menu">메 뉴</a></li>
				<li><a href="../../review">리 뷰</a></li>
				<li><a href="../../qna">QNA</a></li>
			</ul>
		</div>
		
			<div id="menu" class="menu-list">
				
						<div class="panel-collapse collapse in">
								<ul class="sub-list">
									<!-- <li class="ng-scope">
									here
									<div class="menui"><img src=" img/1.JPG" width="80px; "></div>
									<div class="menuu">
										<div class="menu-name">놀부부대찌개（2인）</div>
										<div class="menu-price ">15,000원</div>
										<div class="menu-desc ">놀부부대찌개＋놀부사리＋음료1병</div>
									</div>
									</li> -->
									 <li class="sss1">
        								<img src="img/nolbooset.jpg" style="width: 130px; height: 130px; margin: 0 auto">
       								     <div style="color: black; text-align: center;"><Strong>놀부세트</Strong></br></div>
      									      <div class="radi-box" style="color: #00a7d0; text-align: center;">2인 \20,000</div></br>
   									 </li>
   									 <li  class="sss2">
								       <img src="img/hbooset.jpg"  style="width: 130px; height: 130px; text-align: center" >
								            <div style="color: black; text-align: center;"><Strong>흥부세트</Strong></br></div>
								            <div class="radi-box" style="color: #00a7d0;text-align: center;">2인 \20,000</div></br>
								    </li>
								    <li  class="sss3">
								        <img src="img/YMset.jpg"  style="width: 130px; height: 130px;text-align: center">
								        <div style="color: black; text-align: center;"><Strong>양반세트</Strong></br></div>
								        <div class="radi-box" style="color: #00a7d0;text-align: center;">2인 \20,000</div></br>
								    </li>
								    <li class="sss4">
								        <img src="img/44.jpg" style="width: 130px; height: 130px;text-align: center">
								        <div style="color: black; text-align: center;"><Strong>토토로세트</Strong></br></div>
								        <div class="radi-box" style="color: #00a7d0;text-align: center;">2개 \40,000</div></br>
								    </li>
								    <li class="sss5">
								        <img src="img/44.jpg" style="width: 130px; height: 130px;text-align: center">
								        <div style="color: black; text-align: center;"><Strong>fgfg</Strong></br></div>
								        <div class="radi-box" style="color: #00a7d0;text-align: center;">2개 \40,000</div></br>
								    </li>
								    <li class="sss6">
								        <img src="img/44.jpg" style="width: 130px; height: 130px;text-align: center">
								        <div style="color: black; text-align: center;"><Strong>fgfg</Strong></br></div>
								        <div class="radi-box" style="color: #00a7d0;text-align: center;">2개 \40,000</div></br>
								    </li>
									<!-- <li class="ng-scope"><span class="menu-name ">놀부부대찌개SET</span>
										<span class="menu-price ">20,000원</span>
										<div class="menu-desc ">놀부부대찌개＋놀부사리＋음료1병</div></li>
									<li class="ng-scope"><span class="menu-name ">옛맛부대찌개SET</span>
										<span class="menu-price ">19,000원</span>
										<div class="menu-desc ">옛맛부대찌개＋놀부사리＋음료1병</div></li>
									<li class="ng-scope"><span class="menu-name ">햄
											듬뿍</span> <span class="menu-price ">3,000원</span>
										<div class="menu-desc "></div></li>
									<li class="ng-scope"><span class="menu-name ">놀부사리</span>
										<span class="menu-price ">5,000원</span>
										<div class="menu-desc ">생라면사리＋만두＋햄4종＋조랭이떡＋감자수제비</div>
									</li> -->

								</ul>
						</div>
					</div>

				
		</div>
	</div>

	<div class="btm-btn-set ng-scope">
		<div class="cart-btn clearfix type-a">
			<a class="btn btn-lg btn-ygy2 btn-left  touch-cart-btn-disabled">주문표(1)</a>
			<a class="btn btn-lg btn-ygy1 btn-right touch-order-btn-disabled">바로주문하기</a>
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
						푸드다마스 대표이사: 이성현 | 사업자 등록번호: 000-00-0000 <br class="only-mobile">
						서울특별시 강남구 역삼동 12, 8층<br> <span class="copyrights">©
							2016 zzennam. All rights reserved.</span>
					</p>
				</small>
			</div>
		</div>
	</footer>
</body>
</html>