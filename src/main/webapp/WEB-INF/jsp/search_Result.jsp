<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>検索結果</title>
    <a id="TOP"></a>
    <!-- ここにCSSやJavaScriptのリンクを追加 -->
    <link href="${pageContext.request.contextPath}/CSS/style.css" rel="stylesheet" type="text/css">
    <style>
        .topNav {
            text-align: center; /* テキストを中央揃えにする */
            color: black; /* リンクの文字色を白にする */
            text-decoration: none; /* リンクの下線を削除する */
            background-color: transparent; /* リンクの背景色を透明にする */
        }

        /*aタグリンクの*/
        .link1 {
            color: #fff;
            font-weight: ;
        }

        .link2 {
            color: #004d25;
            font-weight: bold;
            text-decoration: underline;
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
            width: 1200px; /* テーブルの幅を設定 */
            background-color: #d4d9df;
            table-layout: fixed;
        }

        th, td {
            border: 1px solid black; /* セルの境界線を設定 */
            padding: 8px; /* セル内の余白を設定 */
            text-align: left;
            overflow: hidden;
            white-space: nowrap; /* テキストの折り返しを無効にする */
        }

        th {
            background-color: #d4d9df;
        }

        tr:nth-child(even) {
            color: black;
            background-color: #f2f2f2; /* 偶数行の背景色を設定 */
        }


        .ellipsis {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
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
    </style>
</head>
<body>
<header>
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
</header>
<br><br><br>
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

            <td class="ellipsis"><a href="/JavaBoard_styET/thread?id=${thread.threadId}" class="link2"><c:out
                    value="${thread.threadTitle}"/></a></td>
            <td class="ellipsis"><c:out value="${thread.creatorName}"/></td>
            <td class="ellipsis"><c:out value="${thread.posterName}"/></td>
            <td class="ellipsis"><c:out value="${thread.content}"/></td>
        </tr>
    </c:forEach>
</table>
<script>
    // JavaScriptを使用してテキストが幅を超えた場合に省略記号を追加する
    var cells = document.querySelectorAll('td.ellipsis');
    cells.forEach(function (cell) {
        if (cell.scrollWidth > cell.offsetWidth) {
            cell.title = cell.innerText;
        }
    });
</script>
</body>
<br><br>
<footer>
    <span style="color:white;">
        <a href="../TopServlet" target="_top">JavaBoard_styET</a>
    </span>
</footer>
</html>
