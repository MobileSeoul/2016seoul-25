<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="include/header.jsp"%>

<style type="text/css">
.look {
	display: block !important;
}

.look1 {
	display: block;
}

.hide {
	display: none !important;
}

.hide1 {
	display: none
}

@media all and (max-width: 500px) { /* 해상도가 500 이하일때 적용 */
	#qna500 {
		display: none;
	}
}

html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

#map {
	width: 100%;
	height: 300px;
}

/* order */
.nav-tabs {
	border-color: #1A3E5E;
	/*    width:60%;*/
}

.nav-tabs>li a {
	border: 1px solid #1A3E5E;
	background-color: #285e8e;
	color: #fff;
	font-size: 0.8em;
	font-weight: bold;
}

.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover
	{
	background-color: #FFC000;
	color: saddlebrown;
	border: 1px solid #1A3E5E;
	border-bottom-color: transparent;
	font-weight: bold;
}

.nav-tabs>li>a:hover {
	background-color: #FFC000 !important;
	border-radius: 5px;
	color: #000;
}

.tab-pane {
	border: solid 1px #1A3E5E;
	border-top: 0;
	/* width:60%;*/
	background-color: #FFC000;
	padding: 5px;
}

.orderpanel {
	background-color: white;
	width: 99.9%;
	font-size: 0.9em;
	border: 1px solid #737373;
	padding: 0.5em;
	margin-bottom: 5px;
}

.stateDiv {
	padding: 0;
	margin: 5px 0 0 0;
}

.btn_state {
	border: 1px solid #737373;
	background-color: whitesmoke;
	height: 2em;
	text-align: center;
}

.btnCancel {
	border: 1px solid #737373;
	height: 2em;
	text-align: center;
	width: 98%;
	margin-left: 2%;
}
/* swipe css */
.swiper-container {
	width: 100%;
	height: 100%;
}

.swiper-pagination-bullet {
	width: 20px;
	height: 20px;
	text-align: center;
	line-height: 20px;
	font-size: 12px;
	color: #000;
	opacity: 1;
	background: rgba(0, 0, 0, 0.2);
}

.swiper-pagination-bullet-active {
	color: #fff;
	background: #007aff;
}
/* .swiper-pagination{
	margin-top: 100px;
	padding-top: 200px;
}
.col-xs-4{
	
} */
.stylish-input-group .input-group-addon {
	background: white !important;
}

.stylish-input-group .form-control {
	border-right: 0;
	box-shadow: 0 0 0;
	border-color: #ccc;
}

.stylish-input-group button {
	border: 0;
	background: transparent;
}

.serch {
	z-index: 1;
}

.searchInput {
	padding: 0px !important;
	background: white !important;
	/*   line-height:22px !important;
	   height:22px !important; */
}

#refreshOrder{
	height: 36px; 
	margin-left: 5px; 
	font-size: 14px; 
	line-height: 8px;
}
/* end order */
</style>
<!-- Top content -->
<div id="top-content" class="top-content">
	<div class="top-content-text wow fadeInUp">
		<div class="divider-2">
			<span></span>
		</div>

		<h1 class='u_id'>${login.u_id}</h1>
		<div class="divider-2">
			<span></span>
		</div>


	</div>
</div>
<!-- Order -->
<script>
	$(document).ready(
			function() {
				var u_id = "${login.u_id}";
				//localStorage.checkbox ="";
				var orderModule = new OrderModule(u_id);
				orderModule.print();
			
				$("input[name=OpenCloseBtn]").bootstrapSwitch({
					'size' : 'mini',
					'onText' : 'Open',
					'offText' : 'Close',
					'state':orderModule.setSwitch()
				});
				$("input[name=OpenCloseBtn]").on(
						"switchChange.bootstrapSwitch", function() {
							var state = this.checked ? 1 : 0;
							
							orderModule.getPosition(state);
						});
				$("input[name=searchOrder]").on("input", function() {
					orderModule.getData($(this).val());
				});
				$("#refreshOrder").on("click",function(){
					orderModule.getData();
				});
				$("#section1a").on("click",function(){
					//console.log("click section1a");
					setTimeout(function(){
						orderModule.getData();
					},400);
				});
				$("#section2a").on("click",function(){
					//console.log("click section2a");
					  setTimeout(function(){							 
						  orderModule.orderFinished();
						 },200);  
				});
				orderModule.getData();
				 
			});
</script>
<!-- Testimonials -->
<!-- <div 
	class="testimonials-container section-container section-container-gray"> -->
	<div class="container" id="order">
		<div class="row">
			<div class="col-sm-12 testimonials section-description wow fadeInUp">
				<h2>Order</h2>

			</div>
		</div>
		<!--  <div class="alert alert-warning alert-dismissible" role="alert">
             <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span> <span class="sr-only">Close</span></button>
            You have <strong> 2</strong> new order. Check It!
        </div> -->
		<!--Code Here-->
		<div class="row">
			<div>
				<ul class="nav nav-tabs" id="myTabs" role="tablist">
					<li class="active">
					<a id="section1a" role="tab" data-toggle="tab"
						href="#section1">주문확인</a></li>
					<li><a id="section2a" role="tab" data-toggle="tab" href="#section2">Finished</a>
					</li>
					<li style="float: right;"><input type="checkbox"
						id="open_close" name="OpenCloseBtn" value="On">Food Truck
					</li>
				</ul>

				<div class="tab-content">

					<div id="section1" class="tab-pane fade in active">
						<!-- Order Show -->
						<div class="row">
							<div class="col-xs-6 col-md-3">
								<button id="refreshOrder" type="button" class="btn" style="float:left;">Get Order</button>
							</div>
							<div class="form-group col-xs-6 col-md-3" style="float: right;">
							
								<div class="input-group stylish-input-group">

									<input type="text" class="form-control searchInput"
										name="searchOrder" placeholder="Search" /> <span
										class="input-group-addon">
										<button type="submit">
											<span class="glyphicon glyphicon-search"></span>
										</button>
									</span>
								</div>
							</div>
						</div>
						<div id="showSection1"></div>
					</div>
					<div id="section2" class="tab-pane fade">
						<div id="showSection2"></div>
					</div>

				</div>
			</div>
		</div>


	</div>
