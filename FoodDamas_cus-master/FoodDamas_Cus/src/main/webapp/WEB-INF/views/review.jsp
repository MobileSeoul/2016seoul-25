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
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel='stylesheet prefetch'	href='http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css'>

<script src="js/review.js"></script>
<script src="js/info.js"></script>

<style>

.re_name { margin-left: 6px;} 

#write {display: none;}


</style>

<script>

$(document).ready(function() {
 	var local="http://14.32.7.115:4449/";
   // var writer = sessionStorage.getItem('u_id');   // 푸드트럭 사장 아이디
    var c_id = $(".c_id").html()
    var u_id= sessionStorage.getItem('u_id');
   

	InfoManager.InfoList(u_id, display1);
	function display1(info) {

		var infolist = "";
		var infomap = "";

		var data = info.list;



		for (var i = 0; i < data.length; i++) {

			var name = data[i].co_name

			$("#name").html(name);
			var grad = data[i].grade
			var grade = grad.toFixed(1);
			
			
			console.log(grade);

			$("#grade").html(grade);
			
			
			
		}
		
	}

    
    console.log(u_id);

    var obj=[];
    var page="";
    var paging="";
    var pageMaker=[];
 
/////////////////////////////////////////////////////////////////////////////////////////          
///////////////////////////////////////    QNA AJAX 시작       ///////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////// 
  
ReviewManager.ReviewList(u_id,page, display);
    
     function display(data) {
    	    
    	    var stara ="";
    	    var st ="";
    	    var average =""; 
    	    var ave =""; 
    	    var total =""; 
    	 
    	 
total = data.totalCount
   

console.log(total);

    var listreview = "";
    var list= data.list;
    
    console.log(list);
	
    
    console.log(list.length);

    
    pageMaker=data.pageMaker;

    for (var i = 0; i < list.length; i++) {
    	
    	
    	
    	stara = parseInt(list[i].grade)

    	st = parseInt(st +  stara);
    	
    	
    	
     
    	
    	ave = st / total;
    	
    	
    	
    	average =  ave.toFixed(1);
    	
    	
    	
    	
    	   console.log("st" + st );
    	   console.log("total" + total);
    	   console.log("average" + average);

    	
    	$("#average").text(average);

    	var star=""
    	
    	if (1== list[i].grade){
    		
    		star = "★☆☆☆☆"
    		
    	}else if (2 == list[i].grade){
    		 star = "★★☆☆☆"
    	}else if (3 == list[i].grade){
    		 star = "★★★☆☆"
    	}else if (4 == list[i].grade){
    		 star = "★★★★☆"
    	}else if (5 == list[i].grade){
   		 star = "★★★★★"
   	}

 	  listreview += 
 		  
 	 		"<li class='list-group-item ng-scope'><span class='ico-star'>"
 	 		+ star +  "</span><span class='ico-clean-review'></span><br><span class='re_date'>"
 	 		+ list[i].reg_date + "</span><span><span class='re_name'>"
 	 		+ "[" + list[i].c_id + "]"+ "</span></span><p class='re_content'>"
 	 		+ list[i].content + "</p></li>"
 		   
    }	 
    
    
    $("#Reviewlist").html(listreview);
	pagingView();

       
     }
     
		/////////////////////////////////////////////////////////////////////////////////////////          
		////////////////////////////////////Review pageing 시작       /////////////////////////////////
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
		  ReviewManager.ReviewList(u_id,page, display);
		});
		
		

		$(".wannago_wrap").on("click" , function () {
						
	//	document.getElementById("write").style.display=block;
	//		$('#write').css('display','block');
	
	
	$("#write").toggle();
	

		})
		

		
		$("#create").on("click" , function name() {
			var star = document.getElementsByName('star');
		console.log(c_id);
		console.log("----------------");
		
			if (c_id=="")
				{
					alert("로그인이 필요합니다.");
					window.location=local+"member/login";
				}
			else{
				for (var i = 0 ; star.length; i++){
					
					if(star[i].checked == true){
					var check = star[i].value
					$("#check").val(check);
					break;
						
					}
					
				}

					obj = {
							
							c_id : c_id,
							u_id : u_id,
							grade : $("#check").val(),
							content : $("#content").val()
							
					}
				
				if($("#star").val()=="" ){
					alert("제목을 입력해 주세요");
					return false;
				}else if($("#content").val()==""){
					alert("내용을 입력해 주세요");
					return false;
				}
				console.log(obj);
				 ReviewManager.Insert(obj, function () {
					   
					 ReviewManager.ReviewList(u_id,page,display);
						InfoManager.InfoList(u_id, display1);

					   alert("리뷰이 등록 되었습니다");
					   
					   $("#content").val("");
				  
					}); 
				 
			}
			
		/* 	console.log(star[0].checked);
			console.log(star[1].checked);
			console.log(star[2].checked);
			console.log(star[3].checked);
			console.log(star[4].checked); */
			
 	
			
		})

     
});
		

		</script>
	<body>
	
	<div class="nav-bar">
		<div class="LeeBack">← 뒤로</div>
		<div class=" leer">우리청년컵밥</div>
	</div>
