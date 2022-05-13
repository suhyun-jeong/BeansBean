<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 상품 한 개 주문 뷰 -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style type="text/css">
	table {
		border-spacing:5px;
		border-collapse:separate;
		cursor:default;
	}
	
	#goodsInfo #goodsValues td {
		padding:0 20px;
	}
	
	.placeInfo th {
		padding:0 10px;
	}
</style>

<script type="text/javascript">
	$(function() {
		var bCategory = "<c:out value='${cDTO.bcategory}' />";
		var gPrice = parseInt($("#price").text());
		var gAmount = parseInt($("#gamount").val());

		
		// 도매 상품일 경우 번들에서 숫자 및 단위 추출
		if (bCategory != "") {	// 도매 품목일 경우
			var bundleInt = parseInt(bCategory.replaceAll("[^\\d]", ""));	// 번들에서 숫자 추출
			if (isNaN(bundleInt/1))	// 숫자를 추출하지 못했다면 초기값으로 1 지정
				bundleInt = 1;
			var bundleUnit = bCategory.replace(bundleInt.toString(), "").trim();	// 번들에서 단위 추출
			$("#bTotal").text(bundleInt * gAmount + " (" + bundleUnit + ")");	// 전체 수량 화면에 출력
		}
		
		$("#totalPrice").text(gPrice * gAmount);	// 총합 출력
		
		
		// 수량 입력창에 숫자만 받기
		$("#gamount").keyup(function(event) {	// 숫자 외의 값을 입력하면 입력창 초기화
			if (event.keyCode == 8 || event.keyCode == 13) {	// backspace or enter
				if ($("#gamount").val().length > 0)		// 입력창이 비어있지 않을 때
					$("#totalPrice").text(gPrice * gAmount);	// 총합 출력
				else
					$("#totalPrice").text(0);	// 총합 0으로 초기화
				
				return;
			}
			
			if (!((event.keyCode >= 48 && event.keyCode <= 57)	// 0~9가 아닐 경우
					|| (event.keyCode >= 96 && event.keyCode <= 105)))	// Num Lock 키패드 0~9가 아닐 경우
				$("#gamount").val(0);	// 입력창 초기화
			
			$("#totalPrice").text(gPrice * $("#gamount").val());	// 총합 출력
		});
		$("#gamount").bind("paste", function(event) {	// 붙여넣기하면 입력창 초기화
			$("#gamount").val(0);	// 입력창 초기화
		
			$("#totalPrice").text(gPrice * $("#gamount").val());	// 총합 출력
		});
		
		
		// 계정에 저장된 배송지 정보 사용하기
		$("#same1").click(function() {
			var checked = this.checked;
			
			if (checked) {	// 체크되었을 때
				$(".userAddress").each(function(idx, ele) {
					var input = $(".inputPlace").get(idx);
					input.value = this.value;
					input.setAttribute("readonly", "readonly");
				});
				$("#postBtn").attr("disabled", "disabled");
			} else {	// 체크 해제
				$(".inputPlace").each(function(idx, ele) {
					this.value = "";
					this.removeAttribute("readonly");
				});
				$("#postBtn").removeAttr("disabled");
			}
		});
		
		// 계정에 저장된 연락처 정보 사용하기
		$("#same2").click(function() {
			var checked = this.checked;
			
			if (checked) {	// 체크되었을 때
				$(".userPhone").each(function(idx, ele) {
					if (idx == 0) {	// select
						$("#phone1").val(this.value).prop("selected", true);
						$("#phone1").attr("readonly", "readonly");
					} else {	// input text
						var input = $(".inputPhone").get(idx);
						input.value = this.value;
						input.setAttribute("readonly", "readonly");
					}
				});
			} else {	// 체크 해제
				$(".inputPhone").each(function(idx, ele) {
					this.value = "";
					this.removeAttribute("readonly");
				});
			}
		});
		
		
		// 빈칸 검사
		$("form").submit(function(event) {
			// 상품 수량 입력란 확인
			if ($("#gamount").val().length < 1 || $("#gamount").val() == 0) {
				alert("상품 수량을 확인해주세요.");
				$("#gamount").focus();
				return false;
			}
			
			// 배송지 및 연락처 입력란 확인
			var inputCheck = true;
			$("input[class^=input]").each(function(idx, ele) {
				if (this.value.length < 1)
					inputCheck = false;
			});
			if ($("#phone1").val() == null)
				inputCheck = false;
			
			// 경고창 표시
			if (!inputCheck)
				alert("모든 칸을 채워주세요.");

			// 가격 총합에 대한 데이터 폼에 담기
			$("#gprice").val($("#totalPrice").text());
			
			return inputCheck;
		});
	});
