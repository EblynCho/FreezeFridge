<%--
    Created by IntelliJ IDEA.
    User: admin
    Date: 2022-12-01
    Time: 오전 10:27
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>DB 연결</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<%
    Connection conn = null;

    try {
        String url = "jdbc:mysql://localhost:3306/jspdb";
        String userId = "bee";
        String userPw = "1234";

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, userId, userPw);
//        out.println("DB 연결 성공");
    }
    catch (SQLException e) {
//        out.println("DB 연결 실패");
        out.println("SQLException : " + e.getMessage());
    }
    finally {
//        if (conn != null) {
//            conn.close();
//        }
    }
%>
</body>
</html>