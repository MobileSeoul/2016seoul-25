<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<base href="resources/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나만의 맛집 검색</title>
<!-- 메뉴 -->
<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css'>
<!-- 메뉴 -->


<base href="../resources/">
<link rel="stylesheet" media="screen" href="css/app.css">
<link rel="stylesheet" media="screen" href="css/fooddamas.css">
<link rel="stylesheet" media="screen" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/menuStyle.css">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="js/qna.js"></script>

<style>
.qnatit {
	font-weight: normal !important;
	margin-top: 5px;
	line-height: 18px;
	font-size: 11px
}

.qnadate {
	font-size: 10px;
	color: #cccccc;
	font-weight: normal;
	margin-left: 10px;
}

.faq-cat-tabs li a {
	padding: 15px 10px 15px 10px;
	background-color: #ffffff;
	border: 1px solid #dddddd;
	color: #777777;
}

.panel {
	margin-bottom: 6px;
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
	font-weight: normal;
}
</style>



</head>

<body>
	<script>
	
	 

	
$(document).ready(function() {
	var x = document.cookie;

	console.log(x);
    
   // var food = "food1";
    var c_id = $(".c_id").html();
    console.log(c_id);
    var u_id= sessionStorage.getItem('u_id');
    var writer = "beuteu";   // 푸드트럭 사장 아이디
    console.log($(".cid").html());

    var obj=[];
    var page="";
    var paging="";
    var pageMaker=[];
 
/////////////////////////////////////////////////////////////////////////////////////////          
///////////////////////////////////////    QNA AJAX 시작       ///////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////// 
  
	QnaManager.QnaList(u_id,c_id,page, display);
    
     function display(data) {

    	 console.log(data);
    	 
       var listBoard = "";
       var list=data.list;

       pageMaker=data.pageMaker;
      
       for (var i = 0; i < list.length; i++) {
    	   
    	   var num = i;
    	   var num2 = ++num;
    	   
    		var str = list[i].anscnt == 0 ? "답변안함" : "답변완료:" + list[i].anscnt;
			var fontcolor = list[i].anscnt == 0 ? "color:red" : "color:blue";
			

    	   listBoard += 

    		   "<div class='panel panel-default pop' data-toggle='modal' data-target='#myModalV' data-qno='"+list[i].qno+"' data-reg_date='"+list[i].reg_date+"' data-c_id='"+list[i].c_id+"'  data-q_title='"+list[i].q_title+"'  data-q_content='"+list[i].q_content+"' ><div class='panel-heading'>"
					+ "<div style='font-weight: bold'>" 
					+ num2 + "." 
					+ "[" + list[i].q_title  + "]" 
					+ "<span class='qnadate'>"
					/* + list[i].reg_date + "</span><span style='"+fontcolor+"'>" + str + "</span></div>" */
					+ list[i].reg_date + "</span></div>"
					+ "<div class='qnatit'>" + list[i].q_content 
					+ "</div></div></div>"
    		   
       }
      
       $("#Qnalist").html(listBoard);
		pagingView();

       
     }
     
     
/////////////////////////////////////////////////////////////////////////////////////////          
		////////////////////////////////////QNA pageing 시작       /////////////////////////////////
		/////////////////////////////////////////////////////////////////////////////////////////
     function pagingView(){
			paging = "";
			if(pageMaker.prev) {
				paging +="<li><a href='"+(pageMaker.start-1)+"'>◀</a></li>";}
			for(var i =pageMaker.start; i<=pageMaker.end; i++){
				paging += "<li><a href='"+i+"'>" + i + "</a></li>";
				
			}
			if(pageMaker.next){
				paging+="<li><a href='" + (pageMaker.end+1)+ "'>▶</a></li>";
			}
			$("#paging-comment").html(paging);
				
		}
		$("#paging-comment").on("click","li a", function(event){
		  event.preventDefault();
		  console.log("paging.......................");
		
		  var page = $(this).attr("href");
		  QnaManager.QnaList(u_id,c_id,page, display);
		});

		
		
		
    
  	$(".createpop").on("click", function(){
 				
		 $(".c_id").val(c_id);
		 
	
	});
		
  	
  	var obj= [];
  	$(".create").on("click", function(){

	obj = { 
		
		c_id : c_id,
		u_id : u_id,
		q_title : $(".q_title").val(),
		q_content : $(".q_content").val()
		
	};
  	console.log(obj);
	if($(".q_title").val()=="" ){
		alert("제목을 입력해 주세요");
		return false;
	}else if($(".q_content").val()==""){
		alert("내용을 입력해 주세요");
		return false;
	}else{
	$(".q_title").val("");
	$(".q_content").val("");

	 QnaManager.Insert(obj, function () {
		   
	     QnaManager.QnaList(u_id,c_id,page,display);
	
		   alert("질문이 등록 되었습니다");
	  
		}); 
	}
	});
	 $(".view").on("click",".pop" ,function(){  //.view 뿌려지느 클래스  .pop 해당 클래스
		 
		 $this=$(this);
		     var qno=$this.attr("data-qno");
		     var q_title=$this.attr("data-q_title");
		     var c_id=$this.attr("data-c_id");
		     var q_content=$this.attr("data-q_content");
		     var reg_date=$this.attr("data-reg_date");
		     
		 //    console.log(qno);
		                                     
		     $(".qno").val(qno);
		     $(".q_title").text(q_title);
		     $(".c_id").val(c_id);
		     $(".q_content").text(q_content);
		     $(".reg_date").text(reg_date);
		     
		 //    QnaManager.QnaList(u_id,page,display);
		    
		 
		/////////////////////////////////////////////////////////////////////////////////////////          
		//////////////////////////  Ansewer qno 뽑을 려고 뷰페이지에 같이 넣었음       //////////////////////////
		///////////////////////////////////////////////////////////////////////////////////////// 
		 
		     
				qno = qno;
	 			
			    console.log(qno); 
					
				QnaManager.AnswerList(qno, display2);

				function display2(answer) {
					
					console.log(answer);

					var answerList = "";
					var list = answer.list;
					
					console.log(list);
					for (var i = 0; i < list.length; i++) {
						answerList +=

							"<div class='direct-chat-msg right' ><div class='direct-chat-info clearfix'><span class='direct-chat-name pull-right'>"
							+ list[i].writer +  "</span> <span class='direct-chat-timestamp pull-left'>"
							+ list[i].modi_date +  "</span></div><img class='direct-chat-img' src='img/user3-128x128.jpg'	alt='message user image'><div class='direct-chat-text'>"
							+ list[i].a_content  + "</div></div>"
							
					}

					$(".answer").html(answerList);

				}
		
		});
	 
		var obj= [];

		
	 $(".delete").on("click", function() {
		 
			if (
					confirm("정말 삭제하시겠습니까??") == true){    //확인
			}else{   //취소
			    return;
			}
 	 
 		obj = {
			       qno : $(".qno").val(),
			      c_id : $(".c_id").val()
			      
		 }

		 QnaManager.Delete(obj, function () {

		     QnaManager.QnaList(u_id,c_id,page,display);
		     
			   alert("삭제 되었습니다");

		 }) 
		 
		});
	 
		

});
		

		</script>
	
  <%@include file="headersub.jsp"%>
  
