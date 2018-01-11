<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/SE2/js/HuskyEZCreator.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Insert title here</title>
<style type="text/css">
#contents{
height: auto;
    width: 1100px;
    margin: 0 auto;
    padding-bottom: 50px;
}
</style>
</head>
<link href="../resources/css/common/header.css" rel="stylesheet">
<link href="../resources/css/board/boardHeader.css" rel="stylesheet">
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>

<div id="contents">

		<!-- <div class="path">
			<span>현재 위치</span>
			<ol>
				<li><a href="/">home</a></li>
				<li title="현재 위치"></li>
			</ol>
		</div> -->
		<div class="titleArea">
			<h2>MEMBERSHIP</h2>
		</div>
		<form action="./memberLogin.member" method="POST">
			<div class="xans-element- xans-myshop xans-myshop-asyncbenefit">
				<div class="infoWrap ">
					<div class="myInfo">
						<p>
							저희 TEATRO를 이용해 주셔서 감사합니다. <strong class="name"></p>
						<p>	<span class="xans-member-var-name">${member.name}</span></strong> 님은 <strong
								class="group"> <span class="xans-member-var-group_name">${member.kind}</span>
								<span class="myshop_benefit_ship_free_message"></span>
							</strong> 회원입니다.
						</p>
					</div>
				</div>
			</div>

			<div class="xans-element- xans-myshop xans-myshop-asyncbankbook"
				style="height: 90px;">
				<ul>
					<li class=" "><strong class="title">아이디</strong> <strong
						class="data use">&nbsp;<span
							id="xans_myshop_bankbook_avail_mileage">${member.id}</span></strong></li>
					<li class=""><strong class="title">이름</strong> <strong
						class="data"><span
							id="xans_myshop_bankbook_total_mileage">${member.name}</span></strong></li>
					<%-- <li class=""><strong class="title">주소</strong> <strong
						class="data"><span id="xans_myshop_bankbook_used_mileage">${member.address}</span></strong></li> --%>
					<li class=""><strong class="title">휴대폰</strong> <strong
						class="data use">&nbsp;<span
							id="xans_myshop_bankbook_deposit">${member.phone}</span></strong></li>
					<c:if test="${member.kind eq 'user'}">
					<li><strong class="title">생일</strong> <strong class="data"><span
							id="xans_myshop_bankbook_order_price">${user.birth}</span></strong></li>
					</c:if>
					<li class=""><strong class="title">이메일</strong> <strong
						class="data"><span id="xans_myshop_bankbook_coupon_cnt">${member.email}</span></strong>
					</li>
					<c:if test="${member.kind eq 'company'}">
						<li><strong class="title">좌석</strong> <strong class="data"><span
							id="xans_myshop_bankbook_order_price">${company.row_num}행 ${company.col_num}열</span></strong></li>
					</c:if>
				</ul>
			</div>
		</form>
		<a href="./memberDelete?id=${member.id}" class="btn btn-default" onclick="if(!confirm('정말로 탈퇴하시겠습니까?')){return false;}" style="margin-top: 10px;">탈퇴</a>
		<a href="./memberUpdate?id=${member.id}" class="btn btn-default" style="margin-top: 10px;">수정</a>
	</div>

<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>