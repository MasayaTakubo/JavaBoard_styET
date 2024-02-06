<<<<<<< HEAD
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- takeuchi0201 -->    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <style>
@charset "UTF-8";

html {
  font-size: 100%;
}
body {
  background-color: #f1f1f1;
  font-family: 'Poppins', sans-serif;
  font-size: 0.875rem;
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
*/
.single:hover .menu-second {
  visibility: visible;
}

/*
Menu Wide
「position: absolute;」で、menuクラスを基準に所定の位置に配置する
*/
.wide .menu-second {
  width: 100%;
  background-color: #3c3636;
  display: flex;
  justify-content: flex-start;
  flex-wrap: wrap;
  position: absolute;
  top: 50px;
  left: 0;
}
.wide .menu-second li {
  width: 25%;
}
.wide .menu-second li a:hover {
  opacity: 0.7;
}
/*
ホバー時にサブメニュー（Wide）を表示する
*/
.wide:hover .menu-second {
  visibility: visible;
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
>>>>>>> main

<%@ page language="java" contentType="text/html; charset="UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8">
    <title>タイトル</title>
    <meta name="description" content="テキストテキストテキストテキストテキストテキスト">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
  </head>

  <body id="page_top">
    <header>
      <h1></h1>
      <nav>
        <ul class="menu">
          <li class="single">
            <a href="#">Menu Single</a>
            <ul class="menu-second">
              <li><a href="#">Single Child</a></li>
              <li><a href="#">Single Child</a></li>
              <li><a href="#">Single Child</a></li>
            </ul>
          </li>
          <li class="wide">
            <a href="#">Menu Wide</a>
            <ul class="menu-second">
              <li><a href="#">Wide Child</a></li>
              <li><a href="#">Wide Child</a></li>
              <li><a href="#">Wide Child</a></li>
              <li><a href="#">Wide Child</a></li>
              <li><a href="#">Wide Child</a></li>
              <li><a href="#">Wide Child</a></li>
              <li><a href="#">Wide Child</a></li>
              <li><a href="#">Wide Child</a></li>
              <li><a href="#">Wide Child</a></li>
              <li><a href="#">Wide Child</a></li>
            </ul>
          </li>
          <li class="single">
            <a href="#">Menu Single</a>
            <ul class="menu-second">
              <li><a href="#">Single Child</a></li>
              <li><a href="#">Single Child</a></li>
              <li><a href="#">Single Child</a></li>
            </ul>
          </li><%@ page language="java" contentType="text/html; charset=UTF-8"
          pageEncoding="UTF-8"%>
          
      <!DOCTYPE html>
      <html>
      <head>
      <meta charset="UTF-8">
      <title>Insert title here</title>
      </head>
      <body id="page_top">
      
        <header>
            <h1>掲示板サイト</h1>
            <nav>
              <ul class="menu">
                <li class="single">
                  <a href="#">Menu Single</a>
                  <ul class="menu-second">
                    <li><a href="#">Single Child</a></li>
                    <li><a href="#">Single Child</a></li>
                    <li><a href="#">Single Child</a></li>
                  </ul>
                </li>
                <li class="wide">
                  <a href="#">Menu Wide</a>
                  <ul class="menu-second">
                    <li><a href="#">Wide Child</a></li>
                    <li><a href="#">Wide Child</a></li>
                    <li><a href="#">Wide Child</a></li>
                    <li><a href="#">Wide Child</a></li>
                    <li><a href="#">Wide Child</a></li>
                    <li><a href="#">Wide Child</a></li>
                    <li><a href="#">Wide Child</a></li>
                    <li><a href="#">Wide Child</a></li>
                    <li><a href="#">Wide Child</a></li>
                    <li><a href="#">Wide Child</a></li>
                  </ul>
                </li>
                <li class="single">
                  <a href="#">Menu Single</a>
                  <ul class="menu-second">
                    <li><a href="#">Single Child</a></li>
                    <li><a href="#">Single Child</a></li>
                    <li><a href="#">Single Child</a></li>
                  </ul>
                </li>
                <li class="wide">
                  <a href="#">Menu Wide</a>
                  <ul class="menu-second">
                    <li><a href="#">Wide Child</a></li>
                    <li><a href="#">Wide Child</a></li>
                    <li><a href="#">Wide Child</a></li>
                    <li><a href="#">Wide Child</a></li>
                    <li><a href="#">Wide Child</a></li>
                    <li><a href="#">Wide Child</a></li>
                  </ul>
                </li>
              </ul>
            </nav>
        </header>
        
        
      
      
      </body>
      </html>
          <li class="wide">
            <a href="#">Menu Wide</a>
            <ul class="menu-second">
              <li><a href="#">Wide Child</a></li>
              <li><a href="#">Wide Child</a></li>
              <li><a href="#">Wide Child</a></li>
              <li><a href="#">Wide Child</a></li>
              <li><a href="#">Wide Child</a></li>
              <li><a href="#">Wide Child</a></li>
            </ul>
          </li>
        </ul>
      </nav>
<<<<<<< HEAD
    </header>

    <table>
      <tr><td><a href>ここにスレッド</a></td></tr>
    </table>
    
    <form>
        <td><tr></tr></td>
    </form>
    
    
    <footer>
        <span class="s1">
        <a href="サイトのリンク" target="_top">Web</a>
          
        <a href="サイトのリンク" target="_top">きりしま式</a>

        </span>
      </footer>
  </body>
=======
  </header>
  <table>
  
  <nav><a href=""> ここにスレッドいれる</a></nav>
  </table>
</body>

<footer></footer>
>>>>>>> main
</html>