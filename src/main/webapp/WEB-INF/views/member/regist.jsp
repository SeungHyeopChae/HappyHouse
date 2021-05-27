<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Happy House | 회원가입</title>
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

	var check = ture;
	
   
   function regist() {
    	if(document.getElementById("userId").value == "") {
    		alert("아이디 입력!!!");
    		return;
    	} else if(document.getElementById("userPwd").value == "") {
    		alert("비밀번호 입력!!!");
    		return;
    	} else if(check){
    		alert("아이디 중복 확인 해주세요");
    		return;
    	} else {
    		document.getElementById("memberform").action = "${root}/member/regist";
			document.getElementById("memberform").submit();
    	}
   };
    
   function check() {
	   console.log("진입");
	   $.ajax({
       	url : "${root}/member/check",
       	type : "POST",
       	data : {"userId" : $('#userId').val()},
       	success : function(data){ //DB접근 후 가져온 데이터
       		if(data.userId){
       			alert("중복 된 아이디 입니다.");
       		}
       		else {
       			alert("사용 가능한 아이디 입니다.");
       			check = false;
       		}
       	}
   	});
   };
    
    
    	 
        
</script>
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
	<!--  상단  -->
	<%@ include file="../viewers/header.jsp"%>
	<div class="breadcrumb-container">
		<div class="container-fluid">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home pr-2"></i> <a
					class="link-dark" href="${root}/">Home</a></li>
				<li class="breadcrumb-item active">회원 가입</li>
			</ol>
		</div>
	</div>

    <div class="container-fluid p-3 my-3text-white" style="background-color: #707070;">
        <div class="container p-3 my-3">
            <div class="row justify-content-center" style="background-color: #F9F9F9; height:500px;">
                <div class="row" style="margin-top: 20px;"><h2 class="title">회원가입</h2></div>
                <div class="light-gray-bg border-clear" style="margin-top: 70px;">
                    <div>
                     <form id="memberform" method="post" action="">
						<input type="hidden" name="act" id="act" value="join">
                        <div class="row marginTop"> 
                            <h6>아이디 </h6>
                            <p class="text-warning mr-2"> *</p>
                            <input type="text"  id="userId" name="userId" placeholder="" style="width:163px; height:30px;">
                           
                        </div>
                        <div class="row marginTop"> 
                            <h6>비밀번호 </h6>
                            <p class="text-warning"> *</p>
                            <input type="password"  id="userPwd" name="userPwd" placeholder="" style="width:160px; height:30px;">
                        </div>
                        <div class="row marginTop"> 
                            <h6>이름 </h6>
                            <p class="text-warning mr-4"> *</p>
                            <input type="text"  id="userName" name="userName" placeholder="" style="width:165px; height:30px;">
                        </div>
                        <div class="row marginTop"> 
                            <h6>주소 </h6>
                            <p class="text-warning mr-4"> *</p>
                            <input type="text"  id="address" name="address" placeholder=""style="width:160px; height:30px;">
                        </div>
                        <div class="row marginTop"> 
                            <h6>이메일 </h6>
                            <p class="text-warning mr-2"> *</p>
                            <input type="text"  id="email" name="email" placeholder=""style="width:160px; height:30px;">
                        </div>
                
                        
                        <div>
                         <button type="button" class="btn btn-warning marginTop"onclick="javascript:check();">아이디 중복체크</button>
                            <button type="button" class="btn btn-warning marginTop" onclick="javascript:regist();">등록 ✔</button>
                        </div>
                        
                      </form>
                    </div>
                </div>
            </div>
          </div>
      </div>

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