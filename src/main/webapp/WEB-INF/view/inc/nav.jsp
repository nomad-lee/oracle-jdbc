<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Home</title>
<!-- 구글 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<!-- 부트스트랩5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
	img { width:40px;}
	body { background-color:#196F3D;}
	a.nav-link:link { color:white; font-family: 'Gowun Dodum', sans-serif;}
	a.nav-link:visited { color:white; font-family: 'Gowun Dodum', sans-serif;}
	a.nav-link:hover { color:red; font-family: 'Gowun Dodum', sans-serif;}
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container-fluid">
		<a href="${pageContext.request.contextPath}/home">
			<img src="${pageContext.request.contextPath}/img/starbucks.png"/>
		</a>
		<!-- patitial jsp 페이지 -->
		
		<c:if test="${loginMember eq null}"> <!-- 로그아웃 상태 -->
			<ul class="nav justify-content-end tx-white">
				<li class="nav-item">
					<a id="nav1" class="nav-link" href="${pageContext.request.contextPath}/member/addMember">회원가입</a>
				</li>
				<li class="nav-item">
					<a id="nav2" class="nav-link" href="${pageContext.request.contextPath}/member/login">로그인</a>
				</li>
			</ul>		
		</c:if>
		
		
		<c:if test="${loginMember ne null}"> <!-- 로그인 상태 -->
			<ul class="nav justify-content-end tx-white">
				<li class="nav-item">
					<a id="nav1" class="nav-link" href="${pageContext.request.contextPath}/board/boardList">게시판</a>
				</li>
				<li class="nav-item dropdown">
					<a id="nav2" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" role="button" href="">${loginMember.memberName}</a>
					<ul class="dropdown-menu dropdown-menu-end dropdown-menu-lg-start">
					    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/memberOne">회원정보</a></li>
					    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
					</ul>				
				</li>
			</ul>
		</c:if>
	</div>
</nav>
</body>
</html>
