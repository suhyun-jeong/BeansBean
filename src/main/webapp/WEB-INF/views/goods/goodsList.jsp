<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<table width="100%" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<table align="center" width="710" cellspacing="0" cellpadding="0"
				border="0">
				<tr>
					<td height="5"></td>
				</tr>
				<tr>
					<td height="1" colspan="8" bgcolor="CECECE"></td>
				</tr>
				<tr>
					<td height="10"></td>
				</tr>
				<tr>

<!-- 반복시작 -->
<c:forEach var="dto" items="${goodsList}" varStatus="status">
						<td>
							<table style='padding: 15px'>
								<tr>
<<<<<<< HEAD
								<c:forTokens var="token" items="${dto.gimage}" delims="." varStatus="status2">
									<c:if test="${status2.last}">
										<%-- ${token}, ${dto.gimage} --%>
										<c:choose>
											<c:when test="${token eq 'jpg' || token eq 'gif' || token eq 'png' || token eq 'bmp'}">
												<td><a href="goodsDetail?gcode=${dto.gcode}"> <img
														src="images/${dto.gimage}" border="0"
														align="center" width="200"><!--  수정-->
												</a></td>
											</c:when>
											<c:otherwise>
												<td><a href="goodsDetail?gcode=${dto.gcode}"> <img
														src="images/${dto.gimage}.jpg" border="0"
														align="center" width="200"><!--  수정-->
												</a></td>
											</c:otherwise>  
										</c:choose>
									</c:if>
								</c:forTokens>
=======
									<td><a href="goodsDetail?gcode=${dto.gcode}"> <img
											src="images/${dto.gimage}.png" border="0"
											align="center" width="200"><!--  수정-->
									</a></td>
>>>>>>> 37c27722f9f3af1a7a522a9276cb0f02423895b5
								</tr>
								<tr>

									<td height="10">
								</tr>
								<tr>
									<td class="td_default" align="center"><a class="a_black"
										href="goodsDetail?gcode=${dto.gcode}"> ${dto.gname}<br><!-- 수정   -->
									</a> <font color="gray"> -------------------- </font></td>

								</tr>
								<tr>
									<td height="10">
								</tr>
								<tr>
									<td class="td_gray" align="center">${dto.gamount}EA</td>
								</tr>
								<tr>
									<td height="10">
								</tr>
								<tr>
									<td class="td_red" align="center"><font color="red"><strong>
												${dto.gprice}원</strong></font></td>
								</tr>
							</table>
						</td>
						<!-- 한 줄에4개씩 -->
					<c:if test="${status.count%4 ==0 }">
						<tr>
							<td height="10"></td>
						</tr>
					</c:if>
<!-- 반복끝-->
</c:forEach>				
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="10">
	</tr>
</table>