<!-- </div> -->
<!-- End Order -->
<!-- 가영이 info -->
<div id="infoContainer" class="wow fadeInUp" style="padding-left:15px; padding-right:15px;">
	<div class="portfolio-container section-container">
		<div class="row">
			<div class="col-sm-12 portfolio section-description wow fadeIn">
				<h2 id="infoname"></h2>
				<div class="divider-1 wow fadeInUp"></div>

			</div>
		</div>
		<table class="table table-bordered " id="infoTable">
		</table>

		구글 맵
		<div id="map"></div>
	</div>
</div>
<!-- 예진이 menu -->
<div id="menuContainer">
	<h2 style="margin-top: 50px">MENU</h2>
	<br />

	<div class="col-lg-12">
		<button type="button" class="btn btn-warning"
			style="height: 36px; font-size: 14px; line-height: 8px; margin-bottom: 10px; float: left"
			data-toggle="modal" data-target="#myModalC">등록</button>
		<br /> <br />

		<table class="table table-bordered ">
			<colgroup>
				<col width="5%">
				<col width="25%">
				<col width="10%">
				<col width="30%">
				<col width="10%">
				<col width="20%">
			</colgroup>
			<thead>
				<tr>
					<th>NO.</th>
					<th>사진</th>
					<th>이름</th>
					<th>설명</th>
					<th>가격</th>
					<th>on/off</th>
				</tr>
			</thead>
			<tbody id="menuList">

			</tbody>
		</table>

	</div>
	<!--등록-->
	<div class="modal fade" id="myModalC" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
				</div>
				<div class="modal-body">
					<!--테이블 집어넣기-->
					<form class="form" id="form2" enctype="multipart/form-data"
						action="insert" method="post">
						<table class="table table-bordered ">
							<colgroup>
								<col width="20%">
								<col width="80%">
							</colgroup>
							<thead>
								<tr style="display: none">
									<th>NO.</th>
									<td>1</td>
								</tr>
								<tr>
									<th>사진</th>
									<td><input type="file" id="menuimg"></td>

								</tr>
								<tr>
									<th>이름</th>
									<td><input type="text" placeholder="이름"
										class="form-control" id="menuname"></td>
								</tr>
								<tr>
									<th>가격</th>
									<td><input type="text" placeholder="가격"
										class="form-control" id="menuprice"></td>
								</tr>
								<tr>
									<th>설명</th>
									<td><input type="text" placeholder="설명"
										class="form-control" id="menuinfo"></td>
								</tr>
							</thead>
						</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="insertmenu"
						data-dismiss="modal">등록</button>
				</div>
				</form>
			</div>
		</div>
	</div>


	<!-- 예진아 수정페이지 -->
	<div class="modal fade" id="myModalU" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
				</div>
				<form class="updateForm" id="form1" enctype="multipart/form-data"
					action="update" method="post">

					<div class="modal-body">
						<!--테이블 집어넣기-->
						<table class="table table-bordered " id="mview">
							<colgroup>
								<col width="20%">
								<col width="80%">
							</colgroup>
							<thead>
								<tr style="display: none">
									<th>NO.</th>
									<td><input id="m_u_mno" type="text" class="form-control"></td>
								</tr>
								<tr>
									<th>사진</th>
									<td><input type="file" name="mfile" id="m_u_img_real"></td>
								</tr>
								<tr style="display: none">
									<th >이미지경로값</th>
									<td><input id="m_u_img" type="hidden" class="form-control"
										readonly="readonly" ></td>
								</tr>
								<tr>
									<th>이름</th>
									<td><input id="m_u_name" type="text" class="form-control"></td>
								</tr>
								<tr>
									<th>가격</th>
									<td><input id="m_u_price" type="text" class="form-control"></td>
								</tr>
								<tr>
									<th>설명</th>
									<td><input id="m_u_info" type="text" class="form-control"></td>
								</tr>
							</thead>
						</table>


					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" id="updatemenu"
							data-dismiss="modal">수정</button>
						<button type="button" class="btn btn-primary" id="deletemenu"
							data-dismiss="modal">삭제</button>
					</div>
				</form>
			</div>
		</div>
	</div>


</div>




<!-- 종열이형 부분 -->

