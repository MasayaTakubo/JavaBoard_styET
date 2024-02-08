
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

footer{
   background-color: #333;
   color: #fff;
   text-align: center;
   padding: 20px;
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

/*ヘッダーのリンク*/
.link2 {
	color: 101;
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
 
<body id="page_top">
      
      
      
        <header>
            <h1 id=""page_top">掲示板サイト</h1>
            
            <nav>
              <ul class="menu">
              <!-- 1つめ -->
               <li> 
                 <%--書き込む --%>
                  <a href="create_New_thread.jsp"  class="link1">スレッドを書き込む</a>
                  <ul class="menu-second">
                    
                    <li class="single"><a href="">書き込む</a></li>
                    
                  </ul>
                </li>
                
                <!-- 2 -->
                <li>
                <%--検索 --%>
                  <a href="serchThread.html"  class="link1">スレッドを検索する</a>
                  <ul class="menu-second">
                  
                    <li class="single"><a href="">検索する</a></li>
                    
                  </ul>
                </li>
                <!-- 
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
                </li>-->
              </ul>
              
            </nav>
        </header>
        

      <div class="content">



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
        <td><a href="thread?id=<%= dto.getThread_ID() %>" class="link2"><%= dto.getThread_Name() %></a></td>
        <td><%= dto.getCreator_Name() %></td>
    </tr>
<% } %>
    
</table>

</div>
    <!-- フッター -->
    <footer >
    
        <span class="s1">
        <a href="http://www.kent-web.com/"  target="_top">Web</a>
          
        <a href="サイトのリンク"  target="_top">きりしま式</a>

        </span>
      </footer>
      
</body></html>