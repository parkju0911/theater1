<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
.list {
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
	<section class="contentss">
	<div class="contens_point">
	<div class="contens_head">
	<h1>${point}list Page</h1>



	<h2>${id} point page</h2>

</div>



	<c:set var="sum" value="0" />


	<c:forEach var="total" items="${list}">



		<%-- <p id="point_history" > ${total.point} </p> --%>



		<c:set var="sum" value="${sum + total.total_point}" />




	</c:forEach>



	<p class="total_point">
		총 포인트 : <b><c:out value="${sum}" />P</b>
	</p>











	<table>
		<thead>
			<tr>
				<th class="no_1">no.</th>
				<th class="reg_date">발생일자</th>
				<th class="kind">유형</th>
				<th class="point_1">포인트</th>
				<th class="history">포인트 내역</th>


			</tr>
		</thead>

		<tbody>
			<c:forEach items="${list}" var="dto">
				<tr>

					<td class="no_1">${dto.point_num }</td>
					<td class="reg_date">${dto.reg_date}</td>
					<td class="kind">${dto.kind}</td>
					<td class="point_1">${dto.point}</td>
					<td class="history">${dto.history}</td>

				</tr>
			</c:forEach>
		</tbody>

	</table>




	<div class="row_num">
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
	</div>
</section>
	<c:import url="../temp/footer.jsp"></c:import>

</body>
</html>