
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
            <h1>掲示板サイト</h1>
            
            <nav>
              <!-- 1つめ -->
              <ul class="menu">
               <li> 
                  <a href="#">スレッドを書き込む</a>
                  <ul class="menu-second">
                    <%--書き込む --%>
                    <liclass="single"><a href="create_New_thread.jsp">書き込む</a></li>
                    
                  </ul>
                </li>
                <!-- 2 -->
                <li>
                  <a href="#">スレッドを検索する</a>
                  <ul class="menu-second">
                  <%--検索 --%>
                    <li class="single"><a href="serchThread.html">検索する</a></li>
                    
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
        
      <!-- ここにリストや、コンテンツをいれる -->  
      <div class="content">
      
      


    



<table >
	<!-- ここにスレッド-->
    <% for(int i = 0; i < DTOlist.size(); i++) { %>
    <% TopThreadDTO dto = (TopThreadDTO) DTOlist.get(i); %>
    <tr>
        <td><%= dto.getThread_ID() %></td>
        <td><a href="thread?id=<%= dto.getThread_ID() %>"><%= dto.getThread_Name() %></a></td>
        <td><%= dto.getCreator_Name() %></td>
    </tr>
<% } %>
    

</table>

</div>
    <footer >
        <span class="s1">
        <a href="サイトのリンク" target="_top">Web</a>
          
        <a href="サイトのリンク" target="_top">きりしま式</a>

        </span>
      </footer>
      
</body></html>