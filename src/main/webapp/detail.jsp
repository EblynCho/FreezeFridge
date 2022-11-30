<%--
    Created by IntelliJ IDEA.
    User: admin
    Date: 2022-11-30
    Time: 오전 11:15
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<div class="boardview" style="margin-bottom:10px; padding-bottom:20px;">
    <c:set var="key" value="${fn:substring(result.mv_the_origin_url,17,100) }" />
    <div class="boardviewbody" style="text-align:left">
        <iframe width="1000" height="720" src="https://www.youtube.com/embed/${key}"
                title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
        </iframe>
    </div>
</div>
