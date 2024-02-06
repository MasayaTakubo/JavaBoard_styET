<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>掲示板</title>
    <link href="style.css" rel="stylesheet" type="text/css">
    
</head>
<body>
  <h1 id="page_top">あああ(仮)</h1>
<div class="container">
    <form action='createThreadServlet' method='post'>
        <table>
            <tr><th>スレッド名</th><td><input type='text' name='threadName'></td></tr>
            <tr><th>ユーザー名</th><td><input type='text' name='userName'></td></tr>
            <tr><th>投稿内容</th><td><input type='text' name='postText'></td></tr>
            <tr><td></td><td><input type='submit' value='作成'></td></tr>
        </table>
    </form>
</div>

</body>

<footer></footer>

</html>
