<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${empty memberDTO}">
		<p>일치하는 이름의 아이디가 없습니다.</p>
	</c:if>
	<c:if test="${not empty memberDTO}">
		<p>당신의 아이디는 ${memberDTO.id} 입니다.</p>
	</c:if>
</body>
</html>