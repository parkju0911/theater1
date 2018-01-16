<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
@import url('http://fonts.googleapis.com/earlyaccess/nanumgothic.css');
*{
	margin: 0;
	padding: 0;
	font-family: 'Nanum Gothic', sans-serif;
}
h1{
	text-align: center;
}
table {
	margin: 0 auto;
	border: 1px solid #ddd;
	border-collapse: collapse;
	width: 1100px;
}
td{
	border: 1px solid #ddd;
	height: 25px;
	text-align: center;
}
.content{
	height: 100px;
}

.b_title{
	border-top: 1.5px solid #50382f;
    border-bottom: 1.5px solid #50382f;
    padding: 15px 140px 15px 15px;
    font-size: 16px;
    font-weight:Bold;
}
.b_contents{
 padding: 15px 140px 15px 15px;
    font-size: 14px;
    width: auto;
   min-height: 430px;
    border-bottom: 1.2px solid #aba9a9;
}
.btn-group{
	float: right;
}
.btn{
	margin-top: 10px;
	color: #795548;    
	font-family: 'Nanum Gothic', sans-serif;
}
#list_btn{
	float: left;
}

</style>
<link href="../resources/css/board/boardHeader.css" rel="stylesheet">
<link href="../resources/css/common/header.css" rel="stylesheet">
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
<%-- <div class="head_line">
<div class="title_wrap" style=" font-family: 'Nanum Gothic', sans-serif;">
	<h1 id="h1_title"><a href="${pageContext.request.contextPath}/member/faqView.faq?faq_num=${view.faq_num}">FAQ</a></h1>
	<h6 id="h6_title"><a href="${pageContext.request.contextPath}"><img alt="" src="../resources/images/common/homeImg.png" id="homeImg"></a> > <a href="${pageContext.request.contextPath}/member/faq">FAQ</a> > 
	<a href="${pageContext.request.contextPath}/member/faqView.faq?faq_num=${view.faq_num}">${view.title}</a></h6>
	</div>
</div> --%>
<div class="board_wrap1">
	<p class="b_title">${view.title}</p>
	<div class="b_contents">${view.contents}</div>
	
	<div class="btn-group">
	<a href="./faqUpdate?num=${view.faq_num}" class="btn btn-default">수정</a>
	<a href="./faqDelete?num=${view.faq_num}" class="btn btn-default" onclick="if(!confirm('정말로 삭제하시겠습니까?')){return false;}">삭제</a>
	</div>
	
	<a href="./faq" id="list_btn" class="btn btn-default">목록</a>
	</div>
<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>