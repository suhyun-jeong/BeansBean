<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 상품 한 개 주문 화면 -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order</title>
</head>
<body>
	<H1>상품 주문 화면입니다.</H1>

	<jsp:include page="common/top.jsp" flush="true" /><br>	<!-- 상단 메뉴 바 -->
	<jsp:include page="common/menu.jsp" flush="true" /><br>

	<hr>
	
	<jsp:include page="order/order_view.jsp" flush="true" />
</body>
</html>