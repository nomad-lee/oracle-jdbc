<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ModifyMember</title>
<!-- 구글 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<!-- 부트스트랩5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
	h1 { font-family: 'Nanum Gothic Coding', monospace; color:white; padding-top:50px; font-size: 40px; text-align: center;}
	body { background-color:#196F3D;}
	td { color:white; text-align: center;} /* id선택자 #으로 사용 */
</style>
</head>
<body>
	<a href="${pageContext.request.contextPath}/home">홈으로</a>
	<h1 class="mb-5">회원정보수정</h1>
	<div class="container">
		<form action="${pageContext.request.contextPath}/member/modifyMember" method="post">
			<table class = "table">
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="memberId" name="memberId" value="${loginMember.memberId}" readonly>
					<label for="memberId">아이디</label>
				</div>
				<div class="form-floating">
					<input type="text" class="form-control" id="memberName" name="memberName" value="${loginMember.memberName}">
					<label for="memberName">이름</label>
				</div>
			</table>
			<div class="text-center">
				<button class="btn btn-light btn-lg center" type="submit">작성완료</button>
			</div>			
		</form>
	</div>	
</body>
</html>