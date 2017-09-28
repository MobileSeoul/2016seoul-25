<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Riona - One Page Bootstrap Business Template</title>

        <!-- CSS -->
   <!--      <base href="resources/"> -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lato:400,700">
        <link rel="stylesheet" href="resources/assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/assets/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="resources/assets/css/animate.css">
        <link rel="stylesheet" href="resources/assets/css/magnific-popup.css">
		<link rel="stylesheet" href="resources/assets/css/form-elements.css">
        <link rel="stylesheet" href="resources/assets/css/style.css">
        <link rel="stylesheet" href="resources/assets/css/media-queries.css">
        
        
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

        <![endif]-->

        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="resources/assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="resources/assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="resources/assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="resources/assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="resources/assets/ico/apple-touch-icon-57-precomposed.png">
		<!--추가-->
		<link rel="stylesheet" href="resources/assets/bootstrapSwitch/bootstrap-switch.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="resources/assets/bootstrapSwitch/bootstrap-switch.js"></script>
		<script src="resources/assets/js/menu.js"></script>

    </head>
    <style>
        .vac {vertical-align: middle}
		td{vertical-align: middle !important}
    </style>

    <body>
    
        <!-- Loader -->
    	<div class="loader">
    		<div class="loader-img"></div>
    	</div>
		
		<!-- Top menu -->
		<nav>
			<a class="scroll-link" href="#top-content">Top</a>
			<a class="scroll-link" href="#what-we-do">Services</a>
			<a class="scroll-link" href="#process">Process</a>
			<a class="scroll-link" href="#portfolio">Portfolio</a>
			<a class="scroll-link" href="#testimonials">Testimonials</a>
			<a class="scroll-link" href="#team">About</a>
			<a class="scroll-link" href="#contact">Contact</a>
			<div class="hide-menu">
				<a href=""><i class="fa fa-bars"></i></a>
			</div>
		</nav>
		<div class="show-menu">
			<a href=""><i class="fa fa-bars"></i></a>
		</div>
		
        <!-- Top content -->
        <div class="top-content">
            <div class="top-content-text wow fadeInUp">
            	<div class="divider-2"><span></span></div>
            	<h1><a href="">THIS IS FoodTruck</a></h1>
            	<div class="divider-2"><span></span></div>
            	<p>회원가입수정</p>
            	<div class="top-content-bottom-link">
            		<a class="big-link-1" href="#">Start a project!</a>
            	</div>
            </div>
        </div>
		<h1>회원가입 수정할 부분이에요!</h1>
		<!-- modify를 할꺼에요 -->
			<form role="form" method="post" class="login-form" action="" id="modifyform">
            <div class="form-group">
                <label class="sr-only" for="u_id"></label>
                <input type="form-control" value="${login.u_id}" placeholder="아이디를 입력하세요" class="form-UserID form-control" id="modifyuid" readonly="readonly">
            </div>

            <div class="form-group">
                <label class="sr-only" for="u_pw"></label>
                <input value="${login.u_pw}" placeholder="패스워드를 입력하세요" class="UserPW form-control" id="modifyupw">
            </div>

            <div class="form-group">
                <div style="width:30%;"> 프로필 사진</div>
                <div style="float:inherit"><input type="file" name="u_profile_img" class="form-Co-Doc form-control" id="modifypimg_real"></div>
            </div>
            <div class="form-group">
                <div style="width:30%;"> 프로필 사진 경로</div>
                <div style="float:inherit"><input type="hidden" value="${modify.u_profile_img}" name="u_profile_img" class="form-Co-Doc form-control" id="modifypimg"></div>
            </div>

            <div class="form-group">
                <label class="sr-only" for="u_name"></label>
                <input type="form-control" value="${modify.u_name}" placeholder="성함을 입력해주세요" class="form-UserName form-control" id="modifyname">
            </div>

            <div class="form-group">
                <label class="sr-only" for="u_email"></label>
                <input type="form-control" value="${modify.u_email }" placeholder="이메일을 입력해주세요" class="form-UserEmail form-control" id="modifyemail">
            </div>

            <div class="form-group">
                <label class="sr-only" for="u_phone"></label>
                <input type="tel" value="${modify.u_phone }" placeholder="-를 제외하고 입력해주세요" class="form-UserPhone form-control" id="modifyphone">
            </div>
 			<div class="form-group">
                <label class="sr-only" for="co_intro"></label>
                <input type="tel" value="${modify.co_intro} "placeholder="푸드트럭 소개말" class="form-Co-Intro form-control" id="modifycointro">
            </div>
            <div class="form-group">
                <label class="sr-only" for="sales_time"></label>
                <input type="tel" value="${modify.sales_time}" placeholder="푸드트럭  영업시간" class="form-Sales-Time form-control" id="modifysalestime">
            </div>
            <div class="form-group">
                <label class="sr-only" for="co_name"></label>
                <input type="form-control" value="${modify.co_name}" placeholder="상호 " class="form-Co-Name form-control" id="modifyconame">
                <div class="form-group" style="float: right">
                    음식카테고리
                    <select name=f_code id="registerfcode" >
                        <option value="0">한식</option>
                        <option value="1">중식</option>
                        <option value="2">일식</option>
                        <option value="4">양식</option>
                        <option value="3">분식</option>
                    </select>
 				<input type="hidden" class="fcode" value="${modify.f_code}">
                </div>
            </div>
		<%-- 
            <div class="form-group">
                <label class="sr-only" for="co_num"></label>
                <input type="form-control" value="${modify.co_num }" placeholder="사업자등록번호를 입력해주세요" class="form-Co-num form-control" id="modifyconum">
            </div> --%>

          <!--   <div class="form-group">
                <div style="width:30%;"> 사업자등록증 첨부파일</div>
                <div style="float:inherit"><input type="file" name="co_doc" class="form-Co-Doc form-control" id="modifycodoc"></div>
            </div> -->
            <button type="submit" class="btn" id="registermodify">회원 수정</button>
        </form>

		
			</div>
		</div>

		
        
                
        <!-- Footer -->
        <footer>
	        <div class="container">
	            <div class="row">
                    <div class="col-sm-7 footer-copyright">
                    	&copy; Riona Bootstrap Template by <a href="http://azmind.com">Azmind</a>.
                    </div>
                    <div class="col-sm-5 footer-social">
                    	<a href="#"><i class="fa fa-facebook"></i></a>
	                	<a href="#"><i class="fa fa-dribbble"></i></a>
	                    <a href="#"><i class="fa fa-twitter"></i></a>
	                    <a href="#"><i class="fa fa-google-plus"></i></a>
	                    <a href="#"><i class="fa fa-pinterest"></i></a>
                    </div>
	            </div>
	        </div>
        </footer>
        

        <!-- Javascript -->

        <script src="resources/assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="resources/assets/js/jquery.backstretch.min.js"></script>
        <script src="resources/assets/js/wow.min.js"></script>
        <script src="resources/assets/js/retina-1.1.0.min.js"></script>
        <script src="resources/assets/js/jquery.magnific-popup.min.js"></script>
        <script src="resources/assets/js/masonry.pkgd.min.js"></script>
        <script src="resources/assets/js/scripts.js"></script>
		<script>
	 	var fcode=$(".fcode").val();
		console.log(fcode);
		//console.log(${login});
		$("#registerfcode option[value='"+fcode+"']").attr("selected", "selected");
 
		$(document).ready(function(){
			//////update버튼 클릭하면///////
	
			$("#registermodify").on("click", function(){
				event.preventDefault();
				var files = document.getElementById("modifypimg_real").files[0];	
				console.log(files);
				var formData = new FormData();
				
				formData.append("u_id",$("#modifyuid").val());
				formData.append("u_pw",$("#modifyupw").val());
				formData.append("u_name",$("#modifyname").val());
				formData.append("u_email",$("#modifyemail").val());
				formData.append("u_phone",$("#modifyphone").val());
				formData.append("co_intro",$("#modifycointro").val());
				formData.append("sales_time",$("#modifysalestime").val());
				formData.append("co_name",$("#modifyconame").val());
				formData.append("f_code",$("#registerfcode").val());

				//$("#registerfcode option[value='4']").attr("selected", "selected");
				console.log($("#modifypimg").val());
				if($("#modifypimg_real").val()==""){
					//formData.append("u_profile_img",$("#modifypimg").val());
					console.log("사진은 그대로");
				}else {
					formData.append("file1",document.getElementById("modifypimg_real").files[0]);
					console.log("사진 수정");
				}

				$.ajax({
		    		url : 'http://localhost/modify',
		    		type : "POST",
		    		processData:false,
		    		contentType:false,
		    		data : formData,
		    		success : function(data){
		    			alert("회원이 수정되었습니다");
		    			window.location = "http://localhost/home";
		    		}
		    	});//ajax끝
				
			});//end onclick
			
		});//end document
		</script>
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

    </body>

</html>
	