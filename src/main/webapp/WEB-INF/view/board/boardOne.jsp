<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardOne</title>
<!-- 구글 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<!-- 부트스트랩5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
	h1 { font-family: 'Nanum Gothic Coding', monospace; color:white; padding-top:50px; font-size: 40px; text-align: center;}
	body { background-color:#196F3D;}
</style>
</head>
<body>
	<div>
		<c:import url="../inc/nav.jsp"></c:import>		
	</div>
	<h1 class="mb-5">BOARD ONE</h1>
	
	<div class="container">		
		<div class="form-floating my-2">
			<input type="text" class="form-control" id="boardTitle" name="boardTitle" value="${board.boardTitle}" readonly>
			<label for="boardTitle">제목</label>
		</div>
		<div class="form-floating mb-3">
			<textarea class="form-control" id="boardContent" name="boardContent" style="height: 150px" readonly>${board.boardContent}</textarea>
			<label for="boardContent">내용</label>
		</div>
	</div>
	<c:if test="${loginMember.memberId eq board.memberId}"> <!-- 본인이 작성한 글만 수정, 삭제 가능 -->
		<div class="text-center">
			<a class="btn btn-lg btn-secondary" href="${pageContext.request.contextPath}/board/modifyBoard?boardNo=${board.boardNo}">수정</a>
			<a class="btn btn-lg btn-danger" href="${pageContext.request.contextPath}/board/removeBoard?boardNo=${board.boardNo}">삭제</a>
		</div>
	</c:if>
</body>
</html>