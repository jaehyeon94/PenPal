<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/css/customer/search/search.css">


<div
	style="height: 870px; width: 100%; display: flex; flex-direction: column;">
	<div class="member-search-box" style="margin-top: 7%"">
		<div class="main-container">
			<form action="search.do" method="post">
				<div class="login-input-wrap">
					<select name="nationality">
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
					<select name="hobby">
						<option value="독서">독서</option>
						<option value="음악감상">음악감상</option>
						<option value="음악감상">영화감상</option>
						<option value="게임">게임</option>
						<option value="스포츠">스포츠</option>
					</select>
				</div>

				<div class="login-input-wrap">
					<select name="gender">
						<option value="남자">남자</option>
						<option value="여자">여자</option>
					</select>
				</div>

				<div class="login-select-wrap" align="left">
					<select name="age">
						<option value="0">나이</option>
						<c:forEach var="i" begin="1" end="100">
							<option value="${i}">
								<c:out value="${i}" />
							</option>
						</c:forEach>

					</select> <label
						style="font-size: 15px; font-weight: 800; background-color: transparent;">
						&nbsp~ </label> 
						<select name="age2">
						<option value="0">나이</option>
						<c:forEach var="i" begin="1" end="100">
							<option value="${i}">
								<c:out value="${i}" />
							</option>
						</c:forEach>

					</select>
				</div>
				<div align="right">
					<button class="search-but">검색</button>
				</div>
			</form>
		</div>
	</div>

	<div
		style="flex-direction: row; display: flex; margin-left: auto; margin-right: auto; margin-top: 2%"
		align="center">
		<c:forEach var="members" items="${members}">
			<div
				style="width: 300px; height: 300px; flex-direction: column; margin: 2%;"
				align="center" onclick="location.href='memberprofile?id=${members.id}';">
				<div>
					<img src="/images/${members.photo}" width="250px" height="250px"
						alt="PANPAL" style="border-radius: 50%;" />
				</div>
				<div>
					<label style="font-size: 25px;"> ${members.name}
						(${members.age})</label> <br> <label> </label>
				</div>
			</div>
		</c:forEach>


	</div>

</div>