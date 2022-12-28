<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RemoveMember</title>
</head>
<body>
	<h1>회원가입</h1>
	<div class="container">
		<form action="${pageContext.request.contextPath}/member/removeMember" method="post">
			<table class = "table">
				<tr>
					<td>아이디</td>
					<td><input type="text" class="form-control" name="memberId" value="${loginMember.memberId}"></td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td><input type="password" class="form-control" name="memberPw"></td>
				</tr>
			</table>
			<button type="submit" class="btn btn-secondary">탈퇴확정</button>
		</form>
	</div>	
</body>
</html>