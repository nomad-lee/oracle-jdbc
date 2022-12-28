<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ModifyMember</title>
</head>
<body>
	<h1>회원정보수정</h1>
	<div class="container">
		<form action="${pageContext.request.contextPath}/member/modifyMember" method="post">
			<table class = "table">
				<tr>
					<td>아이디</td>
					<td><input type="text" class="form-control" name="memberId" value="${loginMember.memberId}" readonly></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" class="form-control" name="memberName" value="${loginMember.memberName}"></td>
				</tr>
			</table>
			<button type="submit" class="btn btn-secondary">수정완료</button>
		</form>
	</div>	
</body>
</html>