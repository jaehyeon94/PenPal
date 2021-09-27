<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<script type="text/javascript"
	src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		var currentPage = 1;
		var isLoading = false;
		$(".back-drop").hide();
		$(function() {
			$(window).on("scroll", function() {
				var scrollTop = $(window).scrollTop();
				var windowHeight = $(window).height();
				var documentHeight = $(document).height();
				var totalPageCount1 = '${totalPageCount}';
				var isBottom = scrollTop + windowHeight + 10 >= documentHeight;
				if (isBottom) {
					/* if ((currentPage == totalPageCount1) || isLoading) {
					return;
					} */
					isLoading = true;
					$(".back-drop").show();
					currentPage++;
					GetList(currentPage);
				}

			});

		});

	});

	const GetList = function(currentPage) {
		$.ajax({
			url : "/boardPage.do?pageNum=" + currentPage + "&ck=${ck}",
			method : "GET",
			success : function(data) {
				$(".card-list").append(data);
				$(".back-drop").hide();
				isLoading = false;
				console.log("ajax");
			},
			error : function(request, status, error) {
				alert("status : " + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});
	}
</script>


<style>
article .main {
	padding: 52px 3% 0;
}

article .main .block {
	padding: 20px;
	min-height: 500px;
}

article .main .block p {
	line-height: 22px;
	color: #fff;
	font-size: 16px;
	font-weight: 600;
}

article .main .block:nth-child(2n+1) {
	background: #999;
}

article .main .block:nth-child(2n) {
	background: #222;
}
</style>


<c:choose>
	<c:when test="${list[0] == null || list[1] == null}">
		<div style="height: 780px; margin-top: 13%;">
	</c:when>
	<c:otherwise>
		<div style="height: auto; margin-top: 13%;">
	</c:otherwise>
</c:choose>

<div style="margin-bottom: 2%; width: 700px;">
	<c:choose>
		<c:when test="${ck == 'every'}">
			<div>
				<div align="left">
					<font style="font-size: 20px; font-weight: 900" align="left">전체
						게시판 </font>
				</div>
			</div>
		</c:when>
		<c:when test="${ck == 'friend'}">
			<h2 style="font-size: 20px; font-weight: 900" align="left">친구
				게시판</h2>

		</c:when>
		<c:when test="${ck == 'my'}">
			<h2 style="font-size: 20px; font-weight: 900" align="left">나의
				게시판</h2>
		</c:when>
	</c:choose>
	<div align="right">
		<a href="#"
			onclick="window.open('/insertBoardform','name','resizable=no width=400 height=320');return false"
			style="margin-left: 5px;">
			<button>글쓰기</button>
		</a>
	</div>
</div>


<section id="card-list" class="card-list">
	<div class="container" style="text-align: left;">
		<c:forEach var="board" items="${list}">


			<div class="row card-list-container thumbnails"
				style="border: 1px solid black; width: 700px; height: auto; margin-bottom: 2%; border-radius: 3%;">
				<div style="width: 700px; height: 70px;">
					<div style="width: 70px; height: 70px; float: left;">
						<c:choose>
							<c:when test="${ck == friend}">
								<a href="memberprofile?id=${board.friend_id}"> <img id="profile"
									class="profile" alt="profile" src="/images/${board.profile}"
									width="50px" height="50px"
									style="cursor: pointer; border-radius: 50%; margin: 8px;"></a>
							</c:when>
							<c:otherwise>
								<a href="profile"> <img id="profile"
									class="profile" alt="profile" src="/images/${board.profile}"
									width="50px" height="50px"
									style="cursor: pointer; border-radius: 50%; margin: 8px;"></a>
							</c:otherwise>
						</c:choose>

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
</section>
<div class="back-drop" style="text-align: center;">
	<img src="/images/loading.svg" />
</div>
</div>


