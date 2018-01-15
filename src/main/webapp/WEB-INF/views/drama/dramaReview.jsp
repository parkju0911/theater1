<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../resources/css/drama/dramaReview.css" rel="stylesheet">
<link href="../resources/css/common/header.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	
	var message='${message}';
	if(message !=''){
		alert(message);
	}
	
	
	$(".list").click(function (){
		var cur=$(this).attr("title");
		var s = '${pager.search}';
		var v = '${pager.kind}';
		document.frm.curPage=cur;
		document.frm.search=s;
		document.frm.kind=v;
		document.frm.submit();
	});
});
</script>
<style type="text/css">
	.list {
		cursor: pointer;
	}
</style>
</head>
<body>
		<!-- header -->
	<c:import url="../temp/header.jsp"></c:import>
	<!-- header end -->
	<p id="top_line"></p>
	<section id="Review_main">
	<div id="top_text">
		<div id="text">☆공연 리뷰 페이지☆ </div><a href="./dramaReviewwrite">작성하기</a>
		
				<div id="search_box_top">
					<form action="./${board}List" method="get" name="frm">
						<input type="hidden" value="1"  name="curPage">
							<select name="kind" class="select">
								<option>Title</option>
								<option>Writer</option>
								<option>Contents</option>
							</select>
								<input type="text" name="search" class="search">
									<button class="search_form">검색</button>
					</form>
	
				</div>
	
	
	</div>
	<c:forEach items="${review}" var="list">
	<div class="list_box">
		<div class="box_left">
			이미지 불러오는 곳
		</div>
			<div class="box_right">
			
				<div id="review_title">${list.title }</div>
			
				<div id="review_contents"><a href="./dramaReviewview?review_num=${list.review_num }">${list.contents }</a></div>
			<c:if test="${list.star==5 }">
				<div class="review_date_star">작성일:${list.review_date }   별점:<img alt="" src="../resources/images/starpoint/star_5.png" style="height: 12px"></div>
			</c:if>
					<c:if test="${list.star==4 }">
					<div class="review_date_star">작성일:${list.review_date }   별점:<img alt="" src="../resources/images/starpoint/star_4.png" style="height: 12px"></div>
					</c:if>
						<c:if test="${list.star==3 }">
							<div class="review_date_star">작성일:${list.review_date }   별점:<img alt="" src="../resources/images/starpoint/star_3.png" style="height: 12px"></div>
						</c:if>
							<c:if test="${list.star==2 }">
								<div class="review_date_star">작성일:${list.review_date }   별점:<img alt="" src="../resources/images/starpoint/star_2.png" style="height: 12px"></div>
							</c:if>
								<c:if test="${list.star==1}">
									<div class="review_date_star">작성일:${list.review_date }   별점:<img alt="" src="../resources/images/starpoint/star_1.png" style="height: 12px"></div>
								</c:if>
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
	

		<div id="search_box_bottom">
		<form action="./${board}List" method="get" name="frm">
	<input type="hidden" value="1"  name="curPage">
		<select name="kind" class="select">
			<option>Title</option>
			<option>Writer</option>
			<option>Contents</option>
		</select>
		<input type="text" name="search" class="search">
		<button class="search_form">검색</button>
	</form>
	
		</div>
			</section>
	<!-- footer  -->
	<c:import url="../temp/footer.jsp"></c:import>
	<!-- footer end -->
	
</body>
</html>