<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang=ja>
<head>
<meta charset="UTF-8">
<title>?????????</title>
</head>
<body>

<form action='createThreadServlet' method='post'>
<table>

<tr><th>??</th><td><input type='text' name='threadName'></td></tr>
<tr><th>??</th><td><input type='text' name='userName'></td></tr>
<tr><th>??</th><td><input type='text' name='postText'></td></tr>
<tr><td></td><td><input type='submit' value='??'></td></tr>

</table>
</form>

</body>
</html>


