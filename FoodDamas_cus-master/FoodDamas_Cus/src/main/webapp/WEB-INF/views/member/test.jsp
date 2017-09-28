<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="assets/css/reset.css">
    <link rel="stylesheet" href="assets/css/supersized.css">
    <link rel="stylesheet" href="assets/css/style.css">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>

    <![endif]-->

</head>
<style>

</style>
<body>

<div class="page-container">
    <h1>test</h1>
    <h1>${k_id }ee</h1>
    <h1>${k_id1}ee</h1>
     <form action="/member/register" method="post">
        <input type="text" name="c_id" class="c_id" placeholder="아이디" onkeyup="idCheck()">
       		 <ul id="checkId" style="margin-top: 10px;"> </ul>
        <input type="text" name="c_name" class="c_name" placeholder="이름">
        <input type="password" name="c_pw" class="c_pw" placeholder="비밀번호">
        <input type="password" name="confirmC_pw" class="confirmC_pw"  placeholder="비밀번호확인" onkeyup="checkPassword()">
        <ul id="checkPasswordText" style="margin-top: 10px;"> </ul>
        <input type="text" name="c_phone" class="c_phone" placeholder="핸드폰">
        <input type="email" name="c_mail" class="c_mail" placeholder="메일">

        <button type="submit">Sign me in</button>
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
<script src="assets/js/jquery-1.8.2.min.js"></script>
<script src="assets/js/supersized.3.2.7.min.js"></script>
<script src="assets/js/supersized-init.js"></script>
<script src="assets/js/scripts.js"></script>

</body>

</html>

