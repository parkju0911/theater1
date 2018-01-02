<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../resources/css/member/searchId.css" rel="stylesheet">
<link href="../resources/css/common/header.css" rel="stylesheet">
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>

	<c:if test="${empty memberDTO}">
		<p>일치하는 이름의 아이디가 없습니다.</p>
	</c:if>

	<c:if test="${not empty memberDTO}">
		<div class="xans-element- xans-member xans-member-findidresult">
			<div class="findId">
				<h3>
					<img src="../resources/images/member/ico_guide_result.png"
						alt="complete">
				</h3>
				<p class="desc">고객님 아이디 찾기가 완료 되었습니다.</p>
				<p class="info">
					고객님의 아이디 찾기가 성공적으로 이루어졌습니다.<br>
					항상 즐겁고 편리한 쇼핑을 위해 최선의 노력을 다하겠습니다.
				</p>
				<div class="memberInfo">
					<ul>
						<li>이름 : <strong><span>${memberDTO.name}</span></strong></li>
						<li>이메일 : <span>${memberDTO.email}</span></li>
						<li><label>
							<span class="id">${memberDTO.id}</span>
							<span class="gaip">(${memberDTO.kind})</span>
							</label><br>
						</li>
						<li>고객님 즐거운 쇼핑 하세요!</li>
					</ul>
				</div>
				<p class="button btnAreaCustom">
					<a href="memberLogin" class="btn Big Wbig Dark ">로그인</a>
					<a href="memberIdSearch" class="btn Big Wbig Medium mL5 ">비밀번호찾기</a>
				</p>
			</div>
		</div>
	</c:if>

	<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>