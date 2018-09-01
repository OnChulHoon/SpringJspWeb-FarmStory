<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>

<html lang="ko">
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

<style type="text/css">
#plant-sub-title {
	font-size: 17px;
}

#notosans {
	font: 24px/30px 'Noto Sans KR', sans-serif;
}
</style>
</head>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">

	$(function() { //jQuery의 main 함수
		$('#updatebtn').on('click',function(event) {
							<c:choose>
							<c:when test="${ADMIN}">
							alert('관리자만 글을 작성할 수 있습니다.');
							location.href = '/farmstroy/home/action';
							</c:when>
							<c:otherwise>
							location.href = '/farmstory/cover_update.action?covNo=${cover.covNo}';
							</c:otherwise>
							</c:choose>
						});
	});
	$(function() {
		$('#listbtn').on('click', function(event) {
			location.href = '/farmstory/cover_list.action'
		});
	});
	$(function() {
		$('#deletebtn')
				.on('click',function(event) {
							<c:choose>
							<c:when test="${ADMIN}">
							alert('관리자만 글을 삭제할 수 있습니다..');
							location.href = '/farmstroy/home.action';
							</c:when>
							<c:otherwise>
							location.href = '/farmstory/cover_delete.action?covNo=${cover.covNo}'
							</c:otherwise>
							</c:choose>
						});
	});
</script>
<body>

	<!-- ============================================================= HEADER ============================================================= -->

	<jsp:include page="/WEB-INF/views/include/header/public-header.jsp" />

	<!-- ============================================================= HEADER : END ============================================================= -->


	<!-- ============================================================= MAIN ============================================================= -->

	<main> <!-- ============================================================= SECTION â PORTFOLIO ============================================================= -->

	<section id="portfolio">

	<section class="light-bg img-bg img-bg-softer" style="background-image: url(/farmstory/resources/assets/images/art/image-background04.jpg);">
		<div id="registerTitle" class="container inner">
			<div class="row">
				<div class="col-md-8 center-block text-center aos-init aos-animate" data-aos="fade-up">
					<header>
						<h1>팜스토리 소개 만들기</h1>
						<p>팜스토리 소개를 파트별로 작성해주세요.</p>
					</header>
				</div>
				<!-- /.col -->
			</div>
			<!-- ./row -->
		</div>
	</section>
		<!-- /.container -->

		<div class="container inner-bottom notoSansKR">
			<div class="row">
				<div class="col-sm-12 portfolio">

					<div class="tab-content active" id="tab-5"
						style="display: block; position: static; visibility: visible;">

						<div class="row">
							<div
								class="col-md-8 col-sm-6 col-xs-8 center-block text-center"
								data-aos="fade-up">
								<figure>
									<img
									src="/farmstory/resources/upload-image/cover-info/${cover.covImg}"
									style="width: 700px; height: 450px">
								</figure>
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->

						<div class="row">
							<div
								class="col-sm-8 center-block text-left aos-init aos-animate"
								data-aos="fade-up">
								<h3>${ cover.covTitle }</h3>
								<p >${cover.covLcontent}</p>
								<p >${cover.covRcontent}</p>
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->

					</div>

					<div style="text-align: center">
						<button id="updatebtn" class="btn btn-submit" >글수정</button>
						<button id="listbtn" class="btn btn-submit" >목록보기</button>
						<button id="deletebtn" class="btn btn-submit" >삭제</button>
					</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</section>

	<!-- ============================================================= SECTION â PORTFOLIO : END ============================================================= -->



	</main>

	<!-- ============================================================= MAIN : END ============================================================= -->


	<!-- ============================================================= FOOTER ============================================================= -->


	<!-- ============================================================= FOOTER : END ============================================================= -->

	<!-- ============================================================= JAVASCRIPT ============================================================= -->

	<jsp:include page="/WEB-INF/views/include/javascript/public-js.jsp" />

	<!-- ============================================================= JAVASCRIPT : END ============================================================= -->

</body>
</html>