<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
   	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
   	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js
"></script>
<style>
	img { width:50px;}
	body { background-color:#196F3D;}
	a.nav-link:link { color:white;}
	a.nav-link:visited { color:white;}
	a.nav-link:hover { color:red;}
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container-fluid">
		<a href="${pageContext.request.contextPath}/home">
			<img src="${pageContext.request.contextPath}/img/starbucks.png"/>
		</a>
		<!-- patitial jsp 페이지 -->
		 <div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav justify-content-end tx-white">
			<li class="nav-item">
				<a id="nav1" class="nav-link" href="${pageContext.request.contextPath}/board/boardList">게시판</a>
			</li>
			<li class="nav-item dropdown">
				<a id="nav2" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" role="button" href="">${loginMember.memberName}</a>
				<ul class="dropdown-menu">
				    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/memberOne">회원정보</a></li>
				    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/board/boardList">로그아웃</a></li>
				</ul>				
			</li>
			<li class="nav-item">
				<a id="nav3" class="nav-link" href="${pageContext.request.contextPath}/member/memberOne">회원정보</a>
			</li>
			<li class="nav-item">
				<a id="nav4" class="nav-link" href="${pageContext.request.contextPath}/board/boardList">로그아웃</a>
			</li>
		</ul>
		</div>			
	</div>
</nav>

<nav class="navbar navbar-expand-lg bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar scroll</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarScroll">
      <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Link
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
        <li class="nav-item justify-content-end">
          <a class="nav-link disabled">Link</a>
        </li>
      </ul>
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
</body>
</html>
