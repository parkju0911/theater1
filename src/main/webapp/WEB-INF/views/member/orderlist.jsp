<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link href="../resources/css/common/header.css" rel="stylesheet">
<link href="../resources/css/board/boardHeader.css" rel="stylesheet">
<link href="../resources/css/member/orderlist.css" rel="stylesheet">
<script type="text/javascript">
	$(function(){
		$(".sign").each(function(){
			var sign=$(this).attr("title");
			if(sign=='적립'){
				$(this).html('+');
			}else{
				$(this).html('-');
			}
		});
	});
</script>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
     <div class="orderListArea">
     <div class="title_wrap" style="width: 1000px;">
		<h6 id="h6_title" style="margin-right: 5px; margin-top: 8px;">
		<a href="${pageContext.request.contextPath}"><img alt="" src="../resources/images/common/homeImg.png" id="homeImg"></a> > 
		<a href="${pageContext.request.contextPath}/member/memberMypage">MYPAGE</a>
		 > <a href="${pageContext.request.contextPath}/member/orderlist">ORDER LIST</a></h6>
		</div> 
		<h2 style="margin-top: 20px; font: 40px/41px 'fMdBT'; padding-bottom: 20px;">ORDER LIST</h2>
			<!-- 기본배송 -->
			<div class="ec-base-table typeList ">
				<table border="1">
					<caption>기본배송</caption>
					<thead>
						<tr>
							<th scope="col">구매날짜</th>
							<th scope="col">티켓정보</th>
							<th scope="col">구매자</th>
							<th scope="col">관람일시</th>
							<th scope="col">티켓가격</th>
							<th scope="col">수량</th>
							<th scope="col">적립금</th>
							<th scope="col">합계</th>
						</tr>
					</thead>
					<tbody class="xans-element- xans-order xans-order-normallist center">
						<c:forEach items="${orderList}" var="dto">
							<tr class="xans-record-">
								<td>${dto.reg_date}</td>
								<td>
									<a href="#">
										<img src="${pageContext.request.contextPath}/resources/upload/${dto.file_name}"class="buyImage">
										${dto.contents}
									</a>
								</td>
								<td>
									${dto.id}
								</td>
								<td>
									${dto.drama_date}
									<p>${dto.drama_time }</p>
								</td>
								<td>
									<strong>${dto.price }원</strong>
								</td>
								<td>${dto.ticket_numbers }</td>
								<td><span class="txtInfo"><span title="${dto.kind}" id="sign" class="sign"></span>${dto.point }p</span></td>
								<td>
									<strong>${dto.price * dto.ticket_numbers}원</strong>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>