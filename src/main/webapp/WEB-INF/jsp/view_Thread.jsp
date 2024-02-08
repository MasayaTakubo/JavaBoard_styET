<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ここに必要なCSSやJavaScriptのリンクを追加 -->

<%-- スレッド名の表示 --%>
<c:set var="threadName" value="" />
<c:forEach var="threadInfo" items="${threadInfoList}">
    <c:set var="threadName" value="${threadInfo.threadName}" />
</c:forEach>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${threadName}</title>
    <!-- ここにCSSやJavaScriptのリンクを追加 -->
    <link rel="stylesheet" href="../CSS/style.css">
    <style>
    @charset "UTF-8";
        body {
            padding: 5px 30px;
        }
        table {
            margin: auto;
        }
        form {
            margin: auto;
        }
        label {
            display: inline-block;
            width: 200px;
            text-align: center;
            margin-bottom: 5px;
        }
        textarea {
            height: 200px;
            width: 90%;
        }
        .form-group {
            display: flex;
            align-items: flex;
        }
    </style>
    <script>
        function convertEmptyToZero() {
            var postIdInput = document.getElementById('postId');
            if (postIdInput.value.trim() === '') { // 入力内容が空の場合
                postIdInput.value = '0'; // 0に変換
            }
        }
    </script>
</head>
<body>
<h2>スレッド名: ${threadName}</h2>

<table border="1">
    <thead>
        <tr>
            <th>投稿ID</th>
            <th>本文</th>
            <th>投稿者名</th>
            <th>投稿時間</th>
            <th><button>👍</button></th>
        </tr>
    </thead>
    <tbody>
        <!-- スレッド情報を表示 -->
        <c:forEach var="threadInfo" items="${threadInfoList}">
            <tr>
                <td>${threadInfo.postId}</td>
                <td>${threadInfo.content}</td>
                <td>${threadInfo.postUserName}</td>
                <td>${threadInfo.createTime}</td>
                <td>${threadInfo.likes}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<br>
<br>

<form action="CreatePostServlet" method="post" onsubmit="convertEmptyToZero()">
    <label for="threadId">スレッドID</label>
    <input type="text" name="threadId" value="${threadId}">
    
    
    <label for="postUserName">　　　投 稿 者 名　　　</label>
    <input type="text" id="postUserName" name="postUserName"><br>
    
    <label for="content">　　　本　   　文　　　</label>
    <textarea id="content" name="content"></textarea><br>
    
    <label for="postId">返信の場合はIDを入力</label>
    <input type="text" id="postId" name="postId"><br>
    
    <button type="submit">投稿</button>
</form>

</body>
</html>