<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

 </style>
 <title>
 スレッド一覧
 </title>
 		<!--  Javascript -->
 		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 		<script src="${pageContext.request.contextPath}/JavaScript/script.js"></script>
  		<link href="${pageContext.request.contextPath}/CSS/toplist.css" rel="stylesheet" type="text/css">
  		<!--  <link href="${pageContext.request.contextPath}/CSS/style.css" rel="stylesheet" type="text/css">-->
 </head>
 
          <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<body>
<div class="wrapper">
    <main class="main">
        <header>
            <h1 id="title">JavaBoard_styET</h1>
            <nav>
                <ul class="menu">
                    <!-- 1つめ -->
                    <li>
                        <%--書き込む --%>
                        <a href="createNewThread"  class="link1">新規スレッド作成</a>
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
        <!-- page_top -->
        <%--ここからが矢印の範囲 --%>
          <a href="#" class="page-top">
              <div class="page-top__arrow"></div>
         </a>
        <div class="content">
            <table>
                <!-- ここにスレッド-->
                <!--  -->
                <tr>
                    <td><b>スレッドID</b></td>
                    <td><b>スレッド名</b></td>
                    <td><b>作者名</b></td>
                </tr>
                
                   <c:forEach var="dto" items="${DTOlist}">
                        <tr>
                            <td><c:out value="${dto.thread_ID}" /></td>
                            <td><a href="thread?id=<c:out value='${dto.thread_ID}' />" class="link2"><c:out value="${dto.thread_Name}" /></a></td>
                            <td><c:out value="${dto.creator_Name}" /></td>
                        </tr>
                   </c:forEach>
                </table>
            </div>
    </main>

    <footer>
        <span  style="color:white;'">
            <a href="TopServlet"  target="_top">JavaBoard_styET</a>
        </span>
    </footer>
</div>
</body>
</html>
