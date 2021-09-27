<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">

<link href="/css/customer/layout.css" type="text/css" rel="stylesheet" />
<style>
.content-container {
	display: flex;
	flex-direction: row;
	margin-left: auto;
	margin-right: auto;
	height: auto;
}
</style>

<script>
	document.ondragstart = new Function('return false');
	document.onselectstart = new Function('return false');
	document.oncontextmenu = function(e) {
		alert("오른쪽버튼을 이용할 수 없습니다...");
		return false
	}
</script>
</head>



<body onselectstart="return false" oncontextmenu="return false"
	onfragstart="return falses">
	<!-- header 부분 -->
	<tiles:insertAttribute name="header" />


	<!-- --------------------------- <body> --------------------------------------- -->
	<div id="body" style="display: flex;">
		<div class="content-container">

			<!-- aside 부분 -->
			<tiles:insertAttribute name="aside" />


			<!-- --------------------------- main --------------------------------------- -->

			<tiles:insertAttribute name="body" />

		</div>
	</div>

	<!-- ------------------- <footer> --------------------------------------- -->

	<div style="background: #313131; padding-left: 452px; width: 100%" >
		<tiles:insertAttribute name="footer" />
	</div>
</body>

</html>