<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String id = "";
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	}

	String nick = "";
	if (session.getAttribute("nick") != null) {
		nick = (String) session.getAttribute("nick");
	} else {
		nick = "상대방";
	}
%>
<link href="../resources/css/drama/chatform.css" rel="stylesheet">

<link href="../resources/css/common/header.css" rel="stylesheet">
<script src="/socket.io/socket.io.js"></script>

<html>
<head>
	<title>Home</title>

</head>

<body>




  <!-- onkeydown을 통해서 엔터키로도 입력되도록 설정. -->
	<div>
		<div id="graybox"
			style="border-top-left-radius: 8px; border-top-right-radius: 8px; background-color: #c3c1c1; width: 350px; padding: 5px 3px; font-size: 9pt; text-align: center;">
			Teatro 실시간 채팅
			<p
				style="float: right; background-color: gray; border-top-right-radius: 8px; width: 22px; height: 23px; margin-top: -4px; margin-right: -3px; text-align: center; font-size: 14px;">x</p>
		</div>
		<!-- <div id="mmm" style="    background-color: #b8a296; width: 350px;padding: 20px 3px;text-align: center;font-family: initial;">Teatro 실시간 채팅</div> -->
		<div id="messageWindow2"
			style="padding: 20px 3px; height: 20em; overflow: auto; width: 350px; background-color: #774e3f85;"></div>
		<div
			style="background-color: #b8a296; width: 356px; border-bottom-left-radius: 8px; border-bottom-right-radius: 8px;">
			<input id="inputMessage" type="text" placeholder="  메세지를 입력해주세요..."
				onkeydown="if(event.keyCode==13){send();}"
				style="border-radius: 5px; border-style: none; color: #bbbbbb; width: 295px; margin: 13px 4px; height: 22px; font-size: 9pt;" />

			<input type="submit" value="" onclick="send();"
				style="background-image: url(https://cdn.channel.io/plugin/images/send-disabled.png); height: 26px; background-color: #fff0; border: #4c3f3f00; width: 24px; background-position: 50%; background-repeat: no-repeat; background-size: 35px 38px; margin: 6px; padding: 8px;" />
		</div>

	</div>
	</div>


</body>
<script type="text/javascript">
	
	//웹소켓 설정
	var webSocket = new WebSocket('ws://192.168.20.48:80/project/echo-ws');
	//var webSocket = new WebSocket('ws://localhost:8080/프로젝트명/broadcasting');
	var inputMessage = document.getElementById('inputMessage');
	//같은 이가 여러번 보낼때 이름 판별할 변수
	var re_send = "";

	webSocket.onerror = function(event) {
		onError(event)
	};
	webSocket.onopen = function(event) {
		onOpen(event)
	};
	webSocket.onmessage = function(event) {
		onMessage(event)
	};

	//	OnClose는 웹 소켓이 끊겼을 때 동작하는 함수.
	function onClose(event){
		var div=document.createElement('div');
		
		//접속했을 때 접속자들에게 알릴 내용.
		webSocket.send("<%=nick%> is DisConnected\n");
	}

	//	OnMessage는 클라이언트에서 서버 측으로 메시지를 보내면 호출되는 함수.
	function onMessage(event) {

		//클라이언트에서 날아온 메시지를 |\| 단위로 분리한다
		var message = event.data.split("|\|");
		
			//금방 보낸 이를 re_send에 저장하고,
			//금방 보낸 이가 다시 보낼경우 보낸이 출력 없도록 함.
			if(message[0] != re_send){
				//messageWindow2에 붙이기
				var who = document.createElement('div');

				who.style["padding"]="3px";
				who.style["margin-left"]="3px";
				div.style["font-size"]="9pt";

				who.innerHTML = message[0];
				document.getElementById('messageWindow2').appendChild(who);

				re_send = message[0];
			}
		
			//div는 받은 메시지 출력할 공간.
			var div=document.createElement('div');
		
			div.style["width"]="auto";
			div.style["word-wrap"]="break-word";
			div.style["display"]="inline-block";
			div.style["background-color"]="#fcfcfc";
			div.style["border-radius"]="3px";
			div.style["padding"]="3px";
			div.style["margin-left"]="3px";
			div.style["margin-bottom"]="6px";
			div.style["font-size"]="9pt";
			
			

			div.innerHTML = message[1];
			document.getElementById('messageWindow2').appendChild(div);
		
		//clear div 추가. 줄바꿈용.		
		var clear=document.createElement('div');
		clear.style["clear"]="both";
		document.getElementById('messageWindow2').appendChild(clear);
		
		//div 스크롤 아래로.
		messageWindow2.scrollTop = messageWindow2.scrollHeight;
		
	}

	//	OnOpen은 서버 측에서 클라이언트와 웹 소켓 연결이 되었을 때 호출되는 함수.
	function onOpen(event) {
		
		//접속했을 때, 내 영역에 보이는 글.
		
		var div=document.createElement('div');
		
		div.style["text-align"]="center";
		div.style["width"]="260px";
		div.style["display"]="inline-block";
		div.style["background-color"]="rgb(255, 255, 255)";
		div.style["padding"]="3px";
		div.style["border-radius"]="3px";
		div.style["margin-right"]="3px";
		div.style["margin-bottom"]="6px";
		div.style["font-size"]="9pt";
		
	 
		
		div.innerHTML = "운영자와의 실시간 상담이 가능합니다. ^^♥ 궁금한 점이 있다면 자유롭게 질문해주세요 !";
		
		
		document.getElementById('messageWindow2').appendChild(div);
		
		var clear=document.createElement('div');
		clear.style["clear"]="both";
		document.getElementById('messageWindow2').appendChild(clear);
		
		//접속했을 때 접속자들에게 알릴 내용.
		webSocket.send("<%=nick%>|\|안녕하세요^^");
	}

	//	OnError는 웹 소켓이 에러가 나면 발생을 하는 함수.
	function onError(event) {
		alert("chat_server connecting error " + event.data);
	}
	
	// send 함수를 통해서 웹소켓으로 메시지를 보낸다.
	function send() {

		//inputMessage가 있을때만 전송가능
		if(inputMessage.value!=""){
			
			//	서버에 보낼때 날아가는 값.
			webSocket.send("<%=nick%>|\|" + inputMessage.value);
			
			// 채팅화면 div에 붙일 내용
			var div=document.createElement('div');
			
			div.style["width"]="auto";
			div.style["word-wrap"]="break-word";
			div.style["float"]="right";
			div.style["display"]="inline-block";
			div.style["background-color"]="#ffea00";
			div.style["padding"]="3px";
			div.style["border-radius"]="3px";
			div.style["margin-right"]="3px";
			div.style["margin-bottom"]="6px";
			div.style["font-size"]="9pt";

			//div에 innerHTML로 문자 넣기
			div.innerHTML = inputMessage.value;
			document.getElementById('messageWindow2').appendChild(div);

			//clear div 추가
			var clear = document.createElement('div');
			clear.style["clear"] = "both";
			document.getElementById('messageWindow2').appendChild(clear);
			
			//	?
			//inputMessage.value = "";

			//	inputMessage의 value값을 지운다.
			inputMessage.value = '';

			//	textarea의 스크롤을 맨 밑으로 내린다.
			messageWindow2.scrollTop = messageWindow2.scrollHeight;
			
			//	금방 보낸 사람을 임시 저장한다.
			re_send = "<%=nick%>";
		}//inputMessage가 있을때만 전송가능 끝.
		
	}
</script>



</html>

