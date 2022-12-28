<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardOne</title>
</head>
<body>
	<h1>BOARD ONE</h1>
	<table border="1">
		<tr>
			<td>title</td>
			<td>${board.boardTitle}</td>
		</tr>
		<tr>
			<td>content</td>
			<td>${board.boardContent}</td>
		</tr>
	</table>
	<div>
		<a href="${pageContext.request.contextPath}/board/modifyBoard?boardNo=${board.boardNo}">수정</a>
		<a href="${pageContext.request.contextPath}/board/removeBoard?boardNo=${board.boardNo}">삭제</a>
	</div>
</body>
</html>