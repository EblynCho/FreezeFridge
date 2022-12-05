<%--
    Created by IntelliJ IDEA.
    User: admin
    Date: 2022-12-01
    Time: 오전 10:27
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    Connection conn = null;

    String url = "jdbc:mysql://localhost:3306/jspdb";
    String userId = "bee";
    String userPw = "1234";

    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, userId, userPw);
//        out.println("DB 연결 성공");

%>

