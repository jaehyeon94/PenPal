<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
table {
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

tr {
	border-bottom: 1px solid #444444;
	padding: 10px;
}

td {
	border-bottom: 1px solid #efefef;
	padding: 10px;
}

table .even {
	background: #efefef;
}

.text {
	text-align: center;
	padding-top: 20px;
	color: #000000;
	margin-left: auto;
	margin-right: auto;
	display: flex;
}

.text:hover {
	text-decoration: underline;
}
a { text-decoration:none } 

a:visited { color: black; text-decoration: none;}

a:link {
	color: black;
	text-decoration: none;
}

a:hover {
	text-decoration: none;
}

.paging ul {
	list-style: none;
}

.paging li {
	float: left;
	margin: 5px;
}
</style>

<div
	style="height: 800px; width: 1000px; display: flex; flex-direction: column; margin-top: 7%" >
	<div style="margin-top: 3%">


		<c:choose>
			<c:when test="${ck == 'send'}">
				<h2 style="font-size: 20px; font-weight: 900" align="left">보낸
					메세지함</h2>
			</c:when>
			<c:when test="${ck == 'receive'}">
				<h2 style="font-size: 20px; font-weight: 900" align="left">받은
					메세지함</h2>

			</c:when>
		</c:choose>

		<br>
		<table align=center>
			<thead align="center">
				<tr>
					
					<td width="550" align="center">제목</td>
					<c:choose>
						<c:when test="${ck == 'send'}">
							<td width="100" align="center">수신자</td>
						</c:when>
						<c:when test="${ck == 'receive'}">
							<td width="100" align="center">작성자</td>
						</c:when>
					</c:choose>
					<td width="200" align="center">날짜</td>
					<td width="60" align="center">확인</td>
				</tr>
			</thead>

			<tbody>

				<c:forEach var="message" items="${list}" begin="0" end="20">

					<tr class="even">
						<td width="550" align="center"><a href="#"
							onclick="window.open('messageinfo?ck=${ck}&memberNo=${message.message_no}',
							'name','resizable=no width=600 height=550');return false">
								${message.message_title} </a></td>
						<td width="100" align="center">${message.friend_name}(${message.friend_id})</td>
						<td width="200" align="center">${message.birth}</td>
						<c:choose>
							<c:when test="${message.select_ck != 0 }">
								<td width="50" align="center">읽음</td>
							</c:when>
							<c:when test="${message.select_ck == 0}">
								<td width="50" align="center"> </td>
							</c:when>
						</c:choose>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="text" align="center">
			<ul class="paging">


				<c:if test="${pageMaker.prev }">
					<li><a
						href='<c:url value="/message?ck=${ck}&page=${pageMaker.startPage-1 }"/>'><i
							class="fa fa-chevron-left"></i></a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="pageNum">
					<li><a
						href='<c:url value="/message?ck=${ck}&page=${pageNum}"/>'><i
							class="fa">${pageNum }</i></a></li>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
					<li><a
						href='<c:url value="/message?ck=${ck}&page=${pageMaker.endPage+1 }"/>'><i
							class="fa fa-chevron-right"></i></a></li>
				</c:if>

			</ul>
		</div>

	</div>
</div>