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
        // $( function() {
        //     let availableTags = [
        //         "토마토",
        //         "양배추",
        //         "계란",
        //         "새우"
        //     ];
        //
        //     $( "#search" ).autocomplete({
        //         source: availableTags
        //     });
        // } );

        $( function() {
            let tags = [];

            $.ajax({
                url : "requestAjax.jsp",
                data: {type:tags},
                success : function(){
                    let tags = $("keyword").map(function () {
                        return {
                            value: $("keyword", this).text()
                        };
                    }).get();
                    $( "#search" ).autocomplete({
                        source: tags
                    });
                }
            });
        });
        // $( function() {
        //
        //     $.ajax({
        //         url: "requestAjax.jsp",
        //         dataType: "xml",
        //         success: function( xmlResponse ) {
        //             let data = $( "keyword", xmlResponse ).map(function() {
        //                 return {
        //                     value: $("keyword", this).text()
        //                     // value: $( "name", this ).text() + ", " +
        //                     //     ( String.prototype.trim.call( $( "countryName", this ).text() ) ||
        //                     //         "(unknown country)" ),
        //                     // id: $( "geonameId", this ).text()
        //                 };
        //             }).get();
        //             $( "#search" ).autocomplete({
        //                 source: data,
        //                 minLength: 0,
        //                 select: function( event, ui ) {
        //                     log( ui.item ?
        //                         "Selected: " + ui.item.value + ", geonameId: " + ui.item.id :
        //                         "Nothing selected, input was " + this.value );
        //                 }
        //             });
        //         }
        //     });
        // } );
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
    </style>

</head>
<body>
<%--<%@ include file="dbconn.jsp" %>--%>

<div class="wrapper">
    <div class="content">
        <input type="text" name="search" id="search" class="text-center" placeholder="재료를 입력하세요" style="font-size:20pt; border:0 solid black">
    </div>
</div>
</body>
</html>
