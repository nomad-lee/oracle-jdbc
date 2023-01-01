<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RemoveMember</title>
<!-- 구글 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<!-- 부트스트랩5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){	 
		// 폼 유효성 검사   
	    $('#btnSubmit').click(function() {
			if($('#memberPw').val() == '') { // .val().length < 1으로도 가능
				alert('비밀번호를 입력하세요');
				memberPw.focus();
				return;
			}
		});
	  });	
</script>
<style>
	h1 { font-family: 'Nanum Gothic Coding', monospace; color:white; padding-top:50px; font-size: 40px; text-align: center;}
	body { background-color:#196F3D;}
	td { color:white; text-align: center;} /* id선택자 #으로 사용 */
</style>
</head>
<body>
	<div>
		<c:import url="../inc/nav.jsp"></c:import>
	</div>
	<h1 class="mb-5">회원탈퇴</h1>
	<div class="container">		
		<form action="${pageContext.request.contextPath}/member/removeMember" method="post">
			<table class = "table">
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="memberId" name="memberId" value="${loginMember.memberId}" readonly>
					<label for="memberId">아이디</label>
				</div>
				<div class="form-floating">
					<input type="password" class="form-control" id="memberPw" name="memberPw">
					<label for="memberPw">패스워드</label>
				</div>
			</table>
			<div class="text-center">
				<button class="btn btn-danger btn-lg center" id="btnSubmit" type="submit">탈퇴확정</button>
			</div>			
		</form>
	</div>	
</body>
</html>