<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>

<title>채팅</title>
<style>
	* {
  box-sizing: border-box;
}

body {
  background-color: #edeff2;
  font-family: "Calibri", "Roboto", sans-serif;
}

.chat_window {
  position: absolute;
  width: calc(100% - 20px);
  max-width: 800px;
  height: 500px;
  border-radius: 10px;
  background-color: #fff;
  left: 50%;
  top: 50%;
  transform: translateX(-50%) translateY(-50%);
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
  background-color: #f8f8f8;
  overflow: hidden;
}

.top_menu {
  background-color: #fff;
  width: 100%;
  padding: 20px 0 15px;
  box-shadow: 0 1px 30px rgba(0, 0, 0, 0.1);
}
.top_menu .buttons {
  margin: 3px 0 0 20px;
  position: absolute;
}
.top_menu .buttons .button {
  width: 16px;
  height: 16px;
  border-radius: 50%;
  display: inline-block;
  margin-right: 10px;
  position: relative;
}
.top_menu .buttons .button.close {
  background-color: #f5886e;
}
.top_menu .buttons .button.minimize {
  background-color: #fdbf68;
}
.top_menu .buttons .button.maximize {
  background-color: #a3d063;
}
.top_menu .title {
  text-align: center;
  color: #bcbdc0;
  font-size: 20px;
}

.messages {
  position: relative;
  list-style: none;
  padding: 20px 10px 0 10px;
  margin: 0;
  height: 347px;
  overflow: scroll;
}
.messages .message {
  clear: both;
  overflow: hidden;
  margin-bottom: 20px;
  transition: all 0.5s linear;
  opacity: 0;
}
.messages .message.left .avatar {
  background-color: #f5886e;
  float: left;
}
.messages .message.left .text_wrapper {
  background-color: #ffe6cb;
  margin-left: 20px;
}
.messages .message.left .text_wrapper::after, .messages .message.left .text_wrapper::before {
  right: 100%;
  border-right-color: #ffe6cb;
}
.messages .message.left .text {
  color: #c48843;
}
.messages .message.right .avatar {
  background-color: #fdbf68;
  float: right;
}
.messages .message.right .text_wrapper {
  background-color: #c7eafc;
  margin-right: 20px;
  float: right;
}
.messages .message.right .text_wrapper::after, .messages .message.right .text_wrapper::before {
  left: 100%;
  border-left-color: #c7eafc;
}
.messages .message.right .text {
  color: #45829b;
}
.messages .message.appeared {
  opacity: 1;
}
.messages .message .avatar {
  width: 60px;
  height: 60px;
  border-radius: 50%;
  display: inline-block;
}
.messages .message .text_wrapper {
  display: inline-block;
  padding: 20px;
  border-radius: 6px;
  width: calc(100% - 85px);
  min-width: 100px;
  position: relative;
}
.messages .message .text_wrapper::after, .messages .message .text_wrapper:before {
  top: 18px;
  border: solid transparent;
  content: " ";
  height: 0;
  width: 0;
  position: absolute;
  pointer-events: none;
}
.messages .message .text_wrapper::after {
  border-width: 13px;
  margin-top: 0px;
}
.messages .message .text_wrapper::before {
  border-width: 15px;
  margin-top: -2px;
}
.messages .message .text_wrapper .text {
  font-size: 18px;
  font-weight: 300;
}

.bottom_wrapper {
  position: relative;
  width: 100%;
  background-color: #fff;
  padding: 20px 20px;
  position: absolute;
  bottom: 0;
}
.bottom_wrapper .message_input_wrapper {
  display: inline-block;
  height: 50px;
  border-radius: 25px;
  border: 1px solid #bcbdc0;
  width: calc(100% - 160px);
  position: relative;
  padding: 0 20px;
}
.bottom_wrapper .message_input_wrapper .message_input {
  border: none;
  height: 100%;
  box-sizing: border-box;
  width: calc(100% - 40px);
  position: absolute;
  outline-width: 0;
  color: gray;
}
.bottom_wrapper .send_message {
  width: 140px;
  height: 50px;
  display: inline-block;
  border-radius: 50px;
  background-color: #a3d063;
  border: 2px solid #a3d063;
  color: #fff;
  cursor: pointer;
  transition: all 0.2s linear;
  text-align: center;
  float: right;
}
.bottom_wrapper .send_message:hover {
  color: #a3d063;
  background-color: #fff;
}
.bottom_wrapper .send_message .text {
  font-size: 18px;
  font-weight: 300;
  display: inline-block;
  line-height: 48px;
}

