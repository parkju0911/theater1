<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../resources/css/common/header.css" rel="stylesheet">
<title>Insert title here</title>
<script src="https://cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="../resources/SE2/js/HuskyEZCreator.js"></script>
<script type="text/javascript">
	$(function() {
		var index =${view.ar.size()};;
		var count = 0;
			//delete
			$(".del").click(function() {
				var fnum = $(this).attr("title");
				$.post("../util/fileDelete",{fnum:fnum},function(data){
				alert(data.trim());
				
					$("#del"+fnum).remove();
						index--;
				
				});
				
				
			})
		
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
								alert("더이상 추가할수없습니다(최대 5개)");
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
	<h1>Write Form</h1>

	<form id="frm" action="dramaReviewupdate" method="post" >
		<input type="hidden" name="review_num" value="${dto.review_num }">
		<table>
			<tr>
				<td>제목<input type="text" name="title" placeholder="${dto.title}"></td>
				<td>작성자<input type="text" name="writer" placeholder="${member.id}"  readonly="readonly"></td>

			</tr>
			<tr>
				<td class="content" colspan="2">
				<textarea id="contents" name="contents">${view.contents }</textarea></td>
			</tr>
					
			<c:forEach items="${view.ar}" var="file">
			
				<tr id="del${file.fnum}">
					<td class="content" colspan="2">${file.oriname}<input type="button" title="${file.fnum}" value="X" class="del"></td>
				</tr>
				
			
			</c:forEach>
		
		
		</table>
	<table>
		<td><input type="button" value="File Add" id="add">
		<div id="files"></div></td>


		<td><input type="button" id="savebutton" value="Write"></td>
		</table>
	<!-- footer  -->
	<c:import url="../temp/footer.jsp"></c:import>
	<!-- footer end -->

	</form>
</body>
</html>