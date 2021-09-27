<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container" style="text-align: center;">
	<c:forEach var="board" items="${list}">
		<div class="row card-list-container thumbnails"
			style="border: 1px solid black; width: 700px; height: auto; margin-bottom: 2%; border-radius: 3%;">
			<div style="width: 700px; height: 70px;">
				<div style="width: 70px; height: 70px; float: left;">
					<img id="profile" class="profile" alt="profile"
						src="/images/${board.profile}" width="50px" height="50px"
						style="cursor: pointer; border-radius: 50%; margin: 8px;">
				</div>
				<div style="float: left; height: 60px; margin-top: 8px;">
					<font size="5px; "> ${board.nick} <br>
					</font> <font> ${board.birth} </font>
				</div>
			</div>
			<div
				style="height: auto; margin-bottom: 10px; width: 95%; margin-left: 10px;">
				<font> ${board.content} </font>

			</div>
			<div style="margin-bottom: 5px;">
				<img id="profile" class="profile" alt="profile"
					src="/images/${board.photo}" width="698px" height="500px"
					style="cursor: pointer; border-radius: 7px">

			</div>
		</div>

	</c:forEach>
</div>