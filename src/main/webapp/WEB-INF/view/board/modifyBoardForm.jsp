<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ModifyBoardForm</title>
<!-- 구글 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<!-- 부트스트랩5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>	
	$(document).ready(function(){
	    let now = new Date();
	    let year = ('0' + now.getFullYear()).slice(-2);
	    let month = ('0' + (now.getMonth() + 1)).slice(-2);
	    let day = ('0' + now.getDate()).slice(-2);

	    let today = year + '/' + month  + '/' + day;
	    $('#updatedate').val(today);

		// 폼 유효성 검사
	    $('#btnSubmit').click(function() {
			if($('#boardTitle').val() == '') { // .val().length < 1으로도 가능
				alert('제목을 입력하세요');
				boardTitle.focus();
				return;
			} else {
				if($('#boardContent').val() == '') {
					alert('내용을 입력하세요');
					boardContent.focus();
					return;
				}
			}
		});
	  });
</script>
<style>
	h1 { font-family: 'Nanum Gothic Coding', monospace; color:white; padding-top:50px; font-size: 40px; text-align: center;}
	body { background-color:#196F3D;}
</style>
</head>
<body>
	<div>
		<c:import url="../inc/nav.jsp"></c:import>		
	</div>
	<h1 class="mb-5">MODIFY BOARD</h1>
	
	<div class="container">
		<form action="${pageContext.request.contextPath}/board/modifyBoard" method="post">
			<div class="row g-2">
				<div class="form-floating col-md">
					<input type="hidden" name="boardNo" value="${board.boardNo}">
					<input type="text" class="form-control" id="boardTitle" placeholder="제목을 입력하시오" name="boardTitle" value="${board.boardTitle}">
					<label for="boardTitle">제목</label>
				</div>
				<div class="form-floating col-md-3 mb-3">
					<input type="text" class="form-control" id="updatedate" name="updatedate" readonly>
					<label for="updatedate">수정일</label>
				</div>
			</div>
			<div class="form-floating mb-3">
				<textarea class="form-control" id="boardContent" style="height: 200px" placeholder="내용을 입력하시오" name="boardContent">${board.boardContent}</textarea>
				<label for="boardContent">내용</label>
			</div>
			<div class="text-center">
				<button class="btn btn-secondary btn-lg center" id="btnSubmit" type="submit">작성완료</button>
			</div>			
		</form>
	</div> 
</body>
</html>