<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>푸드다마스</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css'>

<base href="../resources/">


<link rel="stylesheet" media="screen" href="css/app.css">
<link rel="stylesheet" media="screen" href="css/fooddamas.css">
<link rel="stylesheet" media="screen" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/menuStyle.css">


<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel='stylesheet prefetch'	href='http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css'>

</head>
<style>
#menuList li IMG {width: 125px; height: 110px;text-align: center}
#menuList li {border: 1px solid #cccccc; padding:5px 0px;list-style:none; width: 48%; height:165px;   float: left; margin: 2px; text-align: center}
    .imgtext {   color: #00a7d0; text-align: center;}
    .imgtitle {margin-top:6px;color: black; text-align: center;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/menu.js"></script>
<script >
$(document).ready(function(){
	var co_name=sessionStorage.getItem('co_name');

	$(".leer").html(co_name);
	var sno= sessionStorage.getItem('sno');
	var u_id= sessionStorage.getItem('u_id');// session가져옴

	menuManager.menuListAll(u_id, displayData);
	
	function displayData(data){
		console.log(data);
		var menuList="";
		var list = data.list;
		for(var i=0; i<list.length; i++){
			menuList +="<a href='/menu/menudetail?mno="+list[i].mno+"'><li>"
				+"<img src='http://14.32.7.115:4040/displayFile?fileName="+list[i].m_img+"'>"
			    +"<div class='imgtitle'><Strong>"+list[i].m_name+"</Strong></br></div>"
			    +"<div class='radi-box imgtext'>"+list[i].m_price+"</div></br>"
			 	+"</li></a>";
		}
		$("#menuList").html(menuList);
		
		
	}//end display
	
	
});//end document
	
</script>
<body>
		<%@include file="../headersub.jsp"%>


<div style="height: 51px"></div>
	<div class="container-fluid ">

		<div class="restaurant-detail">
			<ul class="nav nav-tabs">
				<li><a href="../../info">정 보</a></li>
				<li  class="active"><a href="../..//menu/menulist">메 뉴</a></li>
				<li><a href="../../review">리 뷰</a></li>
				<li><a href="../../qna">QNA</a></li>
			</ul>
		</div>
		<div class="pg-restaurant" style="padding: 0px;">
			<section class="restaurant-detail" style="padding: 0px">
				<header style="min-height: 0px; padding-bottom: 0px">
					<div>


						<h1 class="title">
							<span itemprop="name">MENU</span> <strong class="rate-point">
						</h1>
					</div>
				</header>
			</section>
		</div>
	<div class="restaurant-detail row">

		<div class="col-sm-12">
		
			<div id="menu" class="menu-list">
					<div class="panel-collapse collapse in">
							<ul class="sub-list" id="menuList">

							</ul>
					</div>
			</div>
			<div>
            <a class="btn btn-lg btn-ygy1 btn-right" style="width: 100%" href="/store/cart">장바구니</a>
			</div>
				
		</div>
	</div>


</div>

			<%@include file="../footersub.jsp"%>
		
</body>
</html>