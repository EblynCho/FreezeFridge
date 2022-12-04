<%--
    Created by IntelliJ IDEA.
    User: admin
    Date: 2022-12-02
    Time: 오전 9:14
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>오늘뭐해먹지?</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script>

        $( function() {
            let tags = [];

            $.ajax({
                url : "requestAjax.jsp",
                type: "GET",
                data: {},
                success : function(data){
                    // alert("연결성공");

                    // data = data.trim();
                    // console.log(data);

                    let obj = JSON.parse(data.trim());

                    for (let i = 0; i < obj.length; i++) {
                        if (obj[i].keyword.includes(',')) {
                            let arr2 = obj[i].keyword.split(', ')
                            tags = tags.concat(arr2)
                        } else {
                            tags.push(obj[i].keyword);
                        }
                    }

                    console.log(tags)
                    // 중복 제거
                    let keywordList =[];
                    tags.forEach((element) => {
                        if (!keywordList.includes(element)) {
                            keywordList.push(element);
                        }
                    })
                    console.log(keywordList);

                    $( '#search' ).autocomplete({
                        source: keywordList,
                        select: function (event, ui) {
                            //아이템 선택시 처리 코드
                            location.replace('searchList.jsp')
                        }
                    });
                }
            });
        });

    </script>

    <style>
        body {
            height: 90vh;
            width: 100vw;
            background-image: url("image/main_3.png");
            background-repeat : no-repeat;
            background-size : cover;
        }
        .wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        input:focus {outline: none;}

        /*.ui-menu-item .ui-menu-item-wrapper .ui-state-active {*/
        /*    background: #6693bc ;*/
        /*    font-weight: bold ;*/
        /*    color: #ffffff ;*/
        /*}*/

        .ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active, a.ui-button:active, .ui-button:active, .ui-state-active.ui-button:hover
        {
            border: 1px solid #000;
            background: #000;
            font-weight: bold ;
            font-size: 20px;
            color: #ffffff ;
        }

        .ui-widget-content {
            border: 1px solid #000;
            font-weight: bold ;
            font-size: 20px;
        }
    </style>

</head>
<body>
<%--<%@ include file="dbconn.jsp" %>--%>

<div class="wrapper">
    <div class="content">
        <input type="text" name="search" id="search" class="text-center" placeholder="재료를 입력하세요" style="font-size:20pt; border:0 solid black" autofocus>
    </div>
</div>
</body>
</html>
