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
<script type="text/javascript" src="../resources/SE2/js/HuskyEZCreator.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <title>Home</title>
<link href="./resources/css/common/header.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style type="text/css">
.member_wrap a {
   margin-top: 10px;
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


<%-- <form name="frm" action="./${board}List" method="get">
		<c:forEach items="${list}" var="dto">
		<input type="hidden" name="curPage" value="1">
		<select name="kind">
			<option>Title</option>
			<option>Writer</option>
			<option>Contents</option>
		</select>
		<input type="text" name="search">
		<button>검색</button>
		</c:forEach>
	</form> --%>


	<div class="w3-content w3-display-container" style="max-width: 800px;">

		<img class="mySlides" src="./resources/images/home/sliderImg10.png"
			style="width: 100%"> <img class="mySlides"
			src="./resources/images/home/sliderImg9.png" style="width: 100%">
		<img class="mySlides" src="./resources/images/home/sliderImg8.png"
			style="width: 100%"> <img class="mySlides"
			src="./resources/images/home/sliderImg7.png" style="width: 100%">
		<img class="mySlides" src="./resources/images/home/sliderImg6.png"
			style="width: 100%">

		<div
			class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle"
			style="width: 100%">
			<div class="w3-left w3-hover-text-khaki" onclick="plusDivs(-1)">&#10094;</div>
			<div class="w3-right w3-hover-text-khaki" onclick="plusDivs(1)">&#10095;</div>
			<span class="w3-badge demo w3-border w3-transparent w3-hover-white"
				onclick="currentDiv(1)"></span> <span
				class="w3-badge demo w3-border w3-transparent w3-hover-white"
				onclick="currentDiv(2)"></span> <span
				class="w3-badge demo w3-border w3-transparent w3-hover-white"
				onclick="currentDiv(3)"></span> <span
				class="w3-badge demo w3-border w3-transparent w3-hover-white"
				onclick="currentDiv(4)"></span> <span
				class="w3-badge demo w3-border w3-transparent w3-hover-white"
				onclick="currentDiv(5)"></span>
		</div>
	</div>

	<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
     dots[i].className = dots[i].className.replace(" w3-white", "");
  }
  x[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " w3-white";
}
</script>



	<!-- 

<div class="w3-content w3-display-container">

<div class="w3-display-container mySlides">
  <img src="./resources/images/home/main.jpg" style="width:100%">
</div>

<div class="w3-display-container mySlides">
  <img src="./resources/images/home/main1.jpg" style="width:100%">
</div>

<div class="w3-display-container mySlides">
  <img src="./resources/images/home/main2.jpg" style="width:100%">
</div>

<div class="w3-display-container mySlides">
  <img src="./resources/images/home/main3.jpg" style="width:100%">
</div>

<div class="w3-display-container mySlides">
  <img src="./resources/images/home/main4.jpg" style="width:100%">
</div>


<button class="w3-button w3-display-left w3-black" onclick="plusDivs(-1)">&#10094;</button>
<button class="w3-button w3-display-right w3-black" onclick="plusDivs(1)">&#10095;</button>

</div>

<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
</script> -->


	<a href="drama/dramaList">Drama List</a>
	<a href="./notice/noticeList">Go Notice</a>
	<a href="./qna/qnaList">Go Qna</a>
	<a href="./drama/chatform">chatting</a>
	<a href="./point/pointList">pointList</a>
	<a href="./point/pointCheck">pointCheck</a>


<script type="text/javascript">
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
</script>

	<div
		style="padding: 50px 0 60px 0; margin-top: 30px; background: #eee;">
		<div class="main_wrap" style="width: 960px; margin: 0 auto;">

			<div class="main_cs_divide" style="text-align: center;" alt="출석체크">
				<a href="./point/pointList"> <img
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
					<%-- 
					
					<c:forEach items="${list}" var="dto">
					<ul>
						<li><div class="main_notice_txt ellip">
						<img src="./resources/images/home/icon_box.png" style="padding: 0 4px 1px 0;">
						<a href="./notice/noticeView.notice?num=${dto.notice_num}">${dto.title}</a>
						</div>
						
					</ul>
					</c:forEach>
					 --%>
					
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<c:forEach begin="0" end="1" var = "i">
							<tbody>
								<tr>
								<td valign="top" align="center">
									<div class="main_notice_txt ellip">
									<a href="./notice/noticeView.notice?num=${list[i].notice_num}" style="color: #000;">
										<img src="./resources/images/home/icon_box.png" style="padding: 0 4px 1px 0;">
										${list[i].title}</a>
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

	<c:import url="./temp/footer.jsp"></c:import>
</body>



</html>
