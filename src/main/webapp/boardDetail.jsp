<%--
  Created by IntelliJ IDEA.
  User: eblyn
  Date: 2022/12/06
  Time: 10:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <title>관리자 모드</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

  <script>
    window.addEventListener('DOMContentLoaded', function () {
      const btnList = document.querySelector('#btn-list');
      btnList.addEventListener('click', function () {
        history.back();
      });
    });
  </script>

  <style>
    body {
      height: 90vh;
      width: 100vw;
      background-image: url("image/list_3.png");
      background-repeat : no-repeat;
      background-size : cover;
    }
    .container {
      padding-top: 15%;
    }
    #idx, #title, #keyword {
      width: 100%;
    }
    #youtube-url {
      width: 70%;
    }
    input {
      border-style: none;
    }

  </style>
</head>
<body>

<%@ include file="dbconn.jsp"%>
<%
  int idx = Integer.parseInt(request.getParameter("idx"));

  String title = "";
  String keyword = "";
  String youtubeUrl = "";
  String level = "";
  int likeCnt = 0;
  int cnt = 0;

  PreparedStatement pstmt = null;
  ResultSet rs = null;


  try {
    String sql = "SELECT * FROM board ";
    sql += "WHERE idx = ? ";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, idx);
    rs = pstmt.executeQuery();

    if (rs.next()) {
      title = rs.getString("title");
      keyword = rs.getString("keyword");
      youtubeUrl = rs.getString("youtube_url");
      level = rs.getString("level");
      likeCnt = rs.getInt("like_cnt");
      cnt = rs.getInt("cnt");
    }
  }
  catch (SQLException e) {
    out.print(e.getMessage());
  }
  finally {
    if (rs != null) { rs.close(); }
    if (pstmt != null) { pstmt.close(); }
    if (conn != null) { conn.close(); }
  }

%>
<main class="container mt-4">
  <div class="row">
    <form action="boardUpdate_process.jsp" method="post">
      <div class="col-sm-6 mx-auto">
        <table class="table mx-auto align-middle" style="width: 600px">
          <colgroup>
            <col style="width: 25%;">
            <col style="width: 75%;">
          </colgroup>
          <tbody>
          <tr>
            <th class="bg-light" scope="row"><label for="idx"> 글 번호 </label></th>
            <td>
              <input type="text" id="idx" name="idx" readonly value="<%=idx%>">
            </td>
          </tr>

          <tr>
            <th class="bg-light" scope="row"><label for="title"> 제목 </label></th>
            <td>
              <input type="text" id="title" name="title" placeholder=" 제목을 입력하세요" value="<%=title%>">
            </td>
          </tr>
          <tr>
            <th class="bg-light" scope="row"><label for="youtube-url">유튜브 주소</label></th>
            <td>
              <div>
                <span>https://youtu.be/</span>
                <input type="text" id="youtube-url" name="youtubeUrl" placeholder=" 유튜브 주소를 입력하세요" value="<%=youtubeUrl%>">
              </div>
            </td>
          </tr>
          <tr>
            <th class="bg-light" scope="row"><label for="keyword"> 재료 키워드 </label></th>
            <td>
              <input type="text" id="keyword" name="keyword" placeholder=" 재료 키워드를 입력하세요" value="<%=keyword%>">
            </td>
          </tr>
          </tbody>
        </table>
        <div class="my-3 row">
          <div class="col-sm ms-4">
            <button class="btn btn-outline-secondary" type="button" id="btn-list">목록으로</button>
          </div>
          <div class="col-sm d-flex justify-content-end me-4">
            <button class="btn btn-outline-warning me-2" type="submit">수정</button>
    </form>
    <form action="boardDelete_process.jsp" method="get">
      <input type="hidden" name="idx" value="<%=idx%>">
      <button class="btn btn-outline-danger" type="submit">삭제</button>
    </form>
  </div>
</main>


</body>
</html>