<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("input:radio[name='gcategory']:radio[value='${gdto.gcategory}']").prop('checked', true); 
		
		$("#image").change(function() {//gimage 변경
			var form = new FormData();
			form.append("image",$("#image")[0].files[0]);
			$.ajax({
				url:"imageName",
				type: "post",
				data: form, 
				contentType : false,
				processData : false,
				success: function (data,status,xhr) {
					$("#gimage").val(data);
					$("#fakeImage").val(data);
				},
				error: function(xhr,status,error) {
					console.log(error);
				}
			});//end ajax
		});
		
		 $("#vADD").click(function() {//제품종류 input 추가
				event.preventDefault();
				if ($("#Variation").children("#emptyVariation").length != 0) {	
					$("#Variation").children("#emptyVariation").remove();
				}
				$("#Variation").append("<div class='VRI'>종류:<input type='text' name='vcategory'></div>");
		}); //vADD end
				
		 $("#bADD").click(function() {//번들 input 추가
			event.preventDefault();
			if ($("#Bundle").children("#emptyBundle").length != 0) {	
				$("#Bundle").children("#emptyBundle").remove();
			}
			$("#Bundle").append("<div class='BUD'>번들:<input type='text' name='bcategory'> 번들가격:<input type='text' name='bprice'><br></div>");
			}); //bADD end
			
		$("#vDEL").click(function() {
			event.preventDefault();
			$("#Variation").children(".VRI").last().remove();
			if ($("#Variation").children(".VRI").length == 0) {	
				$("#Variation").append("<span id='emptyVariation'>종류없음</span>");
			}
		});
		$("#bDEL").click(function() {
			event.preventDefault();
			$("#Bundle").children(".BUD").last().remove();
			if ($("#Bundle").children(".BUD").length == 0) {	
				$("#Bundle").append("<span id='emptyBundle'>번들없음</span>");
			}
		});
		
		$("#goodsForm").submit(function(event) {
			var inputCheck = true;
			$("#goodsForm").children("input").each(function() {
				if (this.value.length < 1) {
					inputCheck = false;
					return false;
				}
			});
			if (!inputCheck){
				alert("모든 칸을 채워주세요.");
			}else {
				if ($("#image").val().length != 0) {
					imageUpload();
				}
				delVriBud();
				goodsUpdate();
				insertVariation();
				insertBundle();
			}
			return inputCheck;
		});//submit end
	});//ready end
	
	function imageUpload() {//이미지 저장, imageUpload의 dir변경
		var form = new FormData();
		form.append("image",$("#image")[0].files[0]);
		$.ajax({
			url:"imageUpload",
			type: "post",
			data: form, 
			contentType : false,
			processData : false,
			async:false,
			success: function (data,status,xhr) {
			},
			error: function(xhr,status,error) {
				console.log(error);
			}
		});//end ajax
	}//imageUpload end
	
	function insertVariation() {//each를 이용해서  variation 저장
		$(".VRI").each(function(i, element) {
			var vcategory = $(this).children("input[name=vcategory]").val();
		$.ajax({
			url:"insertVariation",
			type: "get",
			async:false,
			data: {gcode: "${gdto.gcode}", vcategory : vcategory}, 
			dataType: "text"
		});//end ajax
		});//each end
	}//insertVariation end
	
	function insertBundle() {//each를 이용해서  bundle 저장
		$(".BUD").each(function(i, element) {
			var bcategory = $(this).children("input[name=bcategory]").val();
			var bprice = $(this).children("input[name=bprice]").val();
			$.ajax({
				url:"insertBundle",
				type: "get",
				async:false,
				data: {gcode: "${gdto.gcode}", bcategory : bcategory, bprice: bprice }, 
				dataType: "text"
			});//end ajax
		});//each end
	}//insertBundle end
	
	function delVriBud() {//variation과 bundle 제거
		$.ajax({
			url:"delVriBud",
			type: "get",
			async:false,
			data: {gcode: "${gdto.gcode}"},
			dataType: "text"
		});//end ajax
	}//delVriBud end
	
	function goodsUpdate(){//제품 db추가
    	var queryString = $("#goodsForm").serialize() ;
    	$.ajax({
    		type : 'post', 
    		url : 'goodsUpdate', 
    		data : queryString, 
    		dataType : 'json' ,
    		async:false
    		});
  
    }
</script>

제품이미지: <input type="file" name="file" id="image" ><br>
<hr>

<form id="goodsForm" action="CtrlGoods" >
<input type="hidden" name="gcode" value="${gdto.gcode}">
<input type="hidden" name="gimage" id="gimage" value="${gdto.gimage}">
이미지명: <input type="text" id="fakeImage" value="${gdto.gimage}" disabled="disabled"><br>
제품코드:${gdto.gcode}
<br> 
제품카테고리:
	<label><input type="radio" name="gcategory" value="beverage"> beverage</label>
	<label><input type="radio" name="gcategory" value="coffee"> coffee</label>
    <label><input type="radio" name="gcategory" value="liquid"> liquid</label><br> 
제품 이름:<input type="text" name="gname" value="${gdto.gname}"><br> 
제품단일 가격 :<input type="text" name="gprice" value="${gdto.gprice}"><br>
제품 재고:<input type="text" name="gamount" value="${gdto.gamount}"><br>

<div id="Variation">
<c:if test="${empty vlist}">
	<span id="emptyVariation">종류없음</span>
</c:if>
<c:forEach var="vdto" items="${vlist}" varStatus="status" >
	<div class='VRI'>
	종류:<input type="text" name="vcategory" value="${vdto.vcategory}">
	</div>
</c:forEach>
</div>
<button id="vADD" >종류추가</button>
<button id="vDEL">종류삭제</button><br>

<div id="Bundle">
<c:if test="${empty blist}">
<span id="emptyBundle">번들없음</span>
</c:if>
<c:forEach var="bdto" items="${blist}" varStatus="status" >
	<div class="BUD">
	번들:<input type="text" name="bcategory" value="${bdto.bcategory}">
	번들가격:<input type="text" name="bprice" value="${bdto.bprice}">
	</div>
</c:forEach>
</div>
<button id="bADD">번들추가</button>
<button id="bDEL">번들삭제</button><br>
<hr>

<input type="submit" value="수정">
</form>

