<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/css/message/message.css" type="text/css" rel="stylesheet" />


<div align="left"
	style="position:fixed; background: #fff;
	margin-top: 7%; left: 15%; width: 100px; height: 210px; border: 1px solid barck;">
	<ul class="current" >


		<c:choose>
			<c:when test="${ck == 'every'}">

				<li><a href="/board_every?ck=every">
						<button class="send"
							style="width: 150px; height: 70px; font-size: 20px">전체 <br> 게시판</button>
				</a></li>
				<li><a href="/board_every?ck=friend">
						<button class="receive"
							style="width: 150px; height: 70px; font-size: 20px">친구 <br> 게시판</button>
				</a></li>
				
				<li><a href="/board_every?ck=my">
						<button class="receive"
							style="width: 150px; height: 70px; font-size: 20px">나의 <br> 게시판</button>
				</a></li>

			</c:when>
			<c:when test="${ck == 'friend'}">
				<li><a href="/board_every?ck=every">
						<button class="receive"
							style="width: 150px; height: 70px; font-size: 20px">전체 <br> 게시판</button>
				</a></li>
				<li><a href="/board_every?ck=friend">
						<button class="send"
							style="width: 150px; height: 70px; font-size: 20px">친구 <br> 게시판</button>
				</a></li>
				<li><a href="/board_every?ck=my">
						<button class="receive"
							style="width: 150px; height: 70px; font-size: 20px">나의  <br>게시판</button>
				</a></li>

			</c:when>
			
				<c:when test="${ck == 'my'}">
				<li><a href="/board_every?ck=every">
						<button class="receive"
							style="width: 150px; height: 70px; font-size: 20px">전체 <br> 게시판</button>
				</a></li>
				<li><a href="/board_every?ck=friend">
						<button class="receive"
							style="width: 150px; height: 70px; font-size: 20px">친구 <br> 게시판</button>
				</a></li>
				<li><a href="/board_every?ck=my">
						<button class="send"
							style="width: 150px; height: 70px; font-size: 20px">나의 <br> 게시판</button>
				</a></li>

			</c:when>
		</c:choose>

	</ul>
</div>