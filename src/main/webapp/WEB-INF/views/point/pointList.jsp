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
<script type="text/javascript">



</script>
<link href="../resources/css/common/header.css" rel="stylesheet">
<link href="../resources/css/point/point.css" rel="stylesheet">

</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
	<h1>${point} list Page</h1>



<h2> ${id} point page</h2>





<c:set var = "sum" value = "0" />

<c:set var="minus" value="0"/>

<c:forEach var="total" items="${list}">



<%-- <p id="point_history" > ${total.point} </p> --%>



<c:set var= "sum" value="${sum + total.total_point}"/> 




</c:forEach>



<p> 총 포인트 : <b><c:out value="${sum}"/>P</b></p>











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
			<td>${dto.point}</td>
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
	
	<c:import url="../temp/footer.jsp"></c:import>
	
</body>
</html>