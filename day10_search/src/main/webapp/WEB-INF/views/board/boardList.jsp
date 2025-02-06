<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<div class="container mt-5">
    <h4>스프링 게시판</h4>
    <!-- ------------------- -->
    	<div>
		<form action="list.do" id="searchForm" method="post">
			<div class="d-flex justify-content-center">
				<select class="form-select form-select-sm me-2" style="width:200px" 
							name="searchType">
					<option value="">선택</option>
					<option value="S" ${pDto.searchType == 'S' ? 'selected':''}>제목</option>
					<option value="C" ${pDto.searchType == 'C' ? 'selected':''}>내용</option>
					<option value="W" ${pDto.searchType == 'W' ? 'selected':''}>글쓴이</option>
					<option value="SC" ${pDto.searchType == 'SC' ? 'selected':''}>제목 + 내용</option>
					<option value="SW" ${pDto.searchType == 'SW' ? 'selected':''}>제목 + 글쓴이</option>
					<option value="SCW" ${pDto.searchType == 'SCW' ? 'selected':''}>제목 + 내용 + 글쓴이</option>
				</select>
				<input type="text" id="keyword" name="keyword" placeholder="검색어입력"
					class="form-control rounded-0 rounded-start" style="width:300px" 
					value="${pDto.keyword}">
				<button class="btn rounded-0 rounded-end" style="background:#1384aa; color:white"><i class="fa fa-search"></i></button>
			</div>
		</form>
	</div>
	
	<div class="d-flex my-3 justify-content-between">
		<div><b>${pDto.viewPage}</b> / ${pDto.totalPage} pages</div>
		
		<!-- 검색이 없는 경우 -->
		<c:if test="${pDto.searchType == null || pDto.searchType ==''}">
	  	<div>
      		<select class="form-select form-select-sm" id="cntPerPage">
				<option value="5" ${pDto.cntPerPage == 5 ? 'selected':''}>게시글 5개</option>
      			<option value="10" ${pDto.cntPerPage == 10 ? 'selected':''}>게시글 10개</option>
      			<option value="20" ${pDto.cntPerPage == 20 ? 'selected':''}>게시글 20개</option>      		
      		</select>
      	</div>
      	</c:if>
      	<!-- 검색한 경우 경우 -->
		<c:if test="${pDto.searchType != null && pDto.searchType !=''}">
			<div>
			<select class="form-select form-select-sm" id="cntPerPage">
      			<c:choose>
      				<c:when test="${pDto.totalCnt <= 5}">
      					<option value="5" ${pDto.cntPerPage== 5 ? 'selected':''}>선택없음</option>
      				</c:when>
      				
      				<c:when test="${pDto.totalCnt > 5 && pDto.totalCnt < 10}">
      					<option value="5" ${pDto.cntPerPage== 5 ? 'selected':''}>게시글 5개</option>
		      			<option value="10" ${pDto.cntPerPage== 10 ? 'selected':''}>게시글 10개</option>
      				</c:when>
      				
      				<c:when test="${pDto.totalCnt >=10 && pDto.totalCnt < 20}">
      					<option value="5" ${pDto.cntPerPage== 5 ? 'selected':''}>게시글 5개</option>
		      			<option value="10" ${pDto.cntPerPage== 10 ? 'selected':''}>게시글 10개</option>
      				</c:when>
      				
      				<c:otherwise>
      					<option value="5" ${pDto.cntPerPage== 5 ? 'selected':''}>게시글 5개</option>
		      			<option value="10" ${pDto.cntPerPage== 10 ? 'selected':''}>게시글 10개</option>
		      			<option value="20" ${pDto.cntPerPage== 20 ? 'selected':''}>게시글 20개</option>
      				</c:otherwise>
      			</c:choose>
      		</select>
      		</div>
      	</c:if>
      	
	</div>
    <!-- ------------------- -->
    <table class="table">
        <thead class="table-dark">
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
                        <a href="<c:url value='view.do?bid=${dto.bid}&viewPage=${pDto.viewPage}&searchType=${pDto.searchType}&keyword=${pDto.keyword}&cntPerPage=${pDto.cntPerPage}'/>">${dto.subject}</a> 
                        
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
    
    <!-- 페이지 네이션 -->
    <ul class="pagination justify-content-center">
        <li class="page-item ${pDto.prevPage <=0 ? 'disabled':''}">
            <a class="page-link" href="list.do?viewPage=${pDto.prevPage}&searchType=${pDto.searchType}&keyword=${pDto.keyword}&cntPerPage=${pDto.cntPerPage}">이전</a>
        </li>

        <c:forEach var="i" begin="${pDto.blockStart}" end="${pDto.blockEnd}">
            <li class="page-item ${pDto.viewPage == i ? 'active':''}">
                <a class="page-link" href="list.do?viewPage=${i}&searchType=${pDto.searchType}&keyword=${pDto.keyword}&cntPerPage=${pDto.cntPerPage}">${i}</a>
            </li>
        </c:forEach>

        <li class="page-item ${pDto.blockEnd >= pDto.totalPage ? 'disabled':''}">
            <a class="page-link" href="list.do?viewPage=${pDto.nextPage}&searchType=${pDto.searchType}&keyword=${pDto.keyword}&cntPerPage=${pDto.cntPerPage}">다음</a>
        </li>
    </ul>
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
			success:function(response){
				alert(response);
				if(response === "success"){
					let currentLikes = parseInt(btn.text().trim().replace("♥",""));
					btn.text("♥ "+ (currentLikes + 1));					
				}
			},
			error:function(){alert("좋아요 추가 실패!!");}
		});
	});
	
	$("#cntPerPage").change(() => {
		var cntVal = $("#cntPerPage").val();
		alert(cntVal);
		location.href="list.do?viewPage=1&searchType=${pDto.searchType}&keyword=${pDto.keyword}&cntPerPage="+cntVal;
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