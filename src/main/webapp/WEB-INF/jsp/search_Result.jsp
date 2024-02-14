<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
                <td><c:out value="${thread.threadTitle}"/></td>
                <td><c:out value="${thread.creatorName}"/></td>
                <td><c:out value="${thread.posterName}"/></td>
                <td><c:out value="${thread.content}"/></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
