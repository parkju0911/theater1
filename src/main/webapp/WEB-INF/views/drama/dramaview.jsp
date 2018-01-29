<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../resources/css/drama/dramaview.css" rel="stylesheet">
<link href="../resources/css/common/header.css" rel="stylesheet">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=v1_dhkpTCMdne9dcmd_k&submodules=geocoder"></script>



<script type="text/javascript">
	$(function() {
		//안내 리스트 출력
		$("#info").click(function() {
			$("#info_text").load("./text_info?drama_num="+${view.drama_num} )
		});
		
		//후기 리스트 출력
		$("#review").click(function() {
			$("#review_list").load("./reviewlist?drama_num="+${view.drama_num} )
			$("#paging").css("display","none");
		}); 
		
		//문의사항 리스트 출력
		$("#qna").click(function() {
			$("#qna_list").load("./qnalist?drama_num="+${view.drama_num} )
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
			window.open("./reviewlist?drama_num=" +${view.drama_num} ,"후기 전체보기", "width=850 , height=600 , top=200, left=550 , resize=none , location=no, scrollbars=no, menubar=no");
			$("#info").trigger("click");
		});
		
		$("#btn_buy").click(function(){
			if(${member eq  null}){
				alert("로그인 하신 후에 사용해주세요");
				$("#section_info").prop("method", "GET");
				 $("#section_info").prop("action", "../member/memberLogin"); 
			}else{

		
				var drama_date = $("#drama_date").val();
				var drama_time = $("#drama_time").val();
				var drama_ticket = $("#drama_ticket").val();
				if(drama_date=='날짜 선택' || drama_time=='시간 선택'||drama_ticket=='매수 설정'){
					alert("날짜/시간/티켓 장수를 선택하세요.");
				}else{
					$("#section_info").prop("action", "./selectSeat");
					document.frm.submit();
				}

			}
		});
		
		var drama_date = '';
		$('#drama_date').change(function(){
			if($('#drama_date').val()!='날짜 선택'){
				drama_date = $('#drama_date').val();				
			}
			$(".drama_time").load('dramaTime?drama_num=${view.drama_num}&&drama_date='+drama_date);
		});
		$(".drama_time").load('dramaTime?drama_num=${view.drama_num}&&drama_date='+drama_date);
		
		$('#update').click(function(){
			$(location).attr('href', './dramaViewUpdate?drama_num=${view.drama_num}');
		});	
		$('#btn_delete').click(function(){
			$(location).attr('href', './dramaViewDelete?drama_num=${view.drama_num}&&company_num=${view.company_num}&&title=${view.title}');
		});
		
});
	
 $(document).ready(function() {
	
	 $("#info").trigger("click");

} );


 

$('#update').click(function(){
    $(location).attr('href', './dramaViewUpdate?drama_num=${view.drama_num}');
 });
 
/*   $("#select_date").click(function() {


$("#select_date").click(function() {
	var now = new Date();
 	var sysdate = new Date(now.getFullYear(), now.getMonth(), now.getDate());
	var afterdrama = new Date("1/28/2018");
	if(sysdate.getTime() > afterdrama.getTime()){
		alert("종료된 공연입니다. 다른날짜를 선택하여주십시오.")
		window.reload();
	}else{
		
	}

}); 
	
}); 
 */

</script>
<style type="text/css">
body{
	background-color: #fffff8;
}
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
		<form id="section_info" name="frm"method="post">
			<input type="hidden" name="company_num" value="${view.company_num}">
			<input type="hidden" name="drama_num" value="${view.drama_num}">

	<!--   이미지 가져오기 -->
			<div id="drama_image">
				<img src="../resources/upload/${file.file_name}" style="width: 100%";height="100%";>
			</div>
			
			<div id="drama_info_form">
				<div id="drama_info">
					<div id="title">
						<span class="skin-type">${view.place}</span>
						<h3>${view.title}</h3>
						
						<div id="content">${view.simple}</div>
					</div>

					<input id="price"type="text" name="price" value="${view.price}원" readonly="readonly">
				</div>	 


				<select id="drama_date" name="drama_date">
					<optgroup label="날짜 선택">
						<option class ="select_date">날짜 선택</option>
						<c:forEach items="${list}" var="dto">

					 		<fmt:parseDate value='${dto.drama_date}'  var='dto_date'  pattern="yyyy-MM-dd"  scope="page"/>
							<option class="select_date" id="select_date"><fmt:formatDate value="${dto_date}" pattern="yyyy-MM-dd"/></option>

						</c:forEach>
					</optgroup>
				</select>
							
				<div class="drama_time"></div>
				<button id="btn_buy"></button>

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
						<c:if test="${empty review }">
						<div class=review_null><p>	아직 등록된 후기/별점이 없습니다.</p></div>
						</c:if>
					<c:forEach items="${review }" var="re" begin="0" end="2">
						
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
				<c:if test="${!empty review }">
				<div id="afterview_total">
					<a data-toggle="tab" href="#menu1" id="reviewlist_all">후기 전체보기></a>
				</div>
				</c:if>
			</div>


		</div>
		<div id="ticket_top">
		<p>연극 리뷰</p>
		</div>
		<div id="ticket_review">
		<c:if test="${empty review }">
						<div class="review_null"><p>아직 작성된 리뷰가 없습니다.</p></div>
			</c:if>
				<c:forEach items="${review }"   var="one"  begin="1" end="1">
			
				<div id="review_image"><img alt="" src="${pageContext.request.contextPath}/resources/upload/${file.file_name}" style="width: 250px;height: 150px;"></div>
				<div id="review_text">
						
						<div id="review_title">${one.title }</div>
						<div id="review_contents">${one.contents }<div id="view_go"><a href="./dramaReviewview?review_num=${one.review_num }"> ☞리뷰보러가기</a></div></div>
					
				</div>
				
				</c:forEach>
			
	</div>
			

	
		<div class="contain"  style="width: 830; margin: 0 auto;">

			<ul class="nav nav-tabs"  style="width: 830px; margin: 0 auto;" >
				<li class="active" id="menu_info"><a data-toggle="tab" href="#menu0" id="info">안내</a></li>
				<li class="menu_li"><a data-toggle="tab" href="#menu1" id="review" >후기(${total })</a></li>
				<li class="menu_li"><a data-toggle="tab" href="#menu2" id="qna">Q&A</a></li>
				<li class="menu_li"><a data-toggle="tab" href="#menu3" id="refund">환불규정</a></li>
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
		<c:if test="${company_check eq true}">
			<div class="btn_div">
			<button id="update" class="btn btn-default">수정</button>
			<button class="btn btn-default" data-toggle="modal" data-target="#end">종료</button>
			</div>
			
			 <!-- Modal -->
  			<div class="modal fade" id="end" role="dialog">
    			<div class="modal-dialog">
    
      				<!-- Modal content-->
      				<div class="modal-content">
        				<div class="modal-header">
         	 				<button type="button" class="close" data-dismiss="modal">&times;</button>
         	 				<h4>${view.title} 종료</h4>
        				</div>
        				<div class="modal-body">
          					<p>해당 공연을 종료 하시겠습니까?</p>
        				</div>
        				<div class="modal-footer">
          					<button id="btn_delete" class="btn btn-default">네</button>
          					<button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
        				</div>
     		 		</div>
      
    			</div>
  			</div>
		</c:if>
	</section>
	<!-- footer  -->
	<c:import url="../temp/footer.jsp"></c:import>
	<!-- footer end -->

</body>
</html>