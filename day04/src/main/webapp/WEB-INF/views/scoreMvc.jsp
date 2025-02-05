<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>성적</h1>
<%-- 	<p>총점 : ${total}</p>
	<p>평균 : ${avg}</p> --%>
	<p>총점 : ${myScore.total}</p> <!-- myScore.getTotal()  -->
	<p>평균 : ${myScore.avg}</p><!-- myScore.getAvg() -->
</body>
</html>