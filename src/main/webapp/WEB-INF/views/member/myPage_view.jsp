<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 회원 정보 화면 -->

<style type="text/css">
	th {
		text-align:right;
		padding-right:20px;
	}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// 빈칸 검사		
		$("form").submit(function(event) {
			var inputCheck = true;
			
			$("input").each(function() {
				if (this.value.length < 1) {
					inputCheck = false;
					return false;
				}
			});
			if (!inputCheck)
				alert("모든 칸을 채워주세요.");
			
			return inputCheck;
		});
	});
</script>

<!-- 회원 정보 폼 -->
<form action="userInfoUpdate" method="post">
	<table>
		<tr>
			<th>아이디</th>
			<td>
				abc123
				<span style="margin-left:20px;">(일반 회원)</span>
			</td>
		</tr>
		
		<tr><td colspan="3"><hr></td></tr>
		
		<tr>
			<th>이름</th>
			<td><input type="text" name="username" id="username" placeholder="이름 " size="6"></td>
		</tr>
		
		<tr><td colspan="3"><hr></td></tr>
		
		<tr>
			<th>주소</th>
			<td>
				<input type="text" name="post" id="sample4_postcode" placeholder="우편번호" size="5" maxlength="5">
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" name="addr1" id="sample4_roadAddress" placeholder="도로명주소">
				<input type="text" name="addr2" id="sample4_jibunAddress" placeholder="지번주소">
				<span id="guide" style="color:#999"></span>
			</td>
		</tr>
		
		<tr><td colspan="3"><hr></td></tr>
		
		<tr>
			<th>전화번호</th>
			<td>
				<select name="phone1" id="phone1" class="phoneNumber">
					<option value="010">010</option>
					<option value="011">011</option>
				</select>
				-
				<input type="text" name="phone2" id="phone2" class="phoneNumber" size="4" maxlength="4">
				-
				<input type="text" name="phone3" id="phone3" class="phoneNumber" size="4" maxlength="4">
			</td>
		</tr>
		
		<tr><td colspan="3"><hr></td></tr>
		
		<tr>
			<th>이메일</th>
			<td>
				<input type="text" name="email1" id="email1" class="emailAddress" size="12">
				@
				<input type="text" name="email2" id="email2" class="emailAddress" placeholder="도메인">
				<select id="emailSelect" class="emailAddress">
					<option value="daum.net">daum.net</option>
					<option value="naver.com">naver.com</option>
				</select>
			</td>
		</tr>
	</table>
	
	<br>
	
	<input type="submit" value="정보 수정">
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