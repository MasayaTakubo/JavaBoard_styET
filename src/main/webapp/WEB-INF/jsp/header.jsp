<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DTO.TopThreadDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>掲示板サイト</title>
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

   background-color: #000000;
   position: absolute;/*fixed*/
   bottom: 0;
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

/*-------------------------------------------
SP
-------------------------------------------*/
@media screen and (max-width: 600px) {
  body {
    font-size: 0.75rem;
  }

}
 
 </style>
</head>
<body>
<header>
    <h1 id="page_top">JavaBoard_styET</h1>
    
    <nav>
        <ul class="menu">
            <!-- 1つめ -->
            <li>
                <%--書き込む --%>
                <a href="TopServlet" class="link1">スレッド一覧へ</a>
                <ul class="menu-second">


                </ul>
            </li>

            <!-- 2 -->
            <li>
                <%--検索 --%>
                <a href="HTML/ThreaeSerch.html" class="link1">スレッドを検索する</a>
                <ul class="menu-second">

                </ul>
            </li>

        </ul>

    </nav>
</header>
</body>
</html>
