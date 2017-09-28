<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Top menu -->
<div id="mySidenav" class="sidenav navbar-fixed-top">
	<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	<div>
		<img src="http://news20.busan.com/content/image/2012/10/04/20121004000066_0.jpg"
			width="150" height="150" style="border-radius: 100px;" id="face">
		<br>
	</div>
	<div class="col-md-4 col-xs-6 nav-menu order">
		<a class="scroll-link" href="#statContainer">Order</a>
		<!-- <a class="orderp" onclick="order()">Order</a> -->
	</div>
	<div class="col-md-4 col-xs-6 nav-menu info">
		<a href="#">Infomation</a>
	</div>
	<div class="col-md-4 col-xs-6 nav-menu menu">
		<a href="#" class="menus scroll-link">Menu</a>
	</div>
	<div class="col-md-4 col-xs-6 nav-menu qna">
		<a href="#">QnA</a>
	</div>
	<div class="col-md-4 col-xs-6 nav-menu totalSales">
		<a href="#">Total Sales</a>
	</div>
	<div class="col-md-4 col-xs-6 nav-menu notice">
		<a href="#">위치 공고 </a>
	</div>
	<div>
		<a href="/logout" class="setting"><span class="glyphicon glyphicon-off">
				Logout</span></a> 
		<a href="/modify" class="setting"><span	class="glyphicon glyphicon-cog">
				 수정 </span></a>
	</div>
</div>

<div class="sh-nav">
	<span style="font-size: 50px; cursor: pointer; "
		onclick="openNav()">&#9776;</span>
</div>
