<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>掲示板</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 600px;
        }

        table {
            width: 100%;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        input[type="text"] {
            width: calc(100% - 20px);
            padding: 10px;
            box-sizing: border-box;
            margin-bottom: 10px;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: #fff;
            padding: 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }
    </style>
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
</html>
