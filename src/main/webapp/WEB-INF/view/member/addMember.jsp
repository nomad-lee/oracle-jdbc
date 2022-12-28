<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AddMember</title>
</head>
<body>
	<h1>회원가입</h1>
	<div class="container">
		<form action="${pageContext.request.contextPath}/member/addMember" method="post">
			<table class = "table">
				<tr>
					<td>아이디</td>
					<td><input type="text" class="form-control" name="memberId"></td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td><input type="password" class="form-control" name="memberPw"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" class="form-control" name="memberName"></td>
				</tr>
			</table>
			<button type="submit" class="btn btn-secondary">회원가입</button>
		</form>
	</div>	
</body>
</html>