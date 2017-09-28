
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html lang="UTF-8">


<head>
    <base href="../resources/">

    <meta charset="utf-8">
    <title>Fullscreen Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- CSS -->
    <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/supersized.css">
    <link rel="stylesheet" href="css/style.css">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>

    <![endif]-->

</head>
<style>

</style>
<body>
<script type="text/javascript">
	var k_id='${checkId}';
	console.log(k_id);
	if(k_id!=""){
		alert('이미 회원가입을 하였습니다.');
 		window.location.replace("/member/login");
	}else{
		alert('이름, 핸드폰, 메일주소를 작성해주세요');
	}
		
</script>
	
<div class="page-container">
    <h1>Register Kakao</h1>

     <form method="post">
        <input type="text" name="c_id" class="c_id" placeholder="아이디" value='' onkeyup="idCheck()" readonly="readonly">
        <input type="text" name="k_nick" class="k_nick" placeholder="카카오톡 닉네임" value='' readonly>
        <input type="text" name="c_pw" class="c_pw" placeholder="패스워드" value='' hidden >
        <input type="text" name="k_id" class="k_id" placeholder="카카오톡아이디" value='' hidden >
        <input type="text" name="thumb_img" class="thumb_img" placeholder="카카오톡 썸네일" value='' hidden >
        <input type="text" name="profile_img" class="profile_img" placeholder="카카오톡 프사" value='' hidden>
        <input type="text" name="c_name" class="c_name" placeholder="이름">
        <input type="text" name="c_phone" class="c_phone" placeholder="핸드폰">
        <input type="email" name="c_mail" class="c_mail" placeholder="메일">

        <button class="registerKakao">Sign me in</button>
        <div class="error"><span>+</span></div>
    </form>
    <div class="connect">
        <p>Or connect with:</p>
        <p>
            <a class="facebook" href=""></a>
            <a class="twitter" href=""></a>
        </p>
    </div>
</div>

<!-- Javascript -->
<script src="js/jquery-1.8.2.min.js"></script>
<script src="js/supersized.3.2.7.min.js"></script>
<script src="js/supersized-init.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	var local="http://14.32.7.115:4449/";
	
	var k_id= sessionStorage.getItem('k_id');
	var k_nick= sessionStorage.getItem('k_nick');
	var profile_img= sessionStorage.getItem('profile_img');
	var thumb_img= sessionStorage.getItem('thumb_img');
	$(".c_id").val(k_id);
	$(".c_pw").val(k_id);
	$(".k_id").val(k_id);
	$(".profile_img").val(profile_img);
	$(".thumb_img").val(thumb_img);
	$(".k_nick").val(k_nick);
	var obj='';
	$(".registerKakao").on("click", function() {
		obj={
				c_id:$(".c_id").val(),
				c_pw:$(".c_id").val(),
				k_id:$(".c_id").val(),
				k_nick:$(".k_nick").val(),
				profile_img:$(".profile_img").val(),
				thumb_img:$(".thumb_img").val(),
				c_name:$(".c_name").val(),
				c_phone:$(".c_phone").val(),
				c_mail:$(".c_mail").val()
		}
			registerKakao(obj);

	});
		function registerKakao(obj) {
			
			$.ajax({
				url: local+'member/registerKakaomember',
				type: 'post',
				data: obj,
				success:function(data){
					console.log(data);
					
					
					
					if(data=="success")
 					{
						console.log("--------------------------");
 						alert("회원가입을 성공하였습니다.");
						window.location.replace("/member/login");
 					}else {
 	 					alert("회원가입을 실패하였습니다.");

					}				 
					
				}
			});
			
		}
	
});


	

</script>
</body>

</html>

