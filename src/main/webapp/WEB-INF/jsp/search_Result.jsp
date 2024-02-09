<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Results</title>
</head>
<body>
    <h1>Search Results</h1>
    
    <table border="1">
        <tr>
            <th>Thread ID</th>
            <th>Thread Title</th>
            <th>Creator Name</th>
            <th>Poster Name</th>
            <th>Content</th>
        </tr>
        <c:forEach items="${searchResults}" var="thread">
            <tr>
                <td>${thread.threadId}</td>
                <td>${thread.threadTitle}</td>
                <td>${thread.creatorName}</td>
                <td>${thread.posterName}</td>
                <td>${thread.content}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
