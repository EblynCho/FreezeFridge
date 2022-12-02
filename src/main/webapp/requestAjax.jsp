<%--
    Created by IntelliJ IDEA.
    User: admin
    Date: 2022-12-02
    Time: 오후 3:58
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String keyword = null;

    try {
        String sql = "SELECT keyword FROM board ";
        sql += "WHERE deleted_yn = 'N' ";

        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

        while (rs.next()) {
            keyword = rs.getString("keyword");
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
<div>
    <tr>
        <td><%=keyword%></td>
    </tr>
</div>
</body>
</html>
