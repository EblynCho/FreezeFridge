<%--
  Created by IntelliJ IDEA.
  User: eblyn
  Date: 2022/12/07
  Time: 12:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%@ include file="dbconn.jsp" %>

<%
  int idx = Integer.parseInt(request.getParameter("idx"));

  String sql = "UPDATE board SET deleted_yn = 'Y' ";
  sql += "WHERE idx = ? ";

  PreparedStatement pstmt = null;

  try {
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, idx);
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
