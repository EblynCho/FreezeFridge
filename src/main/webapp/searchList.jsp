<%--
  Created by IntelliJ IDEA.
  User: eblyn
  Date: 2022/12/05
  Time: 12:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>오늘뭐해먹지?-검색 목록</title>
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

        .outer-div {
            display : flex;
            justify-content: center;
            align-items : center;
        }


        #blog {
            /*display: flex;*/
            justify-content: center;
            /*align-items: center;*/
            padding: 50px;
            box-sizing: border-box;
            /*position: relative;*/
        }

        ul {
            list-style:none;
        }
        li {
            float: left;
            margin: 10px;
            padding: 20px;
            text-align: center;
            justify-content: center;
        }

        a {
            text-decoration: none;
            color: black;
        }

        .seperate {
            position: absolute;
            left: 18%;
            top: 10%;
            display: flex;
            align-items: center;
        }
        #search-keyword {
            font-size: 22px;
            font-weight: bold;
        }
    </style>

</head>
<body>
<%@ include file="dbconn.jsp" %>

<%
    String keyword = request.getParameter("keyword");
//    out.print("<h2>keyword" + keyword + "</h2>");
%>

<div class="outer-div m-5 p-5">
    <div class="seperate">
        <a href="main.jsp" class="me-2"><img src="image/home.png" alt=""></a>
        <span class="border-top border-bottom border-3 border-dark p-1 px-3" id="search-keyword"><%=keyword%></span>
    </div>
    <div class="inner-div container mt-5" id="blog">
        <ul>
    <%
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT * FROM board ";
            sql += "WHERE deleted_yn = 'N' AND keyword like concat('%',?,'%') ";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, keyword);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                String title = rs.getString("title");
//                String keyword = rs.getString("keyword");
                String youtubeUrl = rs.getString("youtube_url");
                String level = rs.getString("level");
    %>

            <li>
                <a href="#" onclick="location.href='playYoutube.jsp?youtubeUrl=<%=youtubeUrl%>'">
                    <img src="https://img.youtube.com/vi/<%=youtubeUrl%>/mqdefault.jpg" alt="유튜브 동영상 이미지입니다." >
                    <h5 class="mt-2"><%=title%></h5>
                </a>
            </li>

<%
        }
    }
    catch (SQLException e) {
        out.print("SQLException : " + e.getMessage());
    }
    finally {
        if (rs != null) { rs.close(); }
        if (pstmt != null) { pstmt.close(); }
        if (conn != null) { conn.close(); }
    }
%>
        </ul>
    </div>
</div>
</body>
</html>
