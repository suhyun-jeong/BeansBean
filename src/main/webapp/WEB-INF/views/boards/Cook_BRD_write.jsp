<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function () {
		$("#ingreADD").click(function() {//번들 input 추가
			 event.preventDefault();
			if ($("#Ingrement").children("#emptyIngre").length != 0) {	
				$("#Ingrement").children("#emptyIngre").remove();
			}
			$("#Ingrement").append("<div class='ING'>재료:<input type='text' name='ingre'> 용량:<input type='text' name='capacity'><br></div>");
			}); //bADD end
			
			$("#ingreDEL").click(function() {
				event.preventDefault();
				$("#Ingrement").children(".ING").last().remove();
				if ($("#Ingrement").children(".ING").length == 0) {	
					$("#Ingrement").append("<span id='emptyIngre'>재료정보없음</span>");
				}
			});
		
		
		$("#btnSave").click(function () {
			
			var title = $("#title").val();
			var content = $("#content").val();
			var checked = $('input[name=type_num]:checked').val();
				
			if(title.length < 1 || content.length <1 || checked ==null){
				event.preventDefault();
				alert("제목과 내용을 확인하시고 주제를 선택해주세요");
				document.form1.title.focus();
			}
			
			else{
				cook_BRDInsert();
				ingrementInsert();
				alert("게시물 저장이 완료되었습니다.");
				document.form1.submit();
			}
			
			
			
		})
	});// ready end
	
	 function cook_BRDInsert(){//보드에 db추가
	    	var queryString = $("form[name=form1]").serialize() ;
	    	$.ajax({
	    		type : 'post', 
	    		url : 'Cook_BRD_insert', 
	    		data : queryString, 
	    		dataType : 'json' ,
	    		async:false
	    		});
	  
	    }
	
	 function ingrementInsert() {//ingre 저장
			$(".ING").each(function(i, element) {
				var ingre = $(this).children("input[name=ingre]").val();
				var capacity = $(this).children("input[name=capacity]").val();
				$.ajax({
					url:"ingrementInsert",
					type: "get",
					async:false,
					data: {ingre:ingre, capacity:capacity}, 
					dataType: "text"
				});//end ajax
			});//each end
		}//insertBundle end
	

</script>
<%-- ${login.usercode } >>10!=이면 공지라디오버튼 안보이고 요리디폴트 --%>
<h2>래시피 게시글 작성</h2>
<form name="form1" method="post" action="Cook_BRD">
	<input type="hidden" name="userid" value="${login.userid}">
	<div>작성자 :${login.userid}</div>
	<div>
		제목  <input name="title" id="title" size="80" placeholder="제목을 입력해주세요.">
	</div>
	<div>
		내용<textarea name="content" id="content" rows="50" cols="200" placeholder="내용을 입력해주세요."></textarea>
	</div>
	
	<div id="Ingrement">
	<span id="emptyIngre">재료정보없음</span>
	</div>
	<button id="ingreADD">재료정보추가</button>
	<button id="ingreDEL">재료정보삭제</button><br>
	
	<div>
		주제 
		<c:if test="${ login.usercode =='10' or '20'}">
		<input type="radio" id="type_num" name="type_num"  value="10"/>공지
		</c:if>
		<input type="radio" id="type_num" name="type_num"  value="20"/>요리
	</div>
	<div style="width:650px; text-align: left;">
		
		<button type="button" id="btnSave">확인</button>
		<button type="reset">취소</button>
		<button type="button" onclick="history.back()">뒤로가기</button>
	</div>
	
	
	
	
	
	
	
	
	
</form>