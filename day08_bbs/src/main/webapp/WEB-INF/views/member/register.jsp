<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%@ include file="../include/header.jsp" %>

<div class="container w-50 mt-5 p-5 shadow">
   <form action="memberInsert.do" method="post" enctype="application/x-www-form-urlencoded">
      <h4>회원가입</h4>
      <div class="row">
      	<div class="col-md-8 pe-0">
	      <input class="form-control mb-2" type="text" id="id" name="id" placeholder="아이디"> 
      	</div>
      	<div class="col-md-4">
      		<a class="btn btn-outline-info w-100" onclick="idCheck()">중복체크</a>
      	</div>      	
      </div>            
           
      <input class="form-control mb-2" type="text" name="pw" placeholder="비밀번호">
      <input class="form-control mb-2" type="text" name="name" placeholder="이름">
      <input class="form-control mb-2" type="text" name="age" placeholder="나이">
      <input class="form-control mb-2" type="text" name="email" placeholder="이메일">
      <input class="form-control mb-2" type="text" name="tel" placeholder="전화번호">
      
      <div class="text-center mt-3">
         <input type="submit" class="btn btn-primary" value="가입">
         <input type="reset" class="btn btn-info" value="취소">
      </div>
      
    </form>      
</div>
<!-- The Modal 
	class='fade' 애니메이션 적용
-->
<div class="modal fade" id="chkModal"> 
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">중복체크 확인</h4>
        <button type="button" class="btn-close" 
        data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body" id="chkMsg"></div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" 
        	data-bs-dismiss="modal">닫기</button>
      </div>

    </div>
  </div>
</div>

<script>
/* 	function idCheck(){
		let uid = $("#id").val(); // 사용자가 입력한 아이디
		console.log(uid);
		
		$.ajax({
			//옵션:지정값
			url:"<c:url value='memberIdCheck.do'/>",
			type:"get",
			data:{"uid":uid}, // 서버에 전송할 데이터
			success:function(responseData){ // responseData: 서버로부터 전송받은 데이터
				if(responseData == "yes"){
					//alert("사용가능한 아이디 입니다.");
					$("#chkMsg").text("사용가능한 아이디 입니다.");
				}else{
					//alert("사용중인 아이디 입니다.");
					$("#chkMsg").text("사용중인 아이디 입니다.");
				}
				$("#chkModal").modal("show"); // Modal을 보이도록 하는 명령 
			},
			error:function(){alert("서버 에러 입니다!!");}
		});
		
	} */
	
	// Axios를 이용한 비동기 처리
	function idCheck(){
		let uid = $("#id").val(); // 사용자가 입력한 아이디
		console.log(uid);
		
		axios.get("<c:url value='memberIdCheck.do'/>",{
			params:{uid: uid} // 서버로 전송할 데이터
		})
		.then(response => { // 성공시 서버로부터 응답 처리 then(함수)
			const responseData = response.data;
			if(responseData == "yes"){
				//alert("사용가능한 아이디 입니다.");
				$("#chkMsg").text("사용가능한 아이디 입니다.");
			}else{
				//alert("사용중인 아이디 입니다.");
				$("#chkMsg").text("사용중인 아이디 입니다.");
			}
			$("#chkModal").modal("show"); // Modal을 보이도록 하는 명령
		})
		.catch(error =>{
			alert("서버 에러!!");
		});		
	}
</script>









</body>
</html>