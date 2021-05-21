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
<style>
.inputType {
	border-radius: 10px;
	margin-left: 10px;
	border-width: thin;
	width: 400px;
}

.marginTop {
	margin-top: 10px;
}
</style>
</head>
<body>
<footer id="footer" class="clearfix " style="margin-top :50px;">
        <div class="footer">
          <div class="container">
            <div class="footer-inner">
              <div class="row">
               <div class="col-md-1">
                  <div class="footer-content">
                    <img alt="" src="${root}/img/logo.png"  width="100">
                  </div>
                </div>
                <div class="col-md-8">
                  <div class="footer-content">
                    <h2 class="title">Find Us</h2>
                    <hr>
                    <ul class="" style="list-style : none;">
                      <li><i class="text-default"></i>(SSAFY) 서울시 강남구  테헤란로 멀티스퀘어</li>
                      <li><i class="text-default"></i> 1544-9001</li>
                      <li><a href="#"><i class=""></i>admin@ssafy.com</a></li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="subfooter">
          <div class="container">
            <div class="subfooter-inner">
              <div class="row">
                <div class="col-md-12">
                  <p class="text-center">Copyright by SSAFY. All rights reserved.</p>
                </div>
              </div>
            </div>
          </div>
        </div>

      </footer>
     
</body>
</html>