<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Info_BRD</title>
</head>
<body>
<h1>사업자 게시판</h1>
	<jsp:include page="common/top.jsp" flush="true"/><br>	<!-- 상단 메뉴 바 -->
	<jsp:include page="common/menu.jsp" flush="true"></jsp:include><br>
	<hr>
	<jsp:include page="boards/Info_BRD_write.jsp" flush="true"></jsp:include><br>
	
</body>
</html>