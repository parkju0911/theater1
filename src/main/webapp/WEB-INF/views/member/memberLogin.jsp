<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link href="../resources/css/member/memberLogin.css" rel="stylesheet">
<link href="../resources/css/common/header.css" rel="stylesheet">
<script type="text/javascript">
	var result = '${result}';
	if(result != ""){
		alert('${result}');
	}
</script>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
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
			
			<div style="float: right; font-size: 14px; color: #333; font-weight: 300; padding: 15px 90px 0 0; line-height: 16px;">
				<a href="memberIdSearch" onfocus="this.blur()">아이디 찾기</a>
				<span style="padding: 0 8px;">|</span>
				<a href="memberIdSearch" onfocus="this.blur()">비밀번호 찾기</a>
			</div>
			
			<div style="text-align: center; padding: 40px 0; font-size: 16px;">
				<span style="color: #333;">TEATRO 회원이 아니신가요?</span>
				<a href="memberJoin" alt="회원가입">
					<span style="color: #ffbc0d; text-decoration: underline; padding-left: 5px;">회원가입</span>
				</a>
			</div>
		</div>
	</form>
	<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>