<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
</head>
<body>
<H1>회원가입 화면입니다.</H1>

	<jsp:include page="common/top.jsp" flush="true"/><br>	<!-- 상단 메뉴 바 -->
	<jsp:include page="common/menu.jsp" flush="true"></jsp:include><br>
	
<hr>
<jsp:include page="member/memberForm.jsp" flush="true"></jsp:include><br>
</body>
</html>