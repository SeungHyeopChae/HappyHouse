<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<c:set var="root" value="${pageContext.request.contextPath}"/>    
<!-- 로그인 안했을 경우 index page로 이동 -->
<c:if test="${userinfo eq null}">
	<script>
	alert("로그인이 필요한 페이지입니다.\n로그인 페이지로 이동합니다.");
	location.href = "${root}";
	</script>
</c:if>


<!-- 로그인 했을 경우 아래 출력 -->
<c:if test="${admin}">
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>SSAFY-글작성</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  function writeNotice() {
	if(document.getElementById("subject").value == "") {
		alert("제목 입력!!!!");
		return;
	} else if(document.getElementById("content").value == "") {
		alert("내용 입력!!!!");
		return;
	} else {
	  	document.getElementById("writeform").action = "${root}/notice/write";
	  	document.getElementById("writeform").submit();
	}
  }
  </script>
</head>
<body id="page-top">
<%@ include file="../viewers/header.jsp" %>
<br>
<br>
<br>
<br>
<br>
<br>
<div class="container" align="center">
	
	<div class="col-lg-6" align="center">
		<h2>Write Notice</h2>
		<form id="writeform" method="post" action="">
			<div class="form-group" align="left">
				<label for="subject">제목:</label>
				<input type="text" class="form-control" id="subject" name="subject">
			</div>
			<div class="form-group" align="left">
				<label for="content">내용:</label>
				<textarea class="form-control" rows="15" id="content" name="content"></textarea>
			</div>
			<button type="button" class="btn btn-primary" onclick="javascript:writeNotice();">글작성</button>
			<button type="reset" class="btn btn-warning">초기화</button>
		</form>
	</div>

</div>
<br>
<%@ include file="../viewers/footer.jsp"%>
<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Third party plugin JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	<!-- Contact form JS-->
	<script src="dist/assets/mail/jqBootstrapValidation.js"></script>
	<script src="dist/assets/mail/contact_me.js"></script>
	<!-- Core theme JS-->
	<script src="dist/js/scripts.js"></script>  
</body>
</html>
</c:if>