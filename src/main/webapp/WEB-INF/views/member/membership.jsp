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
<script type="text/javascript">
	var message = '${message}';
	if(message != ""){
		alert('${message}');
	}
</script>
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
		<form action="./memberUpdate" method="POST">
			<input type="hidden" name="kind" value="${member.kind}">
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
							id="xans_myshop_bankbook_avail_mileage"><input type="text" id="id" name="id" value="${member.id}" readonly="readonly"></span></strong></li>
					<li class=""><strong class="title">이름</strong> <strong
						class="data"><span
							id="xans_myshop_bankbook_total_mileage"><input type="text" id="name" name="name" value="${member.name}" readonly="readonly"></span></strong></li>
					<%-- <li class=""><strong class="title">주소</strong> <strong
						class="data"><span id="xans_myshop_bankbook_used_mileage">${member.address}</span></strong></li> --%>
					<li class=""><strong class="title">휴대폰</strong> <strong
						class="data use">&nbsp;<span id="xans_myshop_bankbook_deposit">
						<input type="tel" id="phone" name="phone" value="${member.phone}" maxlength="13" 
						onkeypress="if( (event.keyCode<48) || (event.keyCode>57) ) event.returnValue=false;"></span></strong></li>
					<c:if test="${member.kind eq 'user'}">
					<li><strong class="title">생일</strong> <strong class="data"><span
							id="xans_myshop_bankbook_order_price"><input type="date" id="birth" name="birth" value="${user.birth}"></span></strong></li>
					</c:if>
					<li class=""><strong class="title">이메일</strong> <strong
						class="data"><span id="xans_myshop_bankbook_coupon_cnt"><input type="text" id="email" name="email" value="${member.email}"></span></strong>
					</li>
					<c:if test="${member.kind eq 'company'}">
						<li class=""><strong class="title">사업자번호</strong> <strong
						class="data"><span id="xans_myshop_bankbook_coupon_cnt"><input type="number" id="company_num" name="company_num" value="${company.company_num}"></span></strong>
						</li>
						<li><strong class="title">좌석</strong> <strong class="data"><span
							id="xans_myshop_bankbook_order_price">
							<input type="number" id="row_num" name="row_num" value="${company.row_num}">행 
							<input type="number" id="col_num" name="col_num" value="${company.col_num}">열</span></strong></li>
					</c:if>
				</ul>
			</div>
		<input type="submit" id="update" value="수정" class="btn btn-default" style="margin-top: 50px; float: right;">
		</form>
		<a href="./memberDelete?id=${member.id}" class="btn btn-default" onclick="if(!confirm('정말로 탈퇴하시겠습니까?')){return false;}" style="margin-top: 50px; float: left;">탈퇴</a>
	</div>
	
<script>
	//휴대폰 번호 자동 하이픈(-) 스크립트
	function autoHypenPhone(str) {
		str = str.replace(/[^0-9]/g, '');
		var tmp = '';
		if (str.length < 4) {
			return str;
		} else if (str.length < 8) {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3);
			return tmp;
		} else if (str.length < 12) {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3, 4);
			tmp += '-';
			tmp += str.substr(7);
			return tmp;
		}
		return str;
	}
	var cellPhone = document.getElementById('phone');
	cellPhone.onkeyup = function(event) {
		event = event || window.event;
		var _val = this.value.trim();
		this.value = autoHypenPhone(_val);
	}
	// 휴대폰 번호 자동 하이픈(-) 스크립트 END
</script>

<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>