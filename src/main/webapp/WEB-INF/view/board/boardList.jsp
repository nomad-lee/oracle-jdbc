<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardList</title>
<!-- 구글 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<!-- 부트스트랩5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$('#rowPerPage').change(function() {
			$('#pageForm').submit();
			alert('change');
		})
	});
</script>
<style>
	h1 { font-family: 'Nanum Gothic Coding', monospace; color:white; padding-top:50px; font-size: 40px; text-align: center;}
	th { font-family: 'Nanum Gothic Coding', monospace; color:white;}
	body { background-color:#196F3D;}
	a {color :black;}
	#boardTitle:link {text-decoration: none;}
	#boardTitle:hover {color:red; text-decoration: underline; }
	td, a#boardTitle:link, a#boardTitle:visited { color:white; text-align: center;} /* id선택자 #으로 사용 */
</style>
</head>
<body>
	<div>
		<c:import url="../inc/nav.jsp"></c:import>		
	</div>
	<div class = "container">
		<h1>BOARD LIST</h1>
		<div align="right">
			<a class="btn btn-secondary" href="${pageContext.request.contextPath}/home">홈으로</a>
			<a class="btn btn-secondary" href="${pageContext.request.contextPath}/board/addBoard">글입력</a>
		</div>
		<form id="pageForm" method="get" action="${pageContext.request.contextPath}/board/boardList">
			<select name="rowPerPage" id="rowPerPage">
				<c:if test="${rowPerPage == 10}">
					<option value="10" selected="selected">10</option>
					<option value="20">20</option>
					<option value="30">30</option>
				</c:if>
				<c:if test="${rowPerPage == 20}">
					<option value="10">10</option>
					<option value="20" selected="selected">20</option>
					<option value="30">30</option>
				</c:if>
				<c:if test="${rowPerPage == 30}">
					<option value="10">10</option>
					<option value="20">20</option>
					<option value="30" selected="selected">30</option>
				</c:if>
			</select>
		</form>
		<table class="table">
			<tr class = "bg-dark text-center">
				<th>boardNo</th>
				<th>boardTitle</th>
				<th>createdate</th>
			</tr>
			<c:forEach var="b" items="${boardList}">
				<tr>
					<td class="fw-bold">${b.boardNo}</td>
					<td><a class="boardTitle" id="boardTitle" href="${pageContext.request.contextPath}/board/boardOne?boardNo=${b.boardNo}">${b.boardTitle}</a></td>
					<td>${b.createdate}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<nav aria-label="pagiantion">
  		<ul class="pagination justify-content-center mt-3">
  			<li class="page-item">
				<a id=pnav1 class="page-link" href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${currentPage-1}">이전</a>
			</li>
			<li class="page-item">
				<a id=pnav2 class="page-link" href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${currentPage+1}">다음</a>
			</li>
		</ul>
	</nav>
</body>
</html>