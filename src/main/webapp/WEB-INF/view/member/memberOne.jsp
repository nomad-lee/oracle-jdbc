<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberOne</title>
<!-- 구글 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<!-- 부트스트랩5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
	h2 { font-family: 'Nanum Gothic Coding', monospace; color:white; padding-top:50px; padding-bottom:10px; font-size:44px;}
	body { background-color:#196F3D;}
	a:link { color:black; text-decoration: none; font-family: 'Gowun Dodum', sans-serif;}
</style>
</head>
<body>
	<div>
		<c:import url="../inc/nav.jsp"></c:import>		
	</div>	
	<h2 class="text-center">${loginMember.memberName}님 환영합니다</h2>
	<ol class="list-group px-5 fw-bold"> <!-- list-group-numbered 넘버링 가능 -->
		<li class="list-group-item list-group-item-action list-group-item-dark text-center d-grid">
			<a class="btn btn-sm text-dark fs-4" href="${pageContext.request.contextPath}/member/modifyMember">회원정보수정</a>
		</li>
		<li class="list-group-item list-group-item-action list-group-item-dark text-center d-grid">
			<a class="btn btn-sm text-dark fs-4" href="${pageContext.request.contextPath}/member/removeMember">회원탈퇴</a>
		</li>
	</ol>
</body>
</html>