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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../resources/SE2/js/HuskyEZCreator.js"></script>
<link href="../resources/css/drama/dramaReviewview.css" rel="stylesheet">
<link href="../resources/css/common/header.css" rel="stylesheet">
<link href="../resources/css/board/boardHeader.css" rel="stylesheet">
<title>Insert title here</title>
<style type="text/css">
@import url('http://fonts.googleapis.com/earlyaccess/nanumgothic.css');
*{
	margin: 0;
	padding: 0;
	font-family: 'Nanum Gothic', sans-serif;
}
h1{
	text-align: center;
}
table {
	margin: 0 auto;
	border: 1px solid #ddd;
	border-collapse: collapse;
	width: 1100px;
}
td{
	border: 1px solid #ddd;
	height: 25px;
	text-align: center;
}
.content{
	height: 100px;
}

.b_title{
	border-top: 1.5px solid #50382f;
    border-bottom: 1.5px solid #50382f;
    padding: 15px 140px 15px 15px;
    font-size: 16px;
    font-weight:Bold;
}
.b_contents{
 padding: 15px 140px 15px 15px;
    font-size: 14px;
    width: auto;
   min-height: 200px;
    border-bottom: 1.2px solid #aba9a9;
}
.btn-group{
	float: right;
}
.btn{
	margin-top: 10px;
	color: #795548;    
	font-family: 'Nanum Gothic', sans-serif;
}
#list_btn{
	float: left;
}

</style>
</head>
<script type="text/javascript">

function del() {
	var con = confirm("삭제하겠습니까?(복구되지않습니다)")
	if(con==false){
		window.location.reload();
	}
} 
		

</script>
<body>
		<!-- header -->
	<c:import url="../temp/header.jsp"></c:import>
	<!-- header end -->
	<div class="title_wrap"
			style="width: 950px; margin: 0 auto; padding-top: 8px; font-family: 'Nanum Gothic', sans-serif;">
			<h6 id="h6_title"><a href="${pageContext.request.contextPath}"><img alt="" src="../resources/images/common/homeImg.png" id="homeImg"></a> > <a href="${pageContext.request.contextPath}/drama/dramaReview">Review</a> > 
	<a href="${pageContext.request.contextPath}/drama/dramaReviewview?review_num=${selectOne.review_num}">${selectOne.title}</a></h6>
	</div>
<div class="board_wrap1" style="width: 850px;"><img style="    width: 23px;" alt="" src="../resources/images/review/pointing.png">
	<p style="padding: 0;font-size: 18px;font-weight: 550;padding-left: 10px;color: #795548;padding-left: 30px; margin-top: -22px; line-height: initial; color: #473e37; font-family: 'Nanum Gothic', sans-serif;">공연명<%-- ${selectOne.drama_title} --%></p>
	<p class="b_title" style="background-color: #fffffb;">${selectOne.title}
			<c:if test="${selectOne.star ==5}">
				<img alt="" src="../resources/images/starpoint/star_5.png" style="height: 20px;float: right; margin-right: -122px; float: right;">
			</c:if>
			<c:if test="${selectOne.star==4 }">
				<img alt="" src="../resources/images/starpoint/star_4.png" style="height: 20px;float: right; margin-right: -122px;">
			</c:if>
			<c:if test="${selectOne.star==3 }">
				<img alt="" src="../resources/images/starpoint/star_3.png" style="height: 20px;float: right; margin-right: -122px;">
			</c:if>
			<c:if test="${selectOne.star==2 }">
				<img alt="" src="../resources/images/starpoint/star_2.png" style="height: 20px;float: right; margin-right: -122px;">
			</c:if>
			<c:if test="${selectOne.star==1 }">
				<img alt="" src="../resources/images/starpoint/star_1.png" style="height: 20px;float: right; margin-right: -122px;">
			</c:if>
		</p>
		<div id="image_box">
			<c:if test="${file.file_num eq 0 }">
				<img alt="" src="../resources/images/starpoint/no_image.png" style="width: 400px; height: 200px;">			
			</c:if>
			<c:if test="${file.file_num ne 0 }">
			<img alt="" src="${pageContext.request.contextPath}/resources/upload/${file.file_name}" style="width: 400px;height: 200px;"> 
			</c:if>
			
			</div>
	<div class="b_contents">${selectOne.contents}</div>
	
	<div class="btn-group">
	<a href="./dramaReviewupdate?review_num=${selectOne.review_num}" class="btn btn-default">수정</a>
	<a href="./dramaReviewdelete?review_num=${selectOne.review_num }" class="btn btn-default" onclick="if(!confirm('정말로 삭제하시겠습니까?')){return false;}">삭제</a>
	</div>
	
	<a href="./dramaReview" id="list_btn" class="btn btn-default">목록</a>
	</div>
	
	
	
	
	
	<%-- 
	<div id="review_form">
	
	<div id="reviewbox">
		
		<div id="title_box"><div id="title">${selectOne.title }</div> <div id="writer">writer: ${selectOne.id}</div> <div id="date_box">	${selectOne.review_date}</div></div>	
		<div id="image_box"><img alt="" src="${pageContext.request.contextPath}/resources/upload/${file.file_name}" style="width: 400px;height: 200px;"> </div>
		<div id="star_point">
			<c:if test="${selectOne.star ==5}">
				<img alt="" src="../resources/images/starpoint/star_5.png" style="height: 20px">
			</c:if>
			<c:if test="${selectOne.star==4 }">
				<img alt="" src="../resources/images/starpoint/star_4.png" style="height: 20px">
			</c:if>
			<c:if test="${selectOne.star==3 }">
				<img alt="" src="../resources/images/starpoint/star_3.png" style="height: 20px">
			</c:if>
			<c:if test="${selectOne.star==2 }">
				<img alt="" src="../resources/images/starpoint/star_2.png" style="height: 20px">
			</c:if>
			<c:if test="${selectOne.star==1 }">
				<img alt="" src="../resources/images/starpoint/star_1.png" style="height: 20px">
			</c:if>
		
		</div>
			
		<div id="contents_box">${selectOne.contents}</div>
		
			
			<div id="option_box">
				<div id="option_form">
						<a href="./dramaReview">List</a>
						<a href="./dramaReviewupdate?review_num=${selectOne.review_num}">Update</a>
						<a href="./dramaReviewdelete?review_num=${selectOne.review_num }" onclick="del()">Delete</a>
				</div>
			</div>
	</div>
		
		
			
	</div> --%>
	
	
		<!-- footer  -->
	<c:import url="../temp/footer.jsp"></c:import>
	<!-- footer end -->	
			
</body>
</html>