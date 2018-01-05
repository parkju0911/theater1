<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
	.list{
		cursor: pointer; 
	}
</style>
<link href="../resources/css/point/point.css" rel="stylesheet">
</head>
<body>
	<h1>${point} list Page</h1>





<div class="total_point">
<p>총 포인트 : ${p.total_point}</p>


</div>




	<table >
		<thead>
		<tr>
			<th>no.</th>
			<th>발생일자</th>
			<th>유형</th>
			<th>포인트</th>
			<th>포인트 내역</th>
			
			
		</tr>
		</thead>
	
	<tbody>
	<c:forEach items="${list}" var="dto">
		<tr>
			
			<td>${dto.point_num }</td>
			<td>${dto.reg_date}</td>
			<td>${dto.kind}</td>		
			<td><a href="./${point}View?num=${dto.point_num}">${dto.point}</a></td>
			<td>${dto.history}</td>
			
		</tr>
				</c:forEach>
		</tbody>

	</table>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<div>
		<c:if test="${pager.curBlock gt 1}">
			<span class="list" title="${pager.startNum-1}">[이전]</span>
		</c:if>
		<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			<span class="list" title="${i}">${i}</span>
		</c:forEach>
		<c:if test="${pager.curBlock lt pager.totalBlock}">
			<span class="list" title="${pager.lastNum+1}">[다음]</span>
		</c:if>
	</div>
	
	
	
</body>
</html>