<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<style> /* 우선순위 */
	h1 { font-family: 'Nanum Gothic Coding', monospace; color:white; padding-top:50px; font-size: 40px; text-align: center;}
	th { font-family: 'Nanum Gothic Coding', monospace; color:white;}
	td { color:white; } /* id선택자 #으로 사용 */
	body { background-color:#196F3D;}
	a {color :black;}
	a#boardTitle:link {color:white; text-decoration: none;}
	a#boardTitle:visited {color:gray;}
	a#boardTitle:hover {color:red; text-decoration: underline;}
	#boardNo {text-align: center;}
</style>
</head>
<body>
	<div>
		<c:import url="../inc/nav.jsp"></c:import>		
	</div>
	<div class = "container">
		<h1>BOARD LIST</h1>
		<div class="d-flex justify-content-end">
			<form id="pageForm" method="get" action="${pageContext.request.contextPath}/board/boardList">
				<div align="right">
					<select class="form-control" name="rowPerPage" id="rowPerPage">
						<c:if test="${rowPerPage == 10}">
							<option value="10" selected="selected">10개씩</option>
							<option value="20">20개씩</option>
							<option value="30">30개씩</option>
						</c:if>
						<c:if test="${rowPerPage == 20}">
							<option value="10">10개씩</option>
							<option value="20" selected="selected">20개씩</option>
							<option value="30">30개씩</option>
						</c:if>
						<c:if test="${rowPerPage == 30}">
							<option value="10">10개씩</option>
							<option value="20">20개씩</option>
							<option value="30" selected="selected">30개씩</option>
						</c:if>
					</select>
				</div>
			</form>
		</div>
		<table class="table">
			<tr class = "bg-dark text-center">
				<th>번호</th>
				<th class = "col-5" id="title">제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			<c:forEach var="b" items="${boardList}">
				<tr>
					<td class="fw-bold" id="boardNo">${b.boardNo}</td>
					<td><a class="boardTitle" id="boardTitle" href="${pageContext.request.contextPath}/board/boardOne?boardNo=${b.boardNo}">${b.boardTitle}</a></td>
					<td>${b.memberId}</td>
					<td>${b.createdate}</td>
				</tr>
			</c:forEach>
		</table>
		<div align="right">
			<a class="btn btn-secondary" href="${pageContext.request.contextPath}/board/addBoard">글입력</a>
		</div>
	</div>		
	<nav aria-label="pagiantion">
		<ul class="pagination justify-content-center">
			<li class="page-item">
				<a class="page-link" href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${1}&word=${word}" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</li>		      
			<c:if test="${currentPage >= 5}">
				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${currentPage-4}&word=${word}">${currentPage-4}</a></li>
			</c:if>		    	
			<c:if test="${currentPage >= 4}">
		    	<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${currentPage-3}&word=${word}">${currentPage-3}</a></li>
	    	</c:if>		    	
			<c:if test="${currentPage >= 3}">
				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${currentPage-2}&word=${word}">${currentPage-2}</a></li>
	    	</c:if>		    	
			<c:if test="${currentPage >= 2}">
				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${currentPage-1}&word=${word}">${currentPage-1}</a></li>
	    	</c:if>
			<c:if test="${currentPage > 0}">
				<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${currentPage}&word=${word}">${currentPage}</a></li>
	    	</c:if>
			<c:if test="${lastPage - currentPage >= 1}">
				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${currentPage+1}&word=${word}">${currentPage+1}</a></li>
	    	</c:if>
			<c:if test="${lastPage - currentPage >= 2}">
				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${currentPage+2}&word=${word}">${currentPage+2}</a></li>
	    	</c:if>
			<c:if test="${lastPage - currentPage >= 3}">
	   	 		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${currentPage+3}&word=${word}">${currentPage+3}</a></li>
	    	</c:if>
			<c:if test="${lastPage - currentPage >= 4}">
	    		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${currentPage+4}&word=${word}">${currentPage+4}</a></li>
	    	</c:if>		    
		    <li class="page-item">
				<a class="page-link" href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${lastPage}&word=${word}" aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
				</a>
			</li>
		</ul>
	</nav>
	
	<!-- 검색창 -->
	<div class="d-flex justify-content-center">
		<form action="${pageContext.request.contextPath}/board/boardList" method="get">
			<div class="row">
				<div class="col-auto d-grid mx-auto">
					<c:choose>
						<c:when test="${word == null}"> 
							<input type="search" class="form-control-sm" name="word" id="word" placeholder="검색어를 입력해주세요">
						</c:when>
						<c:otherwise>
							<input type="search" class="form-control-sm" name="word" id="word" placeholder="검색어를 입력해주세요" value="${word}">
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-auto">
		        	<button type="submit" class="btn btn-primary">검색</button>
				</div>
			</div>
		</form>
	</div>	
</body>
</html>