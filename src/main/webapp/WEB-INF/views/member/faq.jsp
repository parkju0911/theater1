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
<body>
<c:import url="../temp/header.jsp"></c:import>




<div class="xans-element- xans-myshop xans-myshop-orderhistorytab tabL clear "><a href="/myshop/order/list.html?history_start_date=2017-10-11&amp;history_end_date=2018-01-09" class="selected">주문내역조회 (1)<span class="tabTail" style="display: inline;"></span></a>
<a href="/myshop/order/list.html?mode=cs&amp;history_start_date=2017-10-11&amp;history_end_date=2018-01-09" class="">취소/반품/교환 내역 (0)<span class="tabTail" style="display: none;"></span></a>
<a href="/myshop/order/list_old.html?mode=old&amp;history_start_date=2017-10-11&amp;history_end_date=2018-01-09" class=" displaynone">이전 주문내역 (0)<span class="tabTail" style="display: none;"></span></a>
</div>





<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>