<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	li {list-style: none;
		padding: 5px;}
	span {padding-right: 30px;}
</style>
<script>

	/* $(function() {
		$("#cart").on("click", function() {
			$("form").attr("action", "loginCheck/cartAdd")
		})
	}) */

</script>
<%-- <c:if test="${!empty mesg }">
<script>
	alert("${mesg}상품을 장바구니에 담았습니다.");
</script>
<% if(session.getAttribute("mesg")!= null){
	session.removeAttribute("mesg");
} %>
</c:if> --%>
${goodsDetail}
<FORM name="goodDetailForm" method="GET" action="#"><!--action을 막음 --><!-- hidden data -->
	    <input type="hidden" name="gimage" value="${goodsDetail.gimage}"> 
	    <input type="hidden" name="gcode" value="${goodsDetail.gcode}">
	     <input	type="hidden" name="gname" value="${goodsDetail.gname}"> 
	     <input	type="hidden" name="gprice" value="${goodsDetail.gprice}">

${goodsDetail.gname}
	<div>
		<div style='width:80%'>
				<div style='border-bottom:solid 1px #cecece'>
					<h2>${goodsDetail.gname}</h2>
				</div>
					
					<div style='padding: 20px; float: left; width:30%;'>
						<c:forTokens var="token" items="${goodsDetail.gimage}" delims="." varStatus="status">
							<c:if test="${status.last}">
								<c:choose>
									<c:when test="${token eq 'jpg' || token eq 'gif' || token eq 'png' || token eq 'bmp'}">
										<li><img src="images/${goodsDetail.gimage}"
											border="0" align="center" width="300"/></li>
									</c:when>
									<c:otherwise>
										<li><img src="images/${goodsDetail.gimage}.jpg"
										border="0" align="center" width="300"/></li>
									</c:otherwise>
								</c:choose>
							</c:if>
						</c:forTokens>
					</div>
						<div style='width:50%; float:left;'>
						<ul>
							<li class="td_title"><span>상품코드</span><span>${goodsDetail.gcode }</span></li>
						<%-- 	<li class="td_default" style='padding-left: 30px'>
								${goodsDetail.gcode }
							</li> --%>

							<li class="td_title"><span>상품명</span><span>${goodsDetail.gname}</span></li>
							<li class="td_title"><span>가격</span><span style="color: red; font-weight: bolder;">${goodsDetail.gprice}</span></li>

							<li class="td_red" style='padding-left: 30px'>
								
							</li>
							<li class="td_title"><span>배송비</span><span style="padding-right:0px; color: #2e56a9; font-weight: bolder">무료배송</span><span style="font-size: 0.8em;"> (도서
									산간지역 별도 배송비 추가)</span></li>
							<li class="td_title" rowspan="2">상품옵션</li>
							<li style='padding-left: 30px'>
							<select	class="select_change" name="gSize" id="gSize">
									<option selected value="사이즈선택">사이즈선택</option>
									<option value="L">L</option>
									<option value="M">M</option>
									<option value="S">S</option>
							</select></li>
							<li style='padding-left: 30px'>
							<select	class="select_change" size="3" name="gColor" id="gColor">
								<option selected value="색상선택">색상선택</option>
								<option value="navy">navy</option>
								<option value="black">black</option>
								<option value="ivory">ivory</option>
								<option value="white">white</option>
								<option value="gray">gray</option>
							</select></li>
							<li class="td_title">주문수량</li>
							<li style="padding-left: 30px"><input type="text"
								name="gAmount" value="1" id="gAmount"
								style="text-align: right; height: 18px"> <img
								src="images/up.png" id="up"> <img src="images/down.png"
								id="down"></li>
						</ul>
					</div>
				
		</div>
	</div>
	<div style='width:100%; float:left;'>
		<br> <button >구매</button>
		&nbsp;&nbsp;
		<button id="cart">장바구니</button>
	</div>
</FORM>
