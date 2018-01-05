<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>
		
		
			<div id="afterview_list">
		<div id="point_box">
		
		<div id="point_box1">별점<span style="color:red;"></span>  <!-- 별점/후기인원수 --><span id="star_total">${avg }/5.0 (총  ${total }  명)</span></div>
		<div id="point_box2"style="padding-top:10px;">
			<span class="starRating"><span style="width:100%"></span>
			</span>
		</div>
		<div id="point_box3">실제 관객이 남긴 평균 별점입니다.</div>
		 
		
		
		
		</div>
		</div>
		<div id="afterview_box_list">
			<table>
			<c:if test="${review==null }">
					<tr>
					<td><div id="afterview_box_a">아직 등록된 후기/별점이 없습니다.</div></td>
					</tr>
			</c:if>
				<c:forEach items="${review }" var="re">
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
			
				</c:forEach>
			</table>
		<div id="paging">
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
		
</body>
</html>