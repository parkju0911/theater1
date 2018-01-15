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
h1 {
	text-align: center;
}

table {
	margin: 0 auto;
	width: 1000px;
	/* border: 1px solid #ddd; */
	border-collapse: collapse;
}

td {
	height: 25px;
	text-align: center;
	padding: 10px;
	font-size: 10.5px;
	color: #50382f;    
	padding-top: 20px;
}

.write_ip {
	padding: 3px;
	width: 200px;
	border-radius: 4px;
	border: 1px solid #ddd;
}

.content textarea {
	height: 100px;
	width: 95%;
	border: 1px solid #ddd;
	border-radius: 4px;
	color: gray;
}

.btn {
	padding: 5px 7px;
	border-radius: 4px;
	font-size: 13px;
	float: right;
    margin-right: 106px;
}
</style>
<link href="../resources/css/board/boardHeader.css" rel="stylesheet">
<link href="../resources/css/common/header.css" rel="stylesheet">
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
<div class="title_wrap" style="width: 1000px;font-family: 'Nanum Gothic', sans-serif;">
			<h6 id="h6_title" style="margin-right: 5px; margin-top: 8px;">
				<a href="${pageContext.request.contextPath}"><img alt=""
					src="../resources/images/common/homeImg.png" id="homeImg"></a> >
				<a href="${pageContext.request.contextPath}/member/memberMypage">MYPAGE</a>
				> <a href="${pageContext.request.contextPath}/member/orderlist">FAQ</a>
				> <a href="${pageContext.request.contextPath}/member/orderlist">FAQ WRITE</a>
			</h6>
		</div>
<div class="board_wrap1">
	<form action="faqWrite" method="post" id="frm">
		<table>
			<tr>
				<td style="margin-left: 10px; float: left;">제목 : 
					<input type="text" name="title" placeholder="제목을 입력해주세요." class="write_ip"
				 style="width: 500px; border: none; border-bottom: 1px solid lightgray; border-radius:0px;"></td>
				<td style="float: right; margin-right: 50px; padding-bottom: 20px;">작성자 : 
					<input type="text" name="id" value="${member.id}" class="write_ip" readonly="readonly"
				 style="width: 150px; border: none; border-bottom: 1px solid lightgray; border-radius:0px;"></td>
			</tr>
			<tr>
				<td class="content" colspan="2">
					<textarea id="contents" name="contents" draggable="false">내용을 입력해주세요.</textarea>
				</td>
			</tr>
		</table>		
		<input type="submit" id="savebutton" value="write" class="btn btn-default">
	</form>
	</div>
<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>