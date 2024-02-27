<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>スレッド作成</title>
    
    <link href="${pageContext.request.contextPath}/CSS/style.css" rel="stylesheet" type="text/css">
    
</head>
<body>
    <h1 id="page_top">スレッド作成</h1>
    <nav>
        <ul class="menu">
            <li> 
                <a href="/JavaBoard_styET/TopServlet" class="link1">スレッド一覧へ</a>
                <ul class="menu-second"></ul>
            </li>
            <li>
                <a href="/JavaBoard_styET/HTML/ThreaeSerch.html" class="link1">スレッドを検索する</a>
                <ul class="menu-second"></ul>
            </li>
        </ul>
    </nav>
    <script>
        function validateForm() {
            var threadName = document.forms["threadForm"]["threadName"].value;
            var userName = document.forms["threadForm"]["userName"].value;
            var postText = document.forms["threadForm"]["postText"].value;
    
            // エスケープ処理
            threadName = escapeHtml(threadName);
            userName = escapeHtml(userName);
            postText = escapeHtml(postText);
    
            if (threadName.trim() === "" || userName.trim() === "" || postText.trim() === "") {
                alert("スレッド名とユーザー名、投稿内容を入力してください。");
                return false;
            }
        }
    
        function escapeHtml(unsafe) {
            return unsafe
                .replace(/&/g, "&amp;")
                .replace(/</g, "&lt;")
                .replace(/>/g, "&gt;")
                .replace(/"/g, "&quot;")
                .replace(/'/g, "&#039;");
        }
    </script>
        <form name="threadForm" action='createThreadServlet' method='get' onsubmit="return validateForm()">
        <table class="table-createTable">
            <tr><th class="th-createTable">スレッド名</th><td class="td-createTable"><input type='text' name='threadName' maxlength=30></td></tr>
            <tr><th class="th-createTable">ユーザー名</th><td class="td-createTable"><input type='text' name='userName' maxlength=30></td></tr>
            <tr><th class="th-createTable">投稿内容</th><td class="td-createTable"><input type='text' name='postText' maxlength=1000></td></tr>
            <tr><td></td><td class="td-createTable"><input type='submit' value='作成'></td></tr>
        </table>
        </form>
</body>
<footer>
    <nav>
        <ul class="menu">
            <li> 
                <a href="/JavaBoard_styET/TopServlet" class="link1">スレッド一覧へ</a>
                <ul class="menu-second"></ul>
            </li>
            <li>
                <a href="/JavaBoard_styET/HTML/ThreaeSerch.html" class="link1">スレッドを検索する</a>
                <ul class="menu-second"></ul>
            </li>
        </ul>
    </nav>
</footer>
</html>
