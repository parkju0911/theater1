<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC ">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../resources/css/drama/dramaReviewview.css" rel="stylesheet">
<link href="../resources/css/common/header.css" rel="stylesheet">
<title>Insert title here</title>
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
	<div id="review_form">
	
	<div id="reviewbox">
		
		<div id="title_box"><div id="title">${selectOne.title }</div> <div id="writer">writer: 아이디</div> <div id="date_box">	${selectOne.review_date}</div></div>	
		<div id="image_box"><img alt="" src="${pageContext.request.contextPath}/resources/upload/${file.file_name}"> </div>
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
			
		<div id="contents_box">${selectOne.contents }</div>
		
			
			<div id="option_box">
				<div id="option_form">
						<a href="./dramaReview">List</a>
						<a href="./dramaReviewupdate?review_num=${selectOne.review_num}">Update</a>
						<a href="./dramaReviewdelete?review_num=${selectOne.review_num }" onclick="del()">Delete</a>
				</div>
			</div>
	</div>
		
		
			
	</div>
	
	
		<!-- footer  -->
	<c:import url="../temp/footer.jsp"></c:import>
	<!-- footer end -->	
			
</body>
</html>