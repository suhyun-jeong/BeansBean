<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 상단 메뉴 바 -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 로그인되어있을 때 -->
<c:if test="${not empty login}">
	<p style="cursor:default;">&nbsp;<b>${login.username}</b><span style="font-size:12px;">(${login.userid})</span> 님</p>
	
	<a href="logout">로그아웃</a>
	<a href="mypage">마이페이지</a>
	<a href="cartList">장바구니</a>
	
	<c:if test="${login.usercode == 10}">	<!-- 관리자 페이지 -->
			<a href="CtrlGoods">상품 관리</a>
			<a href="goodsinsert">상품 등록</a>
<<<<<<< HEAD
		<p><b>${login.username}</b> 님</p>
		
	<a href="logout">로그아웃</a>
		<a href="mypage">마이페이지</a>
		<a href="">장바구니</a>
	
		<c:if test="${login.usercode == 10}">	<!-- 관리자 페이지 -->
			<a href="">판매 관리</a>
		</c:if>
=======
>>>>>>> 29c1b838cc59025f5a46142b0794cff116e5c012
	</c:if>
</c:if>


<!-- 로그인되어있지 않을 때 -->
<c:if test="${empty login}">
	<a href="loginForm">로그인</a>
	<a href="memberForm">회원가입</a>
</c:if>