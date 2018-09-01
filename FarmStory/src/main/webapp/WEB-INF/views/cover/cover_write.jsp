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

<title>FARM STORY - Introduce</title>

<!-- Core CSS & AddOn/Plugin CSS & Custom CSS & Fonts & Icons/Glyphs & Favicon -->
<jsp:include page="/WEB-INF/views/include/style/public-style.jsp" />

</head>

<body>

	<!-- ============================================================= HEADER ============================================================= -->
	<jsp:include page="/WEB-INF/views/include/header/public-header.jsp" />

	<!-- ============================================================= HEADER : END ============================================================= -->


	<!-- ============================================================= MAIN ============================================================= -->

	<main> <!-- ============================================================= SECTION – HERO ============================================================= -->

   <section class="light-bg img-bg img-bg-softer" style="background-image: url(/farmstory/resources/assets/images/art/image-background04.jpg);">
		<div id="registerTitle" class="container inner">
			<div class="row">
				<div class="col-md-8 center-block text-center aos-init aos-animate" data-aos="fade-up">
					<header>
						<h1>소개페이지 작성하기</h1>
						<p>팜스토리 소개를 파트별로 작성해주세요.</p>
					</header>
				</div>
				<!-- /.col -->
			</div>
			<!-- ./row -->
		</div>
	</section>
	<div class="container inner">
		<div class="row">

			<div class="col-md-15 inner-right-md">

				<!-- ============================================================= SECTION – CONTACT FORM ============================================================= -->

				<section id="cover-form-section">

					<h2>소개 등록</h2>

					<form id="cover-form" action="cover_write.action" method="post"
						enctype="multipart/form-data">

						<div class="row">
							<div class="col-sm-6">
								<h4>제목 입력</h4>
								<input type="text" name="covTitle" class="form-control"
									placeholder="제목을 입력해주세요">
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->

						<div class="row">
							<div id="addImage">
								<div class="col-sm-6">
									<h4>그림 파일 등록</h4>
									<input type="file" name="cover_image" id="file"
										class="form-control">
								</div>
								<!-- /.col -->
							</div>

						</div>
						<!-- /.row -->
						<br />
						<%
							//////////////////////////////////////////////////
						%>
						<!-- 왼쪽 소개내용 -->
						<div class="row">
							<div style="padding-left:7px;margin-left:7px">
								<div class="col-sm-20">
								<h4>왼쪽 소개 내용 작성</h4>
									<textarea name="covLcontent" id="leftSmartEditor"
										class="form-control"></textarea>
								</div>
								<!-- /.col -->
							</div>
						</div>

						<div class="row">
							<div class="col-sm-20"></div>
							<!-- /.col -->
						</div>
						<%
							//////////////////////////////////////////////////
						%>
						<!-- 오른쪽 소개내용 -->
						<div class="row">
							<div style="padding-left:7px;margin-left:7px">
								<div class="col-sm-20">
								<h4>오른쪽 소개 내용 작성</h4>
									<textarea name="covRcontent" id="rightSmartEditor"
										class="form-control"></textarea>
								</div>
								<!-- /.col -->
							</div>
						</div>

						<div class="row">
							<div class="col-sm-20"></div>
							<!-- /.col -->
						</div>
						<!-- /.row -->

						<button id="savebutton" class="btn btn-submit">등록하기</button>
						<button id="listbutton" class="btn btn-submit">리스트이동</button>
					</form>

					<div id="response"></div>

				</section>

				<!-- ============================================================= SECTION – CONTACT FORM : END ============================================================= -->


				<!-- ============================================================= SECTION – CONTACTS ============================================================= -->



				<!-- ============================================================= SECTION – CONTACTS : END ============================================================= -->

			</div>
			<!-- ./col -->


		</div>
		<!-- /.row -->
	</div>
	<!-- /.container --> </main>

	<!-- ============================================================= MAIN : END ============================================================= -->


	<!-- ============================================================= FOOTER ============================================================= -->

	

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
						elPlaceHolder : "leftSmartEditor",
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

			nhn.husky.EZCreator
					.createInIFrame({
						oAppRef : editor_object,
						elPlaceHolder : "rightSmartEditor",
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

						/*
						//id가 smarteditor인 textarea에 에디터에서 대입
						editor_object.getById["leftSmartEditor"].exec(
								"UPDATE_CONTENTS_FIELD", []);
						editor_object.getById["rightSmartEditor"].exec(
								"UPDATE_CONTENTS_FIELD", []); */

						// 이부분에 에디터 validation 검증
 						
						
                        if(editor_object.getById && editor_object.getById){
						//id가 smarteditor인 textarea에 에디터에서 대입
						event.preventDefault();
						event.stopPropagation();
						
						editor_object.getById["leftSmartEditor"].exec(
								"UPDATE_CONTENTS_FIELD", []);
						editor_object.getById["rightSmartEditor"].exec(
								"UPDATE_CONTENTS_FIELD", []);
                        }else{
                        	event.preventDefault();
    						event.stopPropagation();
                        	
                        } 
						
						//폼 submit
						$("#cover-form").submit();
					});

			//리스트 이동버튼

		$("#listbutton").click(function(event) {
			event.preventDefault();
			event.stopPropagation();
				location.href='/farmstory/cover_list.action';
			});
			$('#addImageBtn')
					.on(
							'click',
							function(event) {
								event.preventDefault();
								event.stopPropagation();
								var add = $("<div class=\"col-sm-6\"><input type=\"file\" class=\"form-control\" id=\"file\" name=\"covImage\"></div>");
								$('#coverImage').append(add);
							});
		});
	</script>

</body>
</html>