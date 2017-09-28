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

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=ddecf6bf572bbacdeb670a2ae1f4b445"></script>
<script type="text/javascript" src="js/api.js"></script>
</head>

<body>


	<script>
	
	$(document).ready(function() {

	 /* 서울시  API 부분  시작  */
	 
	 		var positionAll=[];

	var start;
	 var end;
	// ApiManager.ApiList(display+i+j);
	ApiManager.ApiCount(displayCount);
		function displayCount(data) {
						var infolist = "";
						var total = data.GeoInfoPublicToiletWGS.list_total_count;
						var totalPage=Math.ceil(total/1000);
						console.log(totalPage);
						for(var i=1; i<totalPage+1; i++){
							end=i*1000;
							if(i!=1){
								start=(1000*(i-1))+1;
							}else
							{
								start=1;
							}
							ApiManager.ApiList(display, start, end);
						console.log(position)
						}		
						positionAll.push(position);

						map(positionAll);
						
					}
		var position=[];
		function display(data) {
			var list= data.GeoInfoPublicToiletWGS.row;

			for(var i =0 ; i<list.length; i++){
				position.push({
					title:list[i].HNR_NAM,
					latlng : new daum.maps.LatLng(list[i].LAT, list[i].LNG)
				});
 		//console.log(position);
			}  
		 
		}
	
	});
	
	 /* GEOLOCATION 현재 위치 가져오는것  */

	 /* 다음 API 시작  */
	function map(positionAll)
	 {
		 console.log(positionAll)
		 $(function() {  
		        // Geolocation API에 액세스할 수 있는지를 확인
		        if (navigator.geolocation) {
		            //위치 정보를 얻기
		            navigator.geolocation.getCurrentPosition (function(pos) {
		                $('#latitude').html(pos.coords.latitude);   // 위도
		                $('#longitude').html(pos.coords.longitude); // 경도
		                getList();
		            });
		        } else {
		            alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
		        }
		    });
		 var getList = function(){
				var mapContainer = document.getElementById('map') // 지도를 표시할 div  

				var aa = $('#latitude').text();
				var bb = $('#longitude').text();

				console.log(aa);
				console.log(bb);
				 
				    mapOption = { 
						
				        center: new daum.maps.LatLng(aa, bb), // 지도의 중심좌표
				        level: 4 // 지도의 확대 레벨
				    };

				var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				

				// 마커 이미지의 이미지 주소입니다
				var imageSrc = "img/restroom.png"; 


					for(var j=0; j<positionAll[0].length; j++){
	

				    // 마커 이미지의 이미지 크기 입니다
				    var imageSize = new daum.maps.Size(24, 24); 
				    
				    // 마커 이미지를 생성합니다    
				    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
				    // 마커를 생성합니다
				    var marker = new daum.maps.Marker({
				        map: map, // 마커를 표시할 지도
				        position: positionAll[0][j].latlng, // 마커를 표시할 위치
				        title : positionAll[0][j].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				        image : markerImage // 마커 이미지 
				    });
				} 
					
					var markerPosition  = new daum.maps.LatLng(aa, bb); 

					// 마커를 생성합니다
					var myMarker = new daum.maps.Marker({
					    position: markerPosition
					});

					// 마커가 지도 위에 표시되도록 설정합니다
					myMarker.setMap(map);

	
			};
		 
	 }

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
				<li ><a href="../../api1">화장실정보</a></li>
				<li><a href="../../api2">산책로</a></li>
				<li  class="active"><a href="../../api3">주차정보</a></li>
			</ul>
		</div>
		<div id="map" style="width: 100%; height: 350px;"></div>
		<div id="after"></div>

	</div>

				<%@include file="footersub.jsp"%>


</body>
</html>