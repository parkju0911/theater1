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
</head>
<link href="../resources/css/common/header.css" rel="stylesheet">
<link href="../resources/css/board/boardHeader.css" rel="stylesheet">
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>

<div id="contents">

		<div class="path">
			<span>현재 위치</span>
			<ol>
				<li><a href="/">home</a></li>
				<li title="현재 위치"></li>
			</ol>
		</div>
		<div class="titleArea">
			<h2>my page</h2>
		</div>
		<form action="./memberLogin.member" method="POST">
			<div class="xans-element- xans-myshop xans-myshop-asyncbenefit">
				<div class="infoWrap ">
					<div class="myInfo">
						<p>
							저희 TEATRO를 이용해 주셔서 감사합니다. <strong class="name">
							<%-- <spanclass="xans-member-var-name">${member.name}</span></strong> 님은 <strong
								class="group"> <span class="xans-member-var-group_name">${member.tone}</span>
								<span class="myshop_benefit_ship_free_message"></span>
							</strong> 톤 입니다. --%>
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
					<li><strong class="title">생일</strong> <strong class="data"><span
							id="xans_myshop_bankbook_order_price">${member.user_info.birth}</span></strong></li>
					<li class=""><strong class="title">이메일</strong> <strong
						class="data"><span id="xans_myshop_bankbook_coupon_cnt">${member.email}</span></strong>
					</li>
				</ul>
			</div>
		</form>

		<div class="xans-element- xans-myshop xans-myshop-orderstate ">
			<div class="title">
				<h3>
					나의 주문처리 현황 <span class="desc">(최근 <em>3개월</em> 기준)
					</span>
				</h3>
			</div>
			<div class="state">
				<ul class="order">
					<li><strong>입금전</strong> <span
						id="xans_myshop_orderstate_shppied_before_count">0</span></li>
					<li><strong>배송준비중</strong> <span
						id="xans_myshop_orderstate_shppied_standby_count">0</span></li>
					<li><strong>배송중</strong> <span
						id="xans_myshop_orderstate_shppied_begin_count">0</span></li>
					<li><strong>배송완료</strong> <span
						id="xans_myshop_orderstate_shppied_complate_count">0</span></li>
				</ul>
				<ul class="cs">
					<li><span class="icoDot"></span> <strong>취소 : </strong> <span
						id="xans_myshop_orderstate_order_cancel_count">0</span></li>
					<li><span class="icoDot"></span> <strong>교환 : </strong> <span
						id="xans_myshop_orderstate_order_exchange_count">0</span></li>
					<li><span class="icoDot"></span> <strong>반품 : </strong> <span
						id="xans_myshop_orderstate_order_return_count">0</span></li>
				</ul>
			</div>
		</div>

		<div id="myshopMain"
			class="xans-element- xans-myshop xans-myshop-main ">
			
			<%-- <div class="shopMain profile">
				<a href="${pageContext.request.contextPath}/member/memberView.jsp"><strong>modify</strong>회원이신 고객님의 개인정보를 관리하는 공간입니다.<br>개인정보를
					최신 정보로 유지하시면 보다 간편히 쇼핑을 즐기실 수 있습니다.</a>
			</div> --%>
			

			<div class="shopMain boardlist">
				<a href="${pageContext.request.contextPath}/member/memberBoard.member"><strong>my board</strong>고객님께서 작성하신 게시물을 관리하는 공간입니다.<br>고객님께서
					작성하신 글을 한눈에 관리하실 수 있습니다.</a>
			</div>
			
		</div>
	</div>

<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>