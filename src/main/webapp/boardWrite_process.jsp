<%--
  Created by IntelliJ IDEA.
  User: eblyn
  Date: 2022/12/07
  Time: 12:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%@ include file="dbconn.jsp" %>

<%
  request.setCharacterEncoding("utf-8");

  String title = request.getParameter("title");
  String youtubeUrl = request.getParameter("youtubeUrl");
  String keyword = request.getParameter("keyword");

  PreparedStatement pstmt = null;

  try {
    String sql = "INSERT INTO board (title, youtube_url, keyword, create_date) ";
    sql += "VALUES (?, ?, ?, now()) ";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, youtubeUrl);
    pstmt.setString(3, keyword);
    pstmt.executeUpdate();

  }
  catch (SQLException e) {
    out.println("SQLException : " + e.getMessage());
  }
  finally {
    if (pstmt != null) { pstmt.close(); }
    if (conn != null) { conn.close(); }
  }

  response.sendRedirect("boardList.jsp");
%>

