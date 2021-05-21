<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div class="btn-group">
	<strong>${userinfo.userName}</strong>님 환영합니다.
	
</div>
<div class="btn-group">
	<a href="${root}/member/logout" class="btn btn-default btn-sm">
	<i class="fa fa-user pr-2"></i> Logout</a>
	<button id="header-top-drop-2" type="button"
		class="btn dropdown-toggle btn-default btn-sm dropdown-toggle--no-caret"
		data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		<i class="fa fa-lock pr-2"></i> 회원정보
	</button>
	<ul class="dropdown-menu dropdown-menu-right dropdown-animation"
		aria-labelledby="header-top-drop-2">
		<li>

			<form class="login-form margin-clear" id="" action="main"
				method="post">
				<ul class='pagination'>
					<li><a href="${root}/member/modify"
						class="btn btn-default btn-sm">회원정보 수정</a></li>
					<li><a onclick="javascript:deleteMember();"
						class="btn btn-default btn-sm">회원 탈퇴</a></li>
				</ul>
			</form>
		</li>
	</ul>
</div>