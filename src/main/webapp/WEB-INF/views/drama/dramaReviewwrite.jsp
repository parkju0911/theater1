<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/SE2/js/HuskyEZCreator.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
<script src="../resources/SE2/js/HuskyEZCreator.js"></script>
<link href="../resources/css/common/header.css" rel="stylesheet">
<!-- <link href="../resources/css/drama/smart_editor.css" rel="stylesheet"> -->
<!-- <link href="../resources/css/drama/dramaReviewwrite.css" rel="stylesheet"> -->
<link href="../resources/css/board/boardHeader.css" rel="stylesheet">
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
	/* border: 1px solid #ddd; */

}

td {
	height: 25px;
	text-align: center;
	padding: 10px;
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

#smart_editor2 .se2_text_tool .se2_multy .se2_photo { margin-right: 1px; display: none;}
</style>
</head>
<body>
	<!-- header -->
	<c:import url="../temp/header.jsp"></c:import>
	<!-- header end -->
	<div class="title_wrap" style="width: 980px; padding-top: 10px; padding-bottom: 6px; border-top: 1.5px solid #795548;font-family: 'Nanum Gothic', sans-serif;">
			<h6 id="h6_title" style="margin-right: 5px; margin-top: 8px;">
				<a href="${pageContext.request.contextPath}"><img alt=""
					src="../resources/images/common/homeImg.png" id="homeImg"></a> >
				<a href="${pageContext.request.contextPath}/drama/dramaReview">REVIEW</a>
				> <a href="${pageContext.request.contextPath}/drama/dramaReviewwrite">REVIEW WRITE</a>

			</h6>
		</div>
	<div class="board_wrap1" style="font-size: 12px;">
	<form id="frm" action="dramaReviewwrite" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td><select id="select_drama" style="width: 170px;height: 18px; border: wheat;border-bottom: 1px solid lightgray;"name="drama_num">
						<optgroup label="관람하신 연극을 선택해주세요."><option class="option_height">연극명</option>
						<c:forEach items="${list}" var="drama">
							<option class="option_height"  id="drama"  value="${drama.drama_num}" title="${drama.drama_num }">${drama.title }</option>
						</c:forEach>
							</optgroup>
					</select></td>
				<td style="margin-left: 10px; float: left;">제목 : <input type="text" name="title" placeholder="제목을 입력해주세요." class="write_ip"
				 style="width: 300px; border: none; border-bottom: 1px solid lightgray; border-radius:0px;"></td>
				<td style="float: right; margin-right: 50px; padding-bottom: 20px;">작성자 : <input type="text" value="${member.id}" class="write_ip" readonly="readonly"
				 style="width: 150px; border: none; border-bottom: 1px solid lightgray;background-color: #fffff8; border-radius:0px;"></td>
			</tr>	
			<tr>
				<td class="content" colspan="2" style="padding: 0;">
				<div id="select_1" style="width: 788px;height: auto;margin: 0 auto;">
					<input type="radio"  class="radio" value="5" name="star" checked="checked"  style="float:left;">
					<img alt="" src="../resources/images/starpoint/star_5.png" style="height: 20px; float: left;padding-left: 7px; padding-right: 26px;">
					<input type="radio"  class="radio" value="4" name="star"  style="float:left;">
					<img alt="" src="../resources/images/starpoint/star_4.png" style="height: 20px; float: left;padding-left: 7px; padding-right: 26px;">
					<input type="radio"  class="radio" value="3" name="star"  style="float:left;">
					<img alt="" src="../resources/images/starpoint/star_3.png" style="height: 20px; float: left;padding-left: 7px; padding-right: 26px;">
					<input type="radio"  class="radio" value="2" name="star"  style="float:left;">
					<img alt="" src="../resources/images/starpoint/star_2.png" style="height: 20px; float: left;padding-left: 7px; padding-right: 26px;">
					<input type="radio"  class="radio" value="1" name="star"  style="float:left;">
					<img alt="" src="../resources/images/starpoint/star_1.png" style="height: 20px; float: left;padding-left: 7px; padding-right: 26px;">
			</div>
			<tr>
				<td class="content" colspan="2" style="padding-bottom:0px;">
					<input type="file" name="files">
				</td>
			</tr>
			<tr>
				<td class="content" colspan="2">
					<textarea id="contents" name="contents" draggable="false">내용을 입력해주세요.</textarea>
				</td>
			</tr>
		</table>
		<div class="btn2" style="    width: 850px;height: 30px;margin: 0 auto;">
			<input type="button" id="savebutton" value="write" class="btn btn-default" style="padding: 5px 7px;border-radius: 4px;font-size: 13px;float: right; margin-right: 40px;">
			
			<a href="./dramaReview" class="btn btn-default" style="padding: 5px 7px;border-radius: 4px;font-size: 13px;float: left;font-family: 'Lucida Console',Monospace;">cancel</a>
			<!-- <input type="submit" id="savebutton" value="cancel" class="btn btn-default" style="padding: 5px 7px;border-radius: 4px;font-size: 13px;float: left;"> -->
		</div>
	</form>
		<!-- <button id="cancel"><a href="./dramaReview">취소</a></button>  -->
	</div>

	
	<!-- footer  -->
	<c:import url="../temp/footer.jsp"></c:import>
	<!-- footer end -->
</body>
</html>