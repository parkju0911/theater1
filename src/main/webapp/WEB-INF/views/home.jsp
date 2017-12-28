<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>Home</title>
<link href="./resources/css/common/header.css" rel="stylesheet">
</head>
<body>
<c:import url="./temp/header.jsp"></c:import>

<a href="drama/dramaList">Drama List</a>

<a href="./notice/noticeList">Go Notice</a>
<a href="./qna/qnaList">Go Qna</a>

<c:import url="./temp/footer.jsp"></c:import>
</body>
</html>
