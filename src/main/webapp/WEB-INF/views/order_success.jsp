<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 상품 주문 완료 페이지 -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<c:if test="${not empty success}">
	<script type="text/javascript">alert("${success}")</script>
	<% session.removeAttribute("success"); %>
</c:if>

</head>
<body>
	<H1>주문 완료 화면입니다.</H1>

	<jsp:include page="common/top.jsp" flush="true" /><br>	<!-- 상단 메뉴 바 -->
	<jsp:include page="common/manu.jsp" flush="true" /><br>

	<hr>
	
	<jsp:include page="order/order_success_view.jsp" flush="true" />
</body>
</html>