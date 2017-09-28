<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@include file="include/header.jsp"%>


<style>
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

.searchInput {
	padding: 0px !important;
	background: white !important;
	/*   line-height:22px !important;
	   height:22px !important; */
}
</style>

<script>
	$(document).ready(
			function() {
				$("input[name=OpenCloseBtn]").bootstrapSwitch({
					'size' : 'mini',
					'onText' : 'Open',
					'offText' : 'Close',
					'state':'true'
				});

				$("input[name=OpenCloseBtn]").on(
						"switchChange.bootstrapSwitch", function() {
						
							var state = this.checked ? 1 : 0;
							
							OrderModule.getPosition(state);
				});
				var test = localStorage.input === 'true'?true:false;
				console.log(test);
				
/* 				$("input[name=searchOrder]").on("input", function() {
				
					OrderModule.get($(this).val());
				}); */
				
				
				
				
				
				OrderModule.get();
				
				$("#testtest").on("click", function(){
				
					console.log("test test test");
					OrderModule.orderFinished();
					
				});
				
				
				
				
				/*  var refreshId = setInterval(function(){
					 OrderModule.get();
					 OrderModule.finishOrder();
				 },5000);  */
				 
			});
</script>
<div id="map"></div>
<!-- Testimonials -->
<div
	class="testimonials-container section-container section-container-gray">
	<div class="container">
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
					<li class="active"><a role="tab" data-toggle="tab"
						href="#section1">주문확인</a></li>
						
						
						
						
						
					<li><a id="testtest" role="tab" data-toggle="tab" href="#section2">Finished</a>
					</li>
					<li style="float: right;"><input type="checkbox"
						id="open_close" name="OpenCloseBtn" value="On">Food Truck
					</li>
				</ul>

				<div class="tab-content">

					<div id="section1" class="tab-pane fade in active">
						<!-- Order Show -->


						<div class="row">
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
</div>

<!-- Swiper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/js/swiper.js"></script>

<script src="resources/orderJS/OrderModule.js"></script>



<%@include file="include/footer.jsp"%>