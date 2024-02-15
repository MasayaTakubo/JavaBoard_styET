
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DTO.TopThreadDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List"%>
<%
    // セッションスコープに保存されたデータを取得
    List<TopThreadDTO> DTOlist = (List<TopThreadDTO>)session.getAttribute("DTOlist");
    if (DTOlist == null) {
        System.out.println("DTOlist is null"); // ログにメッセージを出力
    } else {
        System.out.println("DTOlist size: " + DTOlist.size()); // ログにDTOlistのサイズを出力
    }
%>	
<!-- takeuchi0201 -->    
<!DOCTYPE =html>
<html>
<head>
 <style>
@charset "UTF-8";

/*下部h1タグの要素*/
#page_top {
 color: black;
}

html {
  font-size: 100%;
}
body {
  background-color: #f1f1f1;
  font-family: 'Poppins', sans-serif;
  font-size: 0.875rem;
  flex-direction: column;/*積み重ねる*/
  min-height: 100vh;/*コンテンツの高さに合わせて自動*/
 padding: 0; /* ここで四辺すべてを0に設定 */
 font-family: Meiryo,sans-serif;/*フォント*/
}
ul {
  list-style: none;
}
a {
  text-decoration: none;
  color: #fff;
}

header {
  width: 100%;
  background-color: #fff;
}
h1 {
  height: 140px;
  line-height: 140px;
  font-size: 1.625rem;
  text-align: center;
}
nav {
  background-color: #121212;
}

footer{
    
       position: sticky; /**/
   bottom: 0; /*最下部*/
   background-color: #000000;
   width: 99%;/*100%にすると右にはみでる*/
   color:#121212;
   text-align: center;
   padding: 1em;
   box-sizing: border-box; /* パディングを含めた全体の幅と高さを指定 */
    z-index: 100;  /* 必要に応じて他の要素よりも上に表示 */

}
/*
グローバルナビゲーション
「position: relative;」で、サブメニュー（Wide）の基準位置として設定
*/
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
/*
「display: block;」でリンク範囲を親要素と同じ範囲まで広げる
*/
.menu > li a {
  display: block;
}
/*
ドロップダウン用のメニュー
初期状態は表示しないため、「visibility: hidden;」で非表示にしておく
*/
.menu-second {
  visibility: hidden;
}

/*
Menu Single
「position: relative;」で、サブメニュー（Single）の基準位置として設定
*/
.menu > .single {
  position: relative;
}
/*
「position: absolute;」で、singleクラスを基準に所定の位置に配置する
*/
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
/*
ホバー時にサブメニュー（Single）を表示する
.single:hover .menu-second {
  visibility: visible;
}*/
/*ヘッダーのリンク*/
.link1 {
        color: glay; /* 灰色のリンク */
}

/*スレッドのリンク*/
.link2 {
	color: #004d25;
	font-weight: bold;
	text-decoration: underline;/*常に下線追加*/
}

/*スレッド名のカーソルを合わせると色が変わる*/
a.link2:hover{
	color: #00a33a; /*森グリーン*/
	font-size: 16px;
	font-weight: bold;
	text-decoration: none;/*下線消す*/
}

/*  content
----------------------------*/
  .content{
    flex-grow: 1; /* フッターの手前までコンテンツを伸ばす */
    padding: 20px;
  }
/*
テーブル機能
-----------------*/
  table {
        border-collapse: collapse;
        width: 100%;
        background-color: d4d9df;
  }
  th, td {
       border: 1px solid black;
       padding: 8px;
       text-align: left;
  }
    th {
        background-color: #f2f2f2;
    }
    tr:nth-child(even) {
       color: black;
       background-color: #f2f2f2;
    }

    /*  content
----------------------------*/
  .content{
    color:#fff;
    flex-grow: 1; /* フッターの手前までコンテンツを伸ばす */
    padding: 5px 1em 0px 1em;
    padding-bottom: 60px; /* フッターの高さ分の余白を追加 */
    flex:1px;
  }
  .wrapper {
  	display: flex;
  	flex-direction: column;
  	min-height: 100vh;
  	padding: 5px 1em 0 1em;
  }

/*---------
フッター
------------------------*/
 span{
 
 }
 /*トップに戻る矢印↑*/
 .pagetop {
    position: fixed;
  bottom: 30px;
  right: 30px;
  width: 0;
  height: 0;
  border-style: solid;
  border-width: 0 14px 24px 14px;
  border-color: transparent transparent #000000 transparent;
  cursor: pointer;
  transition: all 0.3s ease;
/*   デフォルトは非表示 
  opacity: 0; */
}

.pagetop:hover {
    filter: brightness(1.2);
}

.pagetop:hover::after {
  content: '';
  position: absolute;
  top: -20px;
  left: calc(50% - 10px);
  width: 0;
  height: 0;
  border-style: solid;
  border-width: 0 10px 17.32px 10px; /* 三角形のサイズと形状を調整 */
  border-color: transparent transparent #00A6C4 transparent; /* 三角形の色を指定 */
  transform: rotate(180deg); /* 三角形を下向きに配置 */
}
/*-------------------------------------------
スマホ用の切り替え
-------------------------------------------*/
@media screen and (max-width: 600px) {
  body {
    font-size: 0.75rem;
  }

}
 
 </style>
 		<!-- JavaScript -->
	<script src="../JavaScript/script.js"></script>
 </head>
 

<body >
	<div class ="wrapper">
		
		<header>
			
			<h1 id="page_top">掲示板サイト</h1>
			
			<nav>
				<ul class="menu">
				<!-- 1つめ -->
				<li>
				<%--書き込む --%>
				<a href="createNewThread"  class="link1">スレッドを書き込む</a>
				<ul class="menu-second">
				
				
				</ul>
				</li>

				<!-- 2 -->
				<li>
				<%--検索 --%>
				<a href="HTML/ThreaeSerch.html"  class="link1">スレッドを検索する</a>
				<ul class="menu-second">

				</ul>
				</li>
				
				</ul>
				
			</nav>
	</header>


	<div class="content">
		<main >
		<%--やじるし　↑ --%>
		<div class ="pagetop"></div>
	<table >
		<!-- ここにスレッド-->
		<!--  -->
	<tr>
	<td><b>スレNo</b></td>
	<td><b>スレッド名</b></td>
	<td><b>作者名</b></td>
	</tr>
	<% for(int i = 0; i < DTOlist.size(); i++) { %>
		<% TopThreadDTO dto = (TopThreadDTO) DTOlist.get(i); %>
	<tr>
			<td><%= dto.getThread_ID() %></td>
			<td><a href="thread?id=<%= dto.getThread_ID() %>" class="link2"><%= dto.getThread_Name() %>
					</a></td>
			<td><%= dto.getCreator_Name() %></td>
	</tr>
	<% } %>

	</table>
	
	<%---- コンテンツのdiv -- --%>
	</div>
	</main>
	
	
	<%--wrapperのdiv --%>
</div>
    
    <footer >
    
        <span  style="color:white;'">
        <a href="サイトのリンク"  target="_top">sty_ET'sWeb</a>
          
        <a href="サイトのリンク"  target="_top">きりしま式</a>

        </span>

        
    </footer>
      


</body>
</html>
