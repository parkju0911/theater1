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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="../resources/SE2/js/HuskyEZCreator.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
<script src="../resources/SE2/js/HuskyEZCreator.js"></script>
<link href="../resources/css/drama/rankList.css" rel="stylesheet">
<link href="../resources/css/common/header.css" rel="stylesheet">
<link href="../resources/css/board/boardHeader.css" rel="stylesheet">
<script type="text/javascript">
$(function() {
		var message = '${message}';
		if(message != '') {
			alert(message);
		}

	$(".list").click(function() {
		var cur = $(this).attr("title");
		var s = '${pager.search}';
		var t = '${pager.kind}';
		location.href="rankList?curPage="+cur;
	});


});
</script>
<style type="text/css">
.list {
	cursor: pointer;
}

.starRating {
	width: 110px;
	vertical-align: middle;
	text-align: left;
}

.starRating, .starRating span {
	display: inline-block;
	height: 21px;
	background: transparent url(../resources/images/starpoint/star_rating.png)
		no-repeat;
	overflow: hidden;
}

.starRating span {
	font-size: 0;
	line-height: 0;
	vertical-align: top;
	text-indent: -100px;
	background-position: 0 -21px;
}
</style>
<link href="../resources/css/board/boardHeader.css" rel="stylesheet">
</head>
<body>

	<!-- header -->
	<c:import url="../temp/header.jsp"></c:import>
	<!-- header end -->
	<!-- <p id="top_line"></p> -->
	<section id="Review_main">

		<div class="title_wrap"
			style="border-top: 2px solid #5d4137; padding-top: 8px; width: 1000px; font-family: 'Nanum Gothic', sans-serif;">
			<h6 id="h6_title" style="margin-right: 5px; margin-top: 8px;">
				<a href="${pageContext.request.contextPath}"><img alt=""
					src="../resources/images/common/homeImg.png" id="homeImg"></a> >
				<a href="${pageContext.request.contextPath}/drama/rankList">RANKING</a>
			</h6>
		</div>
		<h2
			style="margin-top: 20px; font: 40px/41px 'fMdBT'; padding-bottom: 20px; width: 900px; margin: 0 auto;">RANKING</h2>

		<!-- header 부분 -->

		<!-- 랭킹 -->








		<section id="Review_main" >



			<c:forEach items="${rank}" var="dto" varStatus="i">

				<div class="list_box">
					<div class="ranking_num"
						style="width: 20px; height:25px; float: left; text-align: center; background-color: black ">

						<c:choose>
							<c:when test="${i.count==1 }">
						<!-- 	<img alt="" src="../resources/images/point/1.png"> -->
								<p style="font-weight:bold; text-align:center;line-height:20px; font-size:15px; color:yellow;font-family: 'Nanum Gothic', sans-serif;"> 
									<c:out value="${i.count} " />
								</p>
							</c:when>
							<c:when test="${i.count==2 }">
								<p style="ffont-weight:bold; text-align:center;line-height:20px; font-size:15px; color: yellow;font-family: 'Nanum Gothic', sans-serif;">
									<c:out value="${i.count} " />
								</p>
							</c:when>
							<c:when test="${i.count==3 }">
								<p style="font-weight:bold; text-align:center;line-height:20px; font-size:15px;color: yellow;font-family: 'Nanum Gothic', sans-serif;">
									<c:out value="${i.count} " />
								</p>
							</c:when>
							<c:otherwise>
								<p style="font-weight:600;text-align:center;line-height:20px; font-size:15px;color:#D7AC87; font-family: 'Nanum Gothic', sans-serif;  ">
									<c:out value="${i.count} " />
								</p>
							</c:otherwise>
						</c:choose>



					</div>

					<div class="box_left" style="height: 200px;width:200px;">

						<img alt="이미지"
							src="../resources/upload/${file[i.index].file_name}"
							width="200px" height="200px">

					</div>
					<div class="box_right" style="width: 500px; height: 200px;">

						<div id="review_title" class="user-labels"style="padding-left: 10px; font-family: 'Nanum Gothic', sans-serif;">
								
							<a href="./dramaview?drama_num=${dto.drama_num }">${dto.title}</a>
							<%-- <span class="skin-type">${dto.place}</span> --%>
						</div>

						<div id="review_contents"
							style="height: 100px; padding-left: 10px; padding-top: 10px; font-family: 'Nanum Gothic', sans-serif;">${dto.simple}</div>

			 	<div style="float: right; line-height: 50px;    font-family: 'Nanum Gothic', sans-serif;">
						
						
							<!-- 별점/후기인원수 -->
							<span id="star_total" style="font-size: 12px;color:	#8F6156;"> 예매율 ${dto.buy_hit*0.5}%
							<!-- 별점 ${avg2[i.index]} / 5.0 (총
								${total2[i.index]} 명)--></span> 
									
										<div class="starRating"> 
				<span  style="width:${avg2[i.index]*10}%" ></span> 
				
				</div>  
						 	
						</div> 
				
					</div>

				</div>

			</c:forEach>
</section>
	<div class="text-center">
      <ul class="pagination">
    
			<c:if test="${pager.curBlock gt 1}">
				<span class="list" title="${pager.startNum-1}">[이전]</span>
			</c:if>
			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				<span class="list" title="${i}">${i}</span>
			</c:forEach>
			<c:if test="${pager.curBlock lt pager.totalBlock}">
				<span class="list" title="${pager.lastNum+1}">[다음]</span>
			</c:if>
		
      </ul>

 
   </div>





			<!-- footer  -->
			<c:import url="../temp/footer.jsp"></c:import>
			<!-- footer end -->
</body>
</html>