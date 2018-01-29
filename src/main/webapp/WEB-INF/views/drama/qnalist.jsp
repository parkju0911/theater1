<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
<link href="../resources/css/drama/qnalist.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css" rel="stylesheet">
#reply_form{
	display:none;
}
.list {
		cursor: pointer;
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

			$(".list").click(function (){
				var cur=$(this).attr("title");
				var s = '${pager.search}';
				var v = '${pager.kind}';
				document.frm.curPage=cur;
				document.frm.search=s;
				document.frm.kind=v;
			
			}); 
		$("#qna_all").click(function() {
			window.open("./qnalist?drama_num=" +${drama_num} ,"Q&A 전체보기", "width=850 , height=600 , top=100, left=550 , resize=none , location=no, scrollbars=no, menubar=no");

		})
	$("#insertbut").click(function() {
		if(${member eq  null}){
			alert("로그인 하셔야 등록가능합니다.");
			$("#qna_insert").prop("method", "GET");
			 $("#qna_insert").prop("action", "../member/memberLogin"); 
		
	}else {
			if($("contents").val() ==null){
				alert("내용을 작성하여주세요.");	
				
			}
				}
	});
	});
</script>
</head>
<body>
		<div id="qna_listform">
			<div id="qna_text">
				<p style="padding-top: 30px; font-size: 25px; font-weight: bolder;">티켓관련 문의를 남겨주세요.</p>
				<p style="padding-top: 20px; font-size: 15px;">환불/취소요청은 <a href="../member/orderlist" style="text-decoration:underline;">마이티켓 > 환불신청</a>, 이용 불편 및 요청사항은 
				<a href="##1:1문의 페이지 이동" style="text-decoration: underline;">1:1문의</a>를 이용해주세요.
				<a href="##" id="qna_all">Q&A 전체보기</a></p>
			</div>
<!------------- 문의 글 ---------------->	
				<div id="qna_form">
							
							<form id="qna_insert" name="frm" method="post"  >
								<div id="qna_textbox">
	
								<input type="hidden"  name="drama_num" value="${drama_num}" >
								<input type="hidden" name="id" value="${member.id }">
								<textarea style="width:530px; height: 70px; border: 1px solid #e6e6e6; font-size: 13px; color:#000;" name="contents"></textarea>
										
								</div>
							
							<div id="qna_button">
								<button id="insertbut" style="width: 150px; height: 70px; margin-top: 10px;">등록</button>
									</div>
								<p id="notextqna" style="color:red; float:left;">* Q&A를 통한 환불/취소/변경 문의는 처리되지 않습니다</p>
								
							</form>
							
					</div>
		
					
			<table id="qna_box">
				<c:forEach items="${qnalist}"  var="list">
				<c:if test="${list.drama_num eq drama_num }">
				<!-- 부모글 form -->
								<tr>
									<td>
											<c:if test="${list.depth eq 0 }">
											<div id="member_qna1">
														
														<c:catch>
														<c:forEach begin="1" end="${list.depth }">
														<img src="../resources/images/starpoint/reply_icon.png">
														</c:forEach>
														</c:catch>		
																
											 				${list.qna_viewnum } ${list.id } ${list.reg_date }
																			
														<c:if test="${member.id == list.id }">
																		 
														<c:if test="${list.depth eq 0}">
				<!-- qna 작성 아이콘 --><a href="##"  class="write_reply" id="${list.qna_viewnum }" title="${list.qna_viewnum }">
														<img alt="" src="../resources/images/starpoint/btn_write_reply.png"></a>
														</c:if>
														<!-- qna 삭제 아이콘  -->
														<a href="qna_delete?qna_viewnum=${list.qna_viewnum}" class="del_reply" onclick="if(!confirm('정말로 삭제하시겠습니까?')){return false;}" title="${list.qna_viewnum }" >
														<img alt="" src="../resources/images/starpoint/btn_del_reply.png"></a>				
														</c:if>
														<p>${list.contents }</p>
																	
											</div>
												</c:if>
				<!-- 답글 form -->
											<c:if test="${list.depth > 0 }">
														<div id="member_qna_reply">
														<c:catch>
														<c:forEach begin="1" end="${list.depth }">
														<img src="../resources/images/starpoint/reply_icon.png">
														</c:forEach>
														</c:catch>		
											 				${list.qna_viewnum } ${list.id } ${list.reg_date }
														<c:if test="${member.id == list.id }">
														
														<!-- qna 삭제 아이콘  -->
														<a href="qna_delete?qna_viewnum=${list.qna_viewnum}" class="del_reply" onclick="if(!confirm('정말로 삭제하시겠습니까?')){return false;}" title="${list.qna_viewnum }" >
														<img alt="" src="../resources/images/starpoint/btn_del_reply.png"></a>				
														</c:if>
														<p>${list.contents }</p>
														</div>		
											<!--답글 --></c:if>
											
											
										<!-- 해당 dramaNum qna만 보게끔 -->
									</td>
							</tr>
				
				
<!--------------답글------------->		
					<tr>
						<td class="${list.qna_viewnum }" id="reply_form">
							<form action="qnareply"  method="post" style="float: left;">
									<input type="hidden" name="qna_viewnum" value="${list.qna_viewnum }">
									<input type="hidden"  name="drama_num" value="${drama_num}" >
									
								<textarea  name="contents" style="width: 400px; height: 50px; margin-left: 30px;"></textarea>
								<button style="width: 70px; height: 50px; margin-left: 10px; float: right;">답변하기</button> 
							
							</form>  
						</td>
					</tr>
					
							
					</c:if>
				</c:forEach>
				
			</table>
			
			
	<div class="pagination"  id="paging">
		<c:if test="${pager.curBlock gt 1}">
				<li><a href="./qnalist?drama_num=${drama_num}&curPage=${i}" class="paging_move" id="move">[이전]</a></li>
		</c:if>
		<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
		
			<li><a href="./qnalist?drama_num=${drama_num}&curPage=${i} " class="paging_move">${i}</a></li>
		</c:forEach>
		<c:if test="${pager.curBlock lt pager.totalBlock}">
			<li><a href="./qnalist?drama_num=${drama_num}&curPage=${i} " class="paging_move">${i}</a></li>
		</c:if>
		</div>
	
		</div>
</body>
</html>