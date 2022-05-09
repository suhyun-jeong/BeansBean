<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 상단 메뉴 바 -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 로그인되어있을 때 -->
<c:if test="${not empty login}">
	<a href="logout">로그아웃</a>
	<a href="mypage">마이페이지</a>
	<a href="">장바구니</a>
</c:if>

<!-- 로그인되어있지 않을 때 -->
<c:if test="${empty login}">
	<a href="loginForm">로그인</a>
	<a href="memberForm">회원가입</a>
</c:if>