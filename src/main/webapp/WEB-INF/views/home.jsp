 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./resources/SE2/js/HuskyEZCreator.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="./resources/css/common/header.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="./resources/css/drama/dramaList.css" rel="stylesheet">
   <title>Home</title>

<style type="text/css">
header{
    background-image: url(./resources/images/home/headerImg.jpg);
    height: 541px;
    width: 100%;    
    background-size: cover;
    background-position-y: -189px;
   /*  padding-bottom: 50px; */
    /* background-repeat-x: no-repeat; */
    /* background-position: center; */
}
nav li a {
    text-shadow: #fffffb66 0px 2px, #fffffb6b 2px 0px, #fffffb69 -2px 0px, #fffffb69 0px -2px, #fffffb57 -1.4px -1.4px, #fffffb47 1.4px 1.4px, #fffffb54 1.4px -1.4px, #fffffb40 -1.4px 1.4px;
}
.search_bar{
margin-right: 25px;
    width: 214px;
    }
.member_wrap a{
}
.push{
	height: 0px;
}
.main_cs_divide {
    float: left;
    width: 33%;
    height: 77px;
    border-right: 1px solid #d6d6d6;
}
a:link {
    text-decoration: none;
}
img {
    border: none;
    margin: 0;
}
a {
    color: #313131;
}
.main_cs_divide {
    float: left;
    width: 33%;
    height: 77px;
    border-right: 1px solid #d6d6d6;
}
table {
    border-collapse: collapse;
}
td, select {
    font-size: 13px;
    font-weight: 300;
}
.ellip {
    word-break: break-all;
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
}
.main_notice_txt {
    width: 250px;
    font-size: 13px;
    font-weight: 300;
    text-align: left;
    line-height: 20px;
}
#slidebox {
		position:relative;
		width: 690px;
    height: 518px;
		overflow:hidden;
		white-space:nowrap;
		    MARGIN: 0 AUTO;
	}
	#slidebox ul#slider {
		list-style:none;
		margin:0;
		padding:0;
	}
	#slidebox ul li {
		position:absolute;
		MARGIN-TOP: 128PX;
	}
	#slidebox ul li img {
		width: 689PX;
    height: 390PX;
	}
</style>
</head>
<script type="text/javascript">
   var result = '${result}';
   if(result != ""){
      alert('${result}');
   }
</script>
<body>
<c:import url="./temp/header.jsp"></c:import>
<div style="height: 60px;"></div>
<!-- SLIDEBOX -->
	<div class="w3-content w3-display-container" style="max-width: 1000px;  background-image: url(./resources/images/home/MAINBG.png);    width: 100%;    height: 650px;    MARGIN: 0 AUTO;">
			<div id="slidebox">
			<ul id="slider">
				<li>
					<img class="mySlides" src="./resources/images/home/main1.jpg">
				</li>
				<li>
					<img class="mySlides" src="./resources/images/home/main2.jpg">
				</li>
				<li>
					<img class="mySlides" src="./resources/images/home/main3.jpg">
				</li>
				<li>
					<img class="mySlides" src="./resources/images/home/main4.jpg">
				</li>
				<li>
					<img class="mySlides" src="./resources/images/home/main5.jpg">
				</li>
			</ul>
		</div>
	</div>
	
<script type='text/javascript'>
	var x = 800;
	var slider = document.getElementById("slider");
	var slideArray = slider.getElementsByTagName("li");
	var slideMax = slideArray.length - 1;
	var curSlideNo = 0;

	for (i = 0; i <= slideMax; i++) {
		if (i == curSlideNo)
			slideArray[i].style.right = 0;
		else
			slideArray[i].style.right = -x + "px";
	}

	slider.addEventListener('click', function() {
		changeSlide();
	}, false);

	var aniStart = false;
	var next = 1;
	var changeSlide = function() {
		if (aniStart === true)
			return;
		next = curSlideNo + 1;
		if (next > slideMax)
			next = 0;
		aniStart = true;
		sliding();
	}

	function sliding() {
		var curX = parseInt(slideArray[curSlideNo].style.right, 10);
		var nextX = parseInt(slideArray[next].style.right, 10);
		var newCurX = curX + 10;
		var newNextX = nextX + 10;
		if (newCurX >= x) {
			slideArray[curSlideNo].style.right = -x + "px";
			slideArray[next].style.right = 0;
			curSlideNo = curSlideNo + 1;
			if (curSlideNo > slideMax)
				curSlideNo = 0;
			aniStart = false;
			return;
		}
		slideArray[curSlideNo].style.right = newCurX + "px";
		slideArray[next].style.right = newNextX + "px";
		setTimeout(function() {
			sliding();
		}, 20);
	}
	setInterval(changeSlide, 6000);
