<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<html>
<head>
<title>푸드다마스</title>
<link rel='stylesheet'
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css'>

<base href="../resources/">
<link rel="stylesheet" media="screen" href="css/app.css">
<link rel="stylesheet" media="screen" href="css/fooddamas.css">
<link rel="stylesheet" media="screen" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/menuStyle.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDY0kkJiTPVd2U7aTOAwhc9ySH6oHxOIYM&sensor=false">
	
</script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/classie/1.0.1/classie.min.js'></script>
<script src="js/info.js"></script>
<body>
	<%@include file="headersub.jsp"%>
	<div style="height: 51px;"></div>
	<div class="container-fluid">
		<div class="restaurant-detail">
			<ul class="nav nav-tabs">
				<li class="active"><a href="../../info">정 보</a></li>
				<li><a href="../../menu/menulist">메 뉴</a></li>
				<li><a href="../../review">리 뷰</a></li>
				<li><a href="../../qna">QNA</a></li>
			</ul>
		</div>
		<div class="pg-restaurant">
			<section class="restaurant-detail">
				<header>
					<div>
						<h1 class="title">
							<span itemprop="name" id="name"></span> <strong	class="rate-point"> <span class="rate-point" id="grade">
							</span> <span itemprop="reviewCount" style="display: none;">48</span>
							</strong>
							<p class="branch">본점</p>
						</h1>
					</div>
				</header>

				<div>
					<script>
						$(document)
								.ready(
										function() {

											var u_id = sessionStorage
													.getItem('u_id');

											InfoManager.InfoList(u_id, display);
											function display(info) {

												var infolist = "";
												var infomap = "";

												var data = info.list;
												var map = info.map;

												var lat = map[0].lat;
												var lng = map[0].lng;

												console.log(lng);
												console.log(lat);
												displayMap(lat, lng);

												for (var i = 0; i < data.length; i++) {

													var name = data[i].co_name

													$("#name").html(name);
													var grad = data[i].grade
													var grade = grad.toFixed(1);
													$("#grade").html(grade);

													infolist +=

													"<table><caption></caption><tbody><colgroup><col width='110px;'></colgroup><tr>"
															+ "<th style='width: 100px;''> 대표자</th><td>"
															+ data[i].u_name
															+ "</td></tr>"

															+ "<th style='width: 100px;''> 핸드폰번호</th><td>"
															+ data[i].u_phone
															+ "</td></tr>"

															+ "<th style='width: 100px;''> 이메일</th><td>"
															+ data[i].u_email
															+ "</td></tr>"

															+ "<th style='width: 100px;''> 운영시간</th><td>"
															+ data[i].sales_time
															+ "</td></tr>"

															+ "<th style='width: 100px;''> 정보</th><td>"
															+ data[i].co_intro
															+ "</td></tr>"

															+ "</tbody></table>"

												}

												$("#infolist").html(infolist);

											}

										});

						function displayMap(lat, lng) {
							var myCenter = new google.maps.LatLng(lat, lng);
							var marker;
							function initialize() {
								var mapProp = {
									center : myCenter,
									zoom : 15,
									mapTypeId : google.maps.MapTypeId.ROADMAP
								};
								var map = new google.maps.Map(document
										.getElementById("googleMap"), mapProp);
								marker = new google.maps.Marker({
									position : myCenter,
									// icon:'themes/assets/images/nepali-momo.png',
									animation : google.maps.Animation.BOUNCE
								});

								marker.setMap(map);

								// Info open
								var infowindow = new google.maps.InfoWindow({
									content : $("#name").html()
								});

								google.maps.event.addListener(marker, 'click',
										function() {
											infowindow.open(map, marker);
										});
							}
							google.maps.event.addDomListener(window, 'load',
									initialize);
						}
					</script>
					<div id="googleMap" style="height: 200px; clear: both"></div>

				</div>
				<!-- 상세 정보 -->

				<div id="infolist" style="margin-bottm: 30px; clear: both"></div>

			</section>

		</div>
	</div>

			<%@include file="footersub.jsp"%>
	
</body>
</html>