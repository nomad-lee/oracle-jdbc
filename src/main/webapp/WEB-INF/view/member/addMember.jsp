<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AddMember</title>
<!-- 구글 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<!-- 부트스트랩5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
	h1 { font-family: 'Nanum Gothic Coding', monospace; color:white; padding-top:50px; font-size: 40px; text-align: center;}
	body { background-color:#196F3D;}
</style>
</head>
<body>
	<div>
		<c:import url="../inc/nav.jsp"></c:import>		
	</div>
	<h1 class="mb-5">회원가입</h1>
	<div>
	</div>
	<div class="container">		
		<form action="${pageContext.request.contextPath}/member/addMember" method="post">
			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="floatMemberId" placeholder="아이디를 입력하시오" name="memberId">
				<label for="floatMemberId">아이디</label>
			</div>
			<div class="form-floating mb-3">
				<input type="password" class="form-control" id="floatMemberPw" placeholder="비밀번호를 입력하시오" name="memberPw">
				<label for="floatMemberPw">패스워드</label>
			</div>
			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="floatMemberName" placeholder="이름을 입력하시오" name="memberName">
				<label for="floatMemberName">이름</label>
			</div>
			<div class="text-center">
				<button class="btn btn-secondary btn-lg center" type="submit">가입완료</button>
			</div>			
		</form>
	</div>	
</body>
</html>