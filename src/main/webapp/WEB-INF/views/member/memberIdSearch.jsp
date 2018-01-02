<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.lost_inputbox {
	color: #aaa;
	background: #fff;
	font-size: 14px;
	height: 35px;
	border: 1px solid #d4d4d4;
	width: 300px;
	padding-left: 10px;
	margin-top: 10px;
}

.lost_submit {
	width: 312px;
	height: 37px;
	border: none;
	background: #444444;
	color: #fff;
	font-size: 16px;
	font-weight: 400;
	margin-top: 15px;
}
</style>
<link href="../resources/css/common/header.css" rel="stylesheet">
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	<div class="wrap_topmargin">
		<div style="margin: 0 auto; width: 900px; height: 650px; padding-top: 50px;">
			<div style="float: left; width: 435px; height: 300px; border: 1px solid #e8e8e8; background: #f4f4f4; text-align: center;">
				<div style="font-size: 20px; font-weight: 500; padding-top: 20px;">
					아이디 찾기
				</div>
				<div style="font-size: 14px; font-weight: 300; color: #444; padding-top: 10px;">
					가입하실 때 기재하신 정보를<br> 정확히 입력해주세요!
				</div>
				<!-- // SSL 연동 16.08.12 x2chi -->
				<form action="memberIdSearch" method="post">
					<input type="text" name="name" value="이름"
						onfocus="this.value='';" class="lost_inputbox"
						style="margin-top: 30px;"> <input type="text"
						name="email" value="이메일" onfocus="this.value='';"
						class="lost_inputbox">
					<button name="formimage1" class="lost_submit">아이디 찾기</button>
				</form>
			</div>
			<!-- <div style="float: right; width: 435px; height: 300px; border: 1px solid #e8e8e8; background: #f4f4f4; text-align: center;">
				<div style="font-size: 20px; font-weight: 500; padding-top: 20px;">
					비밀번호 찾기</div>
				<div style="font-size: 14px; font-weight: 300; color: #444; padding-top: 10px;">
					가입하실 때 기재하신 정보와 일치할 경우<br> 이메일 주소로 비밀번호를 전송해드립니다.
				</div>
				// SSL 연동 16.08.12 x2chi
				<form action="https://timeticket.co.kr:46392/happy_member.php?mode=lostpass_reg" method="post">
					<input type="text" name="member_id" value="아이디"
						onfocus="this.value='';" class="lost_inputbox"
						style="margin-top: 30px;"> <input type="text"
						name="member_email" value="이메일" onfocus="this.value='';"
						class="lost_inputbox">
					<button name="formimage1" class="lost_submit">비밀번호 찾기</button>
				</form>
			</div> -->
			<div style="clear: both;"></div>
			<div style="text-align: center; font-size: 13px; font-weight: 300; margin-top: 50px;">
				* 가입 당시 입력한 정보와 일치하지 않을경우 아이디/비밀번호 찾기가 불가합니다.<br> * 아이디/비밀번호
				찾기에 실패할 경우 고객센터(070-4143-0089)로 문의해주세요.
			</div>
		</div>
	</div>
	<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>