<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
<head>
	<title>Home</title>
<link href="./resources/css/com
mon/header.css" rel="stylesheet">
</head>
<script type="text/javascript">
   var result = '${result}';
   if(result != ""){
      alert('${result}');
   }
</script>
<body>
<c:import url="./temp/header.jsp"></c:import>

<<<<<<< HEAD
<a href="drama/dramaList">Drama List</a>

=======
<a href="./notice/noticeList">Go Notice</a>
>>>>>>> chat2
<a href="./qna/qnaList">Go Qna</a>
<a href="./drama/chatform">chatting</a>


  

<c:import url="./temp/footer.jsp"></c:import>
</body>



</html>

