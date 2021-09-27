<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<meta charset="UTF-8">
	<title>펜팔 로그인</title>
	<link rel="stylesheet" href="/css/customer/login.css">
	<script src="https://kit.fontawesome.com/51db22a717.js" crossorigin="anonymous"></script>
</head>
<body>
	<div class="main-container">
		<div class="main-wrap">
		<header>
			<div class="logo-wrap">
			 <a href="/index">
				<img src="/images/logo_transparent.png" width="250px" height="250px" alt="PANPAL">
				</a>
			</div>
		</header>
		<form action="login.do" method="post"> 
		<section class="login-input-section-wrap">
			<div class="login-input-wrap">	
				<input placeholder="사용자 아이디" type="text" name="id""></input>
			</div>
			<div class="login-input-wrap password-wrap">	
				<input placeholder="비밀번호" type="password" name="password"></input>
			</div>
			<div class="login-button-wrap">
				<button>Sign in</button>
			</div>
		</section>
		 </form>
		<section class="Easy-sgin-in-wrap">
			<p class="forget-msg">Forgot your Username or Password? |<a href="/membership"> Sign up </a></p>
		</section>
		</div>
	</div>
</body>