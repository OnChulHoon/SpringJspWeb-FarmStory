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
						<h1>다이어리 책 만들기</h1>
						<p>내가 키우는 식물의 생육일기 다이어리 책을 만들어보세요.</p>
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

					<form id="diary-book-form" action="diary_book_write.action" method="post"
						enctype="multipart/form-data">


						<div class="row">
							<div class="col-sm-6">
							<h4>식물 이름</h4>
								<input type="text" name="plaName" class="form-control" value="${ plantInfo.plaName }" readonly="readonly">
							</div>
							<div class="col-sm-6">
							<h4>화분 번호</h4>
								<input type="text" name="regPotNo" class="form-control" value="${ regPotNo }" readonly="readonly">
							</div>
							<!-- /.col -->
						</div>
						<div class="row">
							<div class="col-sm-6">
								<h4>다이어리 책 이름</h4>
								<input type="text" name="diaName" class="form-control"
									placeholder="다이어리의 이름을 입력해주세요">
							</div>
							<div class="col-sm-6">
							<h4>카테고리</h4>
								<input type="text" name="diaCategory" class="form-control" value="${ plantInfo.plaType }" readonly="readonly">
							</div>
						</div>	
						
						<div class="row">
							<div id="addImage">
								<div class="col-sm-12">
								<h4>표지 사진 선택</h4>
									<input type="file" name="diaryBookImg" id="file"
										class="form-control"><br>
								</div>
								<!-- /.col -->
							</div>
						</div>
						<!-- /.row -->
						<input type="hidden" name="plaNo" value="${ plaNo }">
						<button id="submitbutton" class="btn btn-submit pull-right">다이어리 만들기</button>

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
	<script type='text/javascript'>
		$(function() {


			//전송버튼 클릭이벤트
			$("#submitbutton").click(
					function(event) {

						event.preventDefault();
						event.stopPropagation();
						//폼 submit
						$("#diary-book-form").submit();
					});

		});
	</script>

</body>
</html>