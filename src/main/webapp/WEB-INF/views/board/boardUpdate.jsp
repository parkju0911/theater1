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
<script type="text/javascript" src="../resources/SE2/js/HuskyEZCreator.js"></script>
<script type="text/javascript">
	
	$(function() {
		//SmartEditor start
		//전역변수선언
		var editor_object = [];

		nhn.husky.EZCreator.createInIFrame({
			oAppRef : editor_object,
			//textarea ID
			elPlaceHolder : "contents",
			sSkinURI : "../resources/SE2/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,
			}
		});

		//전송버튼 클릭이벤트
		$("#savebutton").click(
			function() {
			//id가 smarteditor인 textarea에 에디터에서 대입
			editor_object.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
			$("#frm").submit();
		});
		//SmartEditor end

	});
</script>


<style type="text/css">
h1{
	text-align: center;
}
table {
	margin: 0 auto;
	width: 80%;
	border-collapse: collapse;
}
td{
	height: 25px;
	text-align: center;
	padding: 10px;
	font-size: 10.5px;
	color: #50382f;    
	padding-top: 20px;
}
input{
	padding: 3px;
	width: 200px;
	border-radius: 4px;
	border: 1px solid #ddd;
}
.content textarea{
	height: 100px;
	width: 95%;
	border: 1px solid #ddd;
	border-radius: 4px;
	color: gray;
}
.btn{
	padding: 5px 7px;
	border-radius: 4px;
	font-size: 13px;
	float: right;
	margin-right: 160px;
    width: 68px;
}
</style>
<link href="../resources/css/board/boardHeader.css" rel="stylesheet">
<link href="../resources/css/common/header.css" rel="stylesheet">
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
<div class="head_line">
<div class="title_wrap" style=" font-family: 'Nanum Gothic', sans-serif;">
	<c:if test="${board eq 'notice'}">
	<h1 id="h1_title"><a href="${pageContext.request.contextPath}/${board}/${board}View.${board}?num=${view.notice_num}">${fn:toUpperCase(board)}</a></h1>
	<h6 id="h6_title"><a href="${pageContext.request.contextPath}"><img alt="" src="../resources/images/common/homeImg.png" id="homeImg"></a> > <a href="${pageContext.request.contextPath}/notice/noticeList">${fn:toUpperCase(board)}</a> > 
	<a href="${pageContext.request.contextPath}/${board}/${board}View.${board}?num=${view.notice_num}">${fn:toUpperCase(board)} WRITE</a></h6>
	</c:if>
	<c:if test="${board eq 'event'}">
	<h1 id="h1_title"><a href="${pageContext.request.contextPath}/${board}/${board}View.${board}?num=${view.event_num}">${fn:toUpperCase(board)}</a></h1>
	<h6 id="h6_title"><a href="${pageContext.request.contextPath}"><img alt="" src="../resources/images/common/homeImg.png" id="homeImg"></a> > <a href="${pageContext.request.contextPath}/notice/noticeList">${fn:toUpperCase(board)}</a> > 
	<a href="${pageContext.request.contextPath}/${board}/${board}View.${board}?num=${view.event_num}">${fn:toUpperCase(board)} WRITE</a></h6>
	</c:if>
	
	</div>
</div>
<div class="board_wrap1">
	
	<form action="${board}Update" method="post" id="frm" enctype="multipart/form-data">
		<table>
		<tr>
			<td style="margin-left: 10px; float: left;">제목 : <input type="text" name="title" placeholder="제목을 입력해주세요." class="write_ip"
				 style="width: 500px; border: none; border-bottom: 1px solid lightgray; border-radius:0px;" value="${view.title}"></td>
				<td style="float: right; margin-right: 50px; padding-bottom: 20px;">작성자 : <input type="text" value="${member.id}" placeholder="글쓴이를 입력해주세요." class="write_ip" readonly="readonly"
				 style="width: 150px; border: none; border-bottom: 1px solid lightgray; border-radius:0px;"></td>
			<%-- <td><input type="text" name="title" value="${view.title}"></td> --%>
			<%-- <td><input type="text" name="writer" value="${view.writer}"></td> --%>
			
		</tr>
		<tr>
			<td class="content" colspan="2">
				<textarea id="contents" name="contents" draggable="false">${view.contents}</textarea>
			</td>
		</tr>
	</table>	
	<input type="button" id="savebutton" value="update" class="btn btn-default">
	</form>
	</div>
<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>