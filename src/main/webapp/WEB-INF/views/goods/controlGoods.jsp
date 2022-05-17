<%@page import="com.dto.BundleDTO"%>
<%@page import="com.service.ManagerService"%>
<%@page import="com.dto.GoodsDTO"%>
<%@page import="com.dto.VariationDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function() {
		$(".goodsDelete").click(function() {
			var gcode = $(this).attr("data-gcode");
			var delBtn =$(this);
			$.ajax({
				url:"goodsDelete",
				type: "get",
				data: {gcode : gcode}, 
				dataType: "text",
				success: function (data,status,xhr) {
					delBtn.parents().filter("tr").remove();
				},
				error: function(xhr,status,error) {
					console.log(error);
				}
			});//ajax end
		});//goodsDelete end
		
		$(".goodsUpdate").click(function() {
			var gcode = $(this).attr("data-gcode");
			location.href = "goodsUpdatePage?gcode="+gcode;
		});
		
		
	})//ready end
</script>
<table border="1">
	<tr>
		<td>상품 이미지</td>
		<td>상품코드</td>
		<td>카테고리</td>
		<td>상품명</td>
		<td>단일 가격</td>
		<td>재고수량</td>
		<td>상품 종류</td>
		<td>번들</td>
		<td>수정</td>
		<td>삭제</td>
	</tr>
	
   
<c:forEach var="dto" items="${AllGoods}" varStatus="status">	
	<tr id="${dto.gcode}">
	<td><img src="images/${dto.gimage}" border="0" align="center" width="100"></td>
	<td>${dto.gcode}</td>
	<td>${dto.gcategory}</td>
	<td>${dto.gname}</td>
	<td>${dto.gprice}</td>
	<td>${dto.gamount}</td>
	<td>
		<table>
			<c:forEach var="vdto" items="${vlist}" varStatus="status">
				<c:if test="${vdto.gcode == dto.gcode}">
					<tr>
					<td>${vdto.vcategory}</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
	</td>
	<td>
		<table>
			<c:forEach var="bdto" items="${blist}" varStatus="status">
				<c:if test="${bdto.gcode == dto.gcode}">
					<tr>
					<td>${bdto.bcategory}개 당 ${bdto.bprice}</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
	</td>
	<td><button class="goodsUpdate" data-gcode="${dto.gcode}">수정</button></td>
	<td><button class="goodsDelete" data-gcode="${dto.gcode}">삭제</button></td>
	</tr>
	</c:forEach>
		

</table>
 