<%@page import="org.apache.jasper.tagplugins.jstl.core.Param"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm</title>
<!-- 구글 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<!-- 부트스트랩5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
	h1 { font-family: 'Nanum Gothic Coding', monospace; color:white; padding-top:50px; font-size: 40px; text-align: center;}
	body { background-color:#196F3D;}
</style>
</head>
<body>
	<a href="${pageContext.request.contextPath}/home">홈으로</a>	
	<h1 class="mb-5">로그인</h1>
	<div>
		<!-- msg parameter값이 있으면 출력 -->
		<c:if test = "${param.msg ne null}">
			<c:out value="${param.msg}" />
		</c:if>
	</div>
	<div class="container">
		<form action="${pageContext.request.contextPath}/member/login" method="post">
			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="floatMemberId" placeholder="아이디를 입력하시오" name="memberId">
				<label for="floatMemberId">아이디</label>
			</div>
			<div class="form-floating mb-3">
				<input type="password" class="form-control" id="floatMemberPw" placeholder="비밀번호를 입력하시오" name="memberPw">
				<label for="floatMemberPw">패스워드</label>
			</div>
			<div class="text-center">
				<a type="btn" class="btn btn-dark btn-lg" href="${pageContext.request.contextPath}/member/addMember">회원가입</a>
				<button type="submit" class="btn btn-secondary btn-lg">로그인</button>
			</div>			
		</form>
	</div>	
</body>
</html>