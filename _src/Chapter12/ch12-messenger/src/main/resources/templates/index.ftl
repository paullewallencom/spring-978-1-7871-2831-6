<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content="Spring WebFlux Workshop"/>
    <meta name="author" content="Violeta Georgieva and Brian Clozel"/>
    <title>Spring Trading application</title>
    <link href="./bootstrap.min.css" rel="stylesheet">
    <link href="./main.css" rel="stylesheet">
    <script src="./jquery-1.10.2.min.js"></script>
   
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/">Spring Trading application</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="/">Home</a></li>
                <li><a href="/quotes">Quotes</a></li>
                <li class="active"><a href="/websocket">Websocket</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container wrapper">
    <h2>Websocket Echo</h2>
    <form class="form-inline">
        <div class="form-group">
            <input class="form-control" type="text" id="input" value="type something">
            <input class="btn btn-default" type="submit" id="button" value="Send"/>
        </div>
    </form>
    <div id="output"></div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        if (!("WebSocket" in window)) WebSocket = MozWebSocket;
        var socket = new WebSocket("ws://localhost:8085/ch12-messenger/name");
        socket.onopen = function (event) {
            var newMessage = document.createElement('p');
            newMessage.textContent = "-- CONNECTED";
            document.getElementById('output').appendChild(newMessage);
            socket.onmessage = function (e) {
                var newMessage = document.createElement('p');
                newMessage.textContent = "<< SERVER: " + e.data;
                document.getElementById('output').appendChild(newMessage);
            }
            $("#button").click(function (e) {
                e.preventDefault();
                var message = $("#input").val();
                socket.send(message);
                var newMessage = document.createElement('p');
                newMessage.textContent = ">> CLIENT: " + message;
                document.getElementById('output').appendChild(newMessage);
            });
        }
    });
</script>
</body>
</html>