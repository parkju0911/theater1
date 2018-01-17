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
<title>Insert title here</title>

<style type="text/css">
.faq_mainlist {
	list-style: none;
	border: 2px solid #795548;
	padding: 12px;
	padding-left: 20px;
    background-color: #fffffb;	
}

.faq_mainlist li {
	margin-bottom: 5px;
	margin-top: 5px;
	font-weight: 700;
	font-family: sans-serif;
}

@use postcss-color-function;
@use postcss-nested;
@import url("https://fonts.googleapis.com/css?family=Raleway:400,700,900");

/* Base styling */
.search__container {
	padding-top: 32px;
}

.search__title {
	font-size: 22px;
	font-weight: 900;
	text-align: center;
	color: #ff8b88;
}

.search__input {
	width: 93%;
	height:42px;
	margin-left: 3%;
	padding: 12px 24px;
	background-color: transparent;
	transition: transform 250ms ease-in-out;
	font-size: 14px;
	line-height: 18px;
	color: #575756;
	background-color: transparent;
	background-image: url(http://mihaeltomic.com/codepen/input-search/ic_search_black_24px.svg);
	background-repeat: no-repeat;
	background-size: 18px 18px;
	background-position: 97% center;
	border-radius: 50px;
	border: 1px solid #575756;
	transition: all 250ms ease-in-out;
	backface-visibility: hidden;
	transform-style: preserve-3d; .
	search: :placeholder{
            color: color(#575756 a(0.8));
	text-transform: uppercase;
	letter-spacing: 1.5px;
}

.search:hover, .search:focus {
	padding: 12px 0;
	outline: 0;
	border: 1px solid transparent;
	border-bottom: 1px solid #575756;
	border-radius: 0;
	background-position: 100% center;
}
.list {
	cursor: pointer;
}
</style>
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
<link href="../resources/css/common/header.css" rel="stylesheet">
<link href="../resources/css/board/boardHeader.css" rel="stylesheet">
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>


	<div class="container" style="width: 935px; margin: 0 auto;">
		<div class="title_wrap"
			style="width: 1000px; border-top: 2px solid #5d4137; padding-top: 8px; font-family: 'Nanum Gothic', sans-serif;">
			<h6 id="h6_title" style="margin-right: 5px; margin-top: 8px;">
				<a href="${pageContext.request.contextPath}"><img alt=""
					src="../resources/images/common/homeImg.png" id="homeImg"></a> >
				<a href="${pageContext.request.contextPath}/member/memberMypage">MYPAGE</a>
				> <a href="${pageContext.request.contextPath}/member/orderlist">Q&A</a>
			</h6>
		</div>
		<h2 style="font: 40px/41px 'fMdBT'">Q&A</h2>
		<p
			style="font-family: 'Nanum Gothic', sans-serif; padding-bottom: 17px;">
			자주 문의되는 질문들은 FAQ에서 확인할 수 있으며,<br> 그 외 개인적으로 운영자에게 묻고 싶은 질문은 1:1
			Q&A 게시판을 이용해주세요.
		</p>

		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#faq">FAQ</a></li>
			<li><a data-toggle="tab" href="#qna">1:1 Q&A</a></li>
		</ul>
		<div class="tab-content">
			<div id="faq" class="tab-pane fade in active">
				<h3 style="font-family: 'Nanum Gothic', sans-serif;">자주 묻는 질문</h3>
				<div class="faq_content">
					<ul class="faq_mainlist" style="font-family: inherit;">
						<li>Q. 티켓은 어떻게 사용하죠?</li>
						<li>Q. 티켓을 환불/취소하고 싶어요!</li>
						<li>Q. 구매 후 영수증은 어떻게 발급받나요?</li>
					</ul>

					<form name="frm" action="./faq" method="get">
						<input type="hidden" name="curPage" value="1">
						<input type="hidden" name="kind" value="title">
						<div class="search_wrap">
							<div class="search__container">
								<input class="search__input" type="text" placeholder="Search"  name="search">
							</div>
						</div>
					</form>
					<div class="list_wrap" style="padding-top: 17px;">
						<div class="tbh">
							<table class="table table-hover">
								<tr style="background-color: #fffffb;">
									<td class="td-main" size="10" >NO</td>
									<td id="tb_title" class="td-main">TITLE</td>
								</tr>
								<c:forEach items="${list}" var="dto">
									<tr>
										<td>${dto.faq_num}</td>
										<td><a href="./faqView?num=${dto.faq_num}">${dto.title}</a></td>
									</tr>
								</c:forEach>
							</table>
							<div class="pager">
								<c:if test="${pager.curBlock gt 1}">
									<span class="list" title="${pager.startNum-1}">Previous</span>
								</c:if>
								<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
									var="i">
									<span class="list" title="${i}">${i}</span>
								</c:forEach>
								<c:if test="${pager.curBlock lt pager.totalBlock}">
									<span class="list" title="${pager.lastNum+1}">Next</span>
								</c:if>
							</div>
							<c:if test="${member ne null}">
								<a href="faqWrite?id=${member.id}" class="btn" style="margin: 0 auto;">WRITE</a>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<div id="qna" class="tab-pane fade">
				<h3>1:1 QA</h3>
				<p>Sed ut perspiciatis unde omnis iste natus error sit
					voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
			</div>
		</div>

	</div>
	<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>