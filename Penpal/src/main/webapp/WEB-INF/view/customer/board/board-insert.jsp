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



<script type="text/javascript">
	function insertSubmit() {
		$.ajax({
			type : "POST",
			url : "insertBoard.do",
			data : new FormData($("#insert-board-form")[0]),
			enctype : 'multipart/form-data',
			processData : false,
			contentType : false,
			success : function() {
				opener.parent.location.reload();
				window.close();

			},
			error : function(request, status, error) {
				alert("status : " + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});
		
	}
</script>

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
		<form id = "insert-board-form" >
		<label for="title">이미지<br> <br></label> <input type="file" id = "file" class="file" name ="file">
		<br> <br> <label for="name">글쓰기</label>
		<textarea id="content" name="content" placeholder="내용"
			style="height: 100px;"></textarea>
			<button id="sendSubmit" type="button"  onclick="insertSubmit()">작성하기</button>
		</form>
	</section>
</body>

</html>