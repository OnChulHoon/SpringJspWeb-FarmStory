<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="register" class="modal fade" role="dialog">
	<div class="modal-dialog register" >
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">&nbsp;<i class="icon-user-add"></i>&nbsp;회원 가입</h4>
			</div>
			<div class="modal-body">
				<form id="registerForm" method="post" >
					<div class="form-group">
						<input type="text" class="form-control " name="memId"
							placeholder="아이디를 입력해주세요." required>
					</div>
					<div class="form-group">
						<input id="password" type="password" class="form-control bg-ash" name="memPw"
							placeholder="비밀번호를 설정해주세요." required>
					</div>
					<div class="form-group">
						<input type="password" class="form-control bg-ash" name="memPwConfirm"
							placeholder="비밀번호를 한번더 입력해주세요." required>
					</div>
					<div class="form-group">
						<input type="text" class="form-control bg-ash" name="memName"
							placeholder="이름을 알려주세요." required>
					</div>
					<div class="form-group">
						<input type="email" class="form-control bg-ash" name="memEmail"
							placeholder="이메일 주소를 알려주세요." required>
					</div>
					<div class="form-group">
						<input type="text" class="form-control bg-ash" name="memPhone"
							placeholder="휴대전화번호를 알려주세요." required>
					</div>
					
					<button type="submit" class="btn btn-default">가입하기</button>
				</form>
			</div>
			<div class="modal-footer" >
				<div class="haveAccount">
					<p class="modalChange">
						이미 계정이 있으신가요?&nbsp;&nbsp;&nbsp;<a class="callLoginModal" data-dismiss="modal"
							aria-hidden="true">로그인</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- ================= Register Success Modal ===================================== -->

<div id="registerSuccess" class="modal fade" role="dialog">
	<div class="modal-dialog register-ok">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header" >
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">&nbsp;<i class="icon-user-1"></i>&nbsp;회원가입 성공</h4>
			</div>
			<div class="modal-body">
				<h4>회원가입이 완료되었습니다.<span class="next-line">로그인 해주세요.</span></h4>
			</div>
			<div class="modal-footer">
				<a class="btn callLoginModal" data-dismiss="modal" >로그인 하기</a>
			</div>
		</div>
	</div>
</div>