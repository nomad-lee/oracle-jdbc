<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ModifyBoardForm</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>	
	$(document).ready(function(){
	    let now = new Date();
	    let year = ('0' + now.getFullYear()).slice(-2);
	    let month = ('0' + (now.getMonth() + 1)).slice(-2);
	    let day = ('0' + now.getDate()).slice(-2);

	    let today = year + '/' + month  + '/' + day;
	    $('#updatedate').val(today);
	  });
</script>
</head>
<body>
	<h1>MODIFY BOARD</h1>
	<div>
		<a href="${pageContext.request.contextPath}/board/boardList">홈으로</a>
	</div>
	<form action="${pageContext.request.contextPath}/board/modifyBoard" method="post">
		<table border="1">
			<tr>
				<th>title</th>
				<td>
					<input type="hidden" name="boardNo" value="${board.boardNo}">
					<input type="text" name="boardTitle" value="${board.boardTitle}">
				</td>
			</tr>
			<tr>
				<th>content</th>
				<td>
					<textarea rows="5" cols="50" name="boardContent">${board.boardContent}</textarea>
				</td>
			</tr>
			<tr>
			    <td>updatedate</td>
			    <td>
			    	<input type="text" id="updatedate" name="updatedate" readonly>
			    </td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>