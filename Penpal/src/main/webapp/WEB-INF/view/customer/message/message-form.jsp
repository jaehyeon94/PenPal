<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- charset 설정 -->
<title>massage</title>
<script type="text/javascript"
	src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>


<style>
.contact_form input[type=text], .contact_form select, .contact_form textarea,
	.contact_form input[type=email], .contact_form input[type=title] {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	margin-top: 6px;
	margin-bottom: 16px;
	resize: vertical;
}

.contact_form>h3 {
	text-align: center;
}

.contact_form textarea {
	height: 200px;
	resize: none;
}

.contact_form input[type=submit] {
	background-color: #737373;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: 0.3s;
}

.contact_form input[type=submit]:hover {
	background-color: #aaa;
}

.contact_form {
	width: 90%;
	margin: 0 auto;
	margin-top: 10px;
	border-radius: 5px;
	padding: 20px;
}

.contact_form>h3 {
	font-size: 30px;
	padding-bottom: 50px;
}
</style>
</head>
<body>
	<!-- 폼태그 -->
	<section class="contact_form" id="contact_form">
		<label for="name">이름</label> <input type="text" id="friend_id"
			name="friend_id" placeholder="${massageInfo.friend_name}(${massageInfo.friend_id})"
			readonly="readonly"> <label for="title">제목</label> <input
			type="text" id="title" name="title" placeholder="${massageInfo.message_title}" readonly="readonly">
		<label for="message">메시지 내용</label>
		<textarea id="message" name="message" placeholder="${massageInfo.message}" readonly="readonly"></textarea>
		<a href="messageform?memberid=${massageInfo.friend_id}&membername=${massageInfo.friend_name}">			
						 <button id="sendSubmit">메세지 보내기</button> </a>
		
	</section>
</body>

</html>