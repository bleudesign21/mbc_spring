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
<div class="container w-50 mt-5 p-5 shadow">
	<form action="<c:url value="/member/form"/>" method="post"
		onsubmit="return inputChk(this)">
		
		<h3 class="text-center"><i class="fas fa-user-plus"></i> 회원가입</h3>	
<%-- 		<div id="msg" style="color:red; height:50px;">${param.msg}</div> --%>
		<div id="msg" style="color:red; height:50px;">${msg}</div>
		<input class="form-control mb-2" type="text" id="id" name="id" placeholder="아이디" autofocus>		
		<input class="form-control mb-2" type="text" name="pw" placeholder="비밀번호">
		<input class="form-control mb-2" type="text" name="name" placeholder="이름">
		<input class="form-control mb-2" type="text" name="age" placeholder="나이">
		<input class="form-control mb-2" type="text" name="email" placeholder="이메일">
		<input class="form-control mb-2" type="text" name="phone" placeholder="전화번호">
		<input class="form-control mb-2" type="text" name="birthday" placeholder="생일">
		
		<label><input type="checkbox" name="hobby" value="music"/>음악감상</label>
		<label><input type="checkbox" name="hobby" value="sports"/>운동</label>
		<label><input type="checkbox" name="hobby" value="movie"/>영화</label>
			
		<div>
			<input type="submit" class="btn btn-primary" value="가입"/>
		</div>
	</form>
</div>
<script>
	function inputChk(obj){
		if(obj.id.value.length<3){
			setMsg("id의 길이는 3자리 이상이어야 합니다.", obj.id);
			return false;
		}
		
		if(obj.pw.value.length<3){
			setMsg("비밀번호의 길이는 3자리 이상이어야 합니다.", obj.pw);
			return false;
		}
		return true;
	}
	
	function setMsg(msg, elem){
		alert(msg);
	}
	
</script>
</body>
</html>