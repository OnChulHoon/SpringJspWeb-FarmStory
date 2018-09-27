

/*===================================================================================*/
/*	Footer JS/JQUERY SCRIPTS
/*===================================================================================*/

/*===== Email Subscribe : Start =====*/

$("button#emailSubBtn").on("click", function(event) {
	
	$("#footer-newsletter form").validate({
		rules: {
			subEmail: {
				required: true,
				emailCheck: true,
				remote: {
			 		url : "/farmstory/subscribe_email_exists.action",
			 		type: "POST",
			 		data: {"subEmail" : function () { return $("input[name=subEmail]").val();}
			 		}
			 	}
			}
		},
		messages: {
			subEmail: {
				required: "이메일 주소를 입력해주세요.",
				email: "이메일 형식이 올바르지 않습니다.",
				emailCheck: "이메일 형식이 올바르지 않습니다.",
				remote: "구독신청이 되어있는 이메일 주소입니다."
			}
		},
		submitHandler: function(data) {
			$.ajax({
				"url" : "/farmstory/email-subscribe-register.action",
				"method" : "POST",
				"data" : $("form#newsletter").serialize(),
				"success" : function(data, status, xhr) {
					alert("구독신청이 완료되었습니다. 감사합니다.");
					location.reload("");
				},
				"error" : function(xhr, status, data) {
					alert("구독신청에 실패하였습니다. 관리자에게 문의해주세요.");
					/*location.href="/farmstory/home.action";*/
				}
			});
		}
	});
	
});

/*===== Email Subscribe : End =====*/