<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>

<html lang="en">
<head>
<!-- Meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta name="description" content="">
<meta name="author" content="">

<title>REEN</title>

<!-- Core CSS & AddOn/Plugin CSS & Custom CSS & Fonts & Icons/Glyphs & Favicon -->
<jsp:include page="/WEB-INF/views/include/style/public-style.jsp" />

<!-- HTML5 elements and media queries Support for IE8 : HTML5 shim and Respond.js -->
<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->





</head>

<body>

	<!-- ============================================================= HEADER ============================================================= -->
	<jsp:include page="/WEB-INF/views/include/header/public-header.jsp" />

	<!-- ============================================================= HEADER : END ============================================================= -->


	<!-- ============================================================= MAIN ============================================================= -->

	<main> <!-- ============================================================= SECTION – HERO ============================================================= -->

	<section id="hero" class="light-bg img-bg img-bg-softer"
		style="background-image: url(assets/images/art/image-background04.jpg);">
		<div class="container inner">
			<div class="row">
				<div class="col-md-8">
					<header>
						<h1>다이어리 정보 수정</h1>
						<p>Do you want to know more? We’d love to hear from you!</p>
					</header>
				</div>
				<!-- /.col -->
			</div>
			<!-- ./row -->
		</div>
		<!-- /.container -->
	</section>

	<!-- ============================================================= SECTION – HERO : END ============================================================= -->

	<div class="container inner">
		<div class="row">

			<div class="col-md-15 inner-right-md">

				<!-- ============================================================= SECTION – CONTACT FORM ============================================================= -->

				<section id="diary-form-section">

					<h2>다이어리 수정</h2>

					<form id="diary-form" action="diary_update.action" method="post"
						enctype="multipart/form-data">

						<div class="row">
							<div class="col-sm-6">
								<input type="text" value="${ diary.diaTitle }" name="diaTitle"
									class="form-control" placeholder="제목을 입력해주세요">
								<input type="hidden" name="diaNo" id="diary-diaNo" value="${diary.diaNo}">
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->

						<div class="row">
							<div class="col-sm-6">
								<input type="date" value="${ diary.diaDate }" name="diaDate"
									class="form-control" placeholder="날짜를 입력해주세요">
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->

						<!-- /.panel-heading -->

						 <%-- <div id="content" class="panel-collapse collapse in">
							<div class="panel-body">
								<div id="owl-popular-posts" class="owl-carousel owl-item-gap-sm">
									<c:forEach var="diaryImg" items="${ diaryImg }">
									<input type="hidden" name="diiNo" id="diary-diaNo" value="${diaryImg.diiNo}">
										<div class="item">
											<a href="">
												<figure>
													<figcaption class="text-overlay">
														<div class="info">
														<button id="imageDelete" class="btn btn-submit">삭제</button>
														</div>
														<!-- /.info -->
													</figcaption>
													<img
														src="/farmstory/resources/upload-image/diary-info/${diaryImg.diiImg}"
														alt="">
												</figure>
											</a>
										</div>
									
										<!-- /.item -->
									</c:forEach>


								</div>
								<!-- /.owl-carousel -->
							</div>
							<!-- /.panel-body -->
						</div>  --%>
						<!-- /.content -->

						<div class="row">
							<div id="addImage">
								<div class="col-sm-6">
									<input type="file" name="diiImage1" id="file"
										class="form-control">
								</div>
								<!-- /.col -->
							</div>

						</div>
						<!-- /.row -->
						<br />
						<div class="row">
							<div class="col-sm-20">
								<textarea name="diaContent" id="smarteditor"
									class="form-control">
										<c:out value="${ diary.diaContent }"></c:out>
										</textarea>
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->
						<input type="hidden" name="memId" value="${loginuser.memId}">
						<button type="submit" id="savebutton" class="btn btn-submit">수정하기</button>
						<a id="addImageBtn" class="btn btn-submit">이미지 추가</a>

					</form>

					<div id="response"></div>

				</section>

				<!-- ============================================================= SECTION – CONTACT FORM : END ============================================================= -->


				<!-- ============================================================= SECTION – CONTACTS ============================================================= -->

				<section id="contacts" class="inner-top-md inner-bottom-sm">

					<h2>Contacts</h2>
					<p>
						Magnis modipsae voloratati andigen daepeditem quiate re aut labor.
						<br>Laceaque eictemperum quiae sitiorem rest non restibusaes.
					</p>

					<div class="row">
						<div class="col-sm-6">
							<h3>REEN</h3>
							<ul class="contacts">
								<li><i class="icon-location contact"></i> 84 Street, City,
									State 24813</li>
								<li><i class="icon-mobile contact"></i> +00 (123) 456 78 90</li>
								<li><a href="mailto:info@reen.com"><i
										class="icon-mail-1 contact"></i> info@reen.com</a></li>
							</ul>
							<!-- /.contacts -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->


					<div id="imageDeleteByAjax" class="modal fade" role="dialog">
						<div id="modal-dialog-logout" class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button class="close" data-dismiss="modal">&times;</button>
								</div>
								<div class="modal-body" align="center">
									<h4>이미지가 삭제되었습니다!
									</h4>
								</div>
							</div>
						</div>
					</div>

				</section>

				<!-- ============================================================= SECTION – CONTACTS : END ============================================================= -->

			</div>
			<!-- ./col -->


		</div>
		<!-- /.row -->
	</div>
	<!-- /.container --> </main>

	<!-- ============================================================= MAIN : END ============================================================= -->


	<!-- ============================================================= FOOTER ============================================================= -->

	<jsp:include page="/WEB-INF/views/include/footer/public-footer.jsp" />

	<!-- ============================================================= FOOTER : END ============================================================= -->

	<!-- JavaScripts placed at the end of the document so the pages load faster -->
	<jsp:include page="/WEB-INF/views/include/javascript/public-js.jsp" />
	<script type="text/javascript"
		src="/farmstory/resources/navereditor/js/HuskyEZCreator.js"
		charset="utf-8"></script>
	<script type='text/javascript'>
		$(function() {

			//전역변수선언
			var editor_object = [];

			nhn.husky.EZCreator
					.createInIFrame({
						oAppRef : editor_object,
						elPlaceHolder : "smarteditor",
						sSkinURI : "/farmstory/resources/navereditor/SmartEditor2Skin.html",
						htParams : {
							// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
							bUseToolbar : true,
							// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
							bUseVerticalResizer : true,
							// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
							bUseModeChanger : true,
						}
					});

			//전송버튼 클릭이벤트
			$("#savebutton").click(
					function(event) {

						event.preventDefault();
						event.stopPropagation();

						//id가 smarteditor인 textarea에 에디터에서 대입
						editor_object.getById["smarteditor"].exec(
								"UPDATE_CONTENTS_FIELD", []);

						// 이부분에 에디터 validation 검증

						//폼 submit
						$("#diary-form").submit();
					});

			$('#addImageBtn')
					.on(
							'click',
							function(event) {
								event.preventDefault();
								event.stopPropagation();
								var add = $("<div class=\"col-sm-6\"><input type=\"file\" class=\"form-control\" id=\"file\" name=\"diiImage1\"></div>");
								$('#addImage').append(add);
							});

			/* AJAX */
			/* $('#imageDelete').on(
					'click',
					function(event) {
						var data = $("#diary-diaNo").val();
						event.preventDefault();
						$.ajax({
							"url" : "diary_delete_image.action",
							"data" : data,
							"success" : function(data, status, xhr) {
								$('#imageDeleteByAjax').modal();
							},
							"error" : function(request, status, error) {
								alert("삭제 실패");
							}
						});
					}); */
		});
	
	</script>

</body>
</html>