<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../resources/css/common/header.css" rel="stylesheet">
<link href="../resources/css/drama/dramaReviewwrite.css" rel="stylesheet">
<title>Insert title here</title>
<script src="https://cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="../resources/SE2/js/HuskyEZCreator.js"></script>
<script type="text/javascript">
	$(function() {
		//SmartEditor start 
		var editor_object = [];

		nhn.husky.EZCreator.createInIFrame({
			oAppRef : editor_object,
			//textarea ID
			elPlaceHolder : "contents",
			/* 주소 바꿀껏  */
			sSkinURI : "../resources/SE2/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,
			}
		});

		//전송버튼 클릭이벤트
		$("#savebutton").click(
				function() {
					//id가 smarteditor인 textarea에 에디터에서 대입
					editor_object.getById["contents"].exec(
							"UPDATE_CONTENTS_FIELD", []);

					// 이부분에 에디터 validation 검증

					//폼 submit
					$("#frm").submit();
				})

		//SmartEditor end
		//CKEDITOR.replace( 'contents' );
		var index = 0;
		var count = 0;
		$("#add")
				.click(
						function() {
							if (index < 5) {
								var s = '<div id="d'+count+'">';
								s = s
										+ '<input type="file" name="f1"><span class="del" title="d'+count+'">X</span></div>';
								$("#files").append(s);
								count++;
								index++;
							} else {
								alert("Fail");
							}
						});

		$("#files").on("click", ".del", function() {
			var id = $(this).attr("title");
			$("#" + id).remove();
			index--;
		});

	});
</script>


<style type="text/css">
h1 {
	text-align: center;
}

table {
	margin: 0 auto;
	width: 80%;
	border: 1px solid #ddd;
	border-collapse: collapse;
}

td {
	height: 25px;
	text-align: center;
	padding: 10px;
}

input {
	padding: 3px;
	width: 200px;
	border-radius: 4px;
	border: 1px solid #ddd;
}

.content textarea {
	height: 100px;
	width: 95%;
	border: 1px solid #ddd;
	border-radius: 4px;
	color: gray;
}

.btn {
	padding: 5px 7px;
	border-radius: 4px;
	font-size: 17px;
}


</style>
</head>
<body>
	<!-- header -->
	<c:import url="../temp/header.jsp"></c:import>
	<!-- header end -->
	<h1>Review Write </h1>

	<form id="frm" action="dramaReviewwrite" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td><input type="text" name="title" placeholder="제목을 입력해주세요."></td>
				<td>작성자<input type="text" name="id" placeholder="${member.id }" value="${member.id}"></td>

			</tr>
			<tr>
				<td class="content" colspan="2">
				<textarea id="contents"name="contents">
				<div style="width: 800px; height: 20px;">내용을 입력해주세요.
				</div>
					
				
				<ul class="select_form" style="width: 200px; height: 200px;float: left;">
				------------평가------------
					<li  style="list-style: none; margin-top: 10px;"><img alt="" src="../images/starpoint/star_5.png" style="height: 20px"><input type="radio"  class="radio" value="5" name="star" checked="checked"></li>
					<li  style="list-style: none"><img alt="" src="../images/starpoint/star_4.png" style="height: 20px"><input type="radio"  class="radio" value="4" name="star"></li>
					<li  style="list-style: none"><img alt="" src="../images/starpoint/star_3.png" style="height: 20px"><input type="radio"  class="radio" value="3" name="star"></li>
					<li  style="list-style: none"><img alt="" src="../images/starpoint/star_2.png" style="height: 20px"><input type="radio"  class="radio" value="2" name="star"></li>
					<li  style="list-style: none"><img alt="" src="../images/starpoint/star_1.png" style="height: 20px"><input type="radio"  class="radio" value="1" name="stat"></li>
					</ul>
				
				</textarea>
		<!-- 			<div id="star_form">
				<ul class="choice-rating">
		<li><label for="rating5"><span class="rating"><span style="width:100%;height: 50px;">별5</span></span>
			<input type="radio" name="star_pt" value="5" class="radio" id="rating5" style="width: 50px;"></label></li>
		<li><label for="rating4"><span class="rating"><span style="width:80%;height: 50px;">별4</span></span></label>
			<input type="radio" name="star_pt" value="4" class="radio" id="rating4" style="width: 50px;"></li>
		<li><label for="rating3"><span class="rating"><span style="width:60%;height: 50px;">별3</span></span></label>
			<input type="radio" name="star_pt" value="3" class="radio" id="rating3" style="width: 50px;"></li>
		<li><label for="rating2"><span class="rating"><span style="width:40%;height: 50px;">별2</span></span></label>
			<input type="radio" name="star_pt" value="2" class="radio" id="rating2" style="width: 50px;"></li>
		<li><label for="rating1"><span class="rating"><span style="width:20%;height: 50px;">별1</span></span></label>
			<input type="radio" name="star_pt" value="1" class="radio" id="rating1" style="width: 50px;"></li>
		</ul>	
		
		</div>
				 -->
				
				</td>
			</tr>
		</table>
		
	
		<button id="write">작성하기</button>
	</form>
		<button id="cancel"><a href="./dramaReview">취소</a></button>
	
	<!-- footer  -->
	<c:import url="../temp/footer.jsp"></c:import>
	<!-- footer end -->
</body>
</html>