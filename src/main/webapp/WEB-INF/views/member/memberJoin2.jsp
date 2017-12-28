<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="../resources/css/common/header.css" rel="stylesheet">
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	<div style="width: 100%; padding: 30px 0; background: #f4f4f4; overflow: hidden;">
		<center>
			<table width="803" align="center" cellpadding="15" cellspacing="0" border="0" style="border: 1px solid #e2e2e2;">
				<tbody>
					<tr valign="top">
						<td style="padding: 30px; background: #FFF; line-height: 160%;">
							<p style="font-size: 14px; font-weight: bold; text-align: center;">[개인정보
								수집 및 이용 안내]</p>
							<div style="padding-top: 15px; padding-left: 10px;">
								<table style="width: 720px; border-style: solid; border-color: rgb(221, 221, 221); word-wrap: break-word; word-break: break-all;">
									<thead>
										<tr style="font-size: 12px;">
											<th scope="col"
												style="padding: 8px 12px; border-style: solid; border-color: rgb(221, 221, 221); white-space: nowrap; background-color: rgb(250, 250, 250);">구분</th>
											<th scope="col"
												style="padding: 8px 12px; border-style: solid; border-color: rgb(221, 221, 221); white-space: nowrap; background-color: rgb(250, 250, 250);">수집시점</th>
											<th scope="col"
												style="padding: 8px 12px; border-style: solid; border-color: rgb(221, 221, 221); white-space: nowrap; background-color: rgb(250, 250, 250);">이용목적</th>
											<th scope="col"
												style="padding: 8px 12px; border-style: solid; border-color: rgb(221, 221, 221); white-space: nowrap; background-color: rgb(250, 250, 250);">이용항목</th>
											<th scope="col"
												style="padding: 8px 12px; border-style: solid; border-color: rgb(221, 221, 221); white-space: nowrap; background-color: rgb(250, 250, 250);">보유·이용
												기간 및 파기</th>
										</tr>
									</thead>
									<tbody>
										<tr style="font-size: 12px;">
											<th scope="row"
												style="padding: 8px 12px; border-style: solid; border-color: rgb(221, 221, 221); white-space: nowrap;">필수<br>
												정보
											</th>
											<td class="join-notice-term-table-center" rowspan="2"
												style="padding: 8px 12px; border-style: solid; border-color: rgb(221, 221, 221); vertical-align: middle; text-align: center;">가입</td>
											<td
												style="padding: 8px 12px; border-style: solid; border-color: rgb(221, 221, 221); vertical-align: top;">서비스
												이용 및 이용 상담</td>
											<td
												style="padding: 8px 12px; border-style: solid; border-color: rgb(221, 221, 221); vertical-align: top;">이름,
												아이디, 비밀번호</td>
											<td
												style="padding: 8px 12px; border-style: solid; border-color: rgb(221, 221, 221); vertical-align: top;">회원
												탈퇴 시 즉시 삭제&nbsp;<br> 단, 아이디는 부정사용 방지를 위해 탈퇴 DB에서 6개월 후
												삭제
											</td>
										</tr>
										<tr style="font-size: 12px;">
											<th scope="row"
												style="padding: 8px 12px; border-style: solid; border-color: rgb(221, 221, 221); white-space: nowrap;">선택<br>
												정보
											</th>
											<td
												style="padding: 8px 12px; border-style: solid; border-color: rgb(221, 221, 221); vertical-align: top;">마케팅</td>
											<td
												style="padding: 8px 12px; border-style: solid; border-color: rgb(221, 221, 221); vertical-align: top;">성별,
												이메일, 휴대폰번호</td>
											<td
												style="padding: 8px 12px; border-style: solid; border-color: rgb(221, 221, 221); vertical-align: top;">회원
												탈퇴 시 즉시 삭제</td>
										</tr>
									</tbody>
								</table>
								<div style="margin-top: 20px; font-size: 12px; padding-bottom: 50px;">
									귀하께서는 TEATRO가 수집하는 개인정보에 대해, 동의하지 않거나 개인정보를 기재하지 않음으로써 거부할 수
									있습니다. <br>다만, 이 경우 회원가입 및 구매 등 회원에게 제공되는 서비스가 제한될 수 있습니다.
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</center>
	</div>
	<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>