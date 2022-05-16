<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
</head>
<body>

	<h1>회원 정보 화면입니다.</h1>
	
	<jsp:include page="common/top.jsp" flush="true" /><br>	<!-- 상단 메뉴 바 -->
	<jsp:include page="common/menu.jsp" flush="true" /><br>

	
	<hr>
	
	<jsp:include page="member/myPage_view.jsp" flush="true" />	<!-- 회원 정보 화면 -->
</body>
</html>