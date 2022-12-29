<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--
C -> M -> V
C -> M ========> redirct ========> 다른 컨트롤러 호출 
C -> V
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AddBoardForm</title>
<!-- 구글 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<!-- 부트스트랩5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>	
	$(document).ready(function(){
	    let now = new Date();
	    let year = ('0' + now.getFullYear()).slice(-2);
	    let month = ('0' + (now.getMonth() + 1)).slice(-2);
	    let day = ('0' + now.getDate()).slice(-2);

	    let today = year + '/' + month  + '/' + day;
	    $('#createdate').val(today);
	  });
</script>
<style>
	h1 { font-family: 'Nanum Gothic Coding', monospace; color:white; padding-top:50px; font-size: 40px; text-align: center;}
	body { background-color:#196F3D;}
	#msg { color:red; font-size: 20px;}
</style>
</head>
<body>
	<div>
		<a href="${pageContext.request.contextPath}/board/boardList">게시판으로</a>
	</div>
	<div>
		<h1 class="mb-5">게시글 입력</h1>	
	</div>
	<div class="container">
		<form action="${pageContext.request.contextPath}/board/addBoard" method="post">
			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="title" placeholder="제목을 입력하시오" name="title">
				<label for="title">boardTitle</label>
			</div>
			<div class="form-floating mb-3">
				<textarea class="form-control" id="content" style="height: 200px" placeholder="내용을 입력하시오" name="content"></textarea>
				<label for="content">boardContent</label>
			</div>
			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="createdate" name="createdate" readonly>
				<label for="createdate">createdate</label>
			</div>
			<div class="text-center">
				<button class="btn btn-light btn-lg center" type="submit">작성완료</button>
			</div>			
		</form>
	</div> 
</body>
</html>