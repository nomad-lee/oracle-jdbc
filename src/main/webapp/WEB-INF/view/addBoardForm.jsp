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
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- input에 오늘날짜 기본값으로 넣기 -->
<script>
	/* 
		window.onload = function() {
		today = new Date();
		console.log("today.toString() >>>" + today.toString());
		today = today.toString().slice(0, 10);
		console.log("today >>>> " + today);
		bir = document.getElementById("createdate");
		bir.value = today;
		
		today.toLocaleDateString()
	}
	*/		
		$(document).ready(function(){
		    let now = new Date();
		    let year = ('0' + now.getFullYear()).slice(-2);
		    let month = ('0' + (now.getMonth() + 1)).slice(-2);
		    let day = ('0' + now.getDate()).slice(-2);

		    let today = year + '/' + month  + '/' + day;
		    $('#createdate2').val(today);
		  });
</script>
</head>
<body>
   <h1>게시글 입력</h1>
   <form method="post" action="${pageContext.request.contextPath}/AddBoardActionController" method="post">
      <table border="1">
         <tr>
            <td>boardTitle</td>
            <td>
               <input type="text" name="title">
            </td>
         </tr>
         <tr>
            <td>boardContent</td>
            <td>
               <textarea rows="5" cols="50" name="content"></textarea>
            </td>
         </tr>
         <tr>
            <td>createdate</td>
            <td>
               <input type="date" id="createdate" name="createdate">
               <input type="text" id="createdate2" name="createdate" readonly>
            </td>
         </tr>
      </table>
      <button type="submit">글입력</button>
   </form>   
</body>
</html>