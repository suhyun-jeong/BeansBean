<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<H1>제품 등록 화면입니다.</H1>
<jsp:include page="common/top.jsp" flush="true"/><br>	
<jsp:include page="common/manu.jsp" flush="true"></jsp:include><br>
<hr>
<jsp:include page="goods/insertGoods.jsp" flush="true"></jsp:include><br>
</body>
</html>