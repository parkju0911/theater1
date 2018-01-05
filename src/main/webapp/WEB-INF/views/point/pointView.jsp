<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="../resources/css/point/point.css" rel="stylesheet">
</head>
<body>

<!-- 뷰화면에는 티켓 정보같은거 넣어야함!!!!! -->


<h1>${point}view</h1>
	<table border="1">
		<tr>
			<td>내역:${view.history}</td>
			<td>${view.point}</td>
			<td>총 :${view.total_point}</td>
			<td>${view.kind}</td>		
			<td>${view.reg_date}</td>
		</tr>
	
	</table>
</body>
</html>