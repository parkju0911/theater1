<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/SE2/js/HuskyEZCreator.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Insert title here</title>
<link href="../resources/css/common/header.css" rel="stylesheet">
<link href="../resources/css/board/boardHeader.css" rel="stylesheet">
<link href="../resources/css/member/orderlist.css" rel="stylesheet">

</head>
<body>
<c:import url="../temp/header.jsp"></c:import>

<div class="orderListArea">
     <div class="title_wrap" style="width: 1000px;">
		<h6 id="h6_title" style="margin-right: 5px; margin-top: 8px;">
		<a href="${pageContext.request.contextPath}"><img alt="" src="../resources/images/common/homeImg.png" id="homeImg"></a> > 
		<a href="${pageContext.request.contextPath}/member/memberMypage">MYPAGE</a>
		 > <a href="${pageContext.request.contextPath}/member/myBoard">MYBOARD</a></h6>
	</div> 
	<h2 style="margin-top: 20px; font: 40px/41px 'fMdBT'; padding-bottom: 20px;">MY BOARD</h2>
	<div class="ec-base-table typeList ">
		<table border="1">
			<thead>
				<tr>
					<th scope="col">게시판</th>
					<th scope="col" style="width: 691px;">제목</th>
					<th scope="col">작성날짜</th>
				</tr>
			</thead>
			<tbody class="xans-element- xans-order xans-order-normallist center">
				<c:forEach items="${review}" var="dto">
					<c:if test="${member.id == dto.id}">
						<tr class="xans-record-">
							<td>
								<%-- ${dto.contents} --%>
								공연리뷰
							</td>
							<td style="text-align: left; ">
								<a href="../drama/dramaReviewview?review_num=${dto.review_num}">
									<strong>${dto.title}</strong>
								</a>
							</td>
							<td>${dto.review_date}</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div id="paging">
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

<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>