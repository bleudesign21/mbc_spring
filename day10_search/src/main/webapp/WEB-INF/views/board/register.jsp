<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<div class="container w-50 mt-5 p-5 shadow">
    <form action="register.do" method="post">
        <h4>글쓰기</h4>
        
        <input type="text" class="form-control" 
            id="subject" name="subject" placeholder="글제목" autofocus required />
            
        <textarea class="form-control mt-2" name="contents" id="contents"
            placeholder="글내용" required></textarea>
             
        <input type="text" class="form-control mt-2" 
            id="writer" name="writer" placeholder="작성자" required />      
             
        <div class="text-center mt-3">
            <button type="submit" class="btn btn-primary">글등록</button>
        </div>          
    </form>
</div>
</body>
</html>