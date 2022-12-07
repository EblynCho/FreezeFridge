<%--
  Created by IntelliJ IDEA.
  User: eblyn
  Date: 2022/12/07
  Time: 12:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>오늘뭐해먹지?</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

  <style>
    body {
      height: 90vh;
      width: 100vw;
      background-image: url("image/list_3.png");
      background-repeat : no-repeat;
      background-size : cover;
    }
    .container {
        position: center;
        /*margin: 10%;*/
    }
    .seperate {
        position: absolute;
        left: 18%;
        top: 10%;
        display: flex;
        align-items: center;
    }
    .boardviewbody {
        position: absolute;
        left: 20%;
        top: 15%;
    }
  </style>
</head>
<body>
<%@ include file="dbconn.jsp" %>

<%
    String youtubeUrl = request.getParameter("youtubeUrl");
//    out.print("<h2>" + youtubeUrl + "</h2>");
%>

<div class="container">
    <div class="seperate">
        <a href="javascript:window.history.back();"><img src="image/back.png" alt=""></a>
<%--        <a href="main.jsp"><img src="image/home.png" alt=""></a>--%>
    </div>
    <div class="boardviewbody" style="text-align:left">
        <iframe width="1150" height="720" src="https://www.youtube.com/embed/<%=youtubeUrl%>"
                title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
        </iframe>
    </div>
</div>
</body>
</html>
