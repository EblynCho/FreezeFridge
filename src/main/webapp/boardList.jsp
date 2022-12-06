<%--
    Created by IntelliJ IDEA.
    User: admin
    Date: 2022-12-01
    Time: 오전 10:40
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>관리자 페이지 게시판</title>
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
        .seperate {
            position: absolute;
            left: 15%;
            top: 15%;
            display: flex;
            align-items: center;
        }
    </style>

</head>
<body>
<%@ include file="dbconn.jsp" %>
<div class="bg">
    <div class="seperate">
        <a href="main.jsp" class="me-2"><img src="image/home.png" alt=""></a>
    </div>
    <div class="container mt-5 p-5">
        <main class="container mt-4 p-5">
            <div class="row">
                <div class="col-sm">
                    <table class="table table-hover table-sm align-middle">
                        <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>키워드</th>
                            <th>썸네일</th>
                            <th>유튜브 주소</th>
<%--                            <th>난이도</th>--%>
                            <th>조회수</th>
                            <th>좋아요 수</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            PreparedStatement pstmt = null;
                            ResultSet rs = null;

                            try {
                                String sql = "SELECT * FROM board ";
                                sql += "WHERE deleted_yn = 'N' ";
                                sql += "ORDER BY idx DESC ";
                                pstmt = conn.prepareStatement(sql);
                                rs = pstmt.executeQuery();

                                while (rs.next()) {
                                    int idx = rs.getInt("idx");
                                    String title = rs.getString("title");
                                    String keyword = rs.getString("keyword");
                                    String youtubeUrl = rs.getString("youtube_url");
                                    String level = rs.getString("level");
                                    int cnt = rs.getInt("cnt");
                                    int likeCnt = rs.getInt("like_cnt");
                        %>
                        <tr onclick="location.href='boardDetail.jsp?idx=<%=idx%>'">
                            <td><%=idx%></td>
                            <td><%=title%></td>
                            <td><%=keyword%></td>
                            <td>
                                <img src="https://img.youtube.com/vi/<%=youtubeUrl%>/mqdefault.jpg" alt="유튜브 동영상 이미지입니다." >
                            </td>
                            <td>https://youtu.be/<%=youtubeUrl%></td>
<%--                            <td><%=level%></td>--%>
                            <td><%=cnt%></td>
                            <td><%=likeCnt%></td>
                        </tr>
                        <%
                                }
                            }
                            catch (SQLException e) {
                                out.println("SQLException : " + e.getMessage());
                            }
                            finally {
                                if (rs != null) { rs.close(); }
                                if (pstmt != null) { pstmt.close(); }
                                if (conn != null) { conn.close(); }
                            }
                        %>

                        </tbody>
                    </table>
                    <div class="d-flex justify-content-end">
                        <a href="boardWrite.jsp" class="btn btn-outline-primary">글쓰기</a>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
</body>
</html>
