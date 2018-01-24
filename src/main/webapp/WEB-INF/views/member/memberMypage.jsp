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
<script type="text/javascript" src="../resources/SE2/js/HuskyEZCreator.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Insert title here</title>
<style type="text/css">
.contents{
	height: auto;
    width: 1100px;
    margin: 0 auto;
    padding-bottom: 50px;
    margin-top: 16px;
    border-top: 2px solid #5d4137;
}
.contents_wrap{
	height: auto;
    width: 1000px;
    margin: 0 auto;
    padding-top: 5px;
}
#myImg{
	width: 100%;
    height: 105%;
}
.mypage_wrap table{
	margin: 0 auto;
}
.mypage_wrap td{
	padding: 22px;
}
.help {
    text-align: left;
    width: 700px;
    margin: 0 auto;
    border-top: 1px outset;
    font-size: 12px;
        margin-top: 15px;
        color: #795548;
}
.help h6{
	font-weight: 700;
	color: #e0a814;
}
.help ul{
	list-style: none;
	font-size: 12px;
	margin-bottom: 20px;
}
.help li {
    margin-bottom: -8px;
}
</style>
<script type="text/javascript">
	var result = '${result}';
	if(result != ""){
		alert('${result}');
	}
	

	
	function popupOpen(){

		var popUrl = "http://192.168.20.48/project/drama/chatform";	//팝업창에 출력될 페이지 URL

		var popOption = "width=360, height=440, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

			window.open(popUrl,"",popOption);

		}
</script>
</head>
<link href="../resources/css/common/header.css" rel="stylesheet">
<link href="../resources/css/board/boardHeader.css" rel="stylesheet">
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>

<div class="contents">
	<div class="contents_wrap">
		<div class="title_wrap" style="width: 1000px; font-family: 'Nanum Gothic', sans-serif;">
		<h6 id="h6_title" style="margin-right: 5px; margin-top: 8px;"><a href="${pageContext.request.contextPath}">
		<img alt="" src="../resources/images/common/homeImg.png" id="homeImg"></a> > 
		<a href="${pageContext.request.contextPath}/member/memberMypage">MYPAGE</a></h6>
		</div>
		<h2 style="margin-top: -3px; font: 40px/41px 'fMdBT';">MYPAGE</h2>
		<p style="padding-bottom: 50px;font-size: 11px;font-family: 'Nanum Gothic', sans-serif;"> ♥ ${member.id} 회원님, 항상 TEATRO를 사랑해 주셔서 감사합니다 =)</p>
		
		<div class="mypage_wrap">
		<c:if test="${member.kind eq 'user'}">
			<table>
				<tr>
					<td><a href="${pageContext.request.contextPath}/member/orderlist"><img alt="" src="../resources/images/member/order.png" id="myImg"></a></td>
					<td><a href="${pageContext.request.contextPath}/member/membership"><img alt="" src="../resources/images/member/membership.png" id="myImg"></a></td>					
					<td><a href="${pageContext.request.contextPath}/point/pointList"><img alt="" src="../resources/images/member/point.png" id="myImg"></a></td>
				</tr>
				<tr>
					<td><a href="${pageContext.request.contextPath}/member/myboard"><img alt="" src="../resources/images/member/board.png" id="myImg"></a></td>
					<td><a href="${pageContext.request.contextPath}/member/faq"><img alt="" src="../resources/images/member/faq.png" id="myImg"></a></td>
					<td><a href="javascript:popupOpen();"><img alt="" src="../resources/images/member/qna.png" id="myImg"></a></td>
				</tr>
			</table>
		<div class="help">
		    <ul>
			    <li><h6>예매 내역</h6></li>
				<li>회원님이 예매한 내역을 볼 수 있습니다.</li>
		    </ul>
		    <ul>
			    <li><h6>회원정보 수정</h6></li>
				<li>회원님이 입력하신 회원 정보를 보거나 수정할 수 있습니다.</li>
		    </ul>
		    <ul>
			    <li><h6>포인트 조회</h6></li>
				<li>회원님의 적립된 포인트 내역을 확인할 수 있습니다.</li>
		    </ul>
		    <ul>
			    <li><h6>게시물 관리</h6></li>
				<li>회원님이 작성한 리뷰 등 작성 게시물들을 확인 할 수 있습니다.</li>
		    </ul>
		    <ul>
			    <li><h6>FAQ</h6></li>
				<li>고객들이 자주 묻는 질문을 모아둔 게시판 입니다.</li>
		    </ul>
		    <ul>
			    <li><h6>1:1 Q&A</h6></li>
				<li>FAQ이외에 질문들을 운영자와의 실시간 채팅을 통하여 질문할 수 있습니다.</li>
		    </ul>
		</div>
		</c:if>
		<c:if test="${member.kind eq 'company'}">
			<table>
				<tr>
					<td><a href="${pageContext.request.contextPath}/member/membership"><img alt="" src="../resources/images/member/membership.png" id="myImg"></a></td>	
					<td><a href="${pageContext.request.contextPath}/member/myboard"><img alt="" src="../resources/images/member/board.png" id="myImg"></a></td>
				</tr>
				<tr>
					<td><a href="${pageContext.request.contextPath}/member/faq"><img alt="" src="../resources/images/member/faq.png" id="myImg"></a></td>
					<td><a href="javascript:popupOpen();"><img alt="" src="../resources/images/member/qna.png" id="myImg"></a></td>
				</tr>
			</table>
		<div class="help">
		    <ul>
			    <li><h6>회원정보 수정</h6></li>
				<li>회원님이 입력하신 회원 정보를 보거나 수정할 수 있습니다.</li>
		    </ul>
		    <ul>
			    <li><h6>게시물 관리</h6></li>
				<li>회원님이 작성한 공연정보 등 작성 게시물들을 확인 할 수 있습니다.</li>
		    </ul>
		    <ul>
			    <li><h6>FAQ</h6></li>
				<li>고객들이 자주 묻는 질문을 모아둔 게시판 입니다.</li>
		    </ul>
		    <ul>
			    <li><h6>1:1 Q&A</h6></li>
				<li>FAQ이외에 질문들을 운영자와의 실시간 채팅을 통하여 질문할 수 있습니다.</li>
		    </ul>
		</div>
		</c:if>	
		</div>
		
	</div>
</div>

<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>