<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>掲示板</title>
    
	<link href="${pageContext.request.contextPath}/CSS/style.css" rel="stylesheet" type="text/css">
    
</head>
<body class="body-createTable">

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




  <h1 id="page_top">あああ(仮)</h1>
<div class="container-createTable">
    <form name="threadForm" action='createThreadServlet' method='get' onsubmit="return validateForm()">
    <table class="table-createTable">
        <tr><th class="th-createTable">スレッド名</th><td class="td-createTable"><input type='text' name='threadName' maxlength=30></td></tr>
        <tr><th class="th-createTable">ユーザー名</th><td class="td-createTable"><input type='text' name='userName'maxlength=30></td></tr>
        <tr><th class="th-createTable">投稿内容</th><td class="td-createTable"><input type='text' name='postText'maxlength=1000></td></tr>
        <tr><td></td><td class="td-createTable"><input type='submit' value='作成'></td></tr>
    </table>
</form>
</div>

</body>

<footer></footer>

</html>
