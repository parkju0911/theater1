<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../resources/css/member/memberLogin.css" rel="stylesheet">
</head>
<body>
	<form action="memberLogin" method="post" name="happy_member_login_form">
		<!-- <input type="hidden" name="returnUrl" value="http://timeticket.co.kr/happy_member.php?mode=joinus2&amp;member_group=1">
		<input type="hidden" name="save_id" value=""> -->
		<div style="width: 580px; margin: 80px auto; border: 1px solid #e8e8e8; text-align: center; padding: 30px 0;">
			<div style="font-size: 30px; font-weight: 400;">TEATRO 로그인</div>
			<div style="font-size: 20px; font-weight: 300; padding-top: 10px;">
				보다 합리적으로 누리는 풍요로운 문화생활
			</div>
			<div style="padding-top: 30px;">
				<input type="text" name="id" value="아이디" onfocus="this.value='';"
					style="color: #aaa; background: #fff; border: 1px solid #ccc; font-size: 14px; height: 45px; width: 388px; padding-left: 10px;">
			</div>
			<div style="padding-top: 10px;">
				<input type="password" name="pw" value="비밀번호" onfocus="this.value='';"
					style="color: #aaa; background: #fff; border: 1px solid #ccc; font-size: 14px; height: 45px; width: 388px; padding-left: 10px;">
			</div>

			<div style="padding-top: 10px;">
				<!-- <input type="image" name="formimage1" src="../resources/images/member/btn_login.png" style="width: 400px;" alt="로그인버튼"> -->
				<button id="login_btn" style="width: 400px; height: 50px;">로그인</button>
			</div>
			
			<div style="float: left; text-align: left; padding: 15px 0 0 89px;">
				<input type="checkbox" name="auto_login_use" id="auto_login_use" value="y" checked="" onclick="happy_member_auto_login_use()">
				<label for="auto_login_use" style="font-size: 14px; color: #777; font-weight: 400; line-height: 16px;">자동로그인 설정</label>
			</div>
			
			<!-- <div style="float: right; font-size: 14px; color: #333; font-weight: 300; padding: 15px 90px 0 0; line-height: 16px;">
				<a href="happy_member.php?mode=lostid" onfocus="this.blur()">아이디 찾기</a>
				<span style="padding: 0 8px;">|</span>
				<a href="happy_member.php?mode=lostid" onfocus="this.blur()">비밀번호 찾기</a>
			</div> -->
			
			<div style="text-align: center; padding: 40px 0; font-size: 16px;">
				<span style="color: #333;">TEATRO 회원이 아니신가요?</span>
				<a href="memberJoin" alt="회원가입">
					<span style="color: #ffc108; text-decoration: underline; padding-left: 5px;">회원가입</span>
				</a>
			</div>
		</div>
	</form>
</body>
</html>