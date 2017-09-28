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
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=ddecf6bf572bbacdeb670a2ae1f4b445"></script>
<script type="text/javascript" src="js/api1.js"></script>
</head>

<body>


	<script>
		$(document).ready(function() {
			
				$(".leer").html("API");	


			if (navigator.geolocation) {
				//위치 정보를 얻기
				navigator.geolocation.getCurrentPosition(function(pos) {
					$('#latitude').html(pos.coords.latitude); // 위도
					$('#longitude').html(pos.coords.longitude); // 경도
					console.log("------------------------");
					console.log(pos.coords.latitude);
					console.log(pos.coords.longitude);
					
					getList();

				});
			} else {
				alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
			}
		});
		
		
		
		var getList = function() {
			var mapContainer = document.getElementById('map') // 지도를 표시할 div  

			var aa = $('#latitude').text();
			var bb = $('#longitude').text();

		

			mapOption = {

				center : new daum.maps.LatLng(aa, bb), // 지도의 중심좌표
				level : 4
			// 지도의 확대 레벨
			};

			
			ApiManager.ApiList(aa,bb,display);
			function display(data) {
				
				data = data.list;
				console.log(data);

				var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

			// 마커 이미지의 이미지 주소입니다
			var imageSrc = "img/restroom.png";
			
			console.log(data);
			var position=[];
			for (var j = 0; j < data.length; j++) {
	/* 			console.log(data[j].relat);
				console.log(data[j].relng); */
				var lng=data[j].relat;
				var lat =data[j].relng;
				// 마커 이미지의 이미지 크기 입니다
				var imageSize = new daum.maps.Size(20, 25);
				
				var posi = new daum.maps.LatLng(lat,lng);
				
				
				position.push({
					title:data[j].gu+" "+data[j].dong+" "+data[j].ju+"-"+data[j].bu,
					latlng : new daum.maps.LatLng(lat,lng)
				});
				
 				
				console.log(posi);
				
			}		
			
			for( var i=0; i<position.length;i++){
				// 마커 이미지를 생성합니다    
				var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);
				// 마커를 생성합니다
				var marker = new daum.maps.Marker({
					map : map, // 마커를 표시할 지도
					position : position[i].latlng, // 마커를 표시할 위치
					title : position[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					image : markerImage
				// 마커 이미지 
				}); 
			}

			

			var markerPosition = new daum.maps.LatLng(aa, bb);

			// 마커를 생성합니다
			var myMarker = new daum.maps.Marker({
				position : markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			myMarker.setMap(map);
			}

		};
	</script>


	<ul style="display: none">
		<li>위도:<span id="latitude"></span></li>
		<li>경도:<span id="longitude"></span></li>
	</ul>

		<div class="nav-bar">
		<div class="LeeBack">← 뒤로</div>
		<div class=" leer">우리청년컵밥</div>
	</div>

			<%@include file="headersub.jsp"%>
	<div class="container-fluid">

		<div class="restaurant-detail">
			<ul class="nav nav-tabs">
				<li  class="active"><a href="../../api1">공용화장실</a></li>
				<li><a href="../../api2">산책로</a></li>
				<li><a href="../../api3">주차정보</a></li>
				<li ><a href="../../api4">잔디밭</a></li>
				
			</ul>
		</div>
		<div class="pg-restaurant" style="padding: 0px;">
			<section class="restaurant-detail" style="padding: 0px">
				<header style="min-height: 0px; padding-bottom: 0px">
					<div>


						<h1 class="title">
							<span itemprop="name">공용화장실</span> <strong class="rate-point">
						</h1>
					</div>
				</header>
			</section>
		</div>

		<div id="map" style="width: 100%; height: 450px;"></div>

	</div>

				<%@include file="footersub.jsp"%>


</body>
</html>