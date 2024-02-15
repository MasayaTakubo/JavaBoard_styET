<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Results</title>
<a id="TOP"></a>
    <!-- ここにCSSやJavaScriptのリンクを追加 -->
    <link rel="stylesheet" href="../CSS/style.css">
    <style>
        .topNav {
            text-align: center; /* テキストを中央揃えにする */
            color: black; /* リンクの文字色を白にする */
            text-decoration: none; /* リンクの下線を削除する */
            background-color: transparent; /* リンクの背景色を透明にする */
        }
        body {
            padding: 0px 0px 30px 0px;
        }
        /* navタグの始まり */
        nav {
            background-color: #121212;
        }
        a {
            text-decoration: none;
            color: #fff;
        }
        ul {
            list-style: none;
        }
        .menu {
            max-width: 1000px;
            display: flex;
            justify-content: space-between;
            margin: 0 auto;
            position: relative;
        }
        .menu > li {
            width: 25%;
            height: 50px;
            line-height: 50px;
            text-align: center;
        }
        .menu > li:hover {
            background-color: #3c3636;
        }
        .menu > li a {
            display: block;
        }
        .menu-second {
            visibility: hidden;
        }
        .menu > .single {
            position: relative;
        }
        .single .menu-second {
            width: 100%;
            background-color: #3c3636;
            position: absolute;
            top: 50px;
            left: 0;
        }
        .single .menu-second li a:hover {
            opacity: 0.7;
        }
        @media screen and (max-width: 600px) {
            body {
                font-size: 0.75rem;
            }
        }
        /* navのcss終わり */
        
        /* tableタグのcss始まり */
        table {
            margin: auto;
            border-collapse: collapse; /* セルの境界線を結合 */
            width: 80%; /* テーブルの幅を設定 */
            background-color: #d4d9df;
        }

        th, td {
            border: 1px solid black; /* セルの境界線を設定 */
            padding: 8px; /* セル内の余白を設定 */
            text-align: left;
        }
        th {
           background-color: #d4d9df;
        }
        tr:nth-child(even) {
            color: black;
            background-color: #f2f2f2; /* 偶数行の背景色を設定 */
        }

        /* tr:hover {
            background-color: #ddd; /* ホバー時の背景色を設定 */
        }
        /* tableタグのcss終わり */
        
        /* フォームのcss部分始まり */
        form {
            margin: 0 auto; /* 左右のマージンを自動調整して中央に配置 */
            width: fit-content; /* コンテンツの幅に合わせる */
        }
        .form-group {
            display: flex;
            align-items: flex;
        }
        label {
            display: inline-block;
            width: 200px;
            text-align: center;
            mergin-bottom: 5px;
        }
        textarea {
            height: 75px;
            width: 300px;
            font-size: 20px;
        }
        /* フォームのcss終わり */
        /* 下線のcss始まり */
        hr.double {
            text-decoration: underline overline;
        }
        td.hr-double {
            border-bottom: 2px double black; /* 下線を2重線に変更 */
            padding-bottom: 5px; /* 下部の余白を追加 */
            width: 100%;
        }
        /* 下線のcss 終わり*/
        #mainText {
            width: 80%;
            text-align: left;
        }
        .subText {
            margin: 5px 0 0 15%;
        }
        footer {
            text-align: center; /* テキストを中央揃えにする */
            color: black; /* リンクの文字色を白にする */
            text-decoration: none; /* リンクの下線を削除する */
            background-color: transparent; /* リンクの背景色を透明にする */
        }
    </style>
    <h1>検索結果</h1>
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
            <th>作者名</th>
            <th>投稿者名</th>
            <th>本文</th>
        </tr>
        <c:forEach items="${searchResults}" var="thread">
            <tr>
                <td>${thread.threadId}</td>
                <td><a href="/JavaBoard_styET/thread?id=${thread.threadId}"><c:out value="${thread.threadTitle}"/></a></td>
                <td><c:out value="${thread.creatorName}"/></td>
                <td><c:out value="${thread.posterName}"/></td>
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