<div id="qnaContainer" style="padding-left:15px; padding-right:15px;">
	<div class="row">
		<div class="col-sm-12 testimonials section-description wow fadeInUp">
			<h2>Q&A</h2>
		</div>
	</div>
	<div class="alert alert-warning alert-dismissible" role="alert">
		<!--  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span> <span class="sr-only">Close</span></button> -->
		자주하는 질문을 모아서 답변해 드립니다. 해당 내용을<strong> 클릭</strong>하시면 답변을 보실수 있습니다.
	</div>
	<!--    <button type="button" class="btn btn-waring"
            style="height: 36px; font-size: 14px; line-height: 8px; float: left" data-toggle="modal" data-target="#myModalC">등록</button> -->
	<div class="wow fadeInUp"
		style="float: right; margin-bottom: 5px; background: #00000">
		<button type="button" class="btn btn-info fr"
			style="height: 36px; margin-left: 5px; font-size: 14px; line-height: 8px;">검색</button>
		<input class="form-control fr" style="width: 140px"> <select
			class="form-control fr" style="width: 110px; margin-right: 3px;">
			<option>작성자</option>
			<option>타이틀</option>
			<option>내용</option>
			<option>내용+작성자</option>
		</select>

	</div>
	<div id="#qna500">
		<table class="table table-bordered wow fadeInUp">
			<colgroup>
				<col width="100px">
				<col width="/">
				<col width="15%">
				<col width="15%">
				<col width="15%">
				<col width="15%">
			</colgroup>
			<thead>
				<tr>
					<th>No.</th>
					<th>제 목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>수정일</th>
					<th>답변상태</th>
				</tr>
			</thead>
			<tbody id="list" class="view">
				<tr class="view">
					<td class="tc">6</td>
					<td>푸드트럭을 다른곳으로 이동해서 영업하고 싶은데요?</td>
					<td class="tc">홍길동</td>
					<td class="tc">20160828</td>
					<td class="tc">20160828</td>
				</tr>
			</tbody>
		</table>

	</div>

	<div class="box-footer clearfix">
		<ul id="paging-comment"
			class="pagination pagination-sm no-margin pull-right">
		</ul>
	</div>
</div>

<div id="noticeContainer">
		<div class="row">
			<div class="col-sm-12 testimonials section-description wow fadeInUp">
				<h2>NOTICE</h2>
			</div>
		</div>

		<!--    <button type="button" class="btn btn-waring"
            style="height: 36px; font-size: 14px; line-height: 8px; float: left" data-toggle="modal" data-target="#myModalC">등록</button> -->
		<div class="wow fadeInUp"
			style="float: right; margin-bottom: 5px; background: #00000">
			<button type="button" class="btn btn-info fr"
				style="height: 36px; margin-left: 5px; font-size: 14px; line-height: 8px;">검색</button>
			<input class="form-control fr" style="width: 140px"> <select
				class="form-control fr" style="width: 110px; margin-right: 3px;">
				<option>작성자</option>
				<option>타이틀</option>
				<option>내용</option>
				<option>내용+작성자</option>
			</select>

		</div>
		<table class="table table-bordered wow fadeInUp">
			<colgroup>
				<col width="100px">
				<col width="/">
				<col width="15%">
				<col width="15%">
			</colgroup>
			<thead>
				<tr>
					<th>No.</th>
					<th>제 목</th>
					<th>작성일</th>
					<th>작성자</th>
				</tr>
			</thead>
			<tbody id="listNotice" class="viewnotice">

			</tbody>
		</table>


		<div class="box-footer clearfix">
			<ul id="paging-comment1"
				class="pagination pagination-sm no-margin pull-right">
			</ul>
		</div>
	</div>
<!-- 종열이형 부분 -->



<!-- <div class="row">
            <div class="col-sm-12">
               <div class="dataTables_paginate paging_simple_numbers"
                  id="example2_paginate">
                  <ul class="pagination">
                     <li class="paginate_button previous disabled"
                        id="example2_previous"><a href="#" aria-controls="example2"
                        data-dt-idx="0" tabindex="0">Previous</a></li>
                     <li class="paginate_button active"><a href="#"
                        aria-controls="example2" data-dt-idx="1" tabindex="0">1</a></li>
                                       
                     <li class="paginate_button next" id="example2_next"><a
                        href="#" aria-controls="example2" data-dt-idx="7" tabindex="0">Next</a></li>
                  </ul>
               </div>
            </div>
         </div> -->
</div>
</div>


<!-- 성현 시작 -->
<!-- Sales Anal -->
<div id="statContainer" class="wow fadeInUp">
	<div id="dailyChart"
		style="width: 45%; height: 300px; display: inline-block;"></div>
	<div id="monthlyChart"
		style="width: 45%; height: 300px; display: inline-block;"></div>
	<div id="locationChart"
		style="width: 45%; height: 300px; display: inline-block;"></div>
	<div id="menuChart"
		6
			style="width: 45%; height: 300px; display: inline-block;"></div>
</div>

<!-- 성현  끝 -->


<!--------------------------------------------------------------------->
<!---------------------------- QNA Modal Update ----------------------->
<!--------------------------------------------------------------------->