</script>

<%-- <div id="review-feed-list-wrap">
			<div class="row unpa-card-row row-flex-height-md">
			<c:forEach items="${list}" var="dto">
				<c:forEach items="${requestScope.list}" var="dto">
					<div class="col-md-4 unpa-ad-responsive-parent">

						<div class="unpa-card unpa-card-box-shadow unpa-review">

							<div class="main-section"
								style="border-left: 1px solid #f2f2f2; border-top: 1px solid #f2f2f2; border-right: 1px solid #f2f2f2;">
								<a class="user-info-link" href="">
									<div class="user-info" style="display: inline-block">
										<div class="unpa-feed-user-info-box">
											<div class="unpa-user-block">
												<div class="user-name unpa-tooltip" data-html="true"
													data-toggle="tooltip" data-placement="bottom"
													title="<i class='ion-person'></i> 267 <i class='ion-edit'></i> 40">
													${dto.drama_num}</div>
												<div class="user-labels" style="">
													<span class="skin-type false ">${dto.place}</span>
												</div>
											</div>
										</div>
									</div>
									<div class="time">${dto.file_num}</div>
								</a>
								<div class="unpa-feed-card-hover-actions">
									<span class="unpa-share-this-button"><i
										class="unpacon-share"></i></span>

								<!-- 	<div class="number-of-images">
										<i class="glyphicon glyphicon-picture"></i> 6
									</div> -->

								</div>

								<div class="main-image"
									style="background-image: url('../resources/images/drama_1.jpg')" >
									<div class="content">
										<a>${dto.contents}</a>
									</div>
								</div>
								<div class="review-contents">
									<div class="product-info">
										<div class="left">
											<div class="product-image"
												style="background-image: url(../resources/image/drama_1.jpg')"></div>
										</div>


										<div class="right">
											<div class="brand-name-and-rating">
												<div class="brand-name">
													<a href="./dramaview?drama_num=${dto.drama_num}">${dto.title}</a>
												</div>
											</div>
											<div class="product-name">
												<a
													href="">${dto.price} 원</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="sub-section"
								style="border-left: 1px solid #f2f2f2; border-bottom: 1px solid #f2f2f2; border-right: 1px solid #f2f2f2;">
								<div class="count-info">
									<div class="like">
										<a class="like-button " style="color: #b4b4b4;">
											<div class="icon">
											<img
											src="${pageContext.request.contextPath}/image/review/ic_heart_xs_normal.png"></div>
											<div class="count">${dto.heart}</div>
										</a>
									</div>
									<div class="comments">
										<img
											src="${pageContext.request.contextPath}/image/review/ic_reply_s.png">
										<div style="display: inline; position: relative; top: 1px;">${dto.ref}</div>
									</div>

									<div class="views">
										<div style="display: inline; position: relative; top: 1px;">${dto.buy_hit} BUY</div>

									</div>
								</div>
							</div>
						</div>
					</div>
			</c:forEach>
			</div>
		</div> --%>



<!-- <script type="text/javascript">
	$(function(){
		var message='${message}';
		if(message != ''){
			alert(message);
		}
		
		$(".list").click(function (){
			var cur=$(this).attr("title");
			var s='${pager.search}';
			var t='${pager.kind}';
			document.frm.curPage.value=cur;
			document.frm.search.value=s;
			document.frm.kind.value=t;
			document.frm.submit();
		});
	});
