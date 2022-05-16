<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function () {
		
		
		
		$("#btnSave").click(function (event) {
			
			var title = $("#title").val();
			var content = $("#content").val();
			var checked = $('input[name=type_num]:checked').val();
			
			if(title.length < 1 || content.length <1 || checked ==null){
				event.preventDefault();
				alert("제목과 내용을 확인하시고 주제를 선택해주세요");
				document.form1.title.focus();
			}
			
			else{
				document.form1.submit();
			}
			
			
		})
	}); //ready end
	
	
	
	
		
	
	

</script>

<h2>사업자 게시글 작성</h2>
<form name="form1" method="post" action="Info_BRD_insert">
	<input type="hidden" name="userid" value="${login.userid}">
	<div>작성자 :${login.userid}</div>
	<div>
		제목  <input name="title" id="title" size="80" placeholder="제목을 입력해주세요.">
	</div>
	<div>
		내용<textarea name="content" id="content" rows="50" cols="200" placeholder="내용을 입력해주세요."></textarea>
	</div>
	<div>
		주제 
		<c:if test="${ login.usercode =='10' or '20'}">
		<input type="radio" id="type_num" name="type_num"  value="10"/>공지
		</c:if>
		<input type="radio" id="type_num" name="type_num"  value="20"/>사업
	</div>
	<div style="width:650px; text-align: left;">
		
		<button type="button" id="btnSave">확인</button>
		<button type="reset">취소</button>
		<button type="button" onclick="history.back()">뒤로가기</button>
	</div>
	
	
	
	
	
	
	
	
	
</form>