<div class="modal fade" id="myModalUqna" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<!-- modal-lg 팝업크게  -->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">QNA VIEW</h4>
			</div>
			<div class="modal-body">

				<!-- 팡업 내용 넣는곳  -->

				<table class="table table-bordered ">
					<colgroup>
						<col width="20%">
						<col width="/">
					</colgroup>
					<tr>
						<th>글번호</th>
						<td class="tl"><input class="form-control qno"
							readonly="readonly" id="qno"></td>
					</tr>
					<tr>
						<th>타이틀</th>
						<td class="tl"><input class="form-control q_title"
							readonly="readonly"></td>
					</tr>
					<tr>
						<th>아이디</th>
						<td class="tl"><input class="form-control c_id"
							readonly="readonly"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea class="form-control q_content"
								readonly="readonly" value="q_content"></textarea></td>
					</tr>
					</tbody>
				</table>

				<!-- DIRECT CHAT -->
				<div class="box box-warning direct-chat direct-chat-warning">
					<div class="box-header with-border">
						<h4 class="box-title">Direct Chat</h4>

					</div>
					<!-- /.box-header -->
					<div class="box-body answer">

						<!-- Conversations are loaded here -->
						<!-- Message. Default to the left -->
						<div class="direct-chat-info clearfix">
							<span class="direct-chat-name pull-left">Alexander Pierce</span>
							<span class="tl"> </span> <span
								class="direct-chat-timestamp pull-right">23 Jan 2:00 pm</span>
						</div>
						<!-- /.direct-chat-info -->
						<img class="direct-chat-img" src="resources/assets/img/user3.jpg"
							alt="message user image">
						<!-- /.direct-chat-img -->
						<div class="direct-chat-text tl">Is this template really for
							free? That's unbelievable!</div>

						<div class="timeline-footer"
							style="text-align: left; margin-top: 10px; margin-left: 50px;">
							<a class="btn btn-default btn-xs"><i class="fa fa-times"></i></a>
							<a class="btn btn-default btn-xs"><i class="fa fa-wrench"></i></a>
						</div>

						<!-- Message. Default to the left -->
						<div class="direct-chat-msg">
							<div class="direct-chat-info clearfix">
								<span class="direct-chat-name pull-left">Alexander Pierce</span>
								<span class="direct-chat-timestamp pull-right">23 Jan
									5:37 pm</span>
							</div>
							<!-- /.direct-chat-info -->
							<img class="direct-chat-img" src="resources/assets/img/user4.jpg"
								alt="message user image">
							<!-- /.direct-chat-img -->
							<div class="direct-chat-text tl">Working with AdminLTE on a
								great new app! Wanna join?</div>
							<!-- /.direct-chat-text -->
						</div>

					</div>
					<!-- /.box-body -->

					<div class="box-footer look1" style="margin-top: 20px;" id="add">
						<textarea type="text" name="message" class="form-control createa"
							style="font-size: 14px; width: 85%; height: 80px; float: left;"></textarea>
						<button type="button" class="btn btn-warning  create"
							style="font-size: 14px; height: 80px; float: left; width: 15%; line-height: 16px;"
							onclick="checkFrm()">등록</button>
					</div>

					<div class="box-footer hide1" style="margin-top: 20px;" id="reply">
						<input class="form-control ano" style="display: none"> <input
							class="form-control writer" style="display: none">
						<textarea type="text" name="message"
							class="form-control a_content"
							style="font-size: 14px; width: 85%; height: 80px; float: left;"> </textarea>
						<button type="button" class="btn btn-warning update" id="update"
							style="font-size: 14px; height: 80px; float: left; width: 15%; line-height: 16px;">수정</button>
					</div>

					<!-- /.box-footer-->
				</div>
				<!--/.direct-chat -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<!--                <button type="button" class="btn btn-primary">Save changes</button>
 -->
			</div>
		</div>
	</div>
</div>

<!--------------------------------------------------------------------->
	<!---------------------------- QNA Modal Update ----------------------->
	<!--------------------------------------------------------------------->

	<div class="modal fade" id="myModalnotice" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<!-- modal-lg 팝업크게  -->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Notice View</h4>
				</div>
				<div class="modal-body">

					<!-- 팡업 내용 넣는곳  -->

					<table class="table table-bordered ">
						<colgroup>
							<col width="20%">
							<col width="/">
						</colgroup>
						<tr>
							<th>글번호</th>
							<td class="tl"><input class="form-control nno"
								readonly="readonly" id="nno"></td>
						</tr>
						<tr>
							<th>날짜</th>
							<td class="tl"><input class="form-control reg_date"
								readonly="readonly"></td>
						</tr>
						<tr>
							<th>타이틀</th>
							<td class="tl"><input class="form-control n_title"
								readonly="readonly"></td>
						</tr>

						<tr>
							<th>아이디</th>
							<td class="tl"><input class="form-control a_id"
								readonly="readonly"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea class="form-control n_content"
									readonly="readonly" value="n_content"></textarea></td>
						</tr>
						</tbody>
					</table>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<!--                <button type="button" class="btn btn-primary">Save changes</button>
 -->
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
	
</script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA1rAznN-8BUOMh6_QFOWJy62KRVYcKEPI&callback=initMap">
	
</script>

