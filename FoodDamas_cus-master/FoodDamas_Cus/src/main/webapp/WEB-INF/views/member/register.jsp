<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">


<head>
    <base href="../resources/">

    <meta charset="utf-8">
    <title>FoodDamas Register</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- CSS -->
    <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/supersized.css">
    <link rel="stylesheet" href="css/style.css">

</head>
<style>

</style>
<body>

<div class="page-container">
    <h1>회원가입</h1>
     <form>
        <input type="text" name="c_id" class="c_id" placeholder="아이디" onkeyup="idCheck()">
       	<ul id="checkId" style="margin-top: 10px;"> </ul>
        <input type="text" name="c_name" class="c_name" placeholder="이름">
        <input type="password" name="c_pw" class="c_pw" placeholder="비밀번호">
        <input type="password" name="confirmC_pw" class="confirmC_pw"  placeholder="비밀번호확인" onkeyup="checkPassword()">
        <ul id="checkPasswordText" style="margin-top: 10px;"> </ul>
        <input type="text" name="c_phone" class="c_phone" placeholder="핸드폰">
        <input type="email" name="c_mail" class="c_mail" placeholder="메일">

        <div class="error"><span>+</span></div>
    </form>
            <button class = "register">가입하기</button>
    
<!--     <div class="connect">
        <p>Or connect with:</p>
        <p>
            <a class="facebook" href=""></a>
            <a class="twitter" href=""></a>
        </p>
    </div> -->
</div>

<!-- Javascript -->
<script src="js/jquery-1.8.2.min.js"></script>
<script src="js/supersized.3.2.7.min.js"></script>
<script src="js/supersized-init.js"></script>
<script src="js/register.js"></script>

</body>

</html>

