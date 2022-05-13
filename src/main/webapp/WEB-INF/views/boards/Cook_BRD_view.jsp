<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		
		$("#btnWrite").click(function () {
			
			location.href ="Cook_BRD_write";
		})
		
	})
</script>
    
<form>
<h2>래시피 게시글 목록 </h2>

<% if(session.getAttribute("login") !=null)  {%>
<button type="button" id="btnWrite">글쓰기</button>
<% } %>

<table width="100%" cellspacing="0" cellpadding="0" border="1">
	<tr>
		<th>번호</th>
		<th>주제</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
	</tr>
	
	<c:forEach var="cook" items="${Cook}">
	
	<tr>
		<td>${cook.num}</td>
		<td>
			 <c:choose>
				<c:when test="${cook.type_num eq '10' }">
					공지
				</c:when>
				<c:otherwise>
					자유
				</c:otherwise>
			</c:choose> 
		</td>
		<td>
		  <a href="Cook_BRD_DetailView?num=${cook.num}">${cook.title}</a>
		</td>
		<td>${cook.userid}</td>
		<td>${cook.regdate}</td>
	
	</c:forEach>
</table>

</form>