<div style="height: 51px"></div>

	<div class="container-fluid ">

		<div class="restaurant-detail">
			<ul class="nav nav-tabs">
				<li><a href="../../info">정 보</a></li>
				<li><a href="../../menu/menulist">메 뉴</a></li>
				<li><a href="../../review">리 뷰</a></li>
				<li class="active"><a href="../../qna">QNA</a></li>
			</ul>
		</div>
		<span class="c_id" hidden>${login.c_id}</span>
		
		<div class="pg-restaurant" style="padding: 0px;">
			<section class="restaurant-detail" style="padding: 0px">
				<header style="min-height: 0px; padding-bottom: 0px">
					<div>


						<h1 class="title">
							<span itemprop="name">QNA</span> <strong class="rate-point">
						</h1>
					</div>
				</header>
			</section>
		</div>


		<button type="button" class="btn btn-warning btn-sm createpop"
			data-toggle="modal" data-target="#myModal"
			style="margin: 6px 0px; ">QNA등록</button>

		<div id="Qnalist" class="view">게시물이 없습니다.</div>
<div class="box-footer clearfix">
			<ul id="paging-comment"
				class="pagination pagination-sm no-margin pull-right">
			</ul>
		</div>
	</div>


			<%@include file="footersub.jsp"%>


	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">QNA등록</h4>
				</div>
				<table class="table">
					<colgroup>
						<col width="20%">
						<col width="80%">
					</colgroup>
					
					<tr style="display: none">
						<th>푸드트럭</th>
						<td><input class="form-control Bid c_id" readonly="readonly"></td>
					</tr>
					<tr>
						<th>제 목</th>
						<td><input class="form-control q_title"></td>
					</tr>
					<tr>
						<th>내 용</th>
						<td><textarea class="form-control q_content"></textarea></td>
					</tr>
				</table>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-warning create" data-dismiss="modal">등록</button>
				</div>
			</div>

		</div>
	</div>


	<!--////////////////////////////////////////////////////////////////////////////////////         
	    ///////////////////////////////////////    QNA 뷰페이지        /////////////////////////////////
		/////////////////////////////////////////////////////////////////////////////////// -->

	<div class="modal fade" id="myModalV" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">QNA VIEW</h4>										
					
				</div>
				<div class="direct-chat-messages">
				
					<!-- Message. Default to the left -->
					<div class="direct-chat-msg">
						<div class="direct-chat-info clearfix">
						<input class="qno" type="hidden" >
						<input class="c_id"  type="hidden">
						
							<span class="direct-chat-name pull-left q_title" > 배달해주시는 분 항상
								친절하셔서 기분좋네요.</span> <span
								class="direct-chat-timestamp pull-right reg_date">23 Jan
								2:00 pm</span>
						</div>
						<!-- /.direct-chat-info -->
						<img class="direct-chat-img" src="img/user1-128x128.jpg"
							alt="message user image">
						<!-- /.direct-chat-img -->
						<div class="direct-chat-text q_content">배달해주시는 분 항상 친절하셔서 기분좋네요. 맛도
							좋은데 이번에 마늘강정 주문했는데 사진의 강정이 왔어요</div>
						<div style="margin-top: 6px; margin-left: 50px;"></div>

					</div>
					<div class="answer"></div>
					
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<!-- <button type="button" class="btn btn-ygy1">수정</button>-->
					<button type="button" class="btn btn-warning btn-md delete"	 data-dismiss="modal" style="float: left" >삭제</button>
				</div>
			</div>

		</div>
	</div>



</body>
</html>