<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	$(function() {
		var kind = "user";
		
		$("#join").click(function() {
			if (kind == "user") {
				$("#company").remove();
				$("#frm").attr("action", "./user/memberJoin")
			} else {
				$("#user").remove();
				$("#frm").attr("action", "./company/memberJoin")
			}
			$("#frm").submit();
		});

		$(".kind").click(function() {
			kind = $(this).val();
			if (kind == "company") {
				$("#company").css("display", "block");
				$("#user").css("display", "none")
			} else {
				$("#user").css("display", "block")
				$("#company").css("display", "none");
			}
		});
		
		$("#id").blur(function() {
			$.ajax({
                type: 'POST',
                url: '../member/checkId',
                data: {
                    "id" : $(this).val()
                },
                success: function(data){
                    if($.trim(data) == 1){
                        $('#id_check_msg').html('<p style="color:blue">사용가능한 ID 입니다.</p>');
                    }
                    else{
                        $('#id_check_msg').html('<p style="color:red">사용불가능한(중복된) ID 입니다.</p>');
                    }
                }
            });
		});
		
		$("#pw2").blur(function() {
			var f1 = document.forms[0];
			var pw = $("#pw").val();
			var pw2 = $("#pw2").val();
			if(pw!=pw2){
				document.getElementById('pw_check_msg').style.color = "red";
				document.getElementById('pw_check_msg').innerHTML = "동일한 암호를 입력하세요."; 
			}else{
				document.getElementById('pw_check_msg').style.color = "black";
				document.getElementById('pw_check_msg').innerHTML = "암호가 확인 되었습니다.";  
			}
		});
	});
</script>
<script type="text/javascript">
	function checkForm(theForm) {
		if (!$("#chkok").prop("checked")) {
			alert("이용약관 및 개인정보취급방침에 동의하셔야 가입이 가능합니다.");
			return false;
		}
	}
</script>
<script type="text/javascript">
	var result = '${result}';
	if(result != ""){
		alert('${result}');
	}