</script> -->





							<%-- <c:forEach begin="0" end="4" var = "i">
								<div class="main_drama_list">
									<a href="./drama/dramaView.drama?num=${list[i].drama_num}" style="color: #000;">
										<img src="./resources/images/home/icon_box.png" style="padding: 0 4px 1px 0;">
										${list[i].title}</a>
								</div>
							</c:forEach> --%>
					<%-- <table width="100%" cellpadding="0" cellspacing="0" border="0">
						<c:forEach begin="0" end="4" var = "j">
							<tbody>
								<ul>
								<li valign="top" align="center">
									<div class="main_drama_list">
									<a href="./drama/dramaview?drama_num=${list[j].drama_num}" style="color: #000;">
										<img src="./resources/images/home/icon_box.png" style="padding: 0 4px 1px 0;">
										${list[j].title}</a>
									</div>
								</li>
								</ul>
							</tbody>
						</c:forEach>
					</table>
							 --%>
				<div class="mainDramaList" style="margin: 0 auto;    width: 1300px;   overflow: overlay;    padding: 50px;">
				<c:forEach begin="0" end="3" var = "j">
					<a href="./drama/dramaview?drama_num=${list[j].drama_num}">
					<div class="col-md-4 unpa-ad-responsive-parent"  style="width: 300px;">
						<div class="unpa-card unpa-card-box-shadow unpa-review" style="background-color: whitesmoke; border: 0px;">
							<div class="main-section"
								style="border-left: 1px solid #f2f2f2;border-right: 1px solid #f2f2f2;">
								<a class="user-info-link" href="">
									<div class="user-info" style="display: inline-block; ">
										<div class="unpa-feed-user-info-box">
											<div class="unpa-user-block">
												<%-- <div class="user-name unpa-tooltip" data-html="true" data-toggle="tooltip" data-placement="bottom"
													title="<i class='ion-person'></i> 267 <i class='ion-edit'></i> 40">
													${list[j].drama_num}</div> --%>
												<div class="user-labels" style="margin-top: 5px;">
													<span class="skin-type false ">${list[j].place}</span>
												</div>
											</div>
										</div>
									</div>
									<div class="time">${list[j].file_num}</div>
								</a>
								<div class="unpa-feed-card-hover-actions">
									<span class="unpa-share-this-button"><i
										class="unpacon-share"></i></span>

								<!-- 	<div class="number-of-images">
										<i class="glyphicon glyphicon-picture"></i> 6
									</div> -->

								</div>

					<a href="./drama/dramaview?drama_num=${list[j].drama_num}">
								<div class="main-image"
									style="background-image: url('./resources/upload/${file[j].file_name}')" >
									<div class="content">
										${list[j].contents}
									</div>
								</div></a>
								<div class="review-contents">
									<div class="product-info" style="min-height: 60px;">
										<!-- <div class="left">
										
											<div class="product-image"
												style="background-image: url(./resources/images/drama_1.jpg')"></div>
										</div> -->


										<div class="right" style="margin-left: 10px;">
											<div class="brand-name-and-rating">
												<div class="brand-name" style="    font-size: 15px;">
													<a href="./drama/dramaview?drama_num=${list[j].drama_num}">${list[j].title}</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>	
					</a>
				</c:forEach>
				</div>
					


	<a href="drama/dramaList">Drama List</a>
	<a href="./notice/noticeList">Go Notice</a>
	<a href="./qna/qnaList">Go Qna</a>
	<a href="./drama/chatform">chatting</a>
	<a href="./point/pointList">pointList</a>
	<a href="./point/pointCheck">pointCheck</a>		
<!-- HOME FOOTER -->
	<div style="padding: 50px 0 60px 0; margin-top: 30px; background: #eee;">
		<div class="main_wrap" style="width: 960px; margin: 0 auto;">

			<div class="main_cs_divide" style="text-align: center;" alt="출석체크">
				<a href="./point/pointCheck"> <img
					src="./resources/images/home/btn_point.png"
					style="padding: 8px 10px;">
				</a> <a href="./member/faq"> <img
					src="./resources/images/home/btn_faq.png"
					style="padding: 8px 10px;">
				</a> <a href="member/qna"> <img
					src="./resources/images/home/btn_chatting.png"
					style="padding: 8px 10px;">
				</a>
			</div>

			<div class="main_cs_divide">
				<div style="padding: 5px 20px; text-align: left;">
					<img src="./resources/images/home/title_notice.png"
						style="padding: 0 0 11px 12px;" alt="공지사항"> <a
						href="./notice/noticeList"> <img
						src="./resources/images/home/btn_more.png"
						style="margin: 0 0 11px 10px;">
					</a>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<c:forEach begin="0" end="1" var = "i">
							<tbody>
								<tr>
								<td valign="top" align="center">
									<div class="main_notice_txt ellip">
									<a href="./notice/noticeView.notice?num=${arlist[i].notice_num}" style="color: #000;">
										<img src="./resources/images/home/icon_box.png" style="padding: 0 4px 1px 0;">
										${arlist[i].title}</a>
									</div>
								</td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</div>
			</div>

			<div
				style="float: left; width: 33%; height: 74px; text-align: center;">
				<img src="./resources/images/home/cs_info.png"
					style="padding: 5px 0;" alt="고객센터안내">
			</div>

			<div style="clear: both;"></div>
		</div>
	</div>
<c:import url="./temp/recent.jsp"></c:import>
	<c:import url="./temp/footer.jsp"></c:import>
</body>



</html>
