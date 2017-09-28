<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if IE 8]>
<html xmlns="http://www.w3.org/1999/xhtml" class="ie8" lang="en-US">
<![endif]-->
<!--[if !(IE 8) ]><!-->
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>&rsaquo; Log In</title>
<link rel='stylesheet' id='buttons-css'
	href='http://demo.runwaythemes.com/bootstrap-starter/wp-includes/css/buttons.min.css?ver=4.1.12'
	type='text/css' media='all' />
<link rel='stylesheet' id='open-sans-css'
	href='//fonts.googleapis.com/css?family=Open+Sans%3A300italic%2C400italic%2C600italic%2C300%2C400%2C600&#038;subset=latin%2Clatin-ext&#038;ver=4.1.12'
	type='text/css' media='all' />
<link rel='stylesheet' id='dashicons-css'
	href='http://demo.runwaythemes.com/bootstrap-starter/wp-includes/css/dashicons.min.css?ver=4.1.12'
	type='text/css' media='all' />
<link rel='stylesheet' id='login-css'
	href='http://demo.runwaythemes.com/bootstrap-starter/wp-admin/css/login.min.css?ver=4.1.12'
	type='text/css' media='all' />

<link rel='stylesheet' id='wp-color-picker-css'
	href='http://demo.runwaythemes.com/bootstrap-starter/wp-admin/css/color-picker.min.css?ver=4.1.12'
	type='text/css' media='all' />
<link rel='stylesheet' id='custom-login-css'
	href='http://demo.runwaythemes.com/bootstrap-starter/wp-content/themes/runway-bootstrap-starter/assets/css/bootstrap.min.css?ver=4.1.12'
	type='text/css' media='all' />

<base href="resources/">

<link rel="stylesheet" href="delivery-truck-animation/css/style.css">
<meta name='robots' content='noindex,follow' />
</head>
<script>
	var str = '${fail}';
	if (str === 'fail') {
		alert("로그인 실패하셨습니다. 다시 시도해주세요");
	} else if (str === 'update') {
		alert("수정되었습니다.");

	} else if (str === 'delete') {
		alert("삭제되었습니다.");

	}
</script>

<!-- <body class="login login-action-login wp-core-ui  locale-en-us"
	style="background: url('delivery-truck-animation/back.png');"> -->
<body class="login login-action-login wp-core-ui  locale-en-us">

	<div class="containers">
		<div id="login">
			<div class="foodtruck">
				<div class="car-wrapper">
					<div class="car-wrapper_inner">
						<div class="car_outter">
							<div class="car">
								<div class="body">
									<div></div>
								</div>
								<div class="decos">
									<div class="line-bot"></div>
									<div class="door">
										<div class="handle"></div>
										<div class="bottom"></div>
									</div>
									<div class="window"></div>
									<div class="light"></div>
									<div class="light-front"></div>
									<div class="antenna"></div>
									<div class="ice-cream">
										<div class="cone"></div>
									</div>
								</div>
								<div>
									<div class="wheel"></div>
									<div class="wheel"></div>
								</div>
								<div class="wind">
									<div class="p p1"></div>
									<div class="p p2"></div>
									<div class="p p3"></div>
									<div class="p p4"></div>
									<div class="p p5"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- <script src="js/index.js"></script> -->



			<form name="loginform" id="loginform" action="/loginPost"
				method="post">
				<p>
					<label for="user_login">Username<br /> <input type="text"
						name="u_id" id="user_login" class="input" value="" size="20" /></label>
				</p>
				<p>
					<label for="user_pass">Password<br /> <input
						type="password" name="u_pw" id="user_pass" class="input" value=""
						size="20" /></label>
				</p>
				<p class="forgetmenot">
					<label for="rememberme"><input name="useCookie"
						type="checkbox" /> Remember Me</label>
				</p>
				<p class="submit">
					<input type="submit" name="wp-submit" id="wp-submit"
						class="button button-primary button-large" value="Log In" /> <input
						type="hidden" name="redirect_to"
						value="http://demo.runwaythemes.com/bootstrap-starter/wp-admin/" />
					<input type="hidden" name="testcookie" value="1" />
				</p>

			</form>
			<input type="submit" value="Register"
				onclick="location.href='http://localhost/register'"
				style="width: 330px;">

			<p id="nav">
				<a
					href="http://demo.runwaythemes.com/wp-login.php?action=lostpassword"
					title="Password Lost and Found">Lost your password?</a>
			</p>


			<script type="text/javascript">
				function wp_attempt_focus() {
					setTimeout(function() {
						try {
							d = document.getElementById('user_login');
							d.focus();
							d.select();
						} catch (e) {
						}
					}, 200);
				}

				wp_attempt_focus();
				if (typeof wpOnload == 'function')
					wpOnload();
			</script>

			<p id="backtoblog">
				<a href="http://demo.runwaythemes.com/bootstrap-starter/"
					title="Are you lost?"></a>
			</p>

		</div>



		<div class="clear"></div>
	</div>
</body>
</html>