</script>
<style type="text/css">
#company {
	display: none;
}
</style>
<link href="../resources/css/member/memberJoin.css" rel="stylesheet">
<link href="../resources/css/common/header.css" rel="stylesheet">
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	
	<form action="./memberJoin" method="post" id="frm" onsubmit="return checkForm(this);">
		<div style="width: 850px; margin: 20px auto; padding: 30px 70px; border: 1px solid #e8e8e8; background: #fff; text-align: center;">
			<!-- 타이틀 영역-->
			<div>
				<div style="float: left; text-align: left;">
					<span style="font-size: 24px; font-weight: 400;">TEATRO 회원가입</span>
				</div>
				<div style="font-size: 13px; font-weight: 300; text-align: right; padding-top: 15px; vertical-align: bottom;">
					* 필수 입력항목</div>
				<div style="border-top: 1px solid #e8e8e8; width: 100%; margin-top: 10px;"></div>
			</div>
			<!-- 타이틀 영역 끝-->
			<div alt="입력필드" style="padding: 20px; overflow: hidden;">
				<div class="o">▼ 기본정보(필수)</div>
				<div>
					<div style="text-align: left; padding: 15px 0; clear: both; vertical-align: middle; height: 35px;">
						<div style="float: left; font-size: 16px; font-weight: 500; width: 170px;">아이디*</div>
						<div style="float: left; font-size: 16px; font-weight: 300;">
							<input type="text" id="id" name="id" value="" class="member_txt">
							<div id="id_check_msg"></div>
						</div>
						<!-- <button type="submit" id="checkbtn" class="btn btn-default">중복확인</button> -->
						<div style="text-align: left; padding: 15px 0; clear: both; vertical-align: middle; height: 35px;">
							<div style="float: left; font-size: 16px; font-weight: 500; width: 170px;">비밀번호*</div>
							<div style="float: left; font-size: 16px; font-weight: 300;">
								<input type="password" id="pw" name="pw" value="" class="member_txt"
									size="20" hname="비밀번호*" required="">
								<div id="check_msg"></div>
							</div>
							<div style="text-align: left; padding: 15px 0; clear: both; vertical-align: middle; height: 35px;">
								<div style="float: left; font-size: 16px; font-weight: 500; width: 170px;">비밀번호
									확인*</div>
								<div style="float: left; font-size: 16px; font-weight: 300;">
									<input type="password" id="pw2" name="pw2" value="" class="member_txt"
										size="20" hname="비밀번호확인*" required="">
									<div id="pw_check_msg"></div>
								</div>
								<div style="text-align: left; padding: 15px 0; clear: both; vertical-align: middle; height: 35px;">
									<div style="float: left; font-size: 16px; font-weight: 500; width: 170px;">이름*</div>
									<div style="float: left; font-size: 16px; font-weight: 300;">
										<input type="text" id="name" name="name" value="" class="member_txt" size="10" hname="이름*" required="">
									</div>
									<div style="text-align: left; padding: 15px 0; clear: both; vertical-align: middle; height: 35px;">
										<div style="float: left; font-size: 16px; font-weight: 500; width: 170px;">휴대폰*</div>
										<div style="float: left; font-size: 16px; font-weight: 300;">
											<input type="tel" name="phone" value=""
												id="user_hphone" maxlength="13" class="member_txt"
												onkeypress="if( (event.keyCode<48) || (event.keyCode>57) ) event.returnValue=false;">
											<span style="font-size: 14px; color: #777; padding-left: 10px;">숫자만 입력해 주세요.</span>
										</div>
										<div style="text-align: left; padding: 15px 0; clear: both; vertical-align: middle; height: 35px;">
											<div style="float: left; font-size: 16px; font-weight: 500; width: 170px;">이메일*</div>
											<div style="float: left; font-size: 16px; font-weight: 300;">
												<input type="text" id="email" name="email" value="" class="member_txt">
													<span style="font-size: 14px; color: #777; padding-left: 10px;">아이디/비밀번호 찾기에 필요합니다.</span>
											</div>
										</div>
									</div>
									<div style="text-align: left; padding: 15px 0; clear: both; vertical-align: middle; height: 35px;">
										<!-- <div style="float: left; font-size: 16px; font-weight: 500; width: 170px;">
											<br>
										</div>
										<div style="float: left; font-size: 16px; font-weight: 300;"></div> -->
										<div style="text-align: left; padding: 15px 0; clear: both; vertical-align: middle; height: 35px;">
											<div style="float: left; font-size: 16px; font-weight: 500; width: 170px;">회원*</div>
											<div style="float: left; font-size: 16px; font-weight: 300;">
												<input type="radio" name="kind" value="user" class="kind">
												<label for="user_prefix_0" style="cursor: hand; font-weight: normal; font-size: 14px;">개인회원</label>
												&nbsp;
												<input type="radio" name="kind" value="company" class="kind">
												<label for="user_prefix_1" style="cursor: hand; font-weight: normal; font-size: 14px;">회사회원</label>
												&nbsp;
											</div>
											<div id="user" style="text-align: left; padding: 15px 0; clear: both; vertical-align: middle; height: 35px;">
												<div style="float: left; font-size: 16px; font-weight: 500; width: 170px;">생년월일*</div>
												<div style="float: left; font-size: 16px; font-weight: 300;">
													<input type="date" name="birth" class="member_txt" style=" font-size: 12px;">
												</div>
											</div>
											
											<div id="company" style="text-align: left; padding: 15px 0; clear: both; vertical-align: middle; height: 35px;">
												<div style="float: left; font-size: 16px; font-weight: 500; width: 170px;">사업자등록번호*</div>
												<div style="float: left; font-size: 16px; font-weight: 300;">
													<input type="number" name="company_num" class="member_txt">
												</div>
												<div style="text-align: left; padding: 15px 0; clear: both; vertical-align: middle; height: 35px;">
													<div style="float: left; font-size: 16px; font-weight: 500; width: 170px;">가로줄*</div>
													<div style="float: left; font-size: 16px; font-weight: 300;">
														<input type="number" name="row_num" class="member_txt">
													</div>
													<div style="text-align: left; padding: 15px 0; clear: both; vertical-align: middle; height: 35px;">
														<div style="float: left; font-size: 16px; font-weight: 500; width: 170px;">세로줄*</div>
														<div style="float: left; font-size: 16px; font-weight: 300;">
															<input type="number" name="col_num" class="member_txt">
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="border-top: 1px solid #e8e8e8; width: 100%;"></div>
			<div style="padding-top: 30px; text-align: center; font-size: 14px; font-weight: 300; color: #333;">
				* 예매관련 정보는 수신동의 여부와 관계없이 SMS/이메일로 발송됩니다.<br> * 오타나 잘못된 정보를 입력할
				경우 티켓이용이 불가할 수 있으니 주의해주세요.<br>
			</div>
			<div alt="약관동의" style="padding-top: 30px;">
				<div style="font-size: 16px; color: #555; font-weight: 300;">
					<input type="checkbox" id="chkok" name="chkok" value="약관동의" style="vertical-align: middle; height: 18px; width: 18px;">
					<a href="memberJoin1"
						target="_blank" style="padding-left: 3px; color: #ffc108; font-weight: 500; 
						text-decoration: underline;">회원이용약관</a> 및 
					<a href="memberJoin2"
						target="_blank" style="color: #ffc108; font-weight: 500; text-decoration: underline;">
						개인정보 수집/이용</a>에 대해 동의합니다.
				</div>
			</div>
			<div alt="가입버튼" style="text-align: center; margin: 40px 0 40px 0;">
				<input type="button" value="가입완료" id="join" style="width: 300px; height: 55px; border: none; background: #ffc108; color: #fff; font-size: 18px; font-weight: 400; margin-top: 15px;">
			</div>
		</div>
		<script>
			// 휴대폰 번호 자동 하이픈(-) 스크립트
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
			var cellPhone = document.getElementById('user_hphone');
			cellPhone.onkeyup = function(event) {
				event = event || window.event;
				var _val = this.value.trim();
				this.value = autoHypenPhone(_val);
			}
			// 휴대폰 번호 자동 하이픈(-) 스크립트 END
		</script>
	</form>
	
	<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>