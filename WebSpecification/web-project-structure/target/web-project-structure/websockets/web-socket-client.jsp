<html>

<body style="margin: 35px">
<form>
    <input id="messageField" type="text">
    <input onclick="sendMsg();" value="send" type="button">
</form>

<div id="msg-box" style="width:500px; height: 400px; background: #eee; overflow:auto;"></div>


<script>
    var webSocket = new WebSocket("ws://localhost:9000/web-project-structure/hello");
    var msgField = document.getElementById("messageField");
    var divMsg = document.getElementById("msg-box");

    function sendMsg() {
        var msgToSend = msgField.value;
        webSocket.send(msgToSend);
        divMsg.innerHTML += "<div style='color:red'>Client> " + msgToSend +
            "</div>"
        msgField.value = "";
    }

    webSocket.onmessage = function(message) {
        divMsg.innerHTML += "Server> : " + message.data;

    }

    webSocket.onopen = function() {
        console.log("connection opened");
    };

    webSocket.onclose = function() {
        console.log("connection closed");
    };

    webSocket.onerror = function wserror(message) {
        console.log("error: " + message);
    }


</script>
</body>
</html>