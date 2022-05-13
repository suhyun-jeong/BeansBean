<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
</head>
<body>
<<<<<<< HEAD
	<h1>회원 정보 화면입니다.</h1>
	
	<jsp:include page="common/top.jsp" flush="true" /><br>	<!-- 상단 메뉴 바 -->
<<<<<<< HEAD
	<jsp:include page="common/manu.jsp" flush="true" /><br>
=======
	<h1>회원 정보</h1>
	
	<jsp:include page="common/top.jsp" flush="true" />	<!-- 상단 메뉴 바 -->
>>>>>>> 37c27722f9f3af1a7a522a9276cb0f02423895b5
=======
	<jsp:include page="common/menu.jsp" flush="true" /><br>
>>>>>>> a6bdc312f6916aa0163365ccc983cf932e7a25cc

	<hr>
	
	<jsp:include page="member/myPage_view.jsp" flush="true" />	<!-- 회원 정보 화면 -->
</body>
</html>