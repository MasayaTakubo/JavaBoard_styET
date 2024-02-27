<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DTO.TopThreadDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>掲示板サイト</title>
     <link href="${pageContext.request.contextPath}/CSS/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<header>
    <h1 id="page_top">スレッド検索結果</h1>
    
    <nav>
        <ul class="menu">
            <!-- 1つめ -->
            <li>
                <%--書き込む --%>
                <a href="TopServlet" class="link1">スレッド一覧へ</a>
                <ul class="menu-second">


                </ul>
            </li>

            <!-- 2 -->
            <li>
                <%--検索 --%>
                <a href="HTML/ThreaeSerch.html" class="link1">スレッドを検索する</a>
                <ul class="menu-second">

                </ul>
            </li>

        </ul>

    </nav>
</header>
</body>
</html>
