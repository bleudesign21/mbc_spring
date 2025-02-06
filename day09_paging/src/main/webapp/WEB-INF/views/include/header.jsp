<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>                                  
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css' rel='stylesheet'>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js'></script> 
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		  <div class="container-fluid">
		    <ul class="navbar-nav">
		      <li class="nav-item">
		        <a class="nav-link active" href="<c:url value='/'/>">Home</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="<c:url value='/member/memberRegister.do'/>">회원가입</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="<c:url value='/member/memberList.do'/>">회원리스트</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="<c:url value='/board/list.do'/>">게시판리스트</a>
		      </li>
		    </ul>
		  </div>
		</nav>
	</header>

<!-- </body>
</html> -->