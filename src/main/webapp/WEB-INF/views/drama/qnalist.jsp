<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

		<p>티켓관련 문의를 남겨주세요.</p>
		<p>환불/취소요청은 마이티켓 > 환불신청, 이용 불편 및 요청사항은 1:1문의를 이용해주세요.</p>
		<div id="qna_form">
		<form action=""  method="get">
		<textarea style="width:530px; height: 70px; border: 1px solid #e6e6e6; font-size: 13px; color:#000;"></textarea>
		</form>
		</div>
		
		<table>
		<c:forEach items="${qna}" var="list">
		<div id="member_qna">
		<tr>
			<td>${list.id }</td>  <td>${list.reg_date }</td>
		</tr>
		<tr>
			<td>${list.contents }
		</tr>
		</div>
		
		<div id="master_qna">
				<tr>
				<td><!-- 관리자 ID --></td> <td><!-- 관리자가 작성한 날짜 --></td>
				</tr>
				<tr>
				<td><!-- 관리자 작성한 contents --></td>
		</div>
		
		</c:forEach>
		</table>
		
</body>
</html>