<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<html>
<head>
<title>푸드다마스</title>

<link rel='stylesheet prefetch'
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
<link rel='stylesheet prefetch'
	href='http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css'>

<script src="js/orderlist.js"></script>

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
h1, p, h2, button {
	font-family: "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif; 
	font-weight: 100;
	letter-spacing: 0.5px;
}

h1 {
	font-size: 40px;
	text-align: center;
	color: #666666;
	margin: 0 0 30px 0;
}

h2 {
	font-size: 34px;
	text-align: center;
	color: #666666;
	margin: 0 0 30px 0;
}

p {
	color: #666666;
	margin: 30px auto;
	text-align: center;
	font-size: 16px;
}

button {
	background: #89BDD3;
	border: 0;
	border-radius: 4px;
	padding: 7px 15px;
	font-size: 16px;
	color: #FFFFFF;
	cursor: pointer;

	&:focus {
		outline: none;
	}

	&:hover {
		background: lighten(#89BDD3, 10%);
	}
}

.popup {
	background: rgba(100, 100, 100, 0.6);
	position: fixed;
	display: none;
	z-index: 5000;
	height: 100%;
	width: 100%;
	left: 0;
	top: 0;

	> div {
		border-radius: 10px;
		position: fixed;
		background: #FFFFFF;
		box-shadow: 0px 0px 15px 0px rgba(#000000, 0.3);
		padding: 30px 15px;
		/* Width of popup can be changed */
		width: 70%;
		max-width: 600px;
		z-index: 5001;
		@include transform(translate(-50%, -50%));
  		left: 50%;
	   top: 50%;
		text-align: center;
		border: 5px solid #9AD3DE;
	}
}
</style>

<script>
function popup(data) {
	var local="http://14.32.7.115:4449/";
var ono=data;
var list="";
console.log(ono);
console.log("-------ff----");
	$.ajax({
		url: local+'order/orderDetail?ono='+ono,
		type:"POST",
		success:function(detail){
			console.log(detail);
			var length=detail.length;
			
			for(var i=0; i<length ;i++){
				list+="<div style='border-bottom:1px dotted #cccccc;line-height: 26px '> "
				+detail[i].m_name+"<span style='float:right'> X "+detail[i].quantity+"</span><span style='float:right'>"+detail[i].m_price+"</span></div>";
				$(".popupDetail").html(list);
			}
			
		}
	, error:function(xhr,option,error){
		alert(xhr.status); //오류코드
		alert(error); //오류내용
		}
	});
	
	$(".popup").show();
}


	$(document).ready(function() {
		var c_id=$(".c_id").text();


						var obj = [];
						var page = "";
						var paging = "";
						var pageMaker = [];
						/////////////////////////////////////////////////////////////////////////////////////////          
						///////////////////////////////////////    QNA AJAX 시작       ///////////////////////////////
						///////////////////////////////////////////////////////////////////////////////////////// 
						OrderListManager.OrderList(c_id, page, display);
						function display(data) {
							total = data.totalCount
							console.log(total);
							var orderlist = "";
							var list = data.list;
							
							for (var i =0 ; i <list.length; i++ ){
								
								var ida = "#"+ "faq" + i;
								
								console.log(ida);
								
								var idb = "faq" + i;
								
								var fontcolor = list[i].state_code == 10 ? "color:red" : "color:blue";
								
								orderlist +=  
									
								"<div class='panel-heading' onclick='popup("+ list[i].ono +")'>"
								+ "[ " + list[i].co_name + " ]　" + list[i].regdate + "　 " + "<span style='"+ fontcolor +"'>" + list[i].state_name + "</span>" + "<span class='pull-right'><i class='glyphicon glyphicon-plus'></i></span></a>"
								+  "</div><div id='" + idb + "'class='panel-collapse collapse'><div class='panel-body'>"
								+  "<div style='border-bottom:1px dotted #cccccc;line-height: 26px '> 떡볶이<span style='float:right'> X 1개</span><span style='float:right'>3,000</span></div>"								
								+  "<div style='border-bottom:1px dotted #cccccc;line-height: 26px '> 순대<span style='float:right'> X 1개</span><span style='float:right'>3,000</span></div>"								
								+  "<div style='border-bottom:1px dotted #cccccc;line-height: 26px '> 어묵<span style='float:right'> X 1개</span><span style='float:right'>1,000</span></div>"								
								+  "<div style='line-height: 26px;color:red '> 총합계<span style='float:right;color:red; font-size:16px;'>7,000</span></div>"								
								
								+/* + list[i].total_price + */  "</div></div>"
									
								
							}
							
							
							$("#orderlist").html(orderlist);
							
							
						}
					});
</script>
<body>
 
	<div class="nav-bar" style="border: 1px dotted; line-height: 26px">
		<div class="LeeBack">← 뒤로</div>
		<div class=" leer">우리청년컵밥</div>
	</div>

	<%@include file="../headersub.jsp"%>
	<div class="container-fluid">
						<span  class="c_id" hidden>${login.c_id}</span>

		<div class="pg-restaurant" style="padding: 0px; clear: both">
			<section class="restaurant-detail">
				<header>
					<h1 class="title">
						<span itemprop="name">구매내역</span>
					</h1>
				</header>
			</section>
		</div>
		

		<div style="height: 50px;"></div>

<div class="popup">
<div style="background: #ffffff; margin: 10px auto; width: 94%; border-radius:5px; height:auto; padding:2px 20px 20px 20px;" >
<h3>주문리스트</h3>

<div class="popupDetail"></div>


<button style="margin-top: 10px;" onclick="location.reload();">X</button>

</div>
	
</div>

		<div class="panel panel-default panel-faq" id=orderlist></div>
		<div class="box-footer clearfix">
			<ul id="paging-comment"	class="pagination pagination-sm no-margin pull-right">
			</ul>
		</div>
</div>

			<%@include file="../footersub.jsp"%>
		
		 

</body>
</html>