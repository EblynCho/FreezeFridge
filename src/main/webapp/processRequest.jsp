<%--
  Created by IntelliJ IDEA.
  User: eblyn
  Date: 2022/12/07
  Time: 2:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.bee.jspproj.PaginationDAO" %>
<%
  String req=request.getParameter("requestType");
  String data="";

  if(req.equals("countRecords")){
    data= PaginationDAO.countRecords();
  }

  if(req.equals("getRecords")){
    String start=request.getParameter("currentIndex");
    String total=request.getParameter("recordsToFetch");
    data=PaginationDAO.getRecords(start, total);
  }

  out.print(data);
%>