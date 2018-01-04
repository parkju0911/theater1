<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../resources/css/dramaview.css" rel="stylesheet">
<link href="../resources/css/common/header.css" rel="stylesheet">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=v1_dhkpTCMdne9dcmd_k&submodules=geocoder"></script>
<script type="text/javascript">
	
	$(function() {
			

		//안내 리스트 출력
		$("#info").click(function() {
			$("#info_text").load("./text_info?drama_num="+${view.drama_num})
		});
		
		//후기 리스트 출력
		$("#review").click(function() {
			$("#review_list").load("./reviewlist?drama_num="+${view.drama_num})
		});
		
		//문의사항 리스트 출력
		$("#qna").click(function() {
			$("#qna_list").load("./qnalist?drama_num="+${view.drama_num})
		});
		
		//환불규정
		$("#refund").click(function() {
			$("#refund_list").load("./refundlist")
		});
		
		//안내에 환불 규정
		$("#refund_1").click(function() {
			$("#refund_list").load("./refundlist")
		});
		//후기 전체 보기 클릭시 후기 리스트 출력
		$("#reviewlist_all").click(function() {
			$("#review_list").load("./reviewlist?drama_num="+${view.drama_num})
		});
});
	
$(document).ready(function() {

	 $("#info").trigger("click");

	} );
	



</script>
<style type="text/css">
A:VISITED {
	text-decoration: none;
}
</style>
</head>
<body>
	<!-- header -->
	<c:import url="../temp/header.jsp"></c:import>
	<!-- header end -->

	<section id="section">
		<form id="section_info" action="좌석 선택 페이지" method="post">
			<div id="drama_image">
				<img src="../resources/images/drama_1.jpg" style="width: 100%; height: 100%;">
			</div>

			<div id="drama_info_form">
				<div id="drama_info">
					<div id="title">
						<span class="skin-type">${view.place}</span>
						<h3>${view.title}</h3>
						<div id="content">${view.contents}</div>
					</div>
					<input id="price" type="text" name="price" value="${view.price}원"
						readonly="readonly">
				</div>
				<select id="drama_date" name="date">
					<optgroup label="날짜 선택">
						<option class="select_date">날짜 선택</option>
						<c:forEach items="${list}" var="dto">
							<fmt:parseDate value='${dto.drama_date}' var='dto_date'
								pattern="yyyy-MM-dd" scope="page" />
							<option><fmt:formatDate value="${dto_date}"
									pattern="yyyy-MM-dd" /></option>
						</c:forEach>
					</optgroup>
				</select> <select id="drama_time" name="time">
					<optgroup label="시간 선택">
						<option id="select_time">시간 선택</option>
						<c:forEach items="${list}" var="dto">
							<option>${dto.drama_time }</option>
						</c:forEach>
					</optgroup>
				</select> <select id="drama_ticket" name="ticket">
					<optgroup label="매수 설정">
						<option id="select_ticket">매수 설정</option>
						<c:forEach begin="1" end="${ticket}" var="i">
							<option>${i }</option>
						</c:forEach>
					</optgroup>
				</select> <input id="btn_buy" type="image"
					src="../resources/images/btn_buy.png">
			</div>
		</form>
		<div id="afterview">
			<div id="after_top_text">
				예매자 <span style="color: red;">별점</span>
				<!-- 별점/후기인원수 -->
				<span id="star_total">${avg } /5.0 (총 ${total } 명)</span>
			</div>
			<div id="afterview_box">
				<table>
					<c:forEach items="${review }" var="re">
						<tr>
							<td><div id="afterview_box_a">${re.id }
									(${re.review_date })</div></td>
						</tr>
						<tr>
							<td><div id="atfterview_box_b">
									<c:if test="${re.star==5 }">
										<img alt="" style="height: 17px"
											src="../resources/images/starpoint/star_5.png"> ${re.contents }
				</c:if>
									<c:if test="${re.star==4 }">
										<img alt="" style="height: 17px"
											src="../resources/images/starpoint/star_4.png"> ${re.contents }
				</c:if>
									<c:if test="${re.star==3 }">
										<img alt="" style="height: 17px"
											src="../resources/images/starpoint/star_3.png"> ${re.contents}
				</c:if>
									<c:if test="${re.star==2 }">
										<img alt="" style="height: 17px"
											src="../resources/images/starpoint/star_2.png"> ${re.contents }
				</c:if>
									<c:if test="${re.star==1 }">
										<img alt="" style="height: 17px"
											src="../resources/images/starpoint/star_1.png"> ${re.contents }
				</c:if>
								</div></td>
						</tr>

					</c:forEach>
				</table>
				<div id="afterview_total">
					<a href="#menu1" id="reviewlist_all">후기 전체보기></a>
				</div>
			</div>


		</div>



		<div class="contain">

			<ul class="nav nav-tabs">
				<li class="active" id="menu_info"><a data-toggle="tab"
					href="#menu0" id="info">안내</a></li>
				<li class="menu_li"><a data-toggle="tab" href="#menu1"
					id="review">후기(${total })</a></li>
				<li class="menu_li"><a data-toggle="tab" href="#menu2" id="qna">Q&A</a></li>
				<li class="menu_li"><a data-toggle="tab" href="#menu3"
					id="refund">환불규정</a></li>
			</ul>

			<div class="tab-content"><!--  탭 클릭시 페이지 view -->
				<div id="menu0" class="tab-pane fade in active">

					<div id="info_text"></div>
				</div>
				<div id="menu1" class="tab-pane fade">
					<div id="review_list"></div>
				</div>
				<div id="menu2" class="tab-pane fade">
					<div id="qna_list"></div>
				</div>
				<div id="menu3" class="tab-pane fade">

					<div id="refund_list"></div>
				</div>
			</div>
		</div>

		</div>
	</section>
	<!-- footer  -->
	<c:import url="../temp/footer.jsp"></c:import>
	<!-- footer end -->

</body>
</html>