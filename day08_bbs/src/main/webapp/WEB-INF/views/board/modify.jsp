<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<div class="container w-50 mt-5 p-5 shadow">
    <h4>글 수정</h4>
    <form action="<c:url value='modify.do'/>" method="post">
        <div class="form-group">
            <label for="bid">번호</label>        
            <input class="form-control" type="text" id="bid" 
                name="bid" value="${dto.bid}" readonly>
        </div> 
        <div class="form-group">
            <label for="subject">제목</label>     
            <input class="form-control" type="text" id="subject" 
                name="subject" value="${dto.subject}" required>      
        </div>
        <div class="form-group">
            <label for="contents">내용</label>
            <textarea class="form-control mt-2" 
                name="contents" id="contents" required>${dto.contents}</textarea>
        </div>
        <div class="form-group">
            <label for="writer">글쓴이</label>
            <input class="form-control mt-2" type="text" 
                id="writer" name="writer" value="${dto.writer}" disabled>
        </div>
        <div class="form-group">
            <label>등록/수정일</label>
            <input class="form-control" type="text" 
        value="<fmt:formatDate value='${dto.modify_date != null ? dto.modify_date : dto.reg_date}' 
        pattern='yyyy-MM-dd HH:mm'/>" 
        disabled>
        </div>

        <div class="text-center mt-3">
            <button type="submit" class="btn btn-primary me-2">수정하기</button>   
            <button type="button" id="btn-list" class="btn btn-primary">리스트</button>   
        </div>
    </form>

    <!-- 삭제 버튼을 form 밖으로 이동 -->
    <div class="text-center mt-2">
        <button id="btn-remove" class="btn btn-danger">삭제하기</button>   
    </div>
</div>
<script type="text/javascript">    
    $("#btn-list").click(() => {
        location.href = "<c:url value='list.do'/>";
    });

    $("#btn-remove").click(() => {
        if (confirm("정말 삭제하시겠습니까?")) {
            location.href = "<c:url value='remove.do?bid=${dto.bid}'/>";
        }
    });    
</script>

