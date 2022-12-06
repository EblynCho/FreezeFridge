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
    <title>관리자 모드_등록</title>
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
        /*input {*/
        /*    border-style: none;*/
        /*}*/

        td {
            line-height: 35px;
            align-content: center;
        }
    </style>

</head>
<body>
<main class="container mt-4">
    <div class="row">
        <form action="boardWrite_process.jsp" method="post">
            <div class="col-sm-6 mx-auto">
                <table class="table mx-auto align-middle" style="width: 600px">
                    <colgroup>
                        <col style="width: 25%;">
                        <col style="width: 75%;">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th class="bg-light" scope="row"><label for="title"> 제목 </label></th>
                        <td>
                            <input type="text" id="title" name="title" placeholder=" 제목을 입력하세요">
                        </td>
                    </tr>
                    <tr>
                        <th class="bg-light" scope="row"><label for="youtube-url">유튜브 주소</label></th>
                        <td>
                            <div>
                                <span>https://youtu.be/</span>
                                <input type="text" id="youtube-url" name="youtubeUrl" placeholder=" 유튜브 주소를 입력하세요">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th class="bg-light" scope="row"><label for="keyword"> 재료 키워드 </label></th>
                        <td>
                            <input type="text" id="keyword" name="keyword" placeholder=" 재료 키워드를 입력하세요">
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="my-3 row">
                    <div class="col-sm ms-4">
                        <button class="btn btn-outline-secondary" type="button" id="btn-list">목록으로</button>
                    </div>
                    <div class="col-sm d-flex justify-content-end me-4">
                        <button class="btn btn-outline-primary" type="submit">등록</button>
                    </div>
                </div>
        </form>
    </div>
</main>
</body>
</html>
