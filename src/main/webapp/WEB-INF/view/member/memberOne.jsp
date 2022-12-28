<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
	<h1>${loginMember.memberName}님 환영합니다.</h1>
	<h2><a href="${pageContext.request.contextPath}/member/modifyMember">회원정보수정</a></h2>
	<h2><a href="${pageContext.request.contextPath}/member/removeMember">회원탈퇴</a></h2>
</body>
</html>