<%--
    Created by IntelliJ IDEA.
    User: admin
    Date: 2022-12-02
    Time: 오후 3:58
    To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %>

<%@ include file="dbconn.jsp" %>
<%
    PreparedStatement pstmt = null;
    ResultSet rs = null;


    try {
        String sql = "SELECT keyword FROM board ";
        sql += "WHERE deleted_yn = 'N' ";

        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

        JSONArray keywordList = new JSONArray();

        while (rs.next()) {
            JSONObject obj = new JSONObject();
            obj.put("keyword", rs.getString("keyword"));
            keywordList.add(obj);
        }
        out.print(keywordList.toJSONString());
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

