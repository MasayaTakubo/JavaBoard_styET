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
    <title>${threadName}</title>
    <!-- ここにCSSやJavaScriptのリンクを追加 -->
    <link rel="stylesheet" href="../CSS/style.css">
    <style>
        body {
            padding: 5px 30px;
        }
        table {
            margin: auto;
            width: 100%;
        }
        form {
            margin: 0 auto; /* 左右のマージンを自動調整して中央に配置 */
            width: fit-content; /* コンテンツの幅に合わせる */
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
        }
        .form-group {
            display: flex;
            align-items: flex;
        }
        hr.double {
            text-decoration: underline overline;
        }
        td.hr-double {
            border-bottom: 2px double black; /* 下線を2重線に変更 */
            padding-bottom: 5px; /* 下部の余白を追加 */
            width: 100%;
        }
        #mainText {
            width: 80%;
            text-align: center;
        }
    </style>

    
    
</head>
<body>

<h2>スレッド名: ${threadName}</h2>
<hr class="double">

<table id="sample">
    <thead>
        <tr>
            <th>投稿ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
            <th>投稿者名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
            <th>投稿時間&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
            <th>イイね</th>
        <tr>
            <th class="hr-double">本文</th>
        </tr>
    </thead>
</table>
<hr class="double">
<br><br>
<!-- スレッド情報を表示 -->
<!-- スレッド情報を表示 -->
<c:forEach var="parentPost" items="${threadInfoList}">
    <!-- 親投稿の表示 -->
    <table id="text">
        <tbody>
            <tr>
                <td>${parentPost.postId}     </td>
                <td>${parentPost.postUserName}     </td>
                <td>${parentPost.createTime}     </td>
                <td>
                    <!-- いいねボタン -->
                    <button class="like-button" data-post-id="${parentPost.postId}">👍</button>
                    <span id="likes-count-${parentPost.postId}">${parentPost.likes}</span>
                </td>
            </tr>
        </tbody>
    </table>
    <table id="text">
        <tbody>
            <tr>
                <td class="hr-double" id="mainText">${parentPost.content}</td>
            </tr>
            <br>
        </tbody>
    </table>
    <!-- 返信の表示 -->
    <c:forEach var="childPost" items="${parentPost.childPosts}">
        <table id="text">
            <tbody>
                <tr>
                    <td>${childPost.postId}     </td>
                    <td>${childPost.postUserName}     </td>
                    <td>${childPost.createTime}     </td>
                    <td>
                        <!-- いいねボタン -->
                        <button class="like-button" data-post-id="${childPost.postId}">👍</button>
                        <span id="likes-count-${childPost.postId}">${childPost.likes}</span>
                    </td>
                </tr>
            </tbody>
        </table>
        <table id="text">
            <tbody>
                <tr>
                    <td class="hr-double" id="mainText">${childPost.content}</td>
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

<hr class="double">
<form action="CreatePostServlet" method="post" onsubmit="return validateForm()">
    <input type="hidden" name="threadId" value="${threadId}">
    
    <label for="postUserName">　　　投 稿 者 名　　　</label>
    <input type="text" id="postUserName" name="postUserName"><br>
    
    <label for="content">　　　本　   　文　　　</label>
    <textarea id="content" name="content"></textarea><br>
    
    <label for="postId">返信の場合はIDを入力</label>
    <input type="text" id="postId" name="postId">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <button type="submit">投稿</button>

    <script>
        function validateForm() {
            var content = document.getElementById("content").value;
            if (content.trim() === "") {
                alert("本文が入力されていません。");
                return false; // フォームの送信をキャンセル
            } else {
                return true; // フォームの送信を継続
            }
        }
    </script>
</form>

<hr class="double">




</body>
</html>
