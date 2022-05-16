<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 ${dto}
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function () {
		
		$("#btnBack").click(function () {
		
		})
	})
	
</script>
   <h2> 래시피 게시글 자세히 보기 </h2> 
<form>
	<div>
		작성자 : ${dto.userid}
	</div>
	<div>
		<c:choose>
			<c:when test="${dto.type_num =='10'}">
				주제 - 공지
			</c:when>
			<c:otherwise>
				주제 - 요리
			</c:otherwise>
		</c:choose>
	</div>
	<div>
		제목  <input name="title" id="title" size="80" value="${dto.title }" readonly>
	</div>
	<div>
		내용<textarea name="content" id="content" rows="50" cols="200" readonly>${dto.content}</textarea>
	</div>
	
	<div style="width:650px; text-align: left;">
		<button type="button" onclick="history.back()">뒤로가기</button>
		<c:if test="${login.userid == dto.userid }">
		
		<button type="button" id="btnSave" >수정</button>
		<button type="reset" id="btnDelete">삭제</button>
		</c:if>
	</div>



	
	


</form>
