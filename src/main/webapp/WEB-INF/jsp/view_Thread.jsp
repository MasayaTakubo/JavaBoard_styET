<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%-- スレッド名の表示 --%>
<c:set var="threadName" value="" />
<c:forEach var="threadInfo" items="${threadInfoList}">
    <c:set var="threadName" value="${threadInfo.threadName}" />
</c:forEach>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <title>スレッドページ</title>
    <a  id="TOP"></a>
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
        /* navタグのcss */
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
        /* navのcssここまで */
        table {
            margin: auto;
            width: 1000px;
            border-collapse: collapse;
            table-layout: fixed;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            /*word-wrap: break-word;*/ /* テキストの折り返しを有効にする */
            word-break: break-all; /* テーブル幅に合わせて改行する */
            white-space: pre-wrap; /* テキストの折り返しを有効にする */
        }
        td.time{
        	 width: 400px;
        }
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
</head>
<body>


<h2>スレッド名: <c:out value="${threadName}"/></h2>

<hr class="double">
<nav>
    <ul class="menu">
        <li> 
            <a href="TopServlet" class="link1">スレッド一覧へ</a>
            <ul class="menu-second"></ul>
        </li>
        <li>
            <a href="createNewThread" class="link1">新規スレッド作成</a>
            <ul class="menu-second"></ul>
        </li>
        <li>
            <a href="HTML/ThreaeSerch.html" class="link1">スレッドを検索する</a>
            <ul class="menu-second"></ul>
        </li>
        <li>
            <a href="#POST" class="link1">投稿欄へ</a>
            <ul class="menu-second"></ul>
        </li>
    </ul>
</nav>
<hr class="double">
<br><br>

<!-- スレッド情報を表示 -->
<c:forEach var="parentPost" items="${threadInfoList}">
    <!-- 親投稿の表示 -->
    <table id="text">
        <tbody>
            <tr>
                <td>${parentPost.postId}     </td>
                <td>名前：<c:out value="${parentPost.postUserName}"/>     </td>
                <td class="time">投稿時間：${parentPost.createTime}     </td>
                <td>
                    <!-- いいねボタン -->
                    <button class="like-button" data-post-id="${parentPost.postId}">いいね👍</button>
                    <span id="likes-count-${parentPost.postId}">${parentPost.likes}</span>
                </td>
            </tr>
        </tbody>
    </table>
    <table id="text">
        <tbody>
            <tr>
            	<td class="hr-double" id="mainText"><c:out value="${parentPost.content}"/></td>

            </tr>
            <br>
        </tbody>
    </table>
    <!-- 返信の表示 -->
    <c:forEach var="childPost" items="${parentPost.childPosts}">
        <table class="subText">
            <tbody>
                <tr>

                    <td>>>${childPost.postId}     </td>
                    <td>名前：<c:out value="${childPost.postUserName}"/>     </td>

                    <td class="time">投稿時間：${childPost.createTime}     </td>
                    <td>
                        <!-- いいねボタン -->
                        <button class="like-button" data-post-id="${childPost.postId}">いいね👍</button>
                        <span id="likes-count-${childPost.postId}">${childPost.likes}</span>
                    </td>
                </tr>
            </tbody>
        </table>
        <table class="subText">
            <tbody>
                <tr>
                    <td class="hr-double" id="mainText"><pre><c:out value="${childPost.content}"/></pre></td>
                </tr>
                <br>
            </tbody>
        </table>
    </c:forEach>
</c:forEach>
<script>
    // すべての「いいね」ボタンに対してイベントリスナーを追加
    document.addEventListener('DOMContentLoaded', function() {
        // すべての「いいね」ボタンに対してイベントリスナーを追加
        document.querySelectorAll('.like-button').forEach(function(button) {
            button.addEventListener('click', function() {
                var postId = this.getAttribute('data-post-id');
                // サーバーにリクエストを送信
                fetch('LikeServlet?postId=' + postId, { method: 'POST' })
                    .then(function(response) {
                        if (response.ok) {
                            // レスポンスが成功した場合、いいねの数を更新
                            var likesCountElement = document.getElementById('likes-count-' + postId);
                            likesCountElement.textContent = parseInt(likesCountElement.textContent) + 1;
                        } else {
                            console.error('Request failed: ' + response.status);
                        }
                    });
            });
        });
    });
</script>
<hr class="double" id="POST">
<form action="CreatePostServlet" method="post" onsubmit="return validateForm()">
    <input type="hidden" name="threadId" value="${threadID}">
    <label for="postUserName">　　　投稿者名　　　</label>
    <input type="text" id="postUserName" name="postUserName" maxlength=50><br>
    <label for="content">　　　本　　　文　　　</label>
    <textarea id="content" name="content" maxlength=1000></textarea><br>
    <label for="postId">返信の場合はIDを入力</label>
    <input type="text" id="postId" name="postId">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <button type="submit">投稿</button>
    <script>
    function validateForm() {
        var content = document.getElementById("content").value;
        var postId = document.getElementById("postId").value;

        // 本文が空の場合
        if (content.trim() === "") {
            alert("本文が入力されていません。");
            return false; // フォームの送信をキャンセル
        }

        // 返信IDが数値でない場合
        if (isNaN(postId)) {
            alert("返信IDは数値で入力してください。");
            return false; // フォームの送信をキャンセル
        }

        return true; // フォームの送信を継続
    }
</script>

</form>
<hr class="double">
</body>
<footer>
    <nav>
    <ul class="menu">
        <li> 
            <a href="TopServlet" class="link1">スレッド一覧へ</a>
            <ul class="menu-second"></ul>
        </li>
        <li>
            <a href="createNewThread" class="link1">新規スレッド作成</a>
            <ul class="menu-second"></ul>
        </li>
        <li>
            <a href="HTML/ThreaeSerch.html" class="link1">スレッドを検索する</a>
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
