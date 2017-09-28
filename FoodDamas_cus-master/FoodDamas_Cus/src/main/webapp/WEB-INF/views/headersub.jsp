<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<style>
a:visited {text-decoration: none; color: #333333;}


</style>
<html lang="UTF-8">
		<header class="header">
	<div class="nav-bar">
		<a href="../../home" class="fa fa-home menu fa-2x"  style="left:20px; top:13px" ></a>
		<div class="leer"></div>
			<a class="fa fa-bars menu fa-2x" id="menu_toggle" style="top: 13px;"></a>
	</div>
	
 <nav id="side-menu" style="z-index: 1300">
	<a class="fa fa-close" id="close"></a>
	<span class="cid" hidden>${login.c_id}</span>
	<ul>
		<li class="customer"></li>
		<li class="nav-one"><a href="/home">홈</a><i class="fa fa-home"></i>
		</li>
		<li class="nav-two"><a href="../api1">서울시 공공API</a><i
			class="fa fa-user"></i></li>
		<li class="nav-three"><a href="../order/orderlist">주문내역</a><i
			class="fa fa-floppy-o"></i></li>
		<!--  <li class="nav-four">
        <a>회원정보</a><i class="fa fa-exclamation-triangle"></i>
      </li> -->
		<li id="log" class="nav-five"></li>
	
	</ul>
	
	
</nav>
</header>

<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script >
console.log($(".cid").html());
var customer=$(".cid").html();

if(customer==""){
	$(".customer").html("로그인 해주세요");
	$("#log").html("<a href='/member/login'>login</a> <i class='fa fa-sign-in'></i>");
	

}else{
	$(".customer").html(customer+"님");
	$("#log").html("<a href='/member/logout'>logout</a> <i class='fa fa-sign-out'></i>");

}

</script>
	
  <script src="js/menubar.js"></script>
  
  <script src='https://cdnjs.cloudflare.com/ajax/libs/classie/1.0.1/classie.min.js'></script>
  
 