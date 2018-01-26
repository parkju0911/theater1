 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link href="styles/ihover.css" rel="stylesheet">
<link href="./resources/css/common/ihober.css" rel="stylesheet">
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

<script type="text/javascript">



function popupOpen(){

	var popUrl = "http://192.168.20.48/project/drama/chatform";	//팝업창에 출력될 페이지 URL

	var popOption = "width=360, height=440, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"",popOption);

	}



</script>






<body>
<c:import url="./temp/header.jsp"></c:import>
<div style="height: 110px;"></div>
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

	<p style="    width: 250px;
    height: auto;
    margin: 0 auto;
    padding-top: 300px;"><img style="    width: 250px;" alt="" src="./resources/images/home/homeDrama.png"></p>

				<div class="mainDramaList" style="margin: 0 auto;    width: 1000px;   overflow: overlay;    padding: 50px;">
				<c:forEach begin="0" end="5" var = "j">
					<a href="./drama/dramaview?drama_num=${list[j].drama_num}">
					<div class="col-md-4 unpa-ad-responsive-parent"  style="    PADDING-LEFT: 50PX; width: 300px; height: 345px; PADDING-RIGHT: 50PX;    MARGIN-TOP: 50PX;">
						<!-- <div class="unpa-card unpa-card-box-shadow unpa-review" style="background-color: snow;"> -->
							<div class="main-section"
								style="width: 200PX;">
								<%-- <a class="user-info-link" href="">
									<div class="user-info" style="display: inline-block; ">
										<div class="unpa-feed-user-info-box">
											<div class="unpa-user-block">
												<div class="user-labels" style="margin-top: 5px;">
													<span class="skin-type false ">${list[j].place}</span>
												</div>
											</div>
										</div>
									</div>
									<div class="time">${list[j].file_num}</div>
								</a> --%>
								<div class="unpa-feed-card-hover-actions">
									<span class="unpa-share-this-button"><i
										class="unpacon-share"></i></span>

								</div>

					<a href="./drama/dramaview?drama_num=${list[j].drama_num}">
								<div class="main-image"
									style="background-position: center; width: 220px;height: 220px; border-radius: 100%; background-image: url('./resources/upload/${file[j].file_name}');">
									<%-- <div class="content">
										${list[j].contents}
									</div> --%>
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
						<!-- </div> -->
					</div>	
					</a>
				</c:forEach>
				</div>
					
<!-- 

	<a href="drama/dramaList">Drama List</a>
	<a href="./notice/noticeList">Go Notice</a>
	<a href="./qna/qnaList">Go Qna</a>
	<a href="javascript:popupOpen();" > chatting! </a>
	<a href="./point/pointList">pointList</a>
	<a href="./point/pointCheck">pointCheck</a>	
	
	 -->
		
<!-- HOME FOOTER -->
	<div style="padding: 50px 0 60px 0; margin-top: 30px; background: #eee;">
		<div class="main_wrap" style="width: 960px; margin: 0 auto;">
		
		

			<div class="main_cs_divide" style="text-align: center;" alt="출석체크">
			
			<c:if test="${member.id eq null}">
				<a href="#"onclick="if(!alert('출석체크를 하려면 로그인이 필요합니다.')){return false;}">
				<img src="./resources/images/home/btn_point.png"
					style="padding: 8px 10px;">
			</c:if>
			<c:if test="${member.id ne null}">
				<a href="./point/pointCheck"> <img
					src="./resources/images/home/btn_point.png"
					style="padding: 8px 10px;">
			</c:if>
				</a> <a href="./member/faq"> <img
					src="./resources/images/home/btn_faq.png"
					style="padding: 8px 10px;">
				</a> <a href="javascript:popupOpen();"> <img
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
	
	
	
	<!-- <!--  --> -->
	<div class="row">
  <div class="col-sm-6">
 
    <!-- normal -->
    <div class="ih-item circle effect5"><a href="#">
        <div class="img"><img src="images/assets/1.jpg" alt="img"></div>
        <div class="info">
          <div class="info-back">
            <h3>Heading here</h3>
            <p>Description goes here</p>
          </div>
        </div></a></div>
    <!-- end normal -->
 
  </div>
  <div class="col-sm-6">
 
    <!-- colored -->
    <div class="ih-item circle colored effect5"><a href="#">
        <div class="img"><img src="images/assets/3.jpg" alt="img"></div>
        <div class="info">
          <div class="info-back">
            <h3>Heading here</h3>
            <p>Description goes here</p>
          </div>
        </div></a></div>
    <!-- end colored -->
 
  </div>
</div>
	<c:import url="./temp/footer.jsp"></c:import>
</body>



</html>
