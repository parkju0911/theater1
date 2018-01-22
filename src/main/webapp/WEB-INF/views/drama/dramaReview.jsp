<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/SE2/js/HuskyEZCreator.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
<script src="../resources/SE2/js/HuskyEZCreator.js"></script>
<link href="../resources/css/drama/dramaReview.css" rel="stylesheet">
<link href="../resources/css/common/header.css" rel="stylesheet">
<link href="../resources/css/board/boardHeader.css" rel="stylesheet">
<script src="text/javascript">

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
<%-- <c:import url="../temp/review_search.jsp"></c:import> --%>
		<!-- header -->
	<c:import url="../temp/header.jsp"></c:import>
	<!-- header end -->
	<!-- <p id="top_line"></p> -->
	<section id="Review_main">
	
	<div class="title_wrap" style="border-top: 2px solid #5d4137; padding-top: 8px;width: 1000px;font-family: 'Nanum Gothic', sans-serif; ">
		<h6 id="h6_title" style="margin-right: 5px; margin-top: 8px;">
		<a href="${pageContext.request.contextPath}"><img alt="" src="../resources/images/common/homeImg.png" id="homeImg"></a> > 
		<a href="${pageContext.request.contextPath}/drama/dramaReview">REVIEW</a></h6>
		</div> 
		<h2 style="margin-top: 20px; font: 40px/41px 'fMdBT'; padding-bottom: 20px; width: 900px; margin: 0 auto;">REVIEW</h2>
		<c:if test="${member.id ne null }">
		<div class="top_wrap">
			<a href="./dramaReviewwrite"><img src="../resources/images/review/writeBtn.png" class="writeBtn"></a>
			<!-- <a herf="#"><img alt="" src="../resources/images/review/writeBtn.png"></a> -->
		</div></c:if>
		<c:if test="${member.id eq null }">
		<div class="top_wrap">
			<a href="./dramaReviewwrite" onclick="return false"><img src="../resources/images/review/writeBtn.png" class="writeBtn"></a>
			<!-- <a herf="#"><img alt="" src="../resources/images/review/writeBtn.png"></a> -->
		</div></c:if>
		<div class="sb-search">
			<form name="frm" action="./dramaReview" method="get" class="form-wrapper cf" style="width: 250px;height: auto;">
					<input type="hidden" name="kind" value="title">
						<input type="text" placeholder="Search here..." required>
						<button type="submit">Search</button>
					</form>
		
		</div>
	
	<c:forEach items="${review}" var="list" varStatus="i">
	<div class="list_box">
	<a href="./dramaReviewview?review_num=${list.review_num }">
		<div class="box_left">
			 <img alt="" src="${pageContext.request.contextPath}/resources/upload/${file[i.index].file_name}"style="width: 230px; height: 200px;">
		</div>
			<div class="box_right">
				<p class="review_date">${list.review_date }
				<p id="writer" style="    width: 111px; font-size: 14px; font-weight: bold; text-align: right; margin-top: 39px;  margin-right: -84px;">${list.id }</p></p>
				<div id="review_contents"><a href="./dramaReviewview?review_num=${list.review_num }">
				<p id="review_title">${list.title }</p>
				<div style="font-size: 14px;"><p class="review_con">${list.contents }</p></div>
				</a>
				<c:if test="${member.id eq list.id}">
				<div class="btnGroup">
				<ul>
				<li><a href="./dramaReviewupdate?review_num=${list.review_num}"><img alt="" src="../resources/images/review/update-btn.png"></a></li>
				<li><a href="./dramaReviewdelete?review_num=${list.review_num }" onclick="del()"><img alt="" src="../resources/images/review/delete-btn.png"></a></li>
				</ul>
				</div>
				</c:if>
			</div>
			
			<c:if test="${list.star==5 }">
				<div class="review_star">별점:<img alt="" src="../resources/images/starpoint/star_5.png" style="height: 12px"></div>
			</c:if>
					<c:if test="${list.star==4 }">
						<div class="review_star">별점: <img alt="" src="../resources/images/starpoint/star_4.png" style="height: 12px"></div>
					</c:if>
						<c:if test="${list.star==3 }">
							<div class="review_star">별점: <img alt="" src="../resources/images/starpoint/star_3.png" style="height: 12px"></div>
						</c:if>
							<c:if test="${list.star==2 }">
								<div class="review_star">별점: <img alt="" src="../resources/images/starpoint/star_2.png" style="height: 12px"></div>
							</c:if>
								<c:if test="${list.star==1}">
									<div class="review_star">별점: <img alt="" src="../resources/images/starpoint/star_1.png" style="height: 12px"></div>
								</c:if>
			</div>
			</a>		
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
		<div id="search_box_bottom">
		<form name="frm" action="./dramaReview" method="get" class="form-wrapper cf" style="width: 250px;height: auto;">
					<input type="hidden" name="kind" value="title">
						<input type="text" placeholder="Search here..." required>
						<button type="submit">Search</button>
					</form>
		<%-- <form action="./${board}List" method="get" name="frm">
	<input type="hidden" value="1"  name="curPage">
		<select name="kind" class="select">
			<option>Title</option>
			<option>Writer</option>
			<option>Contents</option>
		</select>
		<input type="text" name="search" class="search">
		<button class="search_form">검색</button> 
	</form>--%>	
	</div>
			</div>
	

			</section>
	<!-- footer  -->
	<c:import url="../temp/footer.jsp"></c:import>
	<!-- footer end -->
	
</body>
</html>