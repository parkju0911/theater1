<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../resources/css/common/header.css" rel="stylesheet">
<link href="../resources/css/dramaview.css" rel="stylesheet">
</head>
<body>
	<!-- header -->
	<c:import url="../temp/header.jsp"></c:import>
	<!-- header end -->
			
	<section id="section">
		<form id="section_info" action="좌석 선택 페이지" method="post">
			<div id="drama_image">
				<img src="../resources/images/drama_1.jpg">
			</div>
			
			<div id="drama_info_form">
				<div id="drama_info">
					<div id="title">
						<span class="skin-type">${view.place}</span>
						<h3>${view.title}</h3>
						<div id="content">${view.contents}</div>
					</div>
					<input id="price"type="text" name="price" value="${view.price}원" readonly="readonly">
				</div>	 
				<select id="drama_date" name="date">
					<optgroup label="날짜 선택">
						<option class ="select_date">날짜 선택</option>
						<c:forEach items="${list}" var="dto">
					 		<fmt:parseDate value='${dto.drama_date}'  var='dto_date'  pattern="yyyy-MM-dd"  scope="page"/>
							<option><fmt:formatDate value="${dto_date}" pattern="yyyy-MM-dd"/></option>
						</c:forEach>
					</optgroup>
				</select>
							
				<select id="drama_time" name="time">
					<optgroup label="시간 선택">
						<option id="select_time">시간 선택</option>
						<c:forEach items="${list}" var="dto">
							<option>${dto.drama_time }</option>
						</c:forEach>
					</optgroup>
				</select>
				
				<select id="drama_ticket" name="ticket">
					<optgroup label="매수설정">
						<option id="select_ticket">매수 설정</option>
						<c:forEach begin="1" end="${ticket}" var="i">
							<option>${i }</option>
						</c:forEach>
	 				</optgroup>
				</select>
				
				<input id="btn_buy" type="image" src="../resources/images/btn_buy.png">
			</div>
		</form>
		<div id="afterview">
			<div id="after_top_text">예매자 <span style="color:red;">별점</span> <!-- 별점/후기인원수 --><span id="star_total">/5.0 (총  <!-- 후기인원수 -->  명)</span> </div>
		</div>
		<div class="view_page">
			<ul class="info_bar">
				<li id="info_1"><a href="">안내</a></li>
				<li id="after"><a href="">후기</a></li>
				<li id="QNA"><a href="">QnA</a></li>
				<li id="reprice"><a href="">환불규정</a></li>
			</ul>
			<div class="warning">
				<p class="warnning_1">예매 전 안내 및 주의사항을 꼭 확인하세요!</p>
				<p class="warnning_2">티켓에 따라 이용방법/환불규정이 상이합니다.</p>
				<img src="http://timeticket.co.kr/img/icon_noti.png">
			</div>
			<div class="info">
				<p>예매정보</p>
				<p>공연기간: 오픈런</p>
				<p>예매가능시간: 공연 10분 전 까지</p>
				<p>관람정보</p>
				<p>관람등급: 만 8세 이상(신분증/학생증 지참)</p>
				<p>공연시간: 약 100분</p>
				<p>티켓배부: 현장수령 (공연 1시간 전부터 공연장 앞 매표소 배부)</p>
				<p>티켓교환: 문자/마이티켓 제시 및 본인확인 후 발권</p>
				<p>좌석배정: 타예매처 지정석 제외 후 매표소 선착순 배정(앞→뒤, 중앙→사이드)</p>
				<p>입장시간: 공연 시작 10분 전 부터 입장 가능</p>
				<p>공연사 안내사항</p>
				<p>크리스마스 얼리버드 할인 기간: ~12.20(수)</p>
				<p>주의사항</p>
				<p>※타임티켓은 비지정석 예매입니다. 상단 좌석배정 방식을 확인하세요!</p>
				<p>※당일 관람티켓 취소/환불/변경 불가 - 신중히 구매해주세요.</p>
				<p>공연 시작 후 입장 불가, 공연 중 퇴장 시 재입장 불가</p>
				<p>지각으로 관람하지 못할 시 취소/환불/변경 불가</p>
				<p>관람 연령 미숙지로 인한 취소/환불/변경 불가</p>
				<p>음식물 반입 금지, 공연 중 사진/동영상 촬영 금지</p>
				<p>공연 취소/변경 발생시, 개별 연락을 드릴 수 있습니다.</p>
				<p>지도에서 미리 확인하세요</p>
				<p>공연장: 대학로 쁘띠첼씨어터</p>
				<p>주소: ${view.place}</p>
				<p>주차여부: 주차불가(인근 유료주차장 이용)</p>
				<p>문의전화: 02-766-7667</p>
			</div>
		</div>		
	</section>
	<!-- footer  -->
	<c:import url="../temp/footer.jsp"></c:import>
	<!-- footer end -->	
</body>
</html>