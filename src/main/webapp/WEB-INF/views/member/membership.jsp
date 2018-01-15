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
.title_wrap{
border-top: 2px solid #5d4137;
    padding-top: 8px;
    }
     .headerArea{
    height: auto;
    width: 935px;
    margin: 0 auto;
    } 
#contents{
	height: auto;
    width: 1100px;
    margin: 0 auto;
    padding-bottom: 50px;
    font-family: 'Nanum Gothic', sans-serif;
}
.contents input{
	font-size: 12px;
    border: none;
    border-bottom: 1px solid #aaaa;
    width: 211px;
}
#row_num, #col_num{
        width: 87px;
    text-align: center;
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
		<!-- <div class="titleArea" style="    width: 900px; margin: 0 auto;">
			<h2>MEMBERSHIP</h2>
		</div> -->
		
		
		<div class="headerArea">
  		<div class="title_wrap" style="width: 1000px;font-family: 'Nanum Gothic', sans-serif;">
		<h6 id="h6_title" style="margin-right: 5px; margin-top: 8px;">
		<a href="${pageContext.request.contextPath}"><img alt="" src="../resources/images/common/homeImg.png" id="homeImg"></a> > 
		<a href="${pageContext.request.contextPath}/member/memberMypage">MYPAGE</a>
		 > <a href="${pageContext.request.contextPath}/member/membership">MEMBERSHIP</a></h6>
		</div> 
		<h2 style="margin-top: 20px; font: 40px/41px 'fMdBT'; padding-bottom: 20px; width: 900px; margin: 0 auto;">MEMBERSHIP</h2>
		
		<form action="./memberUpdate" method="POST">
		<input type="hidden" name="kind" value="${member.kind}">
		<div style="font-size:12px; width: 850px; margin: 20px auto; padding: 30px 70px; border: 1px solid #e8e8e8; background: #fff; text-align: center; padding: 108px; padding-top: 47px;padding-bottom: 55px;">
			<!-- 타이틀 영역-->
			<div>
				<div style="float: left; text-align: left;">
					<span style="font-size: 24px; font-weight: 400;">TEATRO <span style="    font-family: 'Nanum Gothic', sans-serif; font-weight: 600; font-size: 19px;">회원정보</span></span>
				</div>
				<div style="color:#ff9e08; font-size: 13px; font-weight: 600; text-align: right; padding-top: 15px; vertical-align: bottom;">
					* 수정불가 항목</div>
				<div style="border-top: 1px solid #e8e8e8; width: 100%; margin-top: 10px;"></div>
			</div>
			<!-- 타이틀 영역 끝-->
			<div alt="입력필드" style="padding: 20px; overflow: hidden;padding-bottom: 64px;">
			<div class="o" style="padding: 7px;">저희 TEATRO를 이용해 주셔서 감사합니다.
			<p>	<span class="xans-member-var-name">${member.name}</span></strong> 님은 <strong class="group"> 
			<span class="xans-member-var-group_name" style="font-weight: normal; ">${member.kind}</span>
			<span class="myshop_benefit_ship_free_message"></span></strong> 회원입니다.</div>
				<div class="contents">
					<div style="text-align: left; padding: 15px 0; clear: both; vertical-align: middle; height: 35px;">
						<div style="float: left; font-size: 14px; font-weight: 500; width: 170px;">아이디<span style="color:#ff9e08;">*</span></div>
						<div style="float: left; font-size: 16px; font-weight: 300;">
							<input size="30" type="text" size="30" id="id" name="id"value="${member.id}" readonly="readonly" class="member_txt">
							<div id="id_check_msg"></div>
						</div>
								<div style="text-align: left; padding: 15px 0; clear: both; vertical-align: middle; height: 35px;">
									<div style="float: left; font-size: 14px; font-weight: 500; width: 170px;">이름<span style="color:#ff9e08;">*</span></div>
									<div style="float: left; font-size: 16px; font-weight: 300;">
										<input size="30" type="text" id="name" name="name" value="${member.name}" readonly="readonly" class="member_txt" hname="이름*" required="">
									</div>
									<div style="text-align: left; padding: 15px 0; clear: both; vertical-align: middle; height: 35px;">
										<div style="float: left; font-size: 14px; font-weight: 500; width: 170px;">휴대폰</div>
										<div style="float: left; font-size: 16px; font-weight: 300;">
											<input size="30" type="tel" id="phone" name="phone" value="${member.phone}" maxlength="13" 
						onkeypress="if( (event.keyCode<48) || (event.keyCode>57) ) event.returnValue=false;" class="member_txt">
										</div>
										<div style="text-align: left; padding: 15px 0; clear: both; vertical-align: middle; height: 35px;">
											<div style="float: left; font-size: 14px; font-weight: 500; width: 170px;">이메일</div>
											<div style="float: left; font-size: 16px; font-weight: 300;">
												<input size="30" type="text" id="email" name="email" value="${member.email}" class="member_txt">
											</div>
										</div>
									</div>
									<div style="text-align: left; padding:  0; clear: both; vertical-align: middle; height: 35px;">
										<!-- <div style="float: left; font-size: 16px; font-weight: 500; width: 170px;">
											<br>
										</div>
										<div style="float: left; font-size: 16px; font-weight: 300;"></div> -->
										<c:if test="${member.kind eq 'user'}">
											<div id="user" style="text-align: left; padding: 15px 0; clear: both; vertical-align: middle; height: 35px;">
												<div style="float: left; font-size: 14px; font-weight: 500; width: 170px;">생년월일</div>
												<div style="float: left; font-size: 16px; font-weight: 300;">
													<input size="30" type="date" type="date" id="birth" name="birth" value="${user.birth}" class="member_txt" style=" font-size: 12px;">
												</div>
											</div>
										</c:if>
										<c:if test="${member.kind eq 'company'}">
											<div style="text-align: left; padding: 15px 0; clear: both; vertical-align: middle; height: 35px;">
												<div style="float: left; font-size: 14px; font-weight: 500; width: 170px;">좌석</div>
												<div style="float: left; font-size: 14px; font-weight: 300;">
													<input size="15" type="number" id="row_num" name="row_num" class="member_txt" value="${company.row_num}">행
											<input  size="15" type="number" id="col_num" name="col_num" class="member_txt" value="${company.col_num}">열
												</div>
											</div>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div style="border-top: 1px solid #e8e8e8; width: 100%;"></div>
					<div alt="가입버튼"
						style="text-align: center; margin: 30px 0 30px 0; font-family: 'Nanum Gothic', sans-serif;      margin-top: 4px;  padding: 11px;">
						<!-- <input type="submit" id="update" value="수정" id="join" style="width: 300px; height: 55px; border: none; background: #ffc108; color: #fff; font-size: 18px; font-weight: 400; margin-top: 15px;"> -->
						<input type="submit" id="update" value="수정"
							style="float: right; border-radius: 7px; width: 95px; height: 47px; border: none; background: #ffc108; color: #fff; font-size: 18px; font-weight: 400; margin-top: 15px;">
						<div
							style="    width: 95px; height: 47px; float: left; margin: 0 auto; border: none; background: #c7c7c7; margin-top: 15px; border-radius: 7px;">
							<a href="./memberDelete?id=${member.id}"
								onclick="if(!confirm('정말로 탈퇴하시겠습니까?')){return false;}"
								style="height: auto; color: #fff; font-size: 18px; font-weight: 400; vertical-align: middle;">
								<p style="padding-top: 5%; font-family: 'Nanum Gothic', sans-serif;">탈퇴</p></a>
						</div>
						<!-- <input type="submit" id="update" value="수정" class="btn btn-default" style="margin-top: 50px; float: right;"> -->
						<%-- <a href="./memberDelete?id=${member.id}" class="btn btn-default" onclick="if(!confirm('정말로 탈퇴하시겠습니까?')){return false;}" style="margin-top: 50px; float: left;">탈퇴</a> --%>
					</div>
				</div>
				</form>
			</div>
			</div>
		
		
		
		<!-- ================================================================ -->
		
		<%-- 	<input type="hidden" name="kind" value="${member.kind}">
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
					<li class=""><strong class="title">주소</strong> <strong
						class="data"><span id="xans_myshop_bankbook_used_mileage">${member.address}</span></strong></li>
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
	</div> --%>
	
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