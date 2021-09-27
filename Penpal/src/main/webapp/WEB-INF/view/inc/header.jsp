<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header id="header" style="position:fixed;  flex-direction: column; background: #fff; width: 100%" >

	<div class="content-container">
		<!-- ---------------------------<header>--------------------------------------- -->

		<h1 id="logo">
			<a href="/index"> <img src="/images/logo_transparent.png" width="100px" height="50px" alt="PANPAL" />

			</a>
		</h1>

		<section>
			<h1 class="hidden">헤더</h1>
			<nav id="main-menu">
				<h1>메인메뉴</h1>
				<c:choose>
					<c:when test="${member != null}">
						<ul>
							<li><a href="/profile">MyProfle</a></li>
							<li><a href="/message?ck=send">Massage</a></li>
							<li><a href="/board_every?ck=every">Borad</a></li>
							<li><a href="/search">Search</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul>
							<li><a href="/login">MyProfle</a></li>
							<li><a href="/login">Massage</a></li>
							<li><a href="/login">Photo</a></li>
							<li><a href="/login">Search</a></li>
						</ul>
					</c:otherwise>
				</c:choose>
			</nav>

			<div class="sub-menu">
				<nav id="acount-menu">
					<h1 class="hidden">회원메뉴</h1>
					<ul>
						<li><a href="/index">HOME</a></li>
						<c:choose>
							<c:when test="${member == null}">
								<li><a href="/login">로그인</a></li>
								<li><a href="/membership">회원가입</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="/logout.do">로그아웃</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</nav>

			</div>
		</section>

	</div>

</header>