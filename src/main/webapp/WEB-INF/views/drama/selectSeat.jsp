<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>좌석 선택</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="../resources/css/common/header.css" rel="stylesheet">
<link href="../resources/css/drama/selectSeat.css" rel="stylesheet">
<script type="text/javascript">
$(function(){
	var count=0;
	/* 남은좌석 관련해서 추가 할 것  숫자*/
	/* 이미 판매된 좌석 관련해서도 작업할것 */
	/* 좌석 배치도 열 이름 출력 하는 부분 */
	$(".row").each(function(){
		var row=Number($(this).attr("title"));
		var i=64;
		i+=row;
		var english = String.fromCharCode(i);
		$('#'+row).attr("value", english+'열');
	});
	
	/* 좌석 배치도 선택관련 부분 */
	$(".seat_span").each(function(){
		var id=$(this).attr("title");
		<c:forEach items="${select}" var="dto">
			var select = '${dto}';
			if(select==id){
				$('#'+id).css('background-image','url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/step2/seat_icons_new.png)');
				$('#'+id).css('background-color', '#bbb');
				$('#'+id).css('background-position', '-32px 2px');
				$('#'+id).css('background-size','350px');
			}
		</c:forEach>
		$('#'+id).click(function(){
			var color=$('#'+id).css('background-color');
			if(color != 'rgb(187, 187, 187)'){
				if(count<'${seat.ticket_numbers}'||color=='rgb(255, 0, 0)'){
					if(color=='rgb(255, 0, 0)'){
						count--;
						if(count<0){
							count=0;
						}
						$('#'+id).css('background-color', '#666');
					}else{
						count++;
						$('#'+id).css('background-color', 'red');
					}
				}	
			}
			$('#select').attr("value", count);
			$('#anySeat').attr("value", ${(company.row_num * company.col_num)-selectSize}-count);
		});
		$('#select').attr("value", count);
	});
	/* 결제 API 부분 */
	$("#btn").click(function(){
		var arr= new Array();
		$(".seat_span").each(function(){
			var id=$(this).attr("title");
			var color=$('#'+id).css('background-color');
			if(color == 'rgb(255, 0, 0)' ){
				arr.push($(this).attr("title"));
			}
		});

		if(count=='${seat.ticket_numbers}'&&count!=0){
			
			var IMP = window.IMP; /*생략가능 */
			IMP.init('imp95781276');/* 가맹점 식별 코드 변경하지 마세요.*/
			
			IMP.request_pay({
				pg : 'inicis', /* version 1.1.0부터 지원 */
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '${drama.title}', /* 나중에 공연명 데이터 받아오는걸로 변경 할 것 */
				amount : ${drama.price * seat.ticket_numbers}, /* 나중에 총 금액 데이터 받아오는걸로 변경 할 것 */
				buyer_email : 'test@test.com', /* 나중에 회원 정보에서 이메일 받아오는 걸로 변경할 것 */
				buyer_tel : '010-1234-5678', /* 나중에 회원 정보에서 연락처 받아오는 걸로 변경 할 것 */
				buyer_addr : '서울특별시 강남구 삼성동',/* mediabank에서 값을 안받알때 어떻게 진행했는지 확인 할것 */
				buyer_postcode : '123-456', /* 위와 동일 */
				m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			},function(rsp){
				if(rsp.success){
					var msg = rsp.paid_amount+'결제가 완료 되었습니다.';
					
					$.post("./insertBuy", {
						drama_num : ${drama.drama_num},
						select_seat : arr.toString(),
						drama_date : $('#date').val(),
						drama_time : $('#time').val(),
						ticket_numbers : ${seat.ticket_numbers},
						price : ${drama.price}
					});
					
					$(location).attr('href', 'dramaview?drama_num='+'${drama.drama_num}');
				}else{
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : '+rsp.error_msg;
				}
				alert(msg);
			});	
	}else{
			alert('좌석을 선택하세요.');
		}
	});
	
});
	
</script>
</head>
<body>
<div class="body">
<!-- header -->
	<c:import url="../temp/header.jsp"></c:import>
<!-- header end -->
<!-- Contents Start -->
	<form>
		<div class="totalbody">
			<div class="title" style="text-align: center;">
				<marquee id="title" behavior="alternate" width="160" direction="left" scrollamount="5" loop="3" style="     margin-left: 136px;margin-top: 4px;font-family: -webkit-pictograph;">${drama.title}</marquee><span>${drama.place} | ${company.name} | 남은좌석</span> <input type="text" id="anySeat" readonly="readonly" value="${(company.row_num * company.col_num)-selectSize}"><span>/${company.row_num * company.col_num} | 구매 장수 <input id="select" type="number" readonly="readonly"/>/${seat.ticket_numbers}</span> 
				<input id="time" type="text" value="${seat.drama_time}" readonly="readonly" style="margin-left: -85px;"> <input id="date" type="text" value="${seat.drama_date}" readonly="readonly">
			</div>
			
			<div class="seat">
				<div class="stage">
						<span>STAGE</span>
				</div>
				<table class="seat_contents">
					<c:forEach begin="1" end="${company.row_num}" var="i">
						<tr>
							<td class="row" title="${i}"><input type="text" readonly="readonly" id="${i}"></td>
							<c:forEach begin="1" end="${company.col_num}" var="j">
								<td>
									<span class="seat_span" title="r${i}c${j}" id="r${i}c${j}">${j}</span>
								</td>
							</c:forEach>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div id="btn_div">
				<input type="button" id="btn">
			</div>
		</div>
	</form>
<!-- Contents End -->
</div>
<!-- footer  -->
	<c:import url="../temp/footer.jsp"></c:import>
<!-- footer end -->	
</body>
</html>