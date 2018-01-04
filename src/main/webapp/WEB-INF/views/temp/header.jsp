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
					src="${pageContext.request.contextPath}/resources/images/common/teatro_logo4.png"></a>
			</div>
		</div>
		<div class="member_wrap">
			<c:if test="${member eq null}">
				<li>
					<a href="${pageContext.request.contextPath}/member/memberLogin">Login</a>
					<a href="${pageContext.request.contextPath}/member/memberJoin">Join</a>
				</li>
			</c:if>
			<c:if test="${member ne null}">
				<c:if test="${member.id eq 'admin'}">
					<li><a>관리자</a> <a
						href="${pageContext.request.contextPath}/member/memberLogout">Logout</a>
					</li>
				</c:if>
				<c:if test="${member.id ne 'admin'}">
					<li>
						<p style="font-family: 'Nanum Gothic'; font-size: 8pt; color: #795548; font-weight: 600;">
							${member.id}님, 환영합니다 :)
						</p>
						<a href="${pageContext.request.contextPath}/member/memberLogout">Logout</a>
						<a href="${pageContext.request.contextPath}/member/memberMyticket">MYTicket</a>
						<a href="${pageContext.request.contextPath}/member/memberMypage">MYPage</a>
					</li>
				</c:if>
			</c:if>
		</div>
		<div class="search_bar">
			<input type="text" placeholder="연극 검색">
			<button>검색</button>
		</div>
		<!-- 메인메뉴 -->
		<div class="main_menu">
			<nav>
				<ul>
					<li><a href="#">연극예매</a><span style="padding: 0 8px;">|</span></li>
					<li><a href="#">예매순위</a><span style="padding: 0 8px;">|</span></li>
					<li><a href="#">이벤트</a><span style="padding: 0 8px;">|</span></li>
					<li><a href="./dramaReview">공연리뷰</a><span style="padding: 0 8px;">|</span></li>
					<li><a href="${pageContext.request.contextPath}/notice/noticeList">공지사항</a></li>
				</ul>
			</nav>
		</div>
	</div>
</header>
<div id="blank"></div>
<!-- ddd  -->
<!-- header 끝 -->
<!-- member -->