<script>
	var map;
	var lng;
	var lat;
	var co_name;

	$(document).ready(function() {
		var info = {};
		var u_id = $(".u_id").html(); //로그인 아이디
		var obj = [];
		var obj2 = [];
		var page = "";
		var paging = "";
		var pageMaker = [];
		var infolist = "";
		////////////////////////////////////////////////////////////////////////////////////////////////////////////
		///////////////////////////////////////////////////예진이 메뉴//////////////////////////////////////////////////	
		////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//button
		var state0 = "<a class='btn btn-warning btn-xs' role='button'>영업종료</a>";
		var state1 = "<a class='btn btn-info btn-xs' role='button'>영업시작</a>";
		menuManager.menuListAll(u_id, displayData);

		function displayData(data) {
							//console.log(data);
			var menuList = "";
			var list = data.list;
							
			for (var i = 0; i < list.length; i++) {
				//button
				var lee = list[i].m_state == 0 ? state0 : state1;
					menuList += "<tr>"
						+ "<td class='vac' data-target='#myModalU' data-name='"+list[i].m_name+"' data-info='"+list[i].m_info+"' data-price='"+list[i].m_price+"' data-img='"+list[i].m_img+"' data-mnum='"+list[i].mno+"' style='cursor:pointer' id='mnum' class='upview' >"
						+ (i + 1)
						+ "</td>"
						+ "<td data-toggle='modal' data-target='#myModalU' data-name='"+list[i].m_name+"' data-info='"+list[i].m_info+"' data-price='"+list[i].m_price+"' data-img='"+list[i].m_img+"' data-mnum='"+list[i].mno+"' style='cursor:pointer; ' id='m_img' class='upview'>"
						+"<img src='../displayFile?fileName="+ list[i].m_img
						+ "' style='width: 160px; height:100px;'></td>"
						+ "<td data-toggle='modal' data-target='#myModalU' data-name='"+list[i].m_name+"' data-info='"+list[i].m_info+"' data-price='"+list[i].m_price+"' data-img='"+list[i].m_img+"' data-mnum='"+list[i].mno+"' style='cursor:pointer; ' id='m_name' class='upview'>"
						+ list[i].m_name
						+ "</td>"
						+ "<td data-toggle='modal' data-target='#myModalU' data-name='"+list[i].m_name+"' data-info='"+list[i].m_info+"' data-price='"+list[i].m_price+"' data-img='"+list[i].m_img+"' data-mnum='"+list[i].mno+"' style='cursor:pointer; ' id='m_info' class='upview'>"
						+ list[i].m_info
						+ "</td>"
						+ "<td data-toggle='modal' data-target='#myModalU' data-name='"+list[i].m_name+"' data-info='"+list[i].m_info+"' data-price='"+list[i].m_price+"' data-img='"+list[i].m_img+"' data-mnum='"+list[i].mno+"' style='cursor:pointer' id='m_price' class='upview'>"
						+ list[i].m_price
						+ "</td>"
						+ "<td  data-mnum='"+list[i].mno+"' data-state='"+list[i].m_state+"'  style='cursor:pointer' class='state ' style='text-align:center'>"
						+ lee + "</td>" + "</tr>";
			}$("#menuList").html(menuList);

		}//end display
		///////////////////button on/off////////////////////////
		$("#menuList").on("click", ".state", function() {
			$this = $(this);
			var m_mno = $this.attr("data-mnum");
			var state = $this.attr("data-state");
							//console.log("m_mno : " + m_mno);
							//console.log("state: " + state);

			if (state == 1) {
								//console.log("음식팔어");
				$("#m_u_name").val(state);

				obj = {
						mno : m_mno,
						m_state : "0"
					}
					console.log(obj);
			} else {
								//console.log("음식안팔어");
				$("#m_u_name").val(state);
				obj = {
						mno : m_mno,
						m_state : "1"
					}
								//console.log(obj);
			}
			
			menuManager.stateUpdate(obj, function() {
				menuManager.menuListAll(u_id, displayData);
			})
		});//end onclick

		//////////////등록버튼 누르면 실행///////////
		//insert
		$("#insertmenu").on("click",function(event) {
			event.preventDefault();
			//파일정보를 가지고 있는 아이에요		
			var files = document.getElementById("menuimg").files[0];
			console.log(files);

			//obj로 데이터를 넣는게 아니라
			//formData를 이용해서  데이터를 넣는다
			var formData = new FormData();
			formData.append("file",document.getElementById("menuimg").files[0]);
			formData.append("m_name", $("#menuname").val());
			formData.append("m_price", $("#menuprice").val());
			formData.append("m_info", $("#menuinfo").val());
			formData.append("u_id", u_id);

			console.log(formData);
			if ($("#menuimg").val() == "") {
				alert("사진을 넣어주세요");
				return false;
			} else if ($("#menuname").val() == "") {
				alert("이름을 입력해 주세요");
				return false;
			} else if ($("#menuprice").val() == "") {
				alert("가격을 입력해 주세요");
				return false;
			} else if ($("#menuinfo").val() == "") {
				alert("정보를 입력해 주세요");
				return false;
			} else {
				//menuAdd가 실행 될 때 obj를 건네주고
				menuManager.menuAdd(formData,function() {
					//데이터 다 집어 넣었으면 파일부분 리셋해줘
					formData = null;

					$(".form").each(function() {
						this.reset();
					});

					menuManager.menuListAll(u_id,displayData);
				});
			}
		});//end insert

		////////////////////////update버튼 누르면 실행할 애///////////////////
		$("#updatemenu").on("click",function() {

			event.preventDefault();
			var files = document.getElementById("m_u_img_real").files[0];

			console.log(files);
			//console.log("files.name="+files.name);
			var formData = new FormData();

			formData.append("mno",$("#m_u_mno").val());
			formData.append("m_name", $("#m_u_name").val());
			formData.append("m_price", $("#m_u_price").val());
			formData.append("m_info", $("#m_u_info").val());
			formData.append("u_id", u_id);
			//formData.append("m_img",files.name);

			console.log("수정된 후 : "+ $("#m_u_mno").val() + ","+ $("#m_u_name").val()+ ","+ $("#m_u_price").val()
							+ ","+ $("#m_u_info").val()+ "," + u_id);
			//만약 img를 업로드 한다면(img값이 있다면) document.getElementBg_real")
			if ($("#m_u_img_real").val() == "") {
				console.log("없어");
			} else {
				console.log("있어");
				formData.append("file",document.getElementById("m_u_img_real").files[0]);
			}
			console.log(formData);

			menuManager.menuUpdate(formData,function() {
				$(".updateForm").each(function() {
					this.reset();
				});
				menuManager.menuListAll(u_id,displayData);
				console.log("업데이트");
			})
		});

		////////////////////delete버튼 누르면 실행된 아이////////////////
		$("#deletemenu").on("click", function() {

			obj3 = {
						mno : $("#m_u_mno").val(),
						u_id : u_id,
						fileName : $("#m_u_img").val()
					}
			console.log(obj3);

			menuManager.menuDelete(obj3, function() {
				if (obj3 == "deleted") {
					}
				menuManager.menuListAll(u_id, displayData);
			})

		});

		//////////////////update view////////////////
		//List클릭하면 upview라는 클래스에서
		$("#menuList").on("click",".upview",function() {
			$this = $(this);
			console.log($this);
			//데이터의 값을 m_name에 담는다
			var m_name = $this.attr("data-name");
			var m_info = $this.attr("data-info");
			var m_price = $this.attr("data-price");
			var mno = $this.attr("data-mnum");
			var m_img = $this.attr("data-img");

			console.log("m_name = " + m_name + ","+ "m_info = " + m_info + ","+ "m_price = " + m_price + ","
							+ "mno = " + mno + "," + "m_img = "+ m_img);
			//m_name에 담은 값을 m_u_name에 집어넣어준다
			$("#m_u_mno").val(mno);
			$("#m_u_name").val(m_name);
			$("#m_u_info").val(m_info);
			$("#m_u_price").val(m_price);
			$("#m_u_img").val(m_img);

		});
		////////////////////////////////////////////////////////////////////////////////////////////////////////////
		///////////////////////////////////////////////////예진이 메뉴//////////////////////////////////////////////////	
		////////////////////////////////////////////////////////////////////////////////////////////////////////////

		/* 성현 추가 */
		// var u_id = "zzennam";
		statManager.statement(u_id);
		//console.log("실행중");				

		/* 성현 추가 */

		infoManager.view(u_id, displayInfo);
		function displayInfo(data) {

			console.log(data);
			//지도, 이름
			lng = data.list[0].lng;
			lat = data.list[0].lat;
			co_name = data.info.co_name;

			if (lng == 0) {
				navigator.geolocation.getCurrentPosition(function(position) {
					lat = position.coords.latitude;
					lng = position.coords.longitude;
					initMap(lat, lng, co_name);
				});

			} else {
				initMap(lat, lng, co_name);

			}
			var phone = data.info.u_phone;//폰번호
			var location = data.list[0].location;
			var time = data.info.sales_time;
			var intro = data.info.co_intro;
			var u_profile_img = data.info.u_profile_img;
			infolist = "<colgroup><col width='40'><col width='60%'></colgroup><thead><tr><th>Foodtruck Name</th>"
					+ "<th>"
					+ co_name
					+ "</th></tr></thead><tbody><tr><td>Phone</td><td>"
					+ phone
					+ "</td></tr></tbody><tr><td>Location</td>"
					+ "<td>"
					+ location
					+ "</td></tr></tbody><tr><td>Open - Close</td><td>"
					+ time
					+ "</td></tr></tbody><tr><td>introduction</td>"
					+ "<td>" + intro + "</td></tr></tbody>";
					//console.log(infolist);

					$("#infoTable").html(infolist);
							//	console.log(co_name);
					$("#infoname").html(co_name);
					$("#face").attr("src","../displayProfile?fileName="+u_profile_img);
							
		}

		///////////////////////////////////////////////////////////

		var u_id = $(".u_id").html();
		var writer = $(".u_id").html(); // 푸드트럭 사장 아이디
		var qno;

		//console.log(u_id);

		/////////////////////////////////////////////////////////////////////////////////////////          
		///////////////////////////////////////    QNA AJAX 시작       ///////////////////////////////
		///////////////////////////////////////////////////////////////////////////////////////// 

		qnaManager.BoardList(u_id, page, display);

		function display(data) {

			var listBoard = "";
			var list = data.list;

			pageMaker = data.pageMaker;

			for (var i = 0; i < list.length; i++) {

				var str = list[i].anscnt == 0 ? "답변안함" : "답변 수:" + list[i].anscnt;
				var fontcolor = list[i].anscnt == 0 ? "color:red" : "color:blue";

				listBoard += "<tr data-toggle='modal' data-target='#myModalUqna' style='cursor: pointer;' class='pop' data-qno='"+list[i].qno+"' data-c_id='"+list[i].c_id+"'  data-q_title='"+list[i].q_title+"'  data-q_content='"+list[i].q_content+"' >"
					+ "<td class='tc'>"
					+ list[i].qno
					+ "</td>"
					+ "<td>"
					+ list[i].q_title
					+ "</td>"
					+ "<td class='tc'>"
					+ list[i].c_id
					+ "</td>"
					+ "<td class='tc'>"
					+ qnaManager.formatdate(list[i].reg_date)
					+ "</td>"
					+ "<td class='tc'>"
					+ qnaManager.formatdate(list[i].modi_date)
					+ "</td>"
					+ "<td class='tc'><span style='"+fontcolor+"'>"
					+ str + "</span></td>" + "</tr> "

			}

			$("#list").html(listBoard);

			//댓글 페이징부분
			pagingView();

		}

		/////////////////////////////////////////////////////////////////////////////////////////          
		////////////////////////////////////QNA pageing 시작       /////////////////////////////////
		/////////////////////////////////////////////////////////////////////////////////////////

		function pagingView() {
			paging = "";
			if (pageMaker.prev) {
				paging += "<li><a href='"+ (pageMaker.start - 1)+ "'>◀</a></li>";
			}
			for (var i = pageMaker.start; i <= pageMaker.end; i++) {
				paging += "<li><a href='"+i+"'>" + i+ "</a></li>";
			}
			if (pageMaker.next) {
				paging += "<li><a href='" + (pageMaker.end + 1)+ "'>▶</a></li>";
			}
			$("#paging-comment").html(paging);

		}
		$("#paging-comment").on("click","li a",function(event) {
			event.preventDefault();
			console.log("paging.......................");

			var page = $(this).attr("href");
			qnaManager.BoardList(u_id, page,display);
		});

		/////////////////////////////////////////////////////////////////////////////////////////          
		/////////////////////////////////////   QNA VIEW 시작       //////////////////////////////////
		/////////////////////////////////////////////////////////////////////////////////////////         

		$(".view").on("click", ".pop", function() { //.view 뿌려지느 클래스  .pop 해당 클래스
			$this = $(this);
			qno = $this.attr("data-qno");
			var q_title = $this.attr("data-q_title");
			var c_id = $this.attr("data-c_id");
			var q_content = $this.attr("data-q_content");

			$(".qno").val(qno);
			$(".q_title").val(q_title);
			$(".c_id").val(c_id);
			$(".q_content").val(q_content);
			qnaManager.AnswerList(qno, display2);

		});

		/////////////////////////////////////////////////////////////////////////////////////////          
		////////////////////////////////////QNA Answer 시작       /////////////////////////////////
		/////////////////////////////////////////////////////////////////////////////////////////      

		//   qnaManager.AnswerList(qno, display2);
		var obj = [];

		function display2(answer) {

			var answerList = "";
			var lista = answer.list;
			for (var i = 0; i < lista.length; i++) {
				answerList +="<div class='direct-chat-info clearfix'><span class='direct-chat-name pull-left'>"
						+ lista[i].writer
						+ "</span><span class='tl'> </span> <span class='direct-chat-timestamp pull-right'>"
						+ qnaManager.formatdate(lista[i].modi_date)
						+ "</span></div><img class='direct-chat-img' src='resources/assets/img/user3.jpg'><div class='direct-chat-text tl'>"
						+ lista[i].a_content
						+ "</div><div class='timeline-footer' style='text-align: left; margin-top: 10px; margin-left: 50px;'>"
						+ "<a class='btn btn-default btn-xs delete' data-qno='"+lista[i].qno+"' data-ano='"+lista[i].ano+"' data-a_content='"+lista[i].a_content+"' data-writer='"+lista[i].writer+"' ><i class='fa fa-times'></i>삭제</a>"
						+ "<a class='btn btn-default btn-xs update'  data-ano='"+lista[i].ano+"' data-a_content='"+lista[i].a_content+"' data-writer='"+lista[i].writer+"'  style='margin-left:2px;' ><i class='fa fa-wrench'></i>수정</a></div>"
			}

			$(".answer").html(answerList);

		}
		var obj = [];

		/////////////////////////////////////////////////////////////////////////////////////////          
		////////////////////////////////////QNA Answer 삭제        //////////////////////////////////
		/////////////////////////////////////////////////////////////////////////////////////////

		$(".answer").on("click", ".delete", function() {
			$this = $(this);
			obj = {
					ano : $this.attr("data-ano"),
					writer : writer,
					qno : $this.attr("data-qno")

				}

			qnaManager.Delete(obj, function() {

				qnaManager.AnswerList(qno, display2); // 댓글
				qnaManager.BoardList(u_id, page, display); // view
			});

		});

		/////////////////////////////////////////////////////////////////////////////////////////          
		///////////////////////////////////  QNA Answer 글쓰기       //////////////////////////////////
		/////////////////////////////////////////////////////////////////////////////////////////

		var obj = [];

		$(".create").on("click", function() {

			obj = {
					qno : qno,
					a_content : $(".createa").val(),
					writer : writer
				};
			qnaManager.Insert(obj, function() {
				qnaManager.AnswerList(qno, display2);
				alert("댓글이 등록 되었습니다");
				qnaManager.BoardList(u_id, page, display);
			});

			$(".createa").val("");

		});

		/////////////////////////////////////////////////////////////////////////////////////////          
		////////////////////////////////////QNA Answer수정 폽으로 값전송        /////////////////////////////////
		/////////////////////////////////////////////////////////////////////////////////////////

		$(".answer").on("click", ".update", function() {

			var aa = $('#add');
			aa.addClass('hide');

			var aa = $('#reply');
			aa.removeClass('hide1');

			$this = $(this);
							//console.log("수정하는곳 들어와???????");
			var ano = $this.attr("data-ano");
			var writer = $this.attr("data-writer");
			var a_content = $this.attr("data-a_content");

			$(".ano").val(ano);
			$(".writer").val(writer);
			$(".a_content").val(a_content);

		});

		/////////////////////////////////////////////////////////////////////////////////////////          
		////////////////////////////////////QNA Answer 클릭시 수정        /////////////////////////////////
		/////////////////////////////////////////////////////////////////////////////////////////

		$("#update").on("click", function() {
			obj = {
					qno : qno,
					ano : $(".ano").val(),
					a_content : $(".a_content").val(),
					writer : $(".writer").val()
				};

			console.log(obj);

			var aa = $('#add');
			aa.addClass('look');

			var aa = $('#add');
			aa.removeClass('hide');

			var aa = $('#reply');
			aa.addClass('hide');

			qnaManager.Update(obj, function() {

				qnaManager.AnswerList(qno, display2);

			})
		});
		
		
		
		
		var page1="";
        var paging1="";
        var pageMaker1=[];
		
       /////////////////////////////////////////////////////////////////////////////////////////          
		/////////////////////////////////////    NOTICE AJAX 시작       ///////////////////////////////
		///////////////////////////////////////////////////////////////////////////////////////// 

		NoticeManager.NoticeList(page1, displaynotice);
         function displaynotice(data) {
 			console.log(data);
 				  			
 			var listNotice = "";
 			var list = data.list1;
 			console.log(list);

           pageMaker1=data.pageMaker1;
           
           for ( var i = 0; i<list.length; i++){
           	
           	listNotice += 
	            "<tr data-toggle='modal' data-target='#myModalnotice' style='cursor: pointer;'  class='popnotice' data-nno='"+list[i].nno+"' data-title='"+list[i].title+"' data-content='"+list[i].content+"' data-a_id='"+list[i].a_id+"' data-reg_date='"+list[i].reg_date+"'>" +
           	 "<td class='tc'>" +list[i].nno  + "</td>" +
           	 "<td>" + list[i].title + "</td>" +
           	 "<td class='tc'>" + list[i].reg_date + "</td>" +
           	 "<td class='tc'>" + list[i].a_id + "</td>" +
                 "</tr>"
           }
           
           $("#listNotice").html(listNotice);
           //댓글 페이징부분
			pagingView1();
		}
         
         
/////////////////////////////////////////////////////////////////////////////////////////          
////////////////////////////////////NOTICE pageing 시작       /////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////

	function pagingView1(){
	paging = "";
	if(pageMaker1.prev) {
		paging +="<li><a href='"+(pageMaker1.start-1)+"'>◀</a></li>";}
	for(var i =pageMaker1.start; i<=pageMaker1.end; i++){
		paging += "<li><a href='"+i+"'>" + i + "</a></li>";

}
if(pageMaker1.next){
paging+="<li><a href='" + (pageMaker1.end+1)+ "'>▶</a></li>";
}
$("#paging-comment1").html(paging);

}
$("#paging-comment1").on("click","li a", function(event){
event.preventDefault();
	console.log("paging.......................");

var page = $(this).attr("href");
NoticeManager.NoticeList(page, displaynotice);
});

/////////////////////////////////////////////////////////////////////////////////////////          
/////////////////////////////////////   NOTICE VIEW 시작       //////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////         

$(".viewnotice").on("click",".popnotice" ,function(){  //.view 뿌려지느 클래스  .pop 해당 클래스
$this=$(this);
nno=$this.attr("data-nno");
var n_title=$this.attr("data-title");
var a_id=$this.attr("data-a_id");
var n_content=$this.attr("data-content");
var reg_date=$this.attr("data-reg_date");


$(".nno").val(nno);
$(".n_title").val(n_title);
$(".n_content").val(n_content);
$(".a_id").val(a_id);
$(".reg_date").val(reg_date);

});


	});

	function initMap(lat, lng, co_name) {
		var myLatlng = new google.maps.LatLng(lat, lng);

		map = new google.maps.Map(document.getElementById('map'), {
			center : myLatlng,
			zoom : 18
		});
		var marker = new google.maps.Marker({
			position : myLatlng,
			map : map,
			title : 'Hello World!'
		});
		marker.setMap(map);
		var contentString = co_name;

		var infowindow = new google.maps.InfoWindow({
			content : contentString
		});
		infowindow.open(map, marker);

		marker.addListener('click', function() {
			infowindow.open(map, marker);
		});
	}
