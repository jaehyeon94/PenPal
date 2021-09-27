<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
 	function fn_submit() {
		 $('#file1').click();
		uploadBut();
	}; 

	$(function() {
		$("#file1").on('change', function() {
			readURL(this);
		});
	});
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				uploadBut();
				var previewImage = document.getElementById("file")
				previewImage.src = e.target.result
			}
			reader.readAsDataURL(input.files[0]);

		}
	}

	function uploadBut() {
		$.ajax({
			url : "/fileup",
			type : "POST",
			data : new FormData($("#upload-file-form")[0]),
			enctype : 'multipart/form-data',
			processData : false,
			contentType : false,
			cache : false,
			success : function() {
				// Handle upload success
				// ...
			},
			error : function() {

			}
		});
	}
</script>

<div style="text-align: center;">
	<div style="height: 870px; width: 100%; display: flex;">
		<div style="display: flex; margin: auto; margin-top: 7%">
			<div style="width: 450px; height: 600px;">
				<form id="upload-file-form">
					<input type=file id="file1" class="file1" name='file1'
						style='display: none;'> <img
						onclick="javascript:fn_submit();" id="file" class="file"
						alt="PROFILE" src="/images/${member.photo}" width="300px"
						height="300px"
						style="cursor: pointer; border-radius: 50%; margin-top: 70px; margin-bottom: 30px">
					<br>
					<button id="upbut" class="upbut" name='upbut'
						style='display: none;'></button>
				</form>
				<label style="font-size: 20px;"> ${member.id} </label>
				<button onclick="location.href = '/memberupdate'">프로필 편집</button>
				<br> <br> <label style="font-size: 15px"> 게시물 : ${totalRow}
				</label> <label style="font-size: 15px"> 팔로우 : ${follow} </label> <label
					style="font-size: 15px"> 팔로워 : ${follower} </label>
			</div>
			<div style="width: 450px; height: 600px; padding-top: 20%">

				<h1 style="font-size: 25px">이름 : ${member.name}</h1>
				<br>
				<h1 style="font-size: 25px">나이 : ${member.age}</h1>
				<br>
				<h1 style="font-size: 25px">성별 : ${member.gender}</h1>
				<br>
				<h1 style="font-size: 25px">취미 : ${member.hobby}</h1>


				<br>
			</div>
		</div>
	</div>
</div>