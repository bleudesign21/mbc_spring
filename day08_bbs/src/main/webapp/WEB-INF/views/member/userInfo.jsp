<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    
<%@ include file="../include/header.jsp" %>

	<div class='container'>
		<form class ='border w-50 rounded p-5 mx-auto shadow mb-5 mt-5' 
			action="<c:url value='memberUpdate.do'/>" method='get'>
			<h3 class='text-center'>회원정보</h3>
			<table class='mt-3 w-100'>	
				<thead>
					<tr>
						<th colspan='2'>${dto.name}님 회원정보</th>
					</tr>
				</thead>		
				<tbody>
					<tr>
						<td>회원번호 </td>
						<td><input class='ms-2 form-control mb-2' type='text' 
								name='uno' value='${dto.uno}' readonly/></td>
					</tr>
					<tr>
						<td>아이디</td>
						<td><input class='ms-2 form-control mb-2' type='text' 
								name='id' value='${dto.id}' disabled/></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input class='ms-2 form-control mb-2' type='text' 
								name='name' value='${dto.name}' disabled/></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input class='ms-2 form-control mb-2' type='text' 
								name='email' value='${dto.email}'/></td>
					</tr>
					<tr>
						<td>나이</td>
						<td><input class='ms-2 form-control mb-2' type='text' 
								name='age' value='${dto.age}'/></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input class='ms-2 form-control mb-2' type='text' 
								name='tel' size='3' value='${dto.tel}'/></td>
					</tr>
				</tbody>
			</table>
			<div class='mt-5 text-center'>				
				<input type='submit' class='btn btn-primary' value='수정하기'>
				<input type='reset' class='btn btn-secondary' value='취소'>
				<a href="<c:url value='memberList.do'/>" class='btn btn-info'>리스트</a>
			</div>
		</form>
	</div>
</body>
</html>