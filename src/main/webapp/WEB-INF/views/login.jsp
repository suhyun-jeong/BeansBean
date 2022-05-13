<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<h1>로그인 화면입니다.</h1>

	<jsp:include page="common/top.jsp" flush="true" />	<!-- 상단 메뉴 바 -->

	<hr>
	
	<jsp:include page="member/loginForm.jsp" flush="true" />	<!-- 로그인 폼 -->
</body>
</html>