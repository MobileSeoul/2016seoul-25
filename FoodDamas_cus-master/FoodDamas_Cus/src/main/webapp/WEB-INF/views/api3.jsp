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
<link rel="stylesheet" media="screen" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/menuStyle.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel='stylesheet prefetch'
	href='http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css'>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=ddecf6bf572bbacdeb670a2ae1f4b445"></script>
<script type="text/javascript" src="js/api3.js"></script>

<style>
.re_name {
	margin-left: 6px;
}
#write {
	display: none;
}
.faq-cat-content {
	margin-top: 25px;
}
.faq-cat-tabs li a {
	padding: 15px 10px 15px 10px;
	background-color: #ffffff;
	border: 1px solid #dddddd;
	color: #777777;
}
.nav-tabs li a:focus, .panel-heading a:focus {
	outline: none;
}
.panel-heading a, .panel-heading a:hover, .panel-heading a:focus {
	text-decoration: none;
	color: #777777;
}
.faq-cat-content .panel-heading:hover {
	background-color: #efefef;
}
.active-faq {
	border-left: 5px solid #888888;
}
.panel-faq .panel-heading .panel-title span {
	font-size: 13px;
	font-weight: normal;
}

table {
	font-size: 11px;
	width: 100%;
}

th {
	border-bottom: 1px dotted #cccccc
}

td {
	padding-left: 10px;
	border-bottom: 1px dotted #cccccc
}
</style>

</head>

<body>


	<script>
	
		$(document)
				.ready(
						function() {
							

						    $('.collapse').on('show.bs.collapse', function() {
						        var id = $(this).attr('id');
						        $('a[href="#' + id + '"]').closest('.panel-heading').addClass('active-faq');
						        $('a[href="#' + id + '"] .panel-title span').html('<i class="glyphicon glyphicon-minus"></i>');
						    });
						    $('.collapse').on('hide.bs.collapse', function() {
						        var id = $(this).attr('id');
						        $('a[href="#' + id + '"]').closest('.panel-heading').removeClass('active-faq');
						        $('a[href="#' + id + '"] .panel-title span').html("<i class='glyphicon glyphicon-plus fa-2x' style='font-size:40px'>더보기</i>");
						    });
							
							$(".leer").html("API");	

							/* 서울시  API 부분  시작  */

							var positionAll = [];

							var start;
							var end;
							// ApiManager.ApiList(display+i+j);
							ApiManager.ApiCount(displayCount);
							function displayCount(data) {
								var infolist = "";
								var total = data.PublicParkingAvaliable.list_total_count;
								var totalPage = Math.ceil(total / 1000);
								console.log(totalPage);
								for (var i = 1; i < totalPage + 1; i++) {
									end = i * 1000;
									if (i != 1) {
										start = (1000 * (i - 1)) + 1;
									} else {
										start = 1;
									}
									ApiManager.ApiList(display, start, end);
									console.log(position)
								}
							}
							function display(data) {

								console.log(data);
								var list = data.PublicParkingAvaliable.row;

								console.log(list);
								var apilist = ""

								for (var i = 0; i < list.length; i++) {
									var ida = "#"+ "faq" + i;
									var busy=list[i].PARKING_CNT/list[i].MAX_PARKING_CNT*100;
									console.log(busy);
									console.log(ida);
									var color;
									if(busy<30){
										color="green";
									}else if (busy<60){
										color="orange";
									}else if(busy<=100){
										color="red";
									}else{
										
									}
									
									var idb = "faq" + i;
									
									apilist += 
										
										"<div class='panel-heading'><a data-toggle='collapse' href='" +  ida + "'><span class='colorBusy' style='font-size:25px;color:"+color+"'>■</span>"
										+  list[i].PARK_NAME    + "<span class='pull-right'><i class='glyphicon glyphicon-plus'></i></span></a>"
										+  "</div><div id='" + idb + "'class='panel-collapse collapse'><div class='panel-body'>"
										+  "<div style='border-bottom:1px dotted #cccccc;line-height: 26px '> 주소<span style='float:right'>" + list[i].PARK_ADDRESS + "</span></div>"								
										+  "<div style='border-bottom:1px dotted #cccccc;line-height: 26px '> 총주차수<span style='float:right'>" + list[i].MAX_PARKING_CNT + "</span></div>"								
										+  "<div style='border-bottom:1px dotted #cccccc;line-height: 26px '> 주차가능수<span style='float:right'>" + list[i].PARKING_CNT + "</span></div>"								
										
										+/* + list[i].total_price + */  "</div></div>"
										
									
								};

								$("#apilist").html(apilist);
							}

						});

		/* GEOLOCATION 현재 위치 가져오는것  */
	</script>

	<ul style="display: none">
		<li>위도:<span id="latitude"></span></li>
		<li>경도:<span id="longitude"></span></li>
	</ul>

		<div class="nav-bar">
	
	</div>

			<%@include file="headersub.jsp"%>
	<div class="container-fluid">

		<div class="restaurant-detail">
			<ul class="nav nav-tabs">
				<li ><a href="../../api1">공용화장실</a></li>
				<li><a href="../../api2">산책로</a></li>
				<li  class="active"><a href="../../api3">주차정보</a></li>
				<li ><a href="../../api4">잔디밭</a></li>
				
			</ul>
		</div>
		<div class="pg-restaurant" style="padding: 0px; clear: both">
			<section class="restaurant-detail">
				<header>
					<h1 class="title">
						<span itemprop="name">주차정보</span>
					
					</h1>
						<div style="text-align: right; margin-bottom: 10px">
						<span class='colorBusy' style='font-size:12px;'>혼잡도 : </span>
						<span class='colorBusy' style='font-size:12px;color:green'>■ 30% </span>
						<span class='colorBusy' style='font-size:12px;color:orange'>■ 60%</span>
						<span class='colorBusy' style='font-size:12px;color:red'>■ 100%</span></div>
				</header>
			</section>
		</div>

		<div style="height: 60px;"></div>

<div class="panel panel-default panel-faq" id="apilist">
			
			
			
		</div>


	</div>

				<%@include file="footersub.jsp"%>

</body>
</html>