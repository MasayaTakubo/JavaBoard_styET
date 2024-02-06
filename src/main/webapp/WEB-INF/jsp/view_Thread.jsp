<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<!-- ↓jspでスレッド名をもらう -->
		<title>スレッド一覧＿${.TN}</title>
		<style>
			@import url();
		</style>
	</head>
	<body>
		<!-- ↓jspでスレッド名をもらう -->
		<h1 id="page_top">スレッド一覧＿${.TN}</h1>
		<c:forEach>
			No：${.no} &nbsp 日時：${.date}<br>
			投稿者：${.name}<br>
			${.text}<br>
			${.reply}
			${.like}<hr><br>
		</c:forEach>

		<form id="content" method="post" action="kari">
			ユーザー名<input type="text" name="Post_User_Name"><br>
			コメント<input type="text" name="Content"><br>
			<input type="submit" value="投稿" />
		</form>

		<nav>
			<ul>
				<li><a href="３">スレッド一覧</a></li>
				<li><a href="３">検索ページ</a></li>
				<li><a href="３">スレッド作成</a></li>
				<li><a href="#page_top">ページの一番上へ</a></li>
				<li><a href="#content">コメント入力欄へ</a></li>
			</ul>
		</nav>

	</body>
</html>

	<!-- th=文字表示　td=リスト内表示
		jsp		:	Oracle
		
		.TN		= ThreadName
		.no		=	Post_ID
		.thread	=	Thread_ID
		.text	=	Content
		.name	=	Post_User_Name
		.time	=	Create_Time
		.like	=	Likes
		.reply	=	Post_Reply_ID
	-->