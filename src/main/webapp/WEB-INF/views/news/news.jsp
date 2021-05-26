<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="${root}/fontawesome/css/all.css" rel="stylesheet">
<link href="${root}/css/style.css" rel="stylesheet">
<link href="${root}/css/popup.css" rel="stylesheet">
<link href="${root}/css/animations.css" rel="stylesheet">
<link href="${root}/css/typography-default.css" rel="stylesheet">
<link href="${root}/css/bt.css" rel="stylesheet">
<link href="${root}/css/light.css" rel="stylesheet">
<title>Happy House</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<%@include file="../viewers/header.jsp" %>
<div class="container mb-5 mt-5">
			<h2
				class="page-section-heading text-center text-uppercase text-secondary mb-0">Breaking NEWS !</h2>
 </div>
 <hr>
 <br>
 <div class="row">
 	<div class="col-lg-2"></div>
 	<div class="col-lg-4">
 	<table class="table table-hover ">
 	<thead>
 		<tr>
 		  <th colspan='3'>오늘의 뉴스</th>

 		</tr>
 	</thead>
 	<tbody>
 		<c:forEach var="news1" items="${news1 }">
 			<tr>
 				<td colspan='2'><a href="${news1.link}" target='_blank'>${news1.title }</a></td>
 			</tr>
 		
 		</c:forEach>
 	</tbody>
 	</table>
 	</div>
 	<div class="col-lg-4">
 	<table class="table table-hover">
 	<thead>
 		<tr>
 		  <th colspan='3'>주택 관련 뉴스</th>

 		</tr>
 	</thead>
 	<tbody>
 		<c:forEach var="news2" items="${news2 }">
 			<tr>
 				<td colspan='2'><a href="${news2.link}" target='_blank'>${news2.title }</a></td>
 			</tr>
 		
 		</c:forEach>
 	</tbody>
 	</table>
 	</div>
 	<div class="col-lg-2"></div>
 
 </div>
 
 <%@ include file="../viewers/footer.jsp" %>
	<script src="${root}/js/jquery.min.js"></script>
	<script src="${root}/js/bootstrap.bundle.min.js"></script>
	<script src="${root}/js/popup.min.js"></script>
	<script src="${root}/js/slick.min.js"></script>
	<script src="${root}/js/tem.js"></script>
	<script src="${root}/js/custom.js"></script>



</body>
</html>