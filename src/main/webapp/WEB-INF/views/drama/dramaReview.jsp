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
<script src="./temp/review_search.jsp"></script>
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
	
	
	.sb-search {
	position: relative;
	margin-top: 10px;
	width: 0%;
	min-width: 60px;
	height: 60px;
	float: right;
	overflow: hidden;

	-webkit-transition: width 0.3s;
	-moz-transition: width 0.3s;
	transition: width 0.3s;

	-webkit-backface-visibility: hidden;
}
.sb-search-input {
	position: absolute;
	top: 0;
	right: 0;
	border: none;
	outline: none;
	background: #fff;
	width: 100%;
	height: 60px;
	margin: 0;
	z-index: 10;
	padding: 20px 65px 20px 20px;
	font-family: inherit;
	font-size: 20px;
	color: #2c3e50;
}

input[type="search"].sb-search-input {
	-webkit-appearance: none;
	-webkit-border-radius: 0px;
}
.sb-search-input::-webkit-input-placeholder {
	color: #efb480;
}

.sb-search-input:-moz-placeholder {
	color: #efb480;
}

.sb-search-input::-moz-placeholder {
	color: #efb480;
}

.sb-search-input:-ms-input-placeholder {
	color: #efb480;
}
.sb-icon-search,
.sb-search-submit  {
	width: 60px;
	height: 60px;
	display: block;
	position: absolute;
	right: 0;
	top: 0;
	padding: 0;
	margin: 0;
	line-height: 60px;
	text-align: center;
	cursor: pointer;
}
.sb-search-submit {
	background: #fff; /* IE needs this */
	-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)"; /* IE 8 */
    filter: alpha(opacity=0); /* IE 5-7 */
    opacity: 0;
	color: transparent;
	border: none;
	outline: none;
	z-index: -1;
}
.sb-icon-search {
	color: #fff;
	background: #e67e22;
	z-index: 90;
	font-size: 22px;
	font-family: 'icomoon';
	speak: none;
	font-style: normal;
	font-weight: normal;
	font-variant: normal;
	text-transform: none;
	-webkit-font-smoothing: antialiased;
}

.sb-icon-search:before {
	content: "\e000";
}
@font-face {
	font-family: 'icomoon';
	src:url('../fonts/icomoon/icomoon.eot');
	src:url('../fonts/icomoon/icomoon.eot?#iefix') format('embedded-opentype'),
		url('../fonts/icomoon/icomoon.woff') format('woff'),
		url('../fonts/icomoon/icomoon.ttf') format('truetype'),
		url('../fonts/icomoon/icomoon.svg#icomoon') format('svg');
	font-weight: normal;
	font-style: normal;
}
.sb-search.sb-search-open,
.no-js .sb-search {
	width: 100%;
}
.sb-search.sb-search-open .sb-icon-search,
.no-js .sb-search .sb-icon-search {
	background: #da6d0d;
	color: #fff;
	z-index: 11;
}
.sb-search.sb-search-open .sb-search-submit,
.no-js .sb-search .sb-search-submit {
	z-index: 90;
}
</style>
</head>
<body>
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
		
	<div id="top_text">
		<!-- <div id="text">☆공연 리뷰 페이지☆ </div><a href="./dramaReviewwrite">작성하기</a> -->
		
				<div id="search_box_top" class="sb-search">
					<form action="./${board}List" method="get" name="frm">
			
						<input class="sb-search-input" placeholder="Enter your search term..." type="search" value="" name="search" id="search">
						<input class="sb-search-submit" type="submit" value="">
						<span class="sb-icon-search"></span>
						
						<!-- <input type="hidden" value="1"  name="curPage">
							<select name="kind" class="select">
								<option>Title</option>
								<option>Writer</option>
								<option>Contents</option>
							</select>
								<input type="text" name="search" class="search">
									<button class="search_form">검색</button> -->
					</form>
	
				</div>
	
	
	</div>
	 <c:forEach items="${review}" var="list">
	<div class="list_box">
	<a href="./dramaReviewview?review_num=${list.review_num }">
		<div class="box_left">
		
					이미지 불러올것<img alt="" src="##">
		
		</div>
			<div class="box_right">
			
				<p class="review_date">${list.review_date }</p>
				<div id="review_contents"><a href="./dramaReviewview?review_num=${list.review_num }">
				<p id="review_title">${list.title }</p>
				<p class="review_con">${list.contents }</p>
<%-- 				<p>${list.title}</p> --%>
				</a>
				<c:if test="${member.id eq list.id}">
				<div class="btnGroup">
				<ul>
				<li><a href="./dramaReviewUpdate?review_num=${list.review_num }"><img alt="" src="../resources/images/review/update-btn.png"></a></li>
				<li><a href="./dramaReviewDelete?review_num=${list.review_num }"><img alt="" src="../resources/images/review/delete-btn.png"></a></li>
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