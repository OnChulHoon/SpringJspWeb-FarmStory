<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
	$(function() {
		
	/* =================== Register Member : Start  ====================================================== */
	
		//======= 회원가입시 유효성 체크 : Custom Method ==========//
		
		$.validator.addMethod("idCheck",  function( value, element ) {
		return this.optional(element) ||  /^.*(?=.*\d)|(?=.*[a-zA-Z]).*$/.test(value);
		});

		$.validator.addMethod("passwdCheck",  function( value, element ) {
		return this.optional(element) ||  /^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test(value);
		});
		
		$.validator.addMethod("emailCheck",  function( value, element ) {
		return this.optional(element) ||   /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i.test(value);
		});
		
		$.validator.addMethod("phoneCheck",  function( value, element ) {
		return this.optional(element) ||   /^\d{3}-\d{3,4}-\d{4}$/.test(value);
		});
		
		$("#register form").validate({
			rules: {
				memId: {
				 	required: true,
				 	idCheck:true,
				 	rangelength: [4, 12],
				 	remote: {
				 		url : "/farmstory/member_id_exists.action",
				 		type: "POST",
				 		data: {"memId" : function () { return $("input[name=memId]").val();}}
				 	}
			 },
				memPw: {
				 	required: true,
				 	passwdCheck: true,
				 	rangelength: [6, 12]
			 },
			 	memPwConfirm: {
				 	required: true,
				 	equalTo :'#password',
				 	rangelength: [6, 12]
			 },
			 	memName: {
				 	required: true,
				 	rangelength: [2, 5]
			 },
			 	memEmail: {
				 	required: true,
				 	emailCheck: true,
				 	minlength: 5,
				 	remote: {
				 		url : "/farmstory/member_email_exists.action",
				 		type: "POST",
				 		data: {"memEmail" : function () { return $("input[name=memEmail]").val();}
				 		}
				 	}
			 },
			 	memPhone: {
					required: true,
					phoneCheck: true
			 }
			},
			messages: {
				memId: {
				 	required: "아이디는 필수입력 항목입니다.",
				 	idCheck: "영문 대소문자와 숫자로 입력해주세요. (4~12)",
				 	rangelength: "4~12자리로 입력하세요.",
				 	remote: "이미 사용하고 있는 아이디입니다."
			 },
				memPw: {
				 	required: "비밀번호는 필수입력 항목입니다.",
				 	passwdCheck: "영문, 숫자, 특수문자 모두 포함해주세요. (6~12)",
				 	rangelength: "6~12자리로 입력하세요."
			 },
				 memPwConfirm: {
				 	required: "비밀번호를 다시 입력해주세요.",
				 	equalTo: "입력하신 비밀번호와 다릅니다.",
				 	rangelength: "6~12자리로 입력하세요."
			 },
				memName: {
				 	required: "이름은 필수입력 항목입니다.",
				 	rangelength: "2~5자리로 입력하세요."
			 },
			 	memEmail: {
				 	required: "이메일은 필수입력 항목입니다.",
				 	minlength: "5자리 이상 입력하세요.",
				 	email: "이메일 형식이 올바르지 않습니다.",
				 	emailCheck: "이메일 형식이 올바르지 않습니다.",
				 	remote: "이미 등록된 이메일 주소입니다."
			 },
			 	memPhone: {
				 	required: "휴대전화번호는 필수입력 항목입니다.",
				 	phoneCheck: "형식에 맞춰서 입력해주세요.<div>(예시 1) 010-123-4567</div><div>(예시 2) 010-1234-5678</div>",
			 }
			},
			submitHandler: function(data) { // 유효성 체크 완료시 submit을 실행한다.
				$.ajax({
					"url" : "/farmstory/register.action",
					"method" : "POST",
					"data" : $("#registerForm").serialize(),
					"success" : function (data, status, xhr) {
						
						if(data == "success"){
							$("#register").modal("hide");
							$("#registerSuccess").modal("show");
						}else{
							alert("회원가입에 실패하였습니다. 관리자에게 문의해주세요.");
						}
					}
				});
			}
		});	
		
		$(".callLoginModal").on("click", function (event) {
			event.preventDefault();
			$("#login").modal("show");
		});
		
	/* =================== Register Member : End  ====================================================== */
	
	/* =================== Login Member : Start  ====================================================== */
		
		<c:if test="${ param.checkedLogin eq 'empty'}">
			$("#checkedLogin").modal("show");			
		</c:if>
		
		$("#loginBtn").on("click", function (event) {
			event.preventDefault();
			if($("#inputId").val() == ""){
				alert("아이디를 입력해주세요.");
			} else if($("#inputPw").val() == ""){
				alert("비밀번호를 입력해주세요.");
			} else{
				
				var returnUrl = $("#returnUrl").val();
				var requestUrl = window.location.href;
				
				$.ajax({
					"url" : "/farmstory/login.action",
					"metod" : "GET",
					"data" : $("#loginForm").serialize(),
					"success" : function (data, status, xhr) {
						
						if(data == "success"){
							$("#login").modal("hide");
							if(returnUrl != null){
								location.href = returnUrl;	
							}else{
								location.href = requestUrl;
							}
						}else if(data == "wrongId"){
							$("#wrongId").modal("show");
						}else if(data == "wrongPw"){
							$("#wrongPw").modal("show");
						}else{
							alert("로그인에 실패하였습니다. 관리자에게 문의해주세요.");
						}
					}
				});
			}
		});
	
		$("#callRegisterModal").on("click", function (event) {
			event.preventDefault();
			$("#register").modal("show");
		});
	
	/* =================== Login Member : End  ====================================================== */
	
	/* =================== Logout Member : Start  ====================================================== */
	
		$("#logoutBtn").on("click", function (event) {
			event.preventDefault();
			
			$.ajax({
				"url" : "/farmstory/logout.action",
				"method" : "GET",
				"success" : function(data, status, xhr) {
					
					if(data == "success"){
						$("#logout").modal("hide");
						$("#logoutSuccess").modal("show");
					} else {
						alert("로그아웃에 실패하였습니다. 관리자에게 문의해주세요.");
					}
				}
				
			});
		});
		
		$("#logoutConfirm").on("click", function (event) {
			event.preventDefault();
			location.href = "/farmstory/home.action";
		});
		
	/* =================== Logout Member : End  ====================================================== */
	
	});
</script>