</script>

<form action="oneGoodsOrder" method="post">
	<input type="hidden" name="num" value="${cDTO.num}">
	<input type="hidden" name="userid" value="${login.userid}">
	<input type="hidden" name="gcode" value="${cDTO.gcode}">
	<input type="hidden" name="gname" value="${cDTO.gname}">
	<input type="hidden" name="bcategory" value="${cDTO.bcategory}">
	<input type="hidden" name="vcategory" value="${cDTO.vcategory}">
	<input type="hidden" id="gprice" name="gprice" value="${cDTO.gprice * cDTO.gamount}">
	<input type="hidden" name="gimage" value="${cDTO.gimage}">

	<h3 style="cursor:default;">주문 상품 확인</h3>
	<table id="goodsInfo">
		<!-- 구분선 -->
		<tr>
			<c:if test="${not empty cDTO.bcategory}">	<!-- 도매 품목 -->
				<td colspan="8"><hr></td>
			</c:if>
			<c:if test="${empty cDTO.bcategory}">	<!-- 소매 품목 -->
				<td colspan="6"><hr></td>
			</c:if>
		</tr>
		
		<tr>
			<th>주문 번호</th>
			<th colspan="2">상품 정보</th>
			<c:if test="${not empty cDTO.bcategory}">	<!-- 도매 품목 -->
				<th>번들</th>
			</c:if>
			<th>옵션</th>
			<th>판매가</th>
			<th>수량</th>
			<c:if test="${not empty cDTO.bcategory}">	<!-- 도매 품목 -->
				<th>전체 수량</th>
			</c:if>
		</tr>
		
		<!-- 구분선 -->
		<tr>
			<c:if test="${not empty cDTO.bcategory}">	<!-- 도매 품목 -->
				<td colspan="8"><hr></td>
			</c:if>
			<c:if test="${empty cDTO.bcategory}">	<!-- 소매 품목 -->
				<td colspan="6"><hr></td>
			</c:if>
		</tr>
		
		<tr id="goodsValues">
			<td style="text-align:center;">${cDTO.num}</td>
			<td style="">
				<c:forTokens var="token" items="${cDTO.gimage}" delims="." varStatus="status">
					<c:if test="${status.last}">
						<c:choose>
							<c:when test="${token eq 'jpg' || token eq 'gif' || token eq 'png' || token eq 'bmp'}">
								<img src="images/${cDTO.gimage}" border="0" width="80" alt="상품 이미지" />
							</c:when>
							<c:otherwise>
								<img src="images/${cDTO.gimage}.jpg" border="0" width="80" alt="상품 이미지" />
							</c:otherwise>
						</c:choose>
					</c:if>
				</c:forTokens>
			</td>
			<td>${cDTO.gname}</td>
			<c:if test="${not empty cDTO.bcategory}">	<!-- 도매 품목 -->
				<td>${cDTO.bcategory}</td>
			</c:if>
			<td>${cDTO.vcategory}</td>
			<td id="price" style="text-align:center;">
				<c:if test="${not empty cDTO.bcategory}">	<!-- 도매 품목 -->
					<%-- ${bDTO.bprice} //bunble 테이블에서 gCode로 검색해 가져온 DTO --%>
					${cDTO.gprice}<!-- 임시데이터 -->
				</c:if>
				<c:if test="${empty cDTO.bcategory}">	<!-- 소매 품목 -->
					${cDTO.gprice}
				</c:if>
			</td>
			<td>
				<input type="text" id="gamount" name="gamount" value="${cDTO.gamount}" size="2">
			</td>
			<c:if test="${not empty cDTO.bcategory}">	<!-- 도매 품목 -->
				<td id="bTotal" style="text-align:center;"></td>
			</c:if>
		</tr>
		
		<!-- 구분선 -->
		<tr>
			<c:if test="${not empty cDTO.bcategory}">	<!-- 도매 품목 -->
				<td colspan="8"><hr></td>
			</c:if>
			<c:if test="${empty cDTO.bcategory}">	<!-- 소매 품목 -->
				<td colspan="6"><hr></td>
			</c:if>
		</tr>
		
		<tr>
			<c:if test="${not empty cDTO.bcategory}">	<!-- 도매 품목 -->
				<td colspan="8">
					총 결제 금액: <span id="totalPrice"></span>원
				</td>
			</c:if>
			<c:if test="${empty cDTO.bcategory}">	<!-- 소매 품목 -->
				<td colspan="6">
					총 결제 금액: <span id="totalPrice"></span>원
				</td>
			</c:if>
		</tr>
	</table><br>

	<h3 style="cursor:default;">배송지 정보</h3>
	<table id="orderPlace">
		<!-- 유저 정보에서 가져온 배송지 -->
		<c:if test="${not empty login}">	<!-- 로그인되어있을 때 -->
			<tr>
				<td>
					<table id="loginUser" class="placeInfo">
						<tr>
							<th>이름</th>
							<td>
								<input type="text" size="6" value="${login.username}" readonly>
							</td>
						</tr>
					
						<tr><td colspan="2"><hr></td></tr>
					
						<tr>
							<th>주소</th>
							<td>
								<input type="text" class="userAddress" size="5" maxlength="5" value="${login.post}" readonly>
								<!-- <input type="button" onclick="" value="우편번호 찾기"> -->
								<br>
								<input type="text" class="userAddress" value="${login.addr1}" readonly>
								<input type="text" class="userAddress" value="${login.addr2}" readonly>
								<!-- <span id="guide" style="color:#999"></span> -->
							</td>
						</tr>
					
						<tr><td colspan="2"><hr></td></tr>
						
						<tr>
							<th>전화번호</th>
							<td>
								<input type="text" class="userPhone" size="3" maxlength="3" value="0${login.phone1}" readonly>
								-
								<input type="text" class="userPhone" size="4" maxlength="4" value="${login.phone2}" readonly>
								-
								<input type="text" class="userPhone" size="4" maxlength="4" value="${login.phone3}" readonly>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			
			<tr>
				<td style="padding:10px;font-size:12px;">
					<div style="margin:20px 0;padding:10px;border:1px lightgrey solid;">
						<input type="checkbox" id="same1"> 계정에 저장된 배송지를 사용합니다.<br>
						<input type="checkbox" id="same2"> 계정에 저장된 연락처를 사용합니다.
					</div>
				</td>
			</tr>
		</c:if>
		
		<tr>
			<td>
				<!-- 새로 입력할 배송지 -->
				<table id="loginUser" class="placeInfo">
					<tr>
						<th>수취인</th>
						<td>
							<input type="text" id="ordername" class="inputName" name="ordername" size="6" value="">
						</td>
					</tr>
					
					<tr><td colspan="2"><hr></td></tr>
					
					<tr>
						<th>배송지</th>
						<td>
							<input type="text" name="post" id="sample4_postcode" class="inputPlace" placeholder="우편번호" size="5" maxlength="5" value="${userInfo.post}">
							<input type="button" id="postBtn" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" name="addr1" id="sample4_roadAddress" class="inputPlace" placeholder="도로명주소" value="${userInfo.addr1}">
							<input type="text" name="addr2" id="sample4_jibunAddress" class="inputPlace" placeholder="지번주소" value="${userInfo.addr2}">
							<span id="guide" style="color:#999"></span>
						</td>
					</tr>
					
					<tr><td colspan="2"><hr></td></tr>
					
					<tr>
						<th>연락처</th>
						<td>
							<select name="phone1" id="phone1" class="inputPhone">
								<option value="010" <c:if test="${userInfo.phone1 == 010}">selected="selected"</c:if>>010</option>
								<option value="011" <c:if test="${userInfo.phone1 == 011}">selected="selected"</c:if>>011</option>
							</select>
							-
							<input type="text" name="phone2" id="phone2" class="inputPhone" size="4" maxlength="4" value="${userInfo.phone2}">
							-
							<input type="text" name="phone3" id="phone3" class="inputPhone" size="4" maxlength="4" value="${userInfo.phone3}">
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table><br>
	
	<h3 style="cursor:default;">결제 수단</h3>
	<div style="cursor:default;">
		<input type="radio" name="paymethod" value="신용카드" checked="checked">신용카드&nbsp;
		<input type="radio" name="paymethod" value="계좌이체">계좌이체&nbsp;
		<input type="radio" name="paymethod" value="무통장입금">무통장입금&nbsp;
		<input type="radio" name="paymethod" value="카카오페이">카카오페이&nbsp;
	</div><br>
	
	<input type="submit" value="상품 구매">
</form>

<!-- 주소 검색 - 다음 API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>