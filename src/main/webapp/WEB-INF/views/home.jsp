<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 

	<title>Home</title>
<link href="./resources/css/common/header.css" rel="stylesheet">
<c:import url="./temp/header.jsp">
</c:import>
</head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>에코</title> 
</head> 

<body>

		

<h1>
	Hello world!  
</h1>
<P>  The time on the server is ${serverTime}. </P>
<a href="drama/dramaList">Drama List</a>

<a href="./notice/noticeList">Go Notice</a>
<a href="./qna/qnaList">Go Qna</a>


<c:import url="./temp/footer.jsp"></c:import>

</body>

</html>

