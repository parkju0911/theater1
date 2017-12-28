<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
	.list {
		cursor: pointer;
	}
</style>
<link href="../resources/css/common/header.css" rel="stylesheet">
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>

<div class="board_wrap">
	<h1>${fn:toUpperCase(board)} List</h1>
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
	<table class="table table-hover">
		<tr>
			<td>NUM</td>
			<td>TITLE</td>
			<!-- <td>WRITER</td> -->
			<td>DATE</td>
			<td>HIT</td>
		</tr>
		<c:forEach items="${list}" var="dto">
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
				<%-- <td>${dto.writer}</td> --%>
				<td>${dto.reg_date}</td>
				<td>${dto.hit}</td>
			</tr>
		</c:forEach>
	</table>
	
	<div>
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
	
	<a href="${board}Write">WRITE</a>
	</div>
<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>