<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<div style="text-align: center;">
	<div style="height: 870px; width: 100%; display: flex;">
		<div style="display: flex; margin: auto; margin-top: 7%">
			<div style="width: 450px; height: 600px;">
				<form id="upload-file-form">
					<input type=file id="file1" class="file1" name='file1'
						style='display: none;'> <img
						onclick="javascript:fn_submit();" id="file" class="file"
						alt="PROFILE" src="/images/${memberprofile.photo}" width="300px"
						height="300px"
						style="cursor: pointer; border-radius: 50%; margin-top: 70px; margin-bottom: 30px">
					<br>
					<button id="upbut" class="upbut" name='upbut'
						style='display: none;'></button>
				</form>
				<div style="flex-direction:row; display: flex; margin-left: 30%;">
					<div style="height: 20px;">
						<label style="font-size: 20px;"> ${memberprofile.id} </label>
						<c:choose>
							<c:when test="${friendck == null}">
								<button
									onclick="location.href = 'insertfriend.do?id=${memberprofile.id}'">팔로우</button>
							</c:when>
							<c:otherwise>
								<button
									onclick="location.href = 'removefriend.do?id=${memberprofile.id}'">언팔로우</button>
							</c:otherwise>

						</c:choose>
					</div>
					<div>
						<a href="#" onclick="window.open('messageform?memberid=${memberprofile.id}&membername=${memberprofile.name}','name','resizable=no width=600 height=550');return false" style="margin-left: 5px;"> <img src="/images/mssage.png"
							width="30px" height="25px;">
						</a>
					</div>
				</div>
				<br> <br> <label style="font-size: 15px"> 게시물 : ${totalRow}
				</label> <label style="font-size: 15px"> 팔로우 : ${follow} </label> <label
					style="font-size: 15px"> 팔로워 : ${follower} </label>
			</div>


			<div style="width: 450px; height: 600px; padding-top: 20%">

				<h1 style="font-size: 25px">이름 : ${memberprofile.name}</h1>
				<br>
				<h1 style="font-size: 25px">나이 : ${memberprofile.age}</h1>
				<br>
				<h1 style="font-size: 25px">성별 : ${memberprofile.gender}</h1>
				<br>
				<h1 style="font-size: 25px">취미 : ${memberprofile.hobby}</h1>

				</h1>
				<br>
			</div>
		</div>
	</div>