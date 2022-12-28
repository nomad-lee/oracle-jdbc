<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
	<c:if test="${loginMember eq null}">
		<h2><a href="${pageContext.request.contextPath}/member/addMember">회원가입</a></h2>
		<h2><a href="${pageContext.request.contextPath}/member/login">로그인</a></h2>
	</c:if>
	<c:if test="${loginMember ne null}">
		<h1>${loginMember.memberName}님 환영합니다.</h1>
		<h2><a href="${pageContext.request.contextPath}/member/logout">로그아웃</a></h2>
		<h2><a href="${pageContext.request.contextPath}/member/memberOne">회원정보</a></h2>
		<h2><a href="${pageContext.request.contextPath}/board/boardList">게시판리스트</a></h2>
	</c:if>
</body>
</html>