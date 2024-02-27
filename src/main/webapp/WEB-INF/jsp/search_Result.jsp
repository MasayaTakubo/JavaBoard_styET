<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>検索結果</title>
<a id="TOP"></a>
    <!-- ここにCSSやJavaScriptのリンクを追加 -->
    <link href="${pageContext.request.contextPath}/CSS/style.css" rel="stylesheet" type="text/css">

    <h1 id="page_top">検索結果</h1>
<nav>
    <ul class="menu">
        <li> 
            <a href="/JavaBoard_styET/TopServlet" class="link1">スレッド一覧へ</a>
            <ul class="menu-second"></ul>
        </li>
        <li>
            <a href="/JavaBoard_styET/createNewThread" class="link1">新規スレッド作成</a>
            <ul class="menu-second"></ul>
        </li>
        <li>
            <a href="/JavaBoard_styET/HTML/ThreaeSerch.html" class="link1">スレッドを検索する</a>
            <ul class="menu-second"></ul>
        </li>
    </ul>
</nav>
<br><br><br>
</head>
<body>
    
    <table border="1">
        <tr>
            <th>スレッドID</th>
            <th>スレッド名</th>
            <th>作成者名</th>
            <th>本文</th>
        </tr>
        <c:forEach items="${searchResults}" var="thread">
            <tr>
                <td>${thread.threadId}</td>
                <td><a href="/JavaBoard_styET/thread?id=${thread.threadId}"><c:out value="${thread.threadTitle}"/></a></td>
                <td><c:out value="${thread.creatorName}"/></td>
                <td><c:out value="${thread.content}"/></td>
            </tr>
        </c:forEach>
    </table>
</body>
<br><br><br>
<footer>
    <nav>
    <ul class="menu">
        <li> 
            <a href="/JavaBoard_styET/TopServlet" class="link1">スレッド一覧へ</a>
            <ul class="menu-second"></ul>
        </li>
        <li>
            <a href="/JavaBoard_styET/createNewThread" class="link1">新規スレッド作成</a>
            <ul class="menu-second"></ul>
        </li>
        <li>
            <a href="/JavaBoard_styET/HTML/ThreaeSerch.html" class="link1">スレッドを検索する</a>
            <ul class="menu-second"></ul>
        </li>
        <li>
            <a href="#TOP">ページ上部へ</a>
            <ul class="menu-second"></ul>
        </li>
    </ul>
    </nav>
</footer>
</html>
