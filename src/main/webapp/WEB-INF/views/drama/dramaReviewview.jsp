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
<body>
		<!-- header -->
	<c:import url="../temp/header.jsp"></c:import>
	<!-- header end -->
	<div id="review_form">
	
	<div id="reviewbox">
		
	<div id="title_box"><div id="title">${selectOne.title }</div> <div id="writer">작성자 아이디</div> <div id="date_box">	${selectOne.review_date}</div></div>	
	<div id="image_box"><img alt="" src=""> </div>
	<div id="contents_box">${selectOne.contents }</div>
		
	
		${selectOne.star}
		
			
	</div>
	
	</div>
		<!-- footer  -->
	<c:import url="../temp/footer.jsp"></c:import>
	<!-- footer end -->	
			
</body>
</html>