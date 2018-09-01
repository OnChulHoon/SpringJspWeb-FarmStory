<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- ================= Login Modal ===========================================-->

<div id="login" class="modal fade" role="dialog">
	<div id="modal-dialog-login" class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">&nbsp;<i class="icon-login-1"></i>&nbsp;로그인</h4>
			</div>
			<div class="modal-body">
				<form id="loginForm" method="get" >
					<input id="returnUrl" type="hidden" name="returnUrl" value="${ param.returnUrl }">
					<div class="form-group">
						<input id="inputId" type="text" class="form-control bg-ash" name="userInputId"
							placeholder="아이디를 입력해주세요." required>
					</div>
					<div class="form-group">
						<input id="inputPw" type="password" class="form-control bg-ash" name="userInputPw"
							placeholder="비밀번호를 입력해주세요." required>
					</div>
					<button id="loginBtn" class="btn btn-default">로그인</button>
				</form>
			</div>
			<div class="modal-footer">
				<div class="dontHaveAccount">
					<p class="modalChange">
						아직 계정이 없으신가요?&nbsp;&nbsp;&nbsp;<a id="callRegisterModal" href="" data-dismiss="modal"
							aria-hidden="true">회원가입</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- ================= Login Check Modal ===================================== -->

<div id="wrongId" class="modal fade" role="dialog">
	<div id="modal-dialog-login-checkId" class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header" >
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">&nbsp;<i class="icon-login-1"></i>&nbsp;로그인 오류</h4>
			</div>
			<div class="modal-body" align="center">
				<h4>아이디를 찾을 수 없습니다.</h4>
			</div>
			<div class="modal-footer">
				<a class="btn" data-dismiss="modal" >확인</a>
			</div>
		</div>
	</div>
</div>

<div id="wrongPw" class="modal fade" role="dialog">
	<div id="modal-dialog-login-checkPw" class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header" >
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">&nbsp;<i class="icon-login-1"></i>&nbsp;로그인 오류</h4>
			</div>
			<div class="modal-body" align="center">
				<h4>비밀번호를 잘못 입력했습니다.</h4>
			</div>
			<div class="modal-footer">
				<a class="btn" data-dismiss="modal" >확인</a>
			</div>
		</div>
	</div>
</div>

<div id="checkedLogin" class="modal fade" role="dialog">
	<div id="modal-dialog-login-checkId" class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header" >
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">&nbsp;<i class="icon-login-1"></i>&nbsp;로그인 오류</h4>
			</div>
			<div class="modal-body" align="center">
				<h4>로그인 하신 후 이용해주세요.</h4>
			</div>
			<div class="modal-footer">
				<a class="btn callLoginModal" data-dismiss="modal">확인</a>
			</div>
		</div>
	</div>
</div>
