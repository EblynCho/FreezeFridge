<%--
  Created by IntelliJ IDEA.
  User: eblyn
  Date: 2022/12/07
  Time: 12:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%@ include file="dbconn.jsp" %>

<%
  request.setCharacterEncoding("utf-8");

  int idx = Integer.parseInt(request.getParameter("idx"));
  String title = request.getParameter("title");
  String youtubeUrl = request.getParameter("youtubeUrl");
  String keyword = request.getParameter("keyword");


  String sql = "UPDATE board SET title = ?, youtube_url = ?, keyword = ? ";
  sql += "WHERE idx = ? ";

  PreparedStatement pstmt = null;

  try {
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, youtubeUrl);
    pstmt.setString(3, keyword);
    pstmt.setInt(4, idx);
    pstmt.executeUpdate();
  }
  catch (SQLException e) {
    out.print(e.getMessage());
  }
  finally {
    if (pstmt != null) { pstmt.close(); }
    if (conn != null) { conn.close(); }
  }

  response.sendRedirect("boardList.jsp");
%>
