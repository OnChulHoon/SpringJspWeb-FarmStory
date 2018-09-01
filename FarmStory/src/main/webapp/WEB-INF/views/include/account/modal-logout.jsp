<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="logout" class="modal fade" role="dialog">
	<div id="modal-dialog-logout" class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header" >
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">&nbsp;<i class="icon-logout-1"></i>로그아웃</h4>
			</div>
			<div class="modal-body" align="center">
				<h4>${ loginuser.memName }님<div>로그아웃 하시겠습니까?</div></h4>
			</div>
			<div class="modal-footer">
				<a id="logoutBtn" href="/farmstory/logout.action" class="btn">확인</a>&nbsp;&nbsp;&nbsp;
					<a class="btn" data-dismiss="modal" aria-hidden="true">취소</a>
			</div>
		</div>
	</div>
</div>

<!-- ================= Logout Success Modal ===================================== -->

<div id="logoutSuccess" class="modal fade" role="dialog">
	<div id="modal-dialog-logout" class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header" >
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">&nbsp;<i class="icon-logout-1"></i>&nbsp;로그아웃 성공</h4>
			</div>
			<div class="modal-body" align="center">
				<h4>로그아웃 되었습니다!<div>이용해주셔서 감사합니다~^^</div></h4>
			</div>
			<div class="modal-footer">
				<a id="logoutConfirm" class="btn" data-dismiss="modal" >확인</a>
			</div>
		</div>
	</div>
</div>