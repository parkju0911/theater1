<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
<style type="text/css" rel="stylesheet">
#reply_form{
	display:none;
}


</style>
<script type="text/javascript">
	$(function() {
			$(".write_reply").each(function(){ //jquery 반복문 each 리스트에 불러오는 숫자(ex:qna_viewnum)을 title 속성값에 넣어주고 var id 라는 함수에 넣는다.
				var id = $(this).attr('title');
			/* 	$('.'+id).hide(); */
				$('#'+id).click(function(){ //jquery 는 id , class 는 # . 을 앞에 입력해야해서 $('#'+id)로 입력한다.
					
					  if($('.'+id).css("display") =="none"){
						$('.'+id).css("display", "block");
					} else {
						$('.'+id).css("display" , "none");
					}  
				});
			});
		/* $(".write_reply").click(function() {
			if($(".reply_form").css("display") =="none"){
				$(".reply_form").css("display", "block");
			} else {
				$(".reply_form").css("display" , "none");
			}
		}) */
	});

</script>
</head>
<body>
		<div id="qna_listform">
			<div id="qna_text">
				<p style="padding-top: 30px; font-size: 25px; font-weight: bolder;">티켓관련 문의를 남겨주세요.</p>
				<p style="padding-top: 20px; font-size: 15px;">환불/취소요청은 <a href="##환불 페이지 이동" style="text-decoration:underline;">마이티켓 > 환불신청</a>, 이용 불편 및 요청사항은 <a href="##1:1문의 페이지 이동" style="text-decoration: underline;">1:1문의</a>를 이용해주세요.</p>
			</div>
			<div id="qna_form">
				<form action="qnalist" method="post">
					<div id="qna_textbox">
						<textarea style="width:530px; height: 70px; border: 1px solid #e6e6e6; font-size: 13px; color:#000;" name="contents"></textarea>
					</div>
					<div id="qna_button">
						<button style="width: 150px; height: 70px; margin-top: 10px;">등록</button>
					</div>
				<p style="color:red; float:left;">* Q&A를 통한 환불/취소/변경 문의는 처리되지 않습니다</p>
				</form>
			</div>
		
		
			<table id="qna_box">
				<c:forEach items="${qnalist}"  var="list">
		
					<tr>
						<td><div id="member_qna1">${list.id } ${list.reg_date }<a href="##"  class="write_reply" id="${list.qna_viewnum }" title="${list.qna_viewnum }"><img alt="" src="../resources/images/starpoint/btn_write_reply.png"></a></div></td>
					</tr>
					<tr>
						<td><div id="member_qna2"> ${list.contents }</div></td>
					</tr>
					<tr>
						<td class="${list.qna_viewnum }" id="reply_form">
							<form action="drama/qnalist" method="post" style="float: left;">
								<textarea  name="contents" style="width: 400px; height: 50px; margin-left: 30px;"></textarea>
								<button style="width: 70px; height: 50px; margin-left: 10px; float: right;">답변하기</button> 
							</form>  
						</td>
					</tr>
				</c:forEach>
			</table>
		
		``	<div id="paging">
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
		</div>
</body>
</html>