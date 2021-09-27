
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<meta charset="UTF-8">
<title>펜팔 회원가입</title>
<link rel="stylesheet" href="/css/customer/login.css">
<script type="text/javascript"
	src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css"
	rel="stylesheet">

	
	<script type="text/javascript">
	
	 var idCheck = 0;
	    var nickCheck = 0;
	    var pwdCheck = 0;

	function checkId() {
		var inputed = document.getElementById('checkaa').value;
		console.log(inputed);
		$.ajax({
			data : {
				id : inputed
			},
			url : "/checkId.do",
			success : function(data) {
				if (inputed == "" && data == '0') {
					$(".signupbtn").prop("disabled", true);
					$(".signupbtn").css("background-color", "#aaaaaa");
					$("#checkaa").css("background-color", "#FFCECE");
					idCheck = 0;
				} else if (data == '0') {
					$("#checkaa").css("background-color", "#B0F6AC");
					idCheck = 1;
					if (idCheck == 1 && pwdCheck == 1) {
						$(".signupbtn").prop("disabled", false);
						$(".signupbtn").css("background-color", "#4CAF50");
					}
				} else if (data == '1') {
					$(".signupbtn").prop("disabled", true);
					$(".signupbtn").css("background-color", "#aaaaaa");
					$("#checkaa").css("background-color", "#FFCECE");
					idCheck = 0;
				}
			}
		});
	}
	//재입력 비밀번호 체크하여 가입버튼 비활성화 또는 맞지않음을 알림.
	function checkPwd() {
		var inputed = document.getElementById('pass').value;
		var reinputed = document.getElementById('repwd').value;
		console.log(inputed);
		console.log(reinputed);
		if (reinputed == "" && (inputed != reinputed || inputed == reinputed)) {
			$(".signupbtn").prop("disabled", true);
			$(".signupbtn").css("background-color", "#aaaaaa");
			$("#repwd").css("background-color", "#FFCECE");
		} else if (inputed == reinputed) {
			$("#repwd").css("background-color", "#B0F6AC");
			pwdCheck = 1;
			if (idCheck == 1 && pwdCheck == 1) {
				$(".signupbtn").prop("disabled", false);
				$(".signupbtn").css("background-color", "#4CAF50");
			}
		} else if (inputed != reinputed) {
			pwdCheck = 0;
			$(".signupbtn").prop("disabled", true);
			$(".signupbtn").css("background-color", "#aaaaaa");
			$("#repwd").css("background-color", "#FFCECE");

		}
	}
	//닉네임과 이메일 입력하지 않았을 경우 가입버튼 비활성화
	function checkNick() {
		var nickname = $("#nickname").val();
		console.log(nickname);
		$.ajax({
			data : {
				nickName : nickname
			},
			url : "checkNickName.do",
			success : function(data) {
				if (nickname == "" && data == '0') {
					$(".signupbtn").prop("disabled", true);
					$(".signupbtn").css("background-color", "#aaaaaa");
					$("#nickname").css("background-color", "#FFCECE");
					nickCheck = 0;
				} else if (data == '0') {
					$("#nickname").css("background-color", "#B0F6AC");
					nickCheck = 1;
					if (nickCheck == 1 && pwdCheck == 1) {
						$(".signupbtn").prop("disabled", false);
						$(".signupbtn").css("background-color", "#4CAF50");
					}
				} else if (data == '1') {
					$(".signupbtn").prop("disabled", true);
					$(".signupbtn").css("background-color", "#aaaaaa");
					$("#nickname").css("background-color", "#FFCECE");
					nickCheck = 0;
				}
			}
		});
	}
</script>
</head>
<body>
	<div class="main-container">
		<div class="main-wrap">
			<header>
				<div class="logo-wrap">
					<a href="/index"> <img src="/images/logo_transparent.png" width="100px" height="50px"
						alt="PANPAL">
					</a>
				</div>
			</header>
			<form action="membership.do" method="post" id="login-form">
				<section class="login-input-section-wrap">
					<div class="login-input-wrap">
						<input placeholder="아이디" type="text" name="id" oninput="checkId()"
							id="checkaa" autofocus></input>
					</div>
					<div class="login-input-wrap password-wrap">

						<input placeholder="비밀번호" type="password" name="password"
							id="pass" oninput="checkPwd()"></input>
					</div>
					<div class="login-input-wrap password-wrap">
						<input placeholder="비밀번로 확인" type="password" name="password"
							id="repwd" oninput="checkPwd()"></input>
					</div>
					<div class="login-input-wrap">
						<input placeholder="이름" type="text" name="name" id="nickname"
							oninput="checkNick()" autofocus></input>
					</div>
					<div class="login-input-wrap">
						<input placeholder="나이" type="number" name="age"></input>
					</div>

					<div class="login-input-wrap">
						<select name="gender">
							<option value="남자">남</option>
							<option value="여자">여</option>
						</select>
					</div>
					<div class="login-input-wrap">
						<select name="nationality" >
							<option value="한국">한국</option>
							<option value="일본">일본</option>
							<option value="미국">미국</option>
							<option value="중국">중국</option>
							<option value="영국">영국</option>
							<option value="러시아">러시아</option>
							<option value="캐나다">캐나다</option>
						</select>
					</div>


					<div class="login-input-wrap">
						<select name="question">
							<option value="보물 제 1호는 ?">보물 제1호는 ?</option>
							<option value="처음 여행간곳은 ?">처음 여행간곳은 ?</option>
							<option value="첫 키스 장소는 ?">첫 키스 장소는 ?</option>
							<option value="고등학교 수학여행 장소는 ?">고등학교 수학여행 장소는 ?</option>
						</select>
					</div>
					<div class="login-input-wrap">
						<input placeholder="답" type="text" name="answer""></input>
					</div>

					<div class="login-checkbox-wrap">
						<h3>취미 (중복 선택 가능)</h3>
						<input type="checkbox" name="hobby" value="독서"> 독서 
						<input type="checkbox" name="hobby" value="음악감상"> 음악감상 
						<input type="checkbox" name="hobby" value="영화감상"> 영화감상
						<input type="checkbox" name="hobby" value="게임"> 게임 
						<input type="checkbox" name="hobby" value="스포츠"> 스포츠
					</div>
					<div class="login-button-wrap">
						<button type="submit" class="form-control btn btn-primary signupbtn" disabled="disabled">가입하기</button>
					</div>
				</section>
			</form>
		</div>
	</div>
</body>