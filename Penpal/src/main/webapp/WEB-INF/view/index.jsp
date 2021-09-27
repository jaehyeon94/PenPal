<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/css/index.css" type="text/css" rel="stylesheet" />


<
<style>
.backgroundImage {
	width: 100%;
	background-image: url(../images/pen-pals.jpg);
	border-bottom: 1px solid #45a99c;
	background-size: cover;
	display: flex;
}

.login-box {
	height: 120px;
	width: 20%;
	margin: auto;
	background: rgba(101, 123, 137, 0.8);
	display: flex;
}

#login {
	margin: auto;
	font-size: 50px;
	font-weight: bold;
	text-align: center;
	font-family: "맑은 고딕", "고딕", sans-serif;
	text-decoration: none;
	color: black;
}
#login:hover {
	color: #ff6a00;
}
</style>



<div style="text-align: center; height: 857px;">
	<div class="backgroundImage"
		style="height: 857px;">


		<div class="login-box">
			<c:choose>
				<c:when test="${member == null}">
					<a id="login" href="/login"> Login </a>
				</c:when>
				<c:otherwise>
					<a id="login" href="/logout.do"> Logout </a>
				</c:otherwise>
			</c:choose>


		</div>
	</div>
</div>
