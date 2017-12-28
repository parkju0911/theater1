<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
<link href="../resources/css/point/pointCheck.css" rel="stylesheet">

<script type="text/javascript">
	$(function() {
		var n = 0;
		
		$("#checkBtn").click(function() {
			
			var c = document.getElementsByClassName("attendOff");
			var p=document.getElementsByClassName("attendPointOff");
			var message = "출석체크";
		
		
			if(c[n]!=p[n]){
				c[n].src = "../resources/images/point/attendOn.png";
				alert(message);
				n++;
			}else {
				p[n].src = "../resources/images/point/attendPoint.png";
				
			}
		
			
		});
		
		
	});
</script>



</head>
<body>

	<h1>출석체크</h1>
<%-- <form name="frm" action="./${point}List" method="post">
</form> --%>
	<button id="checkBtn">출석하기</button>

 

	<table border="1">
		<tr>
			<td><img class="attendOff" alt="출석체크 아이콘"
				src="../resources/images/point/attendOff.png"></td>
			<td><img class="attendOff" alt="출석체크 아이콘"
				src="../resources/images/point/attendOff.png"></td>
			<td><img class="attendOff" alt="출석체크 아이콘"
				src="../resources/images/point/attendOff.png"></td>
			<td><img  class="attendOff"alt="출석체크 아이콘"
				src="../resources/images/point/attendOff.png"></td>
			<td><img class="attendPointOff" alt="출석체크 아이콘"
				src="../resources/images/point/attendPointOff.png"></td>


		</tr>
		<tr>
			<td><img class="attendOff" alt="출석체크 아이콘"
				src="../resources/images/point/attendOff.png"></td>
			<td><img  class="attendOff"alt="출석체크 아이콘"
				src="../resources/images/point/attendOff.png"></td>
			<td><img  class="attendOff" alt="출석체크 아이콘"
				src="../resources/images/point/attendOff.png"></td>
			<td><img class="attendOff" alt="출석체크 아이콘"
				src="../resources/images/point/attendOff.png"></td>
			<td><img class="attendPointOff" alt="출석체크 아이콘"
				src="../resources/images/point/attendPointOff.png"></td>


		</tr>
		<tr>
			<td><img class="attendOff" alt="출석체크 아이콘"
				src="../resources/images/point/attendOff.png"></td>
			<td><img class="attendOff" alt="출석체크 아이콘"
				src="../resources/images/point/attendOff.png"></td>
			<td><img class="attendOff" alt="출석체크 아이콘"
				src="../resources/images/point/attendOff.png"></td>
			<td><img class="attendOff" alt="출석체크 아이콘"
				src="../resources/images/point/attendOff.png"></td>
			<td><img class="attendPointOff" alt="출석체크 아이콘"
				src="../resources/images/point/attendPointOff.png"></td>


		</tr>
		<tr>
			<td><img class="attendOff" alt="출석체크 아이콘"
				src="../resources/images/point/attendOff.png"></td>
			<td><img class="attendOff"  alt="출석체크 아이콘"
				src="../resources/images/point/attendOff.png"></td>
			<td><img class="attendOff" alt="출석체크 아이콘"
				src="../resources/images/point/attendOff.png"></td>
			<td><img class="attendOff" alt="출석체크 아이콘"
				src="../resources/images/point/attendOff.png"></td>
			<td><img class="attendPointOff" alt="출석체크 아이콘"
				src="../resources/images/point/attendPointOff.png"></td>


		</tr>


	</table>


</body>
</html>