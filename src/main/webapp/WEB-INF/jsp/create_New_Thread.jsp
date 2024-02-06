<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>掲示板</title>
    <link href="style.css" rel="stylesheet" type="text/css">
    
</head>
<body class="body-createTable">
  <h1 id="page_top">あああ(仮)</h1>
<div class="container-createTable">
    <form action='createThreadServlet' method='post'>
        <table class="table-createTable">
            <tr><th class="th-createTable">スレッド名</th><td class="td-createTable"><input type='text' name='threadName'></td></tr>
            <tr><th class="th-createTable">ユーザー名</th><td class="td-createTable"><input type='text' name='userName'></td></tr>
            <tr><th class="th-createTable">投稿内容</th><td class="td-createTable"><input type='text' name='postText'></td></tr>
            <tr><td></td><td class="td-createTable"><input type='submit' value='作成'></td></tr>
        </table>
    </form>
</div>

</body>

<footer></footer>

</html>
