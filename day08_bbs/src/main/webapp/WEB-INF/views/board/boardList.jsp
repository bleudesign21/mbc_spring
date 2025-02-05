<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<div class="container w-75 mt-5 p-5 shadow">
    <h4>스프링 게시판</h4>
    <table class="table">
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>조회수</th>
                <th>글쓴이</th>
                <th>등록/수정일</th>
                <th>좋아요</th>
            </tr>            
        </thead>
        <tbody>
            <c:forEach var="dto" items="${list}">
                <tr>
                    <td>${dto.bid}</td>
                    <td>
                    	<!-- c:url은 현재 URL(http://localhost:8077/bbs/board/list.do)을 기준으로 해석 -->
                        
                        <!-- 상대경로: view.do는 단순 상대경로, 
                        	현재 URL 경로 /board를 기준으로 자동 변환, view.do => /board/view.do -->
                        <a href="<c:url value='view.do?bid=${dto.bid}&viewPage=${pDto.viewPage}'/>">${dto.subject}</a> 
                        
                        <!-- 절대경로: /board/view.do, 절대경로 아님: board/view.do(상대경로)에러 -->
                        <%-- <a href="<c:url value='/board/view.do?bid=${dto.bid}&viewPage=${pDto.viewPage}'/>">${dto.subject}</a> --%>
                    </td>
                    <td>${dto.hit}</td>
                    <td>${dto.writer}</td>
                    <td><fmt:formatDate value="${dto.modify_date != null ? dto.modify_date : dto.reg_date}" pattern="yyyy-MM-dd"/></td>
                    <td>
                        <button class="btn btn-sm btn-outline-danger like-btn" data-bid="${dto.bid}">♥ ${dto.likes}</button>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="6" class="text-center">
                    <button class="btn btn-primary" id="btn-write">글쓰기</button>
                </td>
            </tr>
        </tbody>
    </table>
</div>
<script>
	$("#btn-write").click(()=>{
		location.href="<c:url value='register.do'/>"
	});
	
	// 좋아요 버튼 클릭
	$(".like-btn").click(function(){
		let bid = $(this).data("bid");
		let btn = $(this);
		
		$.ajax({
			url: "like.do",
			type:"get",
			data:{bid:bid},
			success:function(){
				let currentLikes = parseInt(btn.text().trim().replace("♥",""));
				btn.text("♥ "+ (currentLikes + 1));
			},
			error:function(){alert("좋아요 추가 실패!!");}
		});
	});
</script>
</body>
</html>

<%-- <%@ include file="../include/header.jsp" %>

<div class="container w-75 mt-5 p-5 shadow">
    <h4>스프링 게시판</h4>
    <table class="table">
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>조회수</th>
                <th>글쓴이</th>
                <th>등록/수정일</th>
                <th>좋아요</th>
            </tr>            
        </thead>
        <tbody>
            <c:forEach var="dto" items="${list}">
                <tr>
                    <td>${dto.bid}</td>
                    <td>
                        <a href="<c:url value='view.do?bid=${dto.bid}&viewPage=${pDto.viewPage}'/>">${dto.subject}</a>
                    </td>
                    <td>${dto.hit}</td>
                    <td>${dto.writer}</td>
                    <td><fmt:formatDate value="${dto.modify_date != null ? dto.modify_date : dto.reg_date}" pattern="yyyy-MM-dd"/></td>
                    <td>
                        <button class="btn btn-sm btn-outline-danger like-btn" data-bid="${dto.bid}">♥ ${dto.likes}</button>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="6" class="text-center">
                    <button class="btn btn-primary" id="btn-write">글쓰기</button>
                </td>
            </tr>
        </tbody>
    </table>
</div>
</body>
</html> --%>