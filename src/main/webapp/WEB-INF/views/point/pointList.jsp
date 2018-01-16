<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/SE2/js/HuskyEZCreator.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
.list {
	cursor: pointer;
}
</style>
<script type="text/javascript">
/* $(".list").click(function (){
	
	document.frm.curPage.value=cur;
	
	document.frm.submit();
}); */
</script>
<link href="../resources/css/common/header.css" rel="stylesheet">
<link href="../resources/css/point/point.css" rel="stylesheet">
<link href="../resources/css/board/boardHeader.css" rel="stylesheet">
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	<section class="contentss">
	<div class="contens_point">
	
	<!-- <div class="contens_head"> -->
	<div class="headerArea">
  		<div class="title_wrap" style="width: 1000px;font-family: 'Nanum Gothic', sans-serif;">
		<h6 id="h6_title" style="margin-right: 5px; margin-top: 8px;">
		<a href="${pageContext.request.contextPath}"><img alt="" src="../resources/images/common/homeImg.png" id="homeImg"></a> > 
		<a href="${pageContext.request.contextPath}/member/memberMypage">MYPAGE</a>
		 > <a href="${pageContext.request.contextPath}/point/pointList">MYPOINT</a></h6>
		</div> 
		<h2 style="margin-top: 20px; font: 40px/41px 'fMdBT'; padding-bottom: 20px; width: 900px; margin: 0 auto;">MY POINT</h2>
		</div>



	<c:set var="sum" value="0" />
	<c:forEach var="total" items="${list}">
		<%-- <p id="point_history" > ${total.point} </p> --%>
		<c:set var="sum" value="${sum + total.total_point}" />
	</c:forEach>



	<p class="total_point">
		총 포인트 : <b style="color: #ff8707;font-size: 20px;font-family: 'Nanum Gothic', sans-serif;"><c:out value="${sum}" />P</b>
	</p>

	<div class="ec-base-table typeList" style="width: 920px; margin: 0 auto;">
	<table border="1">
		<thead style="font-family: 'Nanum Gothic', sans-serif; border-bottom: 2px solid #aaaa;   border-top: 2px solid #aaaa;">
			<tr>
				<!-- <th class="no_1">no.</th> -->
				<th class="reg_date">적립일자</th>
				<th class="kind">유형</th>
				<th class="point_1">포인트</th>
				<th class="history">포인트 내역</th>


			</tr>
		</thead>

		<tbody class="xans-element- xans-order xans-order-normallist center">
			<c:forEach items="${list}" var="dto">
				<tr>

					<%-- <td class="no_1">${dto.point_num }</td> --%>
					<td class="reg_date">${dto.reg_date}</td>
					<td class="kind" style="font-family: 'Nanum Gothic', sans-serif;">${dto.kind}</td>
					<td class="point_1">${dto.point}</td>
					<td class="history" style="font-family: 'Nanum Gothic', sans-serif;">${dto.history}</td>

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