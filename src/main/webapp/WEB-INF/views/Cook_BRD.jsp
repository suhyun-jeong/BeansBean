<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cook_BRD</title>
</head>
<body>
<h1>래시피 게시판</h1>
	<jsp:include page="common/top.jsp" flush="true"/><br>	<!-- 상단 메뉴 바 -->
	<jsp:include page="common/manu.jsp" flush="true"></jsp:include><br>
	<hr>
	<jsp:include page="boards/Cook_BRD_view.jsp" flush="true"></jsp:include><br>
	
</body>
</html>