<%-- 							<span  class="c_id11">${login.c_id}</span>
 --%>	
<span style="display: none" class="c_id">${login.c_id}</span>
			<%@include file="headersub.jsp"%>
	<div class="container-fluid">

		<div class="restaurant-detail">
			<ul class="nav nav-tabs">
				<li ><a href="../../info">정 보</a></li>
				<li><a href="../../menu/menulist">메 뉴</a></li>
				<li  class="active"><a href="../../review">리 뷰</a></li>
				<li><a href="../../qna">QNA</a></li>
			</ul>
		</div>
		<div class="pg-restaurant" style="padding: 0px; clear: both ">
			<section class="restaurant-detail" style="padding: 20px">
				<header>
					<div>
						<div class="wannago_wrap">
							<button class="btn-type-icon favorite wannago_btn "></button>
							<p class="wannago_txt">평점쓰기</p>
						</div>
						

						<h1 class="title">
							<span itemprop="name" id="name"></span> <strong
								class="rate-point"> <span class="rate-point" id="grade">
									 </span> <span itemprop="reviewCount" style="display: none;">48</span>
							</strong>
							<p class="branch">본점</p>
						</h1>
					</div>
				</header>
			</section>
		</div>
		
		<div style="height: 74px;"></div>

		<div style="padding: 5px 10px; border: 1px solid #cccccc; margin-bottom: 10px; display: none " id="write">

			<ul id="review" class="list-group" style="margin: 0px;">
				<!--  별 평점 시작 -->
				
				
				<input id="check" type="hidden">

<form id="ratingsForm">
    <div class="stars">
        <input type="radio" name="star" class="star-1" id="star-1"  value="1" checked="checked" />
        <label class="star-1" for="star-1">1</label>
        <input type="radio" name="star" class="star-2" id="star-2"  value="2"/>
        <label class="star-2" for="star-2">2</label>
        <input type="radio" name="star" class="star-3" id="star-3"  value="3"/>
        <label class="star-3" for="star-3">3</label>
        <input type="radio" name="star" class="star-4" id="star-4"  value="4"/>
        <label class="star-4" for="star-4">4</label>
        <input type="radio" name="star" class="star-5" id="star-5"  value="5"/>
        <label class="star-5" for="star-5">5</label>
        <span></span>
    </div>
</form>
<div style="height: 5px;"></div>
				<textarea style="height: 45px; float: left; width: 80%; padding: 5px; font-size: 14px;" id="content"></textarea>
				<a class="btn btn-lg btn-ygy1 btn-right" style="width: 20%; border-radius: 0px;" id="create">등록</a>
		</div>
		
		
		<div id="Reviewlist"></div>
		

		
		<div class="box-footer clearfix">
			<ul id="paging-comment"	class="pagination pagination-sm no-margin pull-right">
			</ul>
		</div>
		
		
		
		
		
		<!-- <li class="list-group-item btn-more"><a><span>더 보기<i
					class="arr-down"></i></span></a></li> -->
		</ul>
	</div>

			<%@include file="footersub.jsp"%>

	
</body>
</html>