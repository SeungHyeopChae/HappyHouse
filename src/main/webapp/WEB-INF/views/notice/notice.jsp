<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
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
	

	$("#searchBtn").click(function() {
		
		if($("#sword").val() == "") {
			alert("모든 목록 조회!!");
		} 
		$("#searchform").attr("action", "${root}/article/list").submit();
	});
	
	$(".page-item").click(function() {
		$("#pg").val(($(this).attr("data-pg")));
		$("#pageform").attr("action", "${root}/notice/list").submit();
	});
	
});

function writeNotice(){
	document.location.href ="${root}/notice/mvwrite";
}

		
    </script>
</head>
<body>
	<%@ include file="../viewers/header.jsp"%>
	<form name="pageform" id="pageform" method="GET" action="">
		<input type="hidden" name="pg" id="pg" value="">
		<input type="hidden" name="key" id="key" value="${key}">
		<input type="hidden" name="word" id="word" value="${word}">
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
							<td align="right"><select class="form-control" name="key"
								id="skey">
									<option value="userid" selected="selected">아이디</option>
									<option value="articleno">글번호</option>
									<option value="subject">제목</option>
							</select> <input type="text" class="form-control" placeholder="검색어 입력."
								name="word" id="sword">
								<button type="button" class="btn btn-primary"
									onclick="javascript:searchNotice();">검색</button>
								<button id="mvWriteBtn" type="button" class="btn btn-danger" onclick="javascript:writeNotice();">작성</button></td>
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
								<td>
									<a href="${root}/notice/modify?articleNo=${article.articleNo} " class="btn btn-primary btn-sm " role="button" aria-disabled="true" >수정</a>
									<a href="${root}/notice/delete?articleNo=${article.articleNo}" class="btn btn-primary btn-sm " role="button" aria-disabled="true" >삭제</a>
								</td>
							</tr>

						</c:forEach>
					</tbody>
				</table>

			</div>

		</div>
	</section>

	<%-- <div class="breadcrumb-container">
		<div class="container-fluid">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home pr-2"></i> <a
					class="link-dark" href="${root}/">Home</a></li>
				<li class="breadcrumb-item active">공지 사항 보기</li>
			</ol>
		</div>
	</div>

	<form name="pageform" id="pageform" method="GET" action="">
		<input type="hidden" name="pg" id="pg" value="">
		<input type="hidden" name="key" id="key" value="${key}">
		<input type="hidden" name="word" id="word" value="${word}">
	</form>
	<div class="container" align="center">
	  <div class="col-lg-8" align="center">
	  <h2>공지사항</h2> 
	  <table class="table table-borderless">
	  	<tr>
	  		<td align="right"><button type="button" id="mvWriteBtn" class="btn btn-link">글쓰기</button></td>
	  	</tr>
	  </table>
	  <form id="searchform" method="get" class="form-inline" action="">
	  <input type="hidden" name="pg" id="pg" value="1">
	  <table class="table table-borderless">
	  	<tr>
	  		<td align="right">
		  	  <select class="form-control" name="key" id="skey">
			    <option value="userid" selected="selected">아이디</option>
			    <option value="articleno">글번호</option>
			    <option value="subject">제목</option>
			  </select>
			  <input type="text" class="form-control" placeholder="검색어 입력." name="word" id="sword">
			  <button type="button" id="searchBtn" class="btn btn-primary">검색</button>
			</td>
	  	</tr>
	  </table>
	  </form>
	  <!-- <table class="table table-borderless">
	  	<tr>
	  		<td align="right">
		  	  <select class="form-control" name="spp" id="spp" onchange="javascript:countList();">
			    <option value="10" selected="selected">10개씩보기</option>
			    <option value="20">20개씩보기</option>
			    <option value="50">50개씩보기</option>
			  </select>
			</td>
	  	</tr>
	  </table> -->
	  <c:if test="${articles.size() != 0}">
	  	<c:forEach var="article" items="${articles}">
	  <table class="table table-active">
	    <tbody>
	      <tr class="table-info">
	        <td>작성자 : ${article.userid}</td>
	        <td align="right">작성일 : ${article.regtime}</td>
	      </tr>
	      <tr>
	        <td colspan="2" class="table-danger"><strong>${article.articleno}. ${article.subject}</strong></td>
	      </tr>
	      <tr>
	        <td colspan="2">${article.content}</td>
	      </tr>
	      <c:if test="${userinfo.userid == article.userid}">
	      <tr>
	        <td colspan="2">
			<a href="${root}/article/modify?articleno=${article.articleno}">수정</a>
			<a href="${root}/article/delete?articleno=${article.articleno}">삭제</a>
			</td>
	      </tr>
	      </c:if>
	    </tbody>
	  </table>
	  	</c:forEach>
	  	<table>
	  	<tr>
	  	<td>
	  	${navigation.navigator}
	  	</td>
	  	</tr>
	  	</table>
	  </c:if>
	  <c:if test="${articles.size() == 0}">
	  <table class="table table-active">
	    <tbody>
	      <tr class="table-info" align="center">
	        <td>작성된 글이 없습니다.</td>
	      </tr>
	    </tbody>
	  </table>
	  </c:if>
	  </div>
	</div>
 --%>

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