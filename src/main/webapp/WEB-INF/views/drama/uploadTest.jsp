<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
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
		$("#write").click(
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
		
		var count = 0;
		var index = 0;
		$("#fileAdd").click(function() {
			count++;
			index++;
			if(index <= 5) {
				var box = document.createElement("DIV");
				
				var span = document.createElement("SPAN");
				span.setAttribute("class", "delete");
				span.onclick = function () {
				    this.parentElement.remove();
				    index--;
				};
				var x = document.createTextNode("X");
				span.appendChild(x);
				
				var file = document.createElement("INPUT");
			    file.setAttribute("type", "file");
			    file.setAttribute("name", "files");
			    //file.setAttribute("name", "file"+count);
			    box.append(file);
			    box.append(span);
			    
			    $("#filebox").append(box);
			} else {
				alert("5개까지만 추가할 수 있습니다.");
				index = 5;
			}
		});
		
	});


</script>
<style type="text/css">
	.delete {
		cursor: pointer;
	}

	* {
    	box-sizing: border-box;
	}
	
	input[type=text], select, textarea{
	    width: 100%;
	    padding: 12px;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    box-sizing: border-box;
	    resize: vertical;
	}
	
	label {
	    padding: 12px 12px 12px 0;
	    display: inline-block;
	}
	
	input[type=submit] {
	    background-color: #333;
	    border: 1px solid #333;
	    color: white;
	    padding: 12px 20px;
	    border: none;
	    border-radius: 4px;
	    cursor: pointer;
	    float: right;
	}
	
	input[type=submit]:hover {
	    background-color: #fff;
	    color: black;
	}
	
	.contents {
		width: 100%;
	}
	
	.container {
		width: 1200px;
	    margin: auto;
	    border-radius: 5px;
	    padding: 20px;
	}
	
	.col-25 {
	    float: left;
	    width: 25%;
	    margin-top: 6px;
	}
	
	.col-75 {
	    float: left;
	    width: 75%;
	    margin-top: 6px;
	}
	
	/* Clear floats after the columns */
	.row:after {
	    content: "";
	    display: table;
	    clear: both;
	}
	
	/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
	@media (max-width: 600px) {
	    .col-25, .col-75, input[type=submit] {
	        width: 100%;
	        margin-top: 0;
	    }
	}
</style>
</head>
<body>
	<div class="container">
		<h1>uploadTest</h1>
		<form id="frm" action="uploadTest" method="POST" enctype="multipart/form-data">
			
			<div class="row">
				<div class="col-25">
					<label for="file">파일</label>
				</div>
				<div id="filebox" class="col-75">
					<input type="button" value="File Add" id="fileAdd">
				</div>
			</div>


			<div class="row">
				<input id="write" type="submit" value="Submit">
			</div>
		</form>
	</div>

</body>
</html>