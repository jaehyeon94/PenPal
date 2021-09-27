<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>PanPal</title>

  <link href="/css/layout.css" type="text/css" rel="stylesheet" />

     <script>
     	document.ondragstart = new Function('return false');
     	document.onselectstart = new Function('return false');
     	document.oncontextmenu = function (e) {
     	   alert("오른쪽버튼을 이용할 수 없습니다...");
     	   return false
     	}
    </script>
</head>

<body onselectstart="return false" oncontextmenu="return false" onfragstart="return falses">
    <!-- header 부분 -->

    <tiles:insertAttribute name="header" />

    <!-- --------------------------- <body> --------------------------------------- -->

  <tiles:insertAttribute name="body" />

    <!-- ------------------- <footer> --------------------------------------- -->

<tiles:insertAttribute name="footer" />

  
</body>

</html>