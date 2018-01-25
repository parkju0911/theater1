<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- header 시작 -->
<header>
	<div class="header_wrap">
		<div class="header_logo">
			<div>
				<%-- <a href="${pageContext.request.contextPath}/view/home.jsp"> --%>
				<a href="${pageContext.request.contextPath}"> <img
					id="main_logo" alt=""
					src="${pageContext.request.contextPath}/resources/images/common/mainLogo7.png"></a>
			</div>
		</div>
		<div class="mem_wrap">
			<c:if test="${member eq null}">
				<li class="n_member_wrap">
					<a href="${pageContext.request.contextPath}/member/memberLogin">Login</a>
					<a href="${pageContext.request.contextPath}/member/memberJoin">Join</a>
				</li>
			</c:if>
			<c:if test="${member ne null}">
				<c:if test="${member.id eq 'admin'}">
					<li class="member_wrap"><a>관리자</a> <a
						href="${pageContext.request.contextPath}/member/memberLogout">Logout</a>
					</li>
				</c:if>
				<c:if test="${member.id ne 'admin'}">
						<p id="welcome" style="font-family: 'Nanum Gothic'; font-size: 8pt; color: #795548; font-weight: 600;">
							${member.id}님, 환영합니다 :)
						</p>
					<li class="member_wrap">
						<a href="${pageContext.request.contextPath}/member/memberLogout">Logout</a>
						<a href="${pageContext.request.contextPath}/member/orderlist">MYTicket</a>
						<a href="${pageContext.request.contextPath}/member/memberMypage">MYPage</a>
					</li>
				</c:if>
			</c:if>
		</div>
		<form name="frm" action="${pageContext.request.contextPath}/drama/dramaList" method="get">
						<input type="hidden" name="curPage" value="1">
						<input type="hidden" name="kind" value="title">
			<div class="search_bar">
		
			 <!-- <input type="text" class="form-control" id="usr"> -->
			<input id="s_bar" name="search" type="text" placeholder="연극 검색">
			<button>검색</button>
						<!-- <div class="search_wrap">
							<div class="search__container">
								<input class="search__input" type="text" placeholder="Search"  name="search">
							</div>
						</div>
					</form> -->
		
		</div>
		</form>
		<!-- 메인메뉴 -->
		<div class="main_menu">
			<nav style="margin-top: -31px;">
				<ul>
					<li><a href="${pageContext.request.contextPath}/drama/dramaList">연극예매</a><span style="padding: 0 8px;">|</span></li>
					<li><a href="${pageContext.request.contextPath}/drama/rankList">예매순위</a><span style="padding: 0 8px;">|</span></li>
					<li><a href="${pageContext.request.contextPath}/event/eventList">이벤트</a><span style="padding: 0 8px;">|</span></li>
					<li><a href="${pageContext.request.contextPath}/drama/dramaReview">공연리뷰</a><span style="padding: 0 8px;">|</span></li>
					<li><a href="${pageContext.request.contextPath}/member/faq">문의사항</a><span style="padding: 0 8px;">|</span></li>
					<li><a href="${pageContext.request.contextPath}/notice/noticeList">공지사항</a></li>
				</ul>
			</nav>
		</div>
	</div>
</header>
<!-- <div id="blank"></div> -->
<!-- ddd  -->
<!-- header 끝 -->
<!-- member -->