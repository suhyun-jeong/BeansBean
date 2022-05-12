<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MAIN</title>
<c:if test="${not empty success }">
	<script type="text/javascript">alert("${success}")</script>
</c:if>
</head>
<body>
<H1>메인화면입니다.</H1>

	<jsp:include page="common/top.jsp" flush="true"/><br>	<!-- 상단 메뉴 바 -->
	<jsp:include page="common/manu.jsp" flush="true"></jsp:include><br>
	
<hr>
<jsp:include page="goods/goodsList.jsp" flush="true"></jsp:include><br>
</body>
</html>