<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/SE2/js/HuskyEZCreator.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
<script src="../resources/SE2/js/HuskyEZCreator.js"></script>
<link href="../resources/css/drama/dramaReview.css" rel="stylesheet">
<link href="../resources/css/common/header.css" rel="stylesheet">
<link href="../resources/css/board/boardHeader.css" rel="stylesheet">
<script src="text/javascript">

$(function(){
	
	var message='${message}';
	if(message !=''){
		alert(message);
	}
	
	
	$(".list").click(function (){
		var cur=$(this).attr("title");
		var s = '${pager.search}';
		var v = '${pager.kind}';
		document.frm.curPage=cur;
		document.frm.search=s;
		document.frm.kind=v;
		document.frm.submit();
	});
});
</script>
<style type="text/css">
	.list {
		cursor: pointer;
	}
		
.form-wrapper {
        width: 450px;
        padding: 15px;
        margin: 150px auto 50px auto;
        background: #444;
        background: rgba(0,0,0,.2);
        -moz-border-radius: 10px;
        -webkit-border-radius: 10px;
        border-radius: 10px;
        -moz-box-shadow: 0 1px 1px rgba(0,0,0,.4) inset, 0 1px 0 rgba(255,255,255,.2);
        -webkit-box-shadow: 0 1px 1px rgba(0,0,0,.4) inset, 0 1px 0 rgba(255,255,255,.2);
        box-shadow: 0 1px 1px rgba(0,0,0,.4) inset, 0 1px 0 rgba(255,255,255,.2);
    }
    
    .form-wrapper input {
   	       width: 170px;
    	height: 30px;
        padding: 10px 5px;
        float: left;    
        font: 14px  'lucida sans', 'trebuchet MS', 'Tahoma';
        border: 0;
        background: #eee;
        -moz-border-radius: 3px 0 0 3px;
        -webkit-border-radius: 3px 0 0 3px;
        border-radius: 3px 0 0 3px;      
    }
    
    .form-wrapper input:focus {
        outline: 0;
        background: #fff;
        -moz-box-shadow: 0 0 2px rgba(0,0,0,.8) inset;
        -webkit-box-shadow: 0 0 2px rgba(0,0,0,.8) inset;
        box-shadow: 0 0 2px rgba(0,0,0,.8) inset;
    }
    
    .form-wrapper input::-webkit-input-placeholder {
       color: #999;
       font-weight: normal;
       font-style: italic;
    }
    
    .form-wrapper input:-moz-placeholder {
        color: #999;
        font-weight: normal;
        font-style: italic;
    }
    
    .form-wrapper input:-ms-input-placeholder {
        color: #999;
        font-weight: normal;
        font-style: italic;
    }    
    
    .form-wrapper button {
		overflow: visible;
        position: relative;
        float: right;
        border: 0;
        padding: 0;
        cursor: pointer;
           height: 30px;
    width: 80px;
    font: bold 14px/31px 'lucida sans', 'trebuchet MS', 'Tahoma';
        color: #fff;
        text-transform: uppercase;
        background: #ffa034;
        -moz-border-radius: 0 3px 3px 0;
        -webkit-border-radius: 0 3px 3px 0;
        border-radius: 0 3px 3px 0;      
        text-shadow: 0 -1px 0 rgba(0, 0 ,0, .3);
    }   
      
    .form-wrapper button:hover{		
        background: #f3860a;
    }	
      
    .form-wrapper button:active,
    .form-wrapper button:focus{   
        background: #f3860a;    
    }
    
    .form-wrapper button:before {
        content: '';
        position: absolute;
        border-width: 8px 8px 8px 0;
        border-style: solid solid solid none;
        border-color: transparent #ffa034 transparent;
        top: 7px;
        left: -6px;
    }
    
    .form-wrapper button:hover:before{
        border-right-color: #f3860a ;
    }
    
    .form-wrapper button:focus:before{
        border-right-color: #f3860a ;
    }    
    
    .form-wrapper button::-moz-focus-inner {
        border: 0;
        padding: 0;
    }
