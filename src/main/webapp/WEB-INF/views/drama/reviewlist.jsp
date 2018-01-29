<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Review List</title>
<link href="../resources/css/drama/reviewlist.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
	
	//후기 전체 보기 클릭시 후기 리스트 출력
	$("#reviewlist_al").click(function() {
		
	window.open("./reviewlist?drama_num=" +${drama_num} ,"후기 전체보기", "width=800 , height=400 , top=200, left=520 , resize=none , location=no, scrollbars=no, menubar=no");

	});

	
	$(".list").click(function() {
		var cur = $(this).attr("title");
		var s = '${pager.search}';
		var v = '${pager.kind}';
		$("#curPage").val(cur);
		$("#search").val(s);
		$("#kind").val(v);
		$("#frm").submit();
	});
	
	$("#close").click(function() {
		window.opener.location.reload();
		self.close();
});	
});

</script>
<style type="text/css">
.list {
		cursor: pointer;
	}
	body{
	background-color: #fffff8;
	}
</style>
</head>
<body>
		
			<div id="afterview_list">
					<div id="point_box">
		
				<div id="point_box1">별점<span style="color:red;"></span>  <!-- 별점/후기인원수 --><span id="star_total">${avg }/5.0 (총  ${total }  명) </span></div>
					<div id="point_box2"style="padding-top:10px;">
		
						<div class="starRating">
							<span style="width: ${avg*10*2}%;"></span>
						</div>

					</div>
		<div id="point_box3">실제 관객이 남긴 평균 별점입니다.</div>
		 
		
				</div>
		</div>
		
		<div id="afterview_box_list">
			<table>
			<c:if test="${empty review }">
					<tr>
					<td><div id="afterview_box_a">아직 등록된 후기/별점이 없습니다.</div></td>
					</tr>
			</c:if>
				<c:forEach items="${review }" var="re" begin="0" end="5">
			 		<c:if test="${re.drama_num eq drama_num }">
				
				<tr>
				<td><div id="afterview_box_a">${re.id } (${re.review_date })</div></td>
				</tr>
				<tr>
				<td><div id="atfterview_box_b">
				<c:if test="${re.star==5 }">
				<img alt="" style="height: 17px" src="../resources/images/starpoint/star_5.png"> ${re.contents }
				</c:if>
				<c:if test="${re.star==4 }">
				<img alt="" style="height: 17px" src="../resources/images/starpoint/star_4.png"> ${re.contents }
				</c:if>
				<c:if test="${re.star==3 }">
				<img alt="" style="height: 17px" src="../resources/images/starpoint/star_3.png"> ${re.contents}
				</c:if>
				<c:if test="${re.star==2 }">
				<img alt="" style="height: 17px" src="../resources/images/starpoint/star_2.png"> ${re.contents }
				</c:if>
				<c:if test="${re.star==1 }">
				<img alt=""  style="height: 17px" src="../resources/images/starpoint/star_1.png"> ${re.contents }
				</c:if>
				</div>
				</td>
				</tr>
					</c:if>
				</c:forEach>
			</table>
			
			<c:if test="${!empty review }">
				<div id="afterview_total2">
					<a href="##" id="reviewlist_al">후기 전체보기></a>
				</div>
				</c:if>
			
	
		<div  class="pagination"   id="paging">
		<c:if test="${pager.curBlock gt 1}">
				<li><a href="./reviewlist?drama_num=${drama_num}&curPage=${i}" class="paging_move" id="move">[이전]</a></li>
		</c:if>
		<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
		
			<li><a href="./reviewlist?drama_num=${drama_num}&curPage=${i} " class="paging_move">${i}</a></li>
		</c:forEach>
		<c:if test="${pager.curBlock lt pager.totalBlock}">
			<li><a href="./reviewlist?drama_num=${drama_num}&curPage=${i} " class="paging_move">${i}</a></li>
		</c:if>
		</div>
	
	<div id="hidden_btn">
		<input type="button" value="Close" id="close">
	</div>	

</body>
</html>