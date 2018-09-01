<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>

<html lang="ko">
<head>
<!-- Meta -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta name="description" content="">
<meta name="author" content="">

<title>FARM STORY - My Diary</title>

<!-- Core CSS & AddOn/Plugin CSS & Custom CSS & Fonts & Icons/Glyphs & Favicon -->
<jsp:include page="/WEB-INF/views/include/style/public-style.jsp" />

<style type="text/css">
#diaryTitle{
	padding-top: 70px;
	padding-bottom: 70px;
}
#savebutton, #addImageBtn{
	margin-left: 20px;
}
</style>

</head>

<body>

	<!-- ============================================================= HEADER ============================================================= -->
	<jsp:include page="/WEB-INF/views/include/header/public-header.jsp" />

	<!-- ============================================================= HEADER : END ============================================================= -->


	<!-- ============================================================= MAIN ============================================================= -->

	<main> <!-- ============================================================= SECTION – HERO ============================================================= -->

	<section class="light-bg img-bg img-bg-softer"
		style="background-image: url(/farmstory/resources/assets/images/art/image-background04.jpg);">
		<div id="diaryTitle" class="container inner">
			<div class="row">
				<div class="col-md-8 center-block text-center">
					<header>
						<h1>화분 일기 쓰기</h1>
						<p>내가 키우는 식물의 생육일기를 써보세요.</p>
					</header>
				</div>
				<!-- /.col -->
			</div>
			<!-- ./row -->
		</div>
	</section>

	<!-- ============================================================= SECTION – HERO : END ============================================================= -->

	<div class="container inner">
		<div class="row">

			<div class="col-md-15 inner-right-md">

				<!-- ============================================================= SECTION – CONTACT FORM ============================================================= -->

				<section id="diary-form-section">

					<form id="diary-form" action="diary_write.action" method="post"
						enctype="multipart/form-data">


						<div class="row">
							<div class="col-sm-6">
							<h4>식물 이름</h4>
								<input type="text" name="" class="form-control" value="${ diaryBookInfo.plaName }" readonly="readonly">
							</div>
							<div class="col-sm-6">
							<h4>화분 번호</h4>
								<input type="text" name="" class="form-control" value="${ diaryBookInfo.regPotNo }" readonly="readonly">
							</div>
							<!-- /.col -->
						</div>
						<div class="row">
							<div class="col-sm-6">
								<h4>다이어리 책 이름</h4>
								<input type="text" name="" value="${ diaryBookInfo.diaName }" class="form-control"
									readonly="readonly">
							</div>
							<div class="col-sm-6">
							<h4>카테고리</h4>
								<input type="text" name="" class="form-control" value="${ diaryBookInfo.diaCategory }" readonly="readonly">
							</div>
						</div>	
						<div class="row">	
							<div class="col-sm-6">
								<h4>일기 제목</h4>
								<input type="text" name="diaTitle" class="form-control"
									placeholder="일기 제목을 입력해주세요">
							</div>
							<div class="col-sm-6">
								<h4>날짜 선택</h4>
								<input type="date" name="diaDate" class="form-control"
									placeholder="날짜를 입력해주세요">
							</div>
							<!-- /.col -->
						</div>

						<!-- /.row -->
						<br>
						<div class="row">
							<div class="col-sm-12">
							<h4>일기 쓰기</h4>
								<textarea name="diaContent" id="smarteditor"
									class="form-control"></textarea>
							</div>
							<!-- /.col -->
						</div>
						
						<div class="row">
							<div id="addImage">
								<div class="col-sm-12">
								<h4>사진 선택</h4>
									<input type="file" name="diiImage1" id="file"
										class="form-control"><br>
								</div>
								<!-- /.col -->
							</div>
						</div>
						<!-- /.row -->
						
						<input type="hidden" name="dibNo" value="${ diaryBookInfo.dibNo }">
						<input type="hidden" name="memId" value="${loginuser.memId}">
						<button id="savebutton" class="btn btn-submit pull-right">등록하기</button>
						<a id="addImageBtn" class="btn btn-submit pull-right">이미지 추가</a>

					</form>

					<div id="response"></div>

				</section>

				<!-- ============================================================= SECTION – CONTACT FORM : END ============================================================= -->

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
								var add = $("<div class='col-sm-12'><input type='file' class='form-control' id='file' name='diiImage1'><br></div>");
								$('#addImage').append(add);
							});
		});
	</script>

</body>
</html>