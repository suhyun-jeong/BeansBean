<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
<script type="text/javascript">
	var Variationindex = 1;
	var Bundleindex = 1;
	$(function() {
		$("#image").change(function() {//gimage 변경
			console.log("change");
			imageName();
		});
		
		 $("#vADD").click(function() {//제품종류 input 추가
			event.preventDefault();
			Variationindex++;
			$("#Variation").append("제품 종류("+Variationindex+"):<input type='text' name='vcategory' class='VCA'><br>");
			}); //vADD end
			
		 $("#bADD").click(function() {//번들 input 추가
			event.preventDefault();
			Bundleindex++;
			$("#Bundle").append("번들("+Bundleindex+"): <input type='text' name='bcategory' id='bcategory"+Bundleindex+"'><br> 번들가격("+Bundleindex+"): <input type='text' name='bprice'id='bprice"+Bundleindex+"'><br>");
			}); //bADD end
		
	
		$("#gcode").keyup(function() {//코드중복 검사
			$.ajax({
				url:"gcodeDuplicateCheck",
				type: "get",
				data: {gcode : $("#gcode").val()}, 
				dataType: "text",
				success: function (data,status,xhr) {
					$("#result").text(data);
				},
				error: function(xhr,status,error) {
					console.log(error);
				}
			});//end ajax
		});//end keyup
		
		$("#submitBtn").click(submit); //submitBtn end
		
		
	});//end ready 
	
		 function submit() {//동기로 구현
			goodsInsert();
			imageUpload();	
			insertVariation();
			insertBundle();
			location.href = "goodsinsert"; //후에 변경완료페이지로 이동
		}
		
	
	   function goodsInsert(){//제품 db추가
	    	var queryString = $("#goodsForm").serialize() ;
	    	$.ajax({
	    		type : 'post', 
	    		url : 'insertGoods', 
	    		data : queryString, 
	    		dataType : 'json' ,
	    		async:false
	    		});
	  
	    }
	
	function imageName() {//이미지 이름 추출
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
				console.log($("#gimage").val());
			},
			error: function(xhr,status,error) {
				console.log(error);
			}
		});//end ajax
	}// imageName end
	
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
		$(".VCA").each(function(i, element) {
		$.ajax({
			url:"insertVariation",
			type: "get",
			async:false,
			data: {gcode: $("#gcode").val() , vcategory : $(this).val()}, 
			dataType: "text",
			success: function (data,status,xhr) {
			},
			error: function(xhr,status,error) {
				console.log(error);
			}
		});//end ajax
		});//each end
	}//insertVariation end
	
	function insertBundle() {//for 이용해서  bundle 저장
		console.log(Bundleindex);
		for (var i = 1; i < Bundleindex + 1 ; i++) {
			console.log(i);
		$.ajax({
			url:"insertBundle",
			type: "get",
			async:false,
			data: {gcode: $("#gcode").val(), bcategory : $("#bcategory"+i).val(), bprice: $("#bprice"+i).val()}, 
			dataType: "text",
			success: function (data,status,xhr) {
			},
			error: function(xhr,status,error) {
				console.log(error);
			}
		});//end ajax
		}//for end
	}//insertBundle end

</script>

제품이미지: <input type="file" name="file" id="image"><br>
<hr>

<form id="goodsForm">
<input type="hidden" name="gimage" id="gimage" value="null">
제품코드:<input type="text" name="gcode" id="gcode">
<span id="result"></span>
<br> 
제품카테고리:<input type="text" name="gcategory" id="gcategory"><br> 
제품 이름:<input type="text" name="gname"><br> 
제품단일 가격 :<input type="text" name="gprice"><br>
제품 재고:<input type="text" name="gamount"><br>
<div id="Variation">
제품 종류(1):<input type="text" name="vcategory" class="VCA"><button id="vADD">추가하기</button><br>
</div>
<div id="Bundle">
번들(1): <input type="text" name="bcategory" id="bcategory1"><button id="bADD">추가하기</button><br>
번들가격(1): <input type="text" name="bprice" id="bprice1"><br>
</div>
<input type="reset" value="취소"><br>
</form>
<hr>



<button id="submitBtn">등록</button>

