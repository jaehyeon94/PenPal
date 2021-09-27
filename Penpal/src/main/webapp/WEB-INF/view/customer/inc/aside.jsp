<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/css/message/message.css" type="text/css" rel="stylesheet" />


<div align="left"
	style="position:fixed; background: #fff;
	margin-top: 7%; left: 15%; width: 100px; height: 210px; border: 1px solid barck;">
	<ul class="current" >


		<c:choose>
			<c:when test="${ck == 'send'}">

				<li><a href="/message?ck=send">
						<button class="send"
							style="width: 130px; height: 70px; font-size: 20px">보낸
							메일</button>
				</a></li>
				<li><a href="/message?ck=receive">
						<button class="receive"
							style="width: 130px; height: 70px; font-size: 20px">받은
							메일</button>
				</a></li>

			</c:when>
			<c:when test="${ck == 'receive'}">
				<li><a href="/message?ck=send">
						<button class="receive"
							style="width: 130px; height: 70px; font-size: 20px">보낸
							메일</button>
				</a></li>
				<li><a href="/message?ck=receive">
						<button class="send"
							style="width: 130px; height: 70px; font-size: 20px">받은
							메일</button>
				</a></li>

			</c:when>
		</c:choose>

	</ul>
</div>