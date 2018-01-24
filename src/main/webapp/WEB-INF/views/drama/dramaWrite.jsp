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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="../resources/SE2/js/HuskyEZCreator.js"></script>

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
			$("#date-time").append('<p><select class="ampm" style="float: left; margin-top: 7px; margin-right: 30px; color: #b39f98; font-size: 8pt; border: none; border-bottom: 1px solid lightgray;" title="ampm'+i+'"><option>오전</option><option>오후</option></select> <select id="ampm'+i+'" title="ampm'+i+'" style="margin-top: 7px; margin-right: 30px; color: #b39f98; font-size: 8pt; border: none; border-bottom: 1px solid lightgray;"><c:forEach begin="1" end="12" var="i"><option>${i}</option></c:forEach></select></p>');
			i++;
		});
	});
</script>
<style type="text/css">
h1 {
	text-align: center;
}

table {
	margin: 0 auto;
	width: 1000px;
	/* border: 1px solid #ddd; */
	border-collapse: collapse;
}

td {
	height: 25px;
	text-align: center;
	padding: 10px;
	font-size: 10.5px;
	color: #50382f;    
	padding-top: 20px;
}

.write_ip {
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
	font-size: 13px;
	float: right;
    margin-right: 106px;
}

.fileSec {
	margin: 1% 24%;
}

#add {
	width: 135px;
}

#delete {
	width: 135px;
}
.#smart_editor2 .se2_input_wysiwyg{
	min-height: 400px;
}
:-ms-input-placeholder {
  color: red;
}
</style>
<link href="../resources/css/board/boardHeader.css" rel="stylesheet">
<link href="../resources/css/common/header.css" rel="stylesheet">

</head>
<body>
<c:import url="../temp/header.jsp"></c:import>



<div class="head_line">

</div>
<div class="title_wrap" style=" font-family: 'Nanum Gothic', sans-serif;">
	<c:if test="${board eq 'drama'}">

	<h6 id="h6_title" style="margin-top: 30px;"><a href="${pageContext.request.contextPath}"><img alt="" src="../resources/images/common/homeImg.png" id="homeImg"></a> > <a href="${pageContext.request.contextPath}/drama/dramaList">${fn:toUpperCase(board)}</a> > 
	<a href="${pageContext.request.contextPath}/${board}/${board}View.${board}?num=${view.drama_num}">${fn:toUpperCase(board)} WRITE</a></h6>
	</c:if>
	
	</div>
<div class="board_wrap1">
	<form action="${board}Write" method="post" id="frm" enctype="multipart/form-data">
		<table>
			<tr>
				<td style="margin-left: 10px; float: left;">제목 : 
				<input type="text" name="title" placeholder="제목을 입력해주세요." class="write_ip"
				 style="width: 500px; border: none; border-bottom: 1px solid lightgray; border-radius:0px;">
				 </td>
				<td style="float: right; margin-right: 50px; padding-bottom: 20px;">작성자 : 
				<input type="text" value="${member.id}" placeholder="글쓴이를 입력해주세요." class="write_ip" readonly="readonly"
				 style="width: 150px; border: none; background-color: #fffff8;border-bottom: 1px solid lightgray; border-radius:0px;">
				 </td>
				 <td style="margin-left: 10px; float: left;">공연장소 : 
				<input type="text" id="place" name="place" placeholder="ex)대학로 틴틴홀" class="write_ip"
				 style="width: 500px; border: none; border-bottom: 1px solid lightgray; border-radius:0px;">
				 </td>
				 <td style="margin-left: 10px; float: left;">상세장소 : 
				<input type="text" id="address" name="address" placeholder="건물명 포함하여 상세주소를 적어주세요" class="write_ip"
				 style="width: 500px; border: none; border-bottom: 1px solid lightgray; border-radius:0px;">
				 </td>
				 <td style="margin-left: 10px; float: left;">가격 : 
				<input type="text" id="price" name="price" placeholder="ex)5000" class="write_ip"
				 style="width: 500px; border: none; border-bottom: 1px solid lightgray; border-radius:0px;">
				 </td>
				 <td style="margin-left: 10px; float: left;">작품에 대한 간략한 설명 : 
				<input type="text" id="simple" name="simple" placeholder="ex)7년연속 예매율 1위!! 대국민 추천연극" class="write_ip"
				 style="width: 500px; border: none; border-bottom: 1px solid lightgray; border-radius:0px;">
				 </td>
			</tr>
			<tr>
				<td class="content" colspan="2">
					<textarea id="contents" name="contents" draggable="false">내용을 입력해주세요.</textarea>
				</td>
			</tr>
		</table>		
		
		<div style="margin-left: 80px;">
		<div class="row">
				<div class="col-25">
				<table>
				<tr>
				<td style="float: left;
    margin-left: -30px;
    margin-bottom: 10px;">공연 시간:</td>
				</tr>
				</table>
					
				</div>
				<div class="col-75">
					<input type="date" name="startDate" class="write_ip" style="border: none;
    border-bottom: 1px solid lightgray;
    border-radius: 0px;
    color: #c09f98;
    font-size: 8pt;
    width: 150px;"> ~ <input type="date" name="lastDate" class="write_ip" style="border: none;
    border-bottom: 1px solid lightgray;
    border-radius: 0px;
    color: #c09f98;
    font-size: 8pt;
    width: 150px;">
					<div id="date-time" style="    margin-top: 10px;">
						<select class="ampm" title="ampm0" style="float: left;
    margin-top: 7px;
    margin-right: 30px;
    color: #b39f98;
    font-size: 8pt;
    border: none;
    border-bottom: 1px solid lightgray;">
							<option>오전</option>
							<option>오후</option>
						</select>
						<select id="ampm0"title="ampm0" style="
    margin-top: 7px;
    margin-right: 30px;
    color: #b39f98;
    font-size: 8pt;
    border: none;
    border-bottom: 1px solid lightgray;">
							<c:forEach begin="1" end="12" var="i">
								<option>${i}</option>
							</c:forEach>
						</select>
						<input id="timeAdd" type="button" value="시간 추가" class="btn btn-default">
					</div>
				</div>
			</div>
			
			<div class="row" style="    margin-bottom: 10px;">
				<div class="col-25">
					<table>
				<tr>
				<td style="float: left;
    margin-left: -30px;
    margin-bottom: 10px;">대표 사진:</td>
				</tr>
				</table>
				</div>
				<div id="filebox" class="col-75">
					<input class="btn btn-default" type="button" value="File Add" id="fileAdd" class="btn btn-default">
				</div>
			</div>
			</div>


			<div class="row">
				<input id="write" type="submit" value="Submit" class="btn btn-default">
			</div>
			<input type="hidden" id="time" name="time">
			
		
	</form>
	</div>

<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>