</style>
</head>
<body>
<%-- <c:import url="../temp/review_search.jsp"></c:import> --%>
		<!-- header -->
	<c:import url="../temp/header.jsp"></c:import>
	<!-- header end -->
	<!-- <p id="top_line"></p> -->
	<section id="Review_main">
	
	<div class="title_wrap" style="border-top: 2px solid #5d4137; padding-top: 8px;width: 1000px;font-family: 'Nanum Gothic', sans-serif; ">
		<h6 id="h6_title" style="margin-right: 5px; margin-top: 8px;">
		<a href="${pageContext.request.contextPath}"><img alt="" src="../resources/images/common/homeImg.png" id="homeImg"></a> > 
		<a href="${pageContext.request.contextPath}/drama/dramaReview">REVIEW</a></h6>
		</div> 
		<h2 style="margin-top: 20px; font: 40px/41px 'fMdBT'; padding-bottom: 20px; width: 900px; margin: 0 auto;">REVIEW</h2>
		
	<div id="top_text">
		<!-- <a href="./dramaReviewwrite">작성하기</a> -->
				<div id="search_box_top" class="sb-search">
					<form name="frm" action="./dramaReview" method="get" class="form-wrapper cf" style="width: 250px;height: auto;">
					<!-- <input type="hidden" name="kind" value="title"> -->
						<input type="text" placeholder="내용 검색" required>
						<button type="submit">Search</button>
					</form>
				</div>
	
	
	</div>
	<c:forEach items="${review}" var="list" varStatus="i">
	<div class="list_box">
	<a href="./dramaReviewview?review_num=${list.review_num }">
		<div class="box_left">
			 <img alt="" src="${pageContext.request.contextPath}/resources/upload/${file[i.index].file_name}"style="width: 280px; height: 280px;">
		</div>
			<div class="box_right">
				<p id="writer">작성자: ${list.id }</p>
				<p class="review_date">${list.review_date }</p>
				<div id="review_contents"><a href="./dramaReviewview?review_num=${list.review_num }">
				<p id="review_title">${list.title }</p>
				<p class="review_con">${list.contents }</p>
<%-- 				<p>${list.title}</p> --%>
				</a>
				<c:if test="${member.id eq list.id}">
				<div class="btnGroup" id="updel">
				<ul>
				<li><a href="./dramaReviewupdate?review_num=${list.review_num}"><img alt="" src="../resources/images/review/update-btn.png"></a></li>
				<li><a href="./dramaReviewdelete?review_num=${list.review_num }" onclick="del()"><img alt="" src="../resources/images/review/delete-btn.png"></a></li>
				</ul>
				</div>
				</c:if>
			</div>
			
			<c:if test="${list.star==5 }">
				<div class="review_star">별점:<img alt="" src="../resources/images/starpoint/star_5.png" style="height: 12px"></div>
			</c:if>
					<c:if test="${list.star==4 }">
						<div class="review_star">별점: <img alt="" src="../resources/images/starpoint/star_4.png" style="height: 12px"></div>
					</c:if>
						<c:if test="${list.star==3 }">
							<div class="review_star">별점: <img alt="" src="../resources/images/starpoint/star_3.png" style="height: 12px"></div>
						</c:if>
							<c:if test="${list.star==2 }">
								<div class="review_star">별점: <img alt="" src="../resources/images/starpoint/star_2.png" style="height: 12px"></div>
							</c:if>
								<c:if test="${list.star==1}">
									<div class="review_star">별점: <img alt="" src="../resources/images/starpoint/star_1.png" style="height: 12px"></div>
								</c:if>
			</div>
			</a>		
	</div>
	
 	</c:forEach> 
	
	
	
		
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
		<div id="search_box_bottom">
		<form name="frm" action="./dramaReview" method="get" class="form-wrapper cf" style="width: 250px;height: auto;">
					<input type="hidden" name="kind" value="title">
						<input type="text" placeholder="Search here..." required>
						<button type="submit">Search</button>
					</form>
		<%-- <form action="./${board}List" method="get" name="frm">
	<input type="hidden" value="1"  name="curPage">
		<select name="kind" class="select">
			<option>Title</option>
			<option>Writer</option>
			<option>Contents</option>
		</select>
		<input type="text" name="search" class="search">
		<button class="search_form">검색</button> 
	</form>--%>	
	</div>
			</div>
	

			</section>
	<!-- footer  -->
	<c:import url="../temp/footer.jsp"></c:import>
	<!-- footer end -->
	
</body>
</html>