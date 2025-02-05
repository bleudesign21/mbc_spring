<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css' rel='stylesheet'>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js'></script>
</head>
<body>
	<h3>RegisterInfo</h3>
	<div class="container w-50 mt-5 p-5 shadow">
      <p>id : ${member.id}</p>
      <p>pw : ${member.pw}</p>
      <p>name : ${member.name}</p>
      <p>age : ${member.age}</p>
      <p>email : ${member.email}</p>
      <p>phone : ${member.phone}</p>
      <p>birthday : ${member.birthday}</p>
</div>
</body>
</html>