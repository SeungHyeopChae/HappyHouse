<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<%
boolean admin = false; // 관리자일 경우 true로
boolean user = false; // 유저일 경우 true


if(session.getAttribute("userinfo") != null && session.getAttribute("usercode") != null){
	admin = true;
} else if(session.getAttribute("userinfo") != null){
	user = true;
}; 

pageContext.setAttribute("admin", admin);
pageContext.setAttribute("user", user);
	
%>
<c:if test="${admin }">
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>SSAFY-글수정</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  $(document).ready(function() {
	  $("#modifyBtn").click(function() {
			if($("#subject").val() == "") {
				alert("제목 입력!!!");
				return;
			} else if($("#content").val() == "") {
				alert("내용 입력!!!");
				return;
			} else {
				$("#modifyform").attr("action", "${root}/notice/modify").submit();
			}
		});
	});
  </script>
</head>
<body>
<%@include file="../viewers/header.jsp" %>
	<br>
	<br>
	<br>
<div class="container" align="center">

	<div align="center">
		<h2>공지사항 수정</h2>
		<form id="modifyform" method="post" action="">
		<input type="hidden" name="articleno" id="articleno" value="${article.articleNo}">
			<div class="form-group" align="left">
				<label for="subject">제목:</label>
				<input type="text" class="form-control" id="subject" name="subject" value="${article.subject}">
			</div>
			<div class="form-group" align="left">
				<label for="content">내용:</label>
				<textarea class="form-control" rows="15" id="content" name="content">${article.content}</textarea>
			</div>
			<button type="button" id="modifyBtn" class="btn btn-primary">글수정</button>
			<button type="reset" class="btn btn-warning">초기화</button>
		</form>
	</div>
</div>
<%@include file="../viewers/footer.jsp" %>
</body>
</html>
</c:if>


