<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
<title>MAIN</title>
=======
<title>Insert title here</title>
>>>>>>> 37c27722f9f3af1a7a522a9276cb0f02423895b5
<c:if test="${not empty success }">
	<script type="text/javascript">alert("${success}")</script>
</c:if>
</head>
<body>
<H1>메인화면입니다.</H1>

	<jsp:include page="common/top.jsp" flush="true"/><br>	<!-- 상단 메뉴 바 -->
<<<<<<< HEAD
	<jsp:include page="common/manu.jsp" flush="true"></jsp:include><br>
<<<<<<< HEAD
=======
	로그인 여부: <%= session.getAttribute("login") %>
>>>>>>> 37c27722f9f3af1a7a522a9276cb0f02423895b5
=======
	<jsp:include page="common/menu.jsp" flush="true"></jsp:include><br>
>>>>>>> a6bdc312f6916aa0163365ccc983cf932e7a25cc
	
<hr>
<jsp:include page="goods/goodsList.jsp" flush="true"></jsp:include><br>
</body>
</html>