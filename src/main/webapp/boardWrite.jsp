<%--
    Created by IntelliJ IDEA.
    User: admin
    Date: 2022-12-01
    Time: 오후 12:44
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>동영상 등록</title>
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

        .back {
            background-color: #FFDE66;
        }
    </style>

</head>
<body>
<div class="container mt-5 p-5">
    <div class="container mt-5 p-5 border rounded ">
        <div class="mt-5 p-5 ">
            <table class="table mx-auto align-middle" style="width: 600px">
                <colgroup>
                    <col style="width: 25%;">
                    <col style="width: 75%;">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row"><label for="title"> 제목 </label></th>
                    <td>
                        <input type="text" name="title" id="title" style="width: 100%">
                    </td>
                </tr>
                <tr>
                    <th scope="row">유튜브 주소 ID</th>
                    <td>
                        <div>
                            <span >https://youtu.be/  </span>
                            <input type="text" name="youtubeUrl" id="youtubeUrl" style="width:150px"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th> 재료 키워드 </th>
                    <td>
                        <input type="text" name="keyword" id="keyword" style="width: 100%">
                    </td>
                </tr>
                </tbody>
            </table>
            <div>
                <input type="submit" class="" value="등록">
            </div>
        </div>
    </div>
</div>
</body>
</html>
