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
    <title>검색 목록</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" href="style.css">

    <style>
        body {
            height: 90vh;
            width: 100vw;
            background-image: url("image/list_3.png");
            background-repeat : no-repeat;
            background-size : cover;
        }

        /*.container {*/
        /*    !*width: 900px;*!*/
        /*    display: grid;*/
        /*    grid-template-rows: repeat(3, 1fr);*/
        /*    grid-template-columns: repeat(3, 1fr);*/
        /*    !*grid-auto-rows: 120px;*!*/
        /*    !*margin: 20%;*!*/
        /*    !*padding: 20%;*!*/
        /*}*/

        #blog {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            box-sizing: border-box;
            position: relative;
        }

        .list_start {
            text-align: center;
        }

        .list_detail {
            display: inline-block;
            /*width: 220px;*/
            /*height: 260px;*/
            border: 1px solid;
            margin-bottom: 5px;
        }

        .item {
            display: inline-block;
            align-self: stretch;
            /* align-self: start; */
            /* align-self: center; */
            /* align-self: end; */
        }

        ul {
            list-style:none;
        }
        li {
            float: left;
        }

    </style>

</head>
<body>
<%@ include file="dbconn.jsp" %>

<div class="m-5 p-5">
        <div class=" container" id="blog">
    <ul>
    <%
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT * FROM board ";
            sql += "WHERE deleted_yn = 'N' ";

            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                String title = rs.getString("title");
                String keyword = rs.getString("keyword");
                String youtubeUrl = rs.getString("youtube_url");
                String level = rs.getString("level");
    %>

<%--                <div class="item" >--%>
<%--                    <img src="https://img.youtube.com/vi/<%=youtubeUrl%>/mqdefault.jpg" alt="유튜브 동영상 이미지입니다." >--%>
<%--                        <div class="card-body">--%>
<%--                            <h5 class="card-title text-center py-2"><%=title%></h5>--%>
<%--                        </div>--%>
<%--                </div>--%>

            <li>
                <img src="https://img.youtube.com/vi/<%=youtubeUrl%>/mqdefault.jpg" alt="유튜브 동영상 이미지입니다." >
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
