<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
	<%@ include file="../include/header.jsp" %>
		                                                                                                 
			<div class='container mt-5'>                                                                        
				<h2>회원 리스트</h2>                                                                            
				<table class='table'>                                                                           
					<thead class='table-dark'>                                                                  
						<tr>                                                                                    
							<th>번호</th>                                                                       
							<th>아이디</th>                                                                     
							<th>비밀번호</th>                                                                   
							<th>이름</th>                                                                       
							<th>나이</th>                                                                       
							<th>이메일</th>                                                                     
							<th>전화번호</th>                                                                   
							<th>삭제</th>                                                                       
						</tr>                                                                                   
					</thead>                                                                                    
					<tbody>                                                                                     
					                                                                                            
		
		<%-- <% for( UserDTO dto : list) { %> --%>
		<c:forEach var="dto" items="${list}">
			<tr>                                                                                             
				<%-- <td><%=dto.getUno()%></td> --%>                                                                
				<td>${dto.uno}</td>                                                                
				<td><a href="<c:url value='memberInfo.do?uno=${dto.uno}&viewPage=${pDto.viewPage}'/>" >${dto.id}</a></td>
				<td>${dto.pw}</td>                                                                 
				<td>${dto.name}</td>                                                                   
				<td>${dto.age}</td>                                                                    
				<td>${dto.email}</td>                                                                  
				<td>${dto.tel}</td>                                                                    
				<td><a href="<c:url value='memberDelete.do?uno=${dto.uno}'/>" 
					class='btn btn-danger btn-sm'>삭제</a></td>                                                                                
			</tr>                                                                                            
		<%-- <% } %> --%>
			
		
		</c:forEach>
		</tbody>
		</table>
		
		    <!-- 페이지 네이션 -->
    <ul class="pagination justify-content-center">
        <li class="page-item ${pDto.prevPage <=0 ? 'disabled':''}">
            <a class="page-link" href="memberList.do?viewPage=${pDto.prevPage}">이전</a>
        </li>

        <c:forEach var="i" begin="${pDto.blockStart}" end="${pDto.blockEnd}">
            <li class="page-item ${pDto.viewPage == i ? 'active':''}">
                <a class="page-link" href="memberList.do?viewPage=${i}">${i}</a>
            </li>
        </c:forEach>

        <li class="page-item ${pDto.blockEnd >= pDto.totalPage ? 'disabled':''}">
            <a class="page-link" href="memberList.do?viewPage=${pDto.nextPage}">다음</a>
        </li>
    </ul>
	</div>	
		<script>
			function showList(){
				$.ajax({
					url:"<c:url value='/memberAjaxList.do'/>",
					type:"get", 
					dataType:"json", // 서버에서 응답하는 데이터 형식
					success:resultList, // 서버에서 성공적으로 요청이 수행되면 호출되는 함수명
					error:function(){alert("error")}
				});
			}
			// 매개변수 data == 서버로부터 json형식으로 변환되어 전송된 데이터
			function resultList(data){
				alert("요청처리 성공!!");
				console.log(data);
				
				let html= "<table class='table'>";                                                                                     
				 html+="   <thead class='table-dark'>  ";                                                                            
				 html+="     <tr>                      ";                                                                            
				 html+="       <th>번호</th>           ";                                                                            
				 html+="       <th>아이디</th>         ";                                                                            
				 html+="       <th>비밀번호</th>       ";                                                                            
				 html+="       <th>이름</th>           ";                                                                            
				 html+="       <th>나이</th>           ";                                                                            
				 html+="       <th>이메일</th>         ";                                                                            
				 html+="       <th>전화번호</th>       ";                                
				 html+="     </tr>                     ";                                                                            
				 html+="   </thead>                    ";                                                                            
				 html+="   <tbody>                     ";
				 
				 $.each(data, function(index, obj){
						html+="<tr>";
						html+="<td>"+obj.uno+"</td>";	
						html+="<td>"+obj.id+"</td>";	
						html+="<td>"+obj.pw+"</td>";	
						html+="<td>"+obj.name+"</td>";	
						html+="<td>"+obj.age+"</td>";	
						html+="<td>"+obj.email+"</td>";	
						html+="<td>"+obj.tel+"</td>";
						html+="</tr>";
					 });	
						html+="</tbody>";
						html+="</table>";
				
					$("#ajaxList").html(html);
			}
		</script>
						                                                                                                  
		</body>                                                                                                 
		</html>                        
