<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 로그인 폼 -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style type="text/css">
	span {
		display:inline-block;
		width:70px;
		cursor:default;
	}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		var input_id = $("#userid");
		var input_pw = $("#passwd");
		
		// 빈칸 검사
		$("form").submit(function(event) {
			if (input_id.val().length < 1) {
				event.preventDefault();
				alert("아이디를 입력해주세요.");
				input_id.focus();
			} else if (input_pw.val().length < 1) {
				event.preventDefault();
				alert("비밀번호를 입력해주세요.");
				input_id.focus();
			} else {
				if (!idpwCheck) {
					event.preventDefault();
					alert("아이디 혹은 비밀번호를 확인해주세요.");					
				}
			}
		});
	});
</script>

<!-- 아이디 혹은 비밀번호가 일치하지 않을 때 -->
<c:if test="${not empty loginMsg}">
	<script type="text/javascript">alert("${loginMsg}")</script>
	<% session.removeAttribute("loginMsg"); %>
</c:if>

<!-- 로그인 폼 -->
<form action="login" method="post">
	<table>
		<tr>
			<td>
				<span style="display:inline-block;width:70px;cursor:default;">아이디: </span> 
				<input type="text" name="userid" id="userid" class="loginInput"><br>
				<span style="display:inline-block;width:70px;cursor:default;">비밀번호: </span>
				<input type="text" name="passwd" id="passwd" class="loginInput">
			</td>
			<td>
				<input type="submit" value="로그인" style="width:60px;height:50px;">
			</td>
		</tr>
	</table>
</form>
