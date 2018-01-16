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
<style type="text/css">


.search_wrap{
    width: 1100px;
    float: right;
    background-color: #79554829;
    height: auto;
    padding-top:10px;
    padding-bottom: 10px;
}
.search_wrap form{
	float: right;
	width: auto;
	margin-right: 20px;
}

.tbh{
	margin-top: 20px;
}
/* .tbh a:hover{
	color: #3e2922;
} */
.td-main{
	padding-left:10px;
	font-weight: 700;
}
#tb_title{
	width: 850px;
	text-align: center;
}
.bottom_n{
	text-align: center;
	margin-top: -24px;
}
.btn{
	margin-top: 10px;
	color: #795548;    
	font-family: 'Nanum Gothic', sans-serif;
}
</style>
<link href="../resources/css/common/header.css" rel="stylesheet">
<link href="../resources/css/board/boardHeader.css" rel="stylesheet">
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
<div class="head_line">
<div class="title_wrap">
	<h1 id="h1_title"><a href="${pageContext.request.contextPath}/notice/noticeList">${fn:toUpperCase(board)}</a></h1>
	<h6 id="h6_title"><a href="${pageContext.request.contextPath}"><img alt="" src="../resources/images/common/homeImg.png" id="homeImg"></a> > <a href="${pageContext.request.contextPath}/notice/noticeList">${fn:toUpperCase(board)}</a></h6>
	</div>
</div>
<div class="board_wrap1">
	<div class="list_wrap">
	
	<div class="search_wrap">
	<form name="frm" action="./${board}List" method="get">
		<input type="hidden" name="curPage" value="1">
		<select name="kind">
			<option>Title</option>
			<option>Writer</option>
			<option>Contents</option>
		</select>
		<input type="text" name="search">
		<button>검색</button>
	</form>
	</div>
	<div class="tbh">
	<table class="table table-hover">
		<tr>
			<td class="td-main">NO</td>
			<td id="tb_title" class="td-main">TITLE</td>
			<!-- <td>WRITER</td> -->
			<td class="td-main">DATE</td>
			<td class="td-main">HIT</td>
		</tr>
		<c:forEach items="${arlist}" var="dto">
		
		
		<c:if test="${board eq 'notice'}">
			<tr>
				<td>${dto.notice_num}</td>
				<td>
					<c:catch>
						<c:forEach begin="1" end="${dto.depth-1}">
							--
						</c:forEach>
					</c:catch>
					<a href="./${board}View.${board}?num=${dto.notice_num}">${dto.title}</a>
				</td>
				<%-- <td>${member.id}</td> --%>
				<td>${dto.reg_date}</td>
				<td>${dto.hit}</td>
			</tr>
		</c:if>
		<c:if test="${board eq 'event'}">
			<tr>
				<td>${dto.event_num}</td>
				<td>
					<c:catch>
						<c:forEach begin="1" end="${dto.depth-1}">
							--
						</c:forEach>
					</c:catch>
					<a href="./${board}View.${board}?num=${dto.event_num}">${dto.title}</a>
				</td>
				<td>${dto.reg_date}</td>
				<td>${dto.hit}</td>
			</tr>
		</c:if>
		
		
		</c:forEach>
	</table>
	
	<div class="bottom_n">
		<c:if test="${pager.curBlock gt 1}">
			<span class="list" title="${pager.startNum-1}">[이전]</span>
		</c:if>
		<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			<span class="list" title="${i}">${i}</span>
		</c:forEach>
		<c:if test="${pager.curBlock lt pager.totalBlock}">
			<span class="list" title="${pager.lastNum+1}">[다음]</span>
		</c:if>
	</div>
	
	<c:if test="${member ne null}">
	<a href="${board}Write" class="btn btn-default" style="float: right; margin-right: 10px;">WRITE</a>
	</c:if>
	</div>			
</div>
</div>
<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>