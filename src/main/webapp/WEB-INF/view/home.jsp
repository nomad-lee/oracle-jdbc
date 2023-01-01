<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<!-- 구글 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<!-- 부트스트랩5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
	h1 { font-family: 'Nanum Gothic Coding', monospace; color:white; padding-top:50px; font-size:84px;}
	h2 { font-family: 'Nanum Gothic Coding', monospace; color:white; padding-top:50px; padding-bottom:10px; font-size:44px;}
	body { background-color:#196F3D;}
	img { transition: all 0.5s linear; display:block; margin:auto; width:250px;}
	img:hover { transform: rotateY( 180deg )} /* CSS 애니메이션 */
	a:link { color:black; text-decoration: none; font-family: 'Gowun Dodum', sans-serif;}
</style>
</head>
<body>
	<div class="container">
	 	<img class="pt-3" src="${pageContext.request.contextPath}/img/starbucks.png"/>
	</div>	
	<c:if test="${loginMember eq null}"> <!-- 로그아웃 상태 -->
		<h1 class="text-center">HOME</h1>
		<ol class="list-group list-group-horizontal px-5 fw-bold"> <!-- list-group-numbered 넘버링 가능 -->
			<li class="list-group-item list-group-item-action list-group-item-dark text-center d-grid">
				<a class="btn btn-sm text-dark fs-4 btn-block" href="${pageContext.request.contextPath}/member/addMember">회원가입</a>
			</li>
			<li class="list-group-item list-group-item-action list-group-item-dark text-center d-grid">
				<a class="btn btn-sm text-dark fs-4" href="${pageContext.request.contextPath}/member/login">로그인</a>
			</li>
		</ol>
	</c:if>
	<c:if test="${loginMember ne null}"> <!-- 로그인 상태 -->
		<h2 class="text-center">${loginMember.memberName}님 환영합니다</h2>
		<ol class="list-group px-5 fw-bold"> <!-- list-group-numbered 넘버링 가능 -->
			<li class="list-group-item list-group-item-action list-group-item-dark text-center d-grid">
				<a class="btn btn- text-dark fs-4" href="${pageContext.request.contextPath}/board/boardList">게시판리스트</a>
			</li>
			<li class="list-group-item list-group-item-action list-group-item-dark text-center d-grid">
				<a class="btn btn-sm text-dark fs-4" href="${pageContext.request.contextPath}/member/memberOne">회원정보</a>
			</li>
			<li class="list-group-item list-group-item-action list-group-item-dark text-center d-grid">
				<a class="btn btn-sm text-dark fs-4" href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
			</li>
		</ol>
	</c:if>
</body>
</html>