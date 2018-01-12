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
</head>
<link href="../resources/css/common/header.css" rel="stylesheet">
<link href="../resources/css/board/boardHeader.css" rel="stylesheet">
</head>
<style type="text/css">
* {
   list-style: none;
   text-decoration: none;
}
.orderListArea{
	height: auto;
    width: 1000px;
    margin: 0 auto;
    padding-top: 5px;
}

.orderListArea .title {
    position: relative;
    height: 38px;
    margin: 0;
    padding: 0 0 0 0;
    border-bottom: 0;
    line-height: 38px;
    width: 1000px;
}

}
.orderListArea .title {
    position: relative;
    height: 38px;
    margin: 0;
    padding: 0 0 0 0;
    border-bottom: 0;
    line-height: 38px;
}
.title h3 {
    display: inline-block;
    vertical-align: middle;
    color: #353535;
    font-size: 12px;
}
.orderListArea .title + .ec-base-table table {
    margin: 0;
}
.ec-base-table.typeList table {
    border-top-color: #e7e7e7;
    border-left: 0;
    border-right: 0;
}

.ec-base-table table {
    position: relative;
    margin: 10px 0 0;
    border: 1px solid #e7e7e7;
    border-top-color: #fff;
    color: #fff;
    font-size: 11px;
    line-height: 1.5;
}
table {
    width: 100%;
    border: 0;
    border-spacing: 0;
    border-collapse: collapse;
}

caption {
    display: none;
}

.ec-base-table th:first-child {
    border-left: 0;
}
.ec-base-table thead th {
    padding: 12px 0 11px;
    border-bottom: 1px solid #e7e7e7;
    color: #5d4137;
    vertical-align: middle;
    text-align: center;
    font-weight: bold;
}
th, td {
    border: 0;
    vertical-align: top;
}
.ec-base-table .right {
    text-align: right;
}
.ec-base-table.typeList tfoot td {
    padding: 11px 12px 12px;
    background: #fbfbfb;
}
.ec-base-table.typeList td {
    padding: 13px 10px 12px;
}
.ec-base-table td {
    padding: 11px 10px 10px;
    border-top: 1px solid #e7e7e7;
    color: #353535;
    vertical-align: middle;    
    text-align: center;
}
}
.xans-order-form .ec-base-table tfoot td .gLeft {
    float: left;
    margin: 6px 0 0;
}

.txtInfo {
    color: #707070;
}

.title_wrap{
    border-top: 2px solid #5d4137;
    padding-top: 8px;
}

</style>
<body>
<c:import url="../temp/header.jsp"></c:import>
     <div class="orderListArea">
     <div class="title_wrap" style="width: 1000px;font-family: 'Nanum Gothic', sans-serif;">
		<h6 id="h6_title" style="margin-right: 5px; margin-top: 8px;">
		<a href="${pageContext.request.contextPath}"><img alt="" src="../resources/images/common/homeImg.png" id="homeImg"></a> > 
		<a href="${pageContext.request.contextPath}/member/memberMypage">MYPAGE</a>
		 > <a href="${pageContext.request.contextPath}/member/orderlist">ORDER LIST</a></h6>
		</div> 
		<h2 style="margin-top: 20px; font: 40px/41px 'fMdBT'; padding-bottom: 20px;">ORDER LIST</h2>

					<!-- 기본배송 -->
					<div class="ec-base-table typeList ">
						<table border="1" summary="">
							<caption>기본배송</caption>
							<colgroup>

								<col style="width: auto">

							</colgroup>

							<thead>
								<tr>
									<th scope="col">주문날짜</th>
									<th scope="col">티켓정보</th>
									<th scope="col">관람자</th>
									<th scope="col">관람일시</th>
									<th scope="col">티켓가격</th>
									<th scope="col">수량</th>
									<th scope="col">적립금</th>
									<th scope="col">합계</th>
									<th scope="col">구매상태</th>
								</tr>
							</thead>
							<%-- <tfoot class="right">
								<tr>

									<td style="text-align: right;" colspan="8">상품구매금액 <strong>
										<fmt:formatNumber value="${Math.floor(공연가격)}" type="number" />0
										</strong><span class="displaynone">x ${티켓수량}0
										 = 합계 : <strong class="txtEm gIndent10">
										 <span id="domestic_ship_fee_sum" class="txt18"> 
										 <fmt:formatNumber value="${Math.floor(공연가격 *티켓수량)}" type="number" /></span>원</strong> 
										 <span class="displaynone"></span>
									 </td>
								</tr>
							</tfoot> --%>
							<tbody
								class="xans-element- xans-order xans-order-normallist center">
								<tr class="xans-record-">

									<td>0000.00.00</td>
									<td>
										<a href="#"><img src="../resources/images/drama_1.jpg" alt="" class="buyImage " style="width: auto; height: 200px; padding-bottom: 8px;">
										<p>---공연정보---</p></a>
									</td>
									<td>--userName--
									<p>--userPhoneNum--</p></td>
									<td>2018.01.09
									<p>15:30</p></td>
									<td>
										<div class="">
											<strong>
												<%-- <fmt:formatNumber value="${Math.floor( 공연가격 )}" type="number" /> --%> 0,000원</strong>
										</div>

									</td>
									<td>1</td>
									<td><span class="txtInfo">+ 00p</span></td>
									<td><strong>
											0,000<%-- <fmt:formatNumber value="${Math.floor( 공연가격 *티켓수량 )}" type="number" /> --%>
											원</strong></td>
									<td>--입금 전--<br>--입금 완료--<br>
									<input style="width: 61px; height: 22px; margin-top: 6px; font-size: 11px; padding: 0;" class="btn btn-default" type="button" value="환불 신청"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>