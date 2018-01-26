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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
<script src="../resources/SE2/js/HuskyEZCreator.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="../resources/css/common/header.css" rel="stylesheet">
<link href="../resources/css/board/boardHeader.css" rel="stylesheet">
<link href="../resources/css/drama/dramaWrite.css" rel="stylesheet">
<script type="text/javascript">
	$(function() {
		$(".selectDate").datepicker({
			 dateFormat:"yy-mm-dd",
			 minDate:0
		 });
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
		$("#write").click(function() {
			//id가 smarteditor인 textarea에 에디터에서 대입
			editor_object.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
			// 이부분에 에디터 validation 검증
			
			var arr = [];
			$(".ampm").each(function(){
				var ampm = $(this).attr("title");
				if($(this).attr("title")==$("#"+ampm).attr("title")){
					arr.push($(this).val()+$("#"+ampm).val()+'시');
				}
			});
			
			$("#time").val(arr);
			//폼 submit
			$("#frm").submit();
		});

		//SmartEditor end
		
		//CKEDITOR.replace( 'contents' );
		
		var count = 0;
		var index = 0;
		$("#fileAdd").click(function() {
			count++;
			index++;
			if(index <= 1) {
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
				alert("파일은 1개만 등록 가능합니다.");
				index = 5;
			}
		});
		
		var i=1;
		$("#timeAdd").click(function(){
			$("#date-time").append('<p><select class="ampm" title="ampm'+i+'"><option>오전</option><option>오후</option></select> <select class="ampm_" id="ampm'+i+'" title="ampm'+i+'"><c:forEach begin="1" end="12" var="i"><option>${i}</option></c:forEach></select></p>');
			i++;
		});
	});
</script>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
<div class="head_line">

</div>
<div class="board_wrap">
	<div class="title_wrap" style=" font-family: 'Nanum Gothic', sans-serif;">
			<h6 id="h6_title" style="margin-top: 30px;"><a href="${pageContext.request.contextPath}"><img alt="" src="../resources/images/common/homeImg.png" id="homeImg"></a> > <a href="${pageContext.request.contextPath}/drama/dramaList">${fn:toUpperCase(board)}</a> > 
			<a href="${pageContext.request.contextPath}/${board}/${board}View.${board}?num=${view.drama_num}">${fn:toUpperCase(board)} WRITE</a></h6>
	</div>
	<form action="${board}Write" method="post" id="frm" enctype="multipart/form-data">
		<table>
			<tr>
				<td>제&nbsp;&nbsp;&nbsp;목</td>
				<td><input type="text" name="title" placeholder="제목을 입력해주세요." class="write_ip" required="required"></td>
				<td><input id="writer" type="text" value="${member.id}" placeholder="글쓴이를 입력해주세요." readonly="readonly"></td>
			</tr>
			<tr>
				<td>공연장소</td>
				<td colspan="2"><input type="text" id="place" name="place" placeholder="ex)대학로 틴틴홀" class="write_ip" required="required"></td>
			</tr>
			<tr>
				<td>상세주소</td>
				<td colspan="2"><input type="text" id="address" name="address" placeholder="건물명 포함하여 상세주소를 적어주세요" class="write_ip" required="required"></td>
			</tr>
			<tr>
				<td>가&nbsp;&nbsp;&nbsp;격</td>
				<td><input type="number" id="price" name="price" placeholder="ex)5000" class="write_ip" required="required"></td>
			</tr>
			<tr>
				<td>간단한소개</td>
				<td><input type="text" id="simple" name="simple" placeholder="ex)7년연속 예매율 1위!! 대국민 추천연극" class="write_ip" required="required"></td>
			</tr>
			<tr>
				<td class="content" colspan="3">
					<textarea id="contents" name="contents" draggable="false" required="required">내용을 입력해주세요.</textarea>
				</td>
			</tr>
			<tr>
				<td>공연시간</td>
				<td colspan="2"><input class="selectDate" name="startDate" required="required"> ~ <input class="selectDate" name="lastDate" required="required"></td>
			</tr>
			<tr>
					<td id="date-time" colspan="3">
						<select class="ampm" title="ampm0">
							<option>오전</option>
							<option>오후</option>
						</select>
						<select class="ampm_" id="ampm0"title="ampm0">
							<c:forEach begin="1" end="12" var="i">
								<option>${i}</option>
							</c:forEach>
						</select>
						<input id="timeAdd" type="button" value="시간 추가" class="btn btn-default">
					</td>
			</tr>
			<tr>
				<td>대표사진</td>
				<td id="filebox" colspan="2"><input type="button" value="File Add" id="fileAdd" class="btn btn-default"></td>
			</tr>
		</table>		
		
		<div class="submit">
			<button id="write" class="btn btn-default">Submit</button>
		</div>
		<input type="hidden" id="time" name="time">
			
		
	</form>
	</div>

<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>