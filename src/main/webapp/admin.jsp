<%--
    Created by IntelliJ IDEA.
    User: admin
    Date: 2022-12-06
    Time: 오후 1:40
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

    <script>
        function login() {
            let pw = document.querySelector('#adminPassword');
            console.log(pw.value)

            if (pw.value == "1234") {
                // alert("관리자 페이지 이동");
                location.href = 'boardList.jsp'
            }
        }
    </script>

    <style>
        body {
            height: 90vh;
            width: 100vw;
        }

        #wrap{
            width:100%;
            height:100%;
            position:relative;
        }
        #wrap .box{
            width:300px;
            height:300px;
            position:absolute;
            left:50%;
            top:50%;
            margin-left:-150px;
            margin-top:-150px;
        }
    </style>

</head>
<body>
<div class="container" id="wrap">
    <div class="box">
        <form>
            <fieldset>
                <legend>Administrator Mode</legend>
                <div class="form-group">
                    <label for="adminPassword" class="form-label mt-2">Admin Password</label>
                    <input type="password" class="form-control" id="adminPassword" placeholder="관리자 비밀번호를 입력하세요">
                </div>
                <div class="mt-3 d-flex justify-content-end">
                    <button type="button" class="btn btn-dark" id="btn-admin" onclick="login()">Submit</button>
                </div>
            </fieldset>
        </form>
    </div>
</div>

</body>
</html>