<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>
<meta charset="UTF-8">
<title>펜팔 회원가입</title>
<link rel="stylesheet" href="/css/customer/login.css">

<script type="text/javascript"
	src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

<script type="text/javascript"
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css"
	rel="stylesheet">

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/JavaScript">

	 $(document).ready(function() {

		 var sel = document.getElementById("nationality");	 
		 for(i=0; i<sel.options.length; i++) {
			 if(sel.options[i].value == "${member.nationality}")
			 	$('#nationality option:eq('+i+')').prop('selected', true);
				 
		 }
		 
		 var sel1 = document.getElementById("question");
		 for(i=0; i<sel1.options.length; i++) {
			 if(sel1.options[i].value == "${member.question}")
				
			  	 $('#question option:eq('+i+')').prop('selected', true); 
				 
		 }
	  
		var size = "${fn:length(member.hobby)}";		
		var list = new Array();
		list.push("${member.hobby}");
		
		<c:forEach items="${member.hobby}" var="item">
		 $("input:checkbox[id='${item}']").attr("checked",true);
		
		</c:forEach>
		
	
		/*   alert(sel.options[0].value);
		for(i=0; i<sel.options.length; i++) {
		    if(sel.options[i].value == ${member.nationality}) {
		        sel.options[i].selected;
		        break;
		    } */
		
		
	});
	 
	
	
	/*  $("#nationality").val(${member.nationality}).prop("selected", true );
	$("#question").val(${member.question}).prop("selected", true);  */ 


	var idCheck = 0;
	var nickCheck = 0;
	var pwdCheck = 0;

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
			if (pwdCheck == 1) {
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
			<form action="memberupdate.do" method="post" id="login-form">
				<section class="login-input-section-wrap">
					<div class="login-label">
						<label type="text" name="id" id="checkaa">아이디 : </label> <label
							type="text" name="id" id="checkaa"> ${member.id} </label>
					</div>
					<div class="login-input-wrap password-label">
						<input placeholder="비밀번호" type="password" name="password"
							id="pass" oninput="checkPwd()"></input>
					</div>
					<div class="login-input-wrap password-label1">
						<input placeholder="비밀번로 확인" type="password" name="password"
							id="repwd" oninput="checkPwd()"></input>
					</div>
					<div class="login-label">
						<label type="text" name="id" id="checkaa">이름 : </label> <label
							type="text" name="id" id="checkaa"> ${member.name} </label>
					</div>
					<div class="login-label">
						<label type="text" name="id" id="checkaa">나이 : </label> <label
							type="text" name="id" id="checkaa"> ${member.age} </label>
					</div>
					<div class="login-label">
						<label type="text" name="id" id="checkaa">성별 : </label> <label
							type="text" name="id" id="checkaa"> ${member.gender} </label>
					</div>
					<div class="login-input-wrap">
						<select class="nationality" id="nationality" name= "nationality"
							style="margin-top: 10px; margin-left: 15px">
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
						<select name="question" id="question" class="question"
							style="margin-top: 10px; margin-left: 15px">
							<option value="보물 제 1호는 ?">보물 제 1호는 ?</option>
							<option value="처음 여행간곳은 ?">처음 여행간곳은 ?</option>
							<option value="첫 키스 장소는 ?">첫 키스 장소는 ?</option>
							<option value="고등학교 수학여행 장소는 ?">고등학교 수학여행 장소는 ?</option>
						</select>
					</div>
					<div class="login-input-wrap">
						<input placeholder="${member.answer}" type="text" name="answer""></input>
					</div>

					<div class="login-checkbox-wrap">
						<h3>취미 (중복 선택 가능)</h3>
						<input type="checkbox" name="hobby" class="ckbox" id="독서"
							value="독서"> 독서 <input type="checkbox" name="hobby"
							class="ckbox" id="음악감상" value="음악감상"> 음악감상 <input
							type="checkbox" name="hobby" class="ckbox" id="영화감상" value="영화감상">
						영화감상 <input type="checkbox" name="hobby" class="ckbox" id="게임"
							value="게임"> 게임 <input type="checkbox" name="hobby"
							class="ckbox" id="스포츠" value="스포츠"> 스포츠
					</div>
					<div class="login-button-wrap">
						<button type="submit"
							class="form-control btn btn-primary signupbtn"
							disabled="disabled">수정하기</button>
					</div>
				</section>
			</form>
		</div>
	</div>
</body>