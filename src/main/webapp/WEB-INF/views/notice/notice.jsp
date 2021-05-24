<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<%
	boolean admin = false; // 관리자일 경우 true로
boolean user = false; // 유저일 경우 true

if (session.getAttribute("userinfo") != null && session.getAttribute("usercode") != null) {
	admin = true;
} else if (session.getAttribute("userinfo") != null) {
	user = true;
} ;

pageContext.setAttribute("admin", admin);
pageContext.setAttribute("user", user);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Happy House</title>
<meta name="description"
	content="The Project a Bootstrap-based, Responsive HTML5 Template">
<meta name="author" content="author">
<!-- Mobile Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="${root}/fontawesome/css/all.css" rel="stylesheet">
<link href="${root}/css/style.css" rel="stylesheet">
<link href="${root}/css/popup.css" rel="stylesheet">
<link href="${root}/css/animations.css" rel="stylesheet">
<link href="${root}/css/typography-default.css" rel="stylesheet">
<link href="${root}/css/bt.css" rel="stylesheet">
<link href="${root}/css/light.css" rel="stylesheet">
<script type="text/javascript">
	$(document).ready(function() {

		$(".page-item").click(function() {
			
			$("#pg").val(($(this).attr("data-pg")));
			
			$("#pageform").attr("action", "${root}/notice/list").submit();
		});
		console.log(click);

	});

 	function writeNotice() {
		document.location.href = "${root}/notice/mvwrite";
		
	} 
</script>
</head>
<body>
	<%@ include file="../viewers/header.jsp"%>
	<form name="pageform" id="pageform" method="GET" action="">
		<input type="hidden" name="pg" id="pg" value="">  
	</form>
	<section class="page-section" id="contact">
		<div class="container">
			<h2
				class="page-section-heading text-center text-uppercase text-secondary mb-0">Notice</h2>
			<!-- Contact Section Heading-->
			<div class="mt-5">
				<form id="searchform" method="get" class="form-inline" action="">
					<input type="hidden" name="pg" id="pg" value="1">
					<table class="table table-borderless">
						<tr>
							<td align="right">
							 <c:if test="${admin }">
									<button id="mvWriteBtn" type="button" class="btn btn-danger"
										onclick="javascript:writeNotice();">작성</button>
								</c:if></td>
						</tr>
						<!-- <tr>
							<td align="right"><select class="form-control" name="spp"
								id="spp" onchange="javascript:countList();">
									<option value="10" selected="selected">10개씩보기</option>
									<option value="20">20개씩보기</option>
									<option value="50">50개씩보기</option>
							</select>
							</td>
						</tr> -->
					</table>
				</form>

				<table class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>내용</th>
							<th>작성일</th>
							<th></th>

						</tr>
					</thead>
					<c:if test="${articles.size() == 0 }">
						<tfoot>
							<tr>
								<td colspan="5">작성된 글이 없습니다..</td>
							</tr>
						</tfoot>
					</c:if>

					<tbody>
						<c:forEach var="article" items="${articles}">
							<tr>
								<td>${article.articleNo }</td>
								<td>${article.subject }</td>
								<td>${article.userId }</td>
								<td>${article.content }</td>
								<td>${article.regtime }</td>
								<td><c:if test="${admin }">
										<a
											href="${root}/notice/modify?articleNo=${article.articleNo} "
											class="btn btn-primary btn-sm " role="button"
											aria-disabled="true">수정</a>
										<a href="${root}/notice/delete?articleNo=${article.articleNo}"
											class="btn btn-primary btn-sm " role="button"
											aria-disabled="true">삭제</a>
									</c:if></td>

							</tr>

						</c:forEach>
					</tbody>
				</table>
				<table>
					<tr>
						<td>${navigation.navigator}</td>
					</tr>
				</table>

			</div>

		</div>
	</section>

	
	<!--하단-->
	<%@ include file="../viewers/footer.jsp"%>
	<script src="${root}/js/jquery.min.js"></script>
	<script src="${root}/js/bootstrap.bundle.min.js"></script>
	<script src="${root}/js/popup.min.js"></script>
	<script src="${root}/js/slick.min.js"></script>
	<script src="${root}/js/tem.js"></script>
	<script src="${root}/js/custom.js"></script>
</body>
</html>