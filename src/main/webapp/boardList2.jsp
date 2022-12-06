<%@ page import="com.bee.jspproj.dao.EmpDao" %>
<%@ page import="com.bee.jspproj.beans.Emp" %>
<%@ page import="java.util.List" %><%--
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
<%--                            <th>조회수</th>--%>
<%--                            <th>좋아요 수</th>--%>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            String spageid=request.getParameter("page");
                            int pageid=Integer.parseInt(spageid);
                            int total=4;
                            if(pageid==1){}
                            else{
                                pageid=pageid-1;
                                pageid=pageid*total+1;
                            }
                            List<Emp> list= EmpDao.getRecords(pageid,total);
                            for(Emp e:list){
                                out.print("<tr onclick=\"location.href='boardDetail.jsp?idx=" + e.getIdx() + "'\"><td>"+e.getIdx()+"</td><td>"+e.getTitle()+"</td><td>"+e.getKeyword()+"</td>" +
                                        "<td><img src='https://img.youtube.com/vi/" + e.getYoutubeUrl() + "/mqdefault.jpg'></td>" +
                                        "<td>https://youtu.be/" + e.getYoutubeUrl()+"</td>");
                            }
                            out.print("</table>");
                        %>

                        </tbody>
                    </table>
                    <div class="d-flex justify-content-center">
                        <a href="boardList2.jsp?page=1" class="btn">1</a>
                        <a href="boardList2.jsp?page=2" class="btn">2</a>
                        <a href="boardList2.jsp?page=3" class="btn">3</a>
                    </div>
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