.message_template {
  display: none;
}
	
</style>
</head>
<body>
<!-- 	<input id="inputMsgBox" style="width: 250px;" type="text" -->
<!-- 		onkeypress="inputMsgBox_onkeypress()"> -->
<!-- 	<input id="sendButton" value="Send" type="button" -->
<!-- 		onclick="sendButton_onclick()"> -->
<!-- 	<input id="disconnectButton" value="Disconnect" type="button" -->
<!-- 		onclick="disconnectButton_onclick()"> -->
<!-- 	<br> -->
<!-- 	<textarea id="chatBoxArea" style="width: 250px;" rows="10" cols="50" -->
<!-- 		readonly="readonly"></textarea> -->

	<div class="chat_window">
		<div class="top_menu">
			<div class="buttons">
				<div class="button close"></div>
				<div class="button minimize"></div>
				<div class="button maximize"></div>
			</div>
			<div class="title">Chat</div>
			<div>${phone}</div>
		</div>
		<ul class="messages">
			<li><textarea id="chatBoxArea" style="width: 100%; height:100%" rows="14" cols="50" readonly="readonly"></textarea></li>
		</ul>
		<div class="bottom_wrapper clearfix">
			<div class="message_input_wrapper">
				<input class="message_input" id="inputMsgBox" placeholder="Type your message here..." onkeypress="inputMsgBox_onkeypress()"/>
			</div>
			<div class="send_message">
				<div class="icon"></div>
				<input class="send_message" id="sendButton" value="Send" type="button" onclick="sendButton_onclick()">
				<input class="send_message" id="disconnectButton" value="Disconnect" type="button" onclick="disconnectButton_onclick()">
			</div>
		</div>
	</div>
	<div class="message_template">
		<li class="message">
			<div class="avatar"></div>
			<div class="text_wrapper">
				<div class="text"></div>
			</div>
		</li>
	</div>
</body>

<script type="text/javascript">
	var g_webSocket = null;
	window.onload = function() {
		g_webSocket = new WebSocket("ws://localhost:8080/zizon/websocket");

		// 웹소켓 사용자 연결 성립하는 경우 호출
		g_webSocket.onopen = function(message) {
			addLineToChatBox("Server is connected.");
		};

		// 웹소켓 메시지(From Server) 수신하는 경우 호출
		g_webSocket.onmessage = function(message) {
			addLineToChatBox(message.data);
		};

		// 웹소켓 사용자 연결 해제하는 경우 호출
		g_webSocket.onclose = function(message) {
			addLineToChatBox("Server is disconnected.");
		};

		// 웹소켓 에러 발생하는 경우 호출
		g_webSocket.onerror = function(message) {
			addLineToChatBox("Error!");
		};
	}

	// 채팅 박스영역에 내용 한 줄 추가

	function addLineToChatBox(_line) {
		if (_line == null) {
			_line = "";
		}

		var chatBoxArea = document.getElementById("chatBoxArea");
		chatBoxArea.value += _line + "\n";
		chatBoxArea.scrollTop = chatBoxArea.scrollHeight;
	}

	// Send 버튼 클릭하는 경우 호출 (서버로 메시지 전송)
	function sendButton_onclick() {
		var inputMsgBox = document.getElementById("inputMsgBox");
		if (inputMsgBox == null || inputMsgBox.value == null
				|| inputMsgBox.value.length == 0) {
			return false;
		}

		var chatBoxArea = document.getElementById("chatBoxArea");

		if (g_webSocket == null || g_webSocket.readyState == 3) {
			chatBoxArea.value += "Server is disconnected.\n";
			return false;
		}

		// 서버로 메시지 전송
		g_webSocket.send(inputMsgBox.value);
		inputMsgBox.value = "";
		inputMsgBox.focus();

		return true;
	}

	// Disconnect 버튼 클릭하는 경우 호출
	function disconnectButton_onclick() {
		if (g_webSocket != null) {
			g_webSocket.close();
		}
	}

	// inputMsgBox 키입력하는 경우 호출
	function inputMsgBox_onkeypress() {
		if (event == null) {
			return false;
		}

		// 엔터키 누를 경우 서버로 메시지 전송
		var keyCode = event.keyCode || event.which;
		if (keyCode == 13) {
			sendButton_onclick();
		}
	}
</script>
</html>