</script>
<script>
	$(".order").click(function(e) {
		e.preventDefault();
		closeNav();
		var offset = $("#order").offset();
		$('html, body').animate({
			scrollTop : offset.top
		}, 400);
	});
	$(".menu").click(function(e) {
		e.preventDefault();
		closeNav();
		var offset = $("#menuContainer").offset();
		$('html, body').animate({
			scrollTop : offset.top
		}, 400);
	});
	$(".info").click(function(e) {
		e.preventDefault();
		closeNav();
		var offset = $("#infoContainer").offset();
		$('html, body').animate({
			scrollTop : offset.top
		}, 400);
	});
	$(".totalSales").click(function(e) {
		e.preventDefault();
		closeNav();
		var offset = $("#statContainer").offset();
		$('html, body').animate({
			scrollTop : offset.top
		}, 400);
	});
	$(".qna").click(function(e) {
		e.preventDefault();
		closeNav();
		var offset = $("#qnaContainer").offset();
		$('html, body').animate({
			scrollTop : offset.top
		}, 400);
	});
	$(".notice").click(function(e) {
		e.preventDefault();
		closeNav();
		var offset = $("#notice").offset();
		$('html, body').animate({
			scrollTop : offset.top
		}, 400);
	});
</script>

<%@include file="include/footer.jsp"%>




