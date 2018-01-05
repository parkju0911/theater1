<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../resources/css/dramaReview.css" rel="stylesheet">
<link href="../resources/css/common/header.css" rel="stylesheet">
</head>
<body>
		<!-- header -->
	<c:import url="../temp/header.jsp"></c:import>
	<!-- header end -->
	<p id="top_line"></p>
	<section id="Review_main">
	<div id="top_text">
		☆공연 리뷰 페이지☆
		<div id="write_form">
		<a href="review_write"><button id="btn_tool">리뷰 작성하기</button></a>
		</div>
	</div>
	<c:forEach items="${re}" var="list">
	<div class="list_box">
		<div class="image_tool">이미지툴입니다.		
			</div>
		<div class="text_form"><a href="#">${list.title } ->view page로 이동</a>
			</div>
		<div class="reg_date">작성 날짜 hit 수 
			</div>
	</div>
	

	
	</c:forEach>
	

	
		
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
	
	</section>
		
	
	
	<!-- footer  -->
	<c:import url="../temp/footer.jsp"></c:import>
	<!-- footer end -->
	
</body>
</html>