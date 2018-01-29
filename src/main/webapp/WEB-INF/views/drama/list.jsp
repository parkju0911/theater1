<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="../resources/css/common/header.css" rel="stylesheet">
<link href="../resources/css/drama/dramaList.css" rel="stylesheet">
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
			location.href="dramaList?curPage="+cur;
		});
		
		$(".drama_num").each(function(){
			var id=$(this).attr("title");
				<c:forEach items="${end_list}" var="dto">
					$('#'+id).click(function(){
						var end = '${dto.drama_num}';
						if(end==id){
							alert('종료된 공연입니다.');
						}else{
							$(location).attr('href', './dramaview?drama_num='+id);
						}
					});
				</c:forEach>				
		});
		$(".price").each(function(){
			var id=$(this).attr("title");
				<c:forEach items="${end_list}" var="dto">
					$('#'+id+'_price').click(function(){
						var end = '${dto.drama_num}';
						if(end==id){
							alert('종료된 공연입니다.');
						}else{
							$(location).attr('href', './dramaview?drama_num='+id);
						}
					});
				</c:forEach>				
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<!-- Header 시작 -->
	<c:import url="../temp/header.jsp"></c:import>
	<!-- Header 끝 -->
	<div class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 location-board ">
		<div class="tit-board">
			<p class="img"></p>
			<h2>
				<font color="#555555"></font>
			</h2>
		</div>
	</div>
	
	<c:if test="${list eq null}">
		<h1>데이터를 가져오지 못했습니다.</h1>
	</c:if>
	<div>
		<c:if test="${list ne null}">
			<div class="container review">
				<div id="review-feed-list-wrap">
					<div class="row unpa-card-row row-flex-height-md">
						<c:forEach items="${list}" var="dto" varStatus="i">
							<div class="col-md-4 unpa-ad-responsive-parent">
								<div class="unpa-card unpa-card-box-shadow unpa-review">
									<div class="main-section" style="border-left: 1px solid #f2f2f2; border-top: 1px solid #f2f2f2; border-right: 1px solid #f2f2f2;">
								<!-- <a class="user-info-link" href=""> -->
										<div class="user-info" style="display: inline-block">
											<div class="unpa-feed-user-info-box">
												<div class="unpa-user-block">				
													<div class="user-labels">
														<span class="skin-type false">${dto.place}</span>
													</div>
												</div>
											</div>
										</div>
								<!-- </a> -->
									<div class="unpa-feed-card-hover-actions">
										<span class="unpa-share-this-button">
											<i class="unpacon-share"></i></span>
									</div>
									<div class="main-image"style="background-image: url('../resources/upload/${file[i.index].file_name}')" >
										<div class="content">
											<a>${dto.simple}</a>
										</div>
									</div>
									<div class="review-contents">
										<div class="product-info">
											<div class="left">
												<div class="product-image"style="background-image: url(../resources/image/drama_1.jpg')"></div>
											</div>
											<div class="right">
												<div class="brand-name-and-rating">
													<div class="brand-name">
														<span id="${dto.drama_num}" class="drama_num" title="${dto.drama_num}">${dto.title}</span>
													</div>
												</div>
												<div class="product-name">
													<span id="${dto.drama_num}_price" class="price" title="${dto.drama_num}">${dto.price} 원</span>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="sub-section"style="border-left: 1px solid #f2f2f2; border-bottom: 1px solid #f2f2f2; border-right: 1px solid #f2f2f2;">
									<div class="count-info">
										<div class="views">
											<div style="display: inline; position: relative; top: 1px;">${dto.buy_hit} BUY</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					<div id="rightSide">
						<div id="right_zzim">
							<div  class="recTit">최근본상품 <span id=recentCnt></span></div>
							<ul id="d"><!-- 본 상품이 뿌려질 부분  -->
								<c:catch>
									<c:forEach items="${title}" var="t" varStatus="i">
										<li>${t.title}</li>
										<li><img id="zzim_img" alt="" src=../resources/upload/${fileimage[i.index].file_name}></li>
									</c:forEach>
								</c:catch>
							</ul>    
						</div>
					</div> 
				</div>
			</div>
		</div>		
		<div class="text-center">
			<c:if test="${!empty list}">	
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
   			</c:if>
   			<c:if test="${member.kind eq 'company'}">
				<div class="write-btn" style="float: right; width: 84px; height: 23px;     margin-top: 60px; border-radius: 123px; background-color: #a09d9dcc;">
   					<a href="${board}Write" style="color: white; margin: auto; padding: 20px; font-weight: 600;">WRITE</a>
   				</div> 
   			</c:if>
  		</div>
   	</c:if>
</div>

	<!-- footer 시작 -->
	<c:import url="../temp/footer.jsp"></c:import>
	<!-- footer 끝 -->
</body>
</html>