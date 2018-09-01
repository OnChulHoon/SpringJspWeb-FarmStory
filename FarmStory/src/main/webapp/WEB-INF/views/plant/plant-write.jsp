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

<title>FARM STORY - Register Plant</title>

<!-- Core CSS & AddOn/Plugin CSS & Custom CSS & Fonts & Icons/Glyphs & Favicon -->
<jsp:include page="/WEB-INF/views/include/style/public-style.jsp" />

</head>

<body>

	<!-- ============================================================= HEADER ============================================================= -->

	<jsp:include page="/WEB-INF/views/include/header/public-header.jsp" />

	<!-- ============================================================= HEADER : END ============================================================= -->


	<!-- ============================================================= MAIN ============================================================= -->

	<main> 
	
	<!-- ============================================================= SECTION – HERO ============================================================= -->

	<section class="light-bg img-bg img-bg-softer"
		style="background-image: url(/farmstory/resources/assets/images/art/image-background04.jpg);">
		<div id="registerTitle" class="container inner">
			<div class="row">
				<div class="col-md-8 center-block text-center">
					<header>
						<h1>식물 정보 등록</h1>
						<p>식물에 대한 정보를 아래 빈칸에 입력해주세요.</p>
					</header>
				</div>
				<!-- /.col -->
			</div>
			<!-- ./row -->
		</div>
	</section>

	<!-- ============================================================= SECTION – HERO : END ============================================================= -->


	<!-- ============================================================= SECTION â CONTACT FORM ============================================================= -->

	<section>
		<div id="registerForm" class="container inner">
			<div class="row">
				<div class="col-sm-12">
					<div class="row">

						<div class="col-sm-12 outer-top-md inner-right-sm">

							<form id="plantInfoForm" class="forms"
								action="/farmstory/plant_write.action" method="post"
								enctype="multipart/form-data">

								<div class="row">
									<div class="col-sm-6">
										<h4>식물 이름</h4>
										<input type="text" name="plaName" class="form-control"
											placeholder="식물의 이름을 입력해주세요">
									</div>
									<!-- /.col -->

									<div class="col-sm-6">
										<h4>식물 종류</h4>
										<select class="selectType" name="plaType">
											<option value="꽃">꽃</option>
											<option value="관엽식물">관엽식물</option>
											<option value="허브">허브</option>
											<option value="다육">다육</option>
										</select>
									</div>
									<!-- /.col -->

								</div>
								<!-- /.row -->

								<div class="row">
									<div class="col-sm-12">
										<br>
										<h4>간략 설명</h4>
										<input type="text" name="plaSimple" class="form-control"
											placeholder="식물의 간략한 정보를 입력해주세요.">
									</div>
									<!-- /.col -->
								</div>
								<!-- /.row -->

								<div class="row">
									<div class="col-sm-12">
										<h4>상세 설명</h4>
										<textarea name="plaContent" class="form-control"
											placeholder="식물의 상세한 정보를 입력해주세요."></textarea>
									</div>
									<!-- /.col -->
								</div>
								<!-- /.row -->

								<h4>적정 온도</h4>
								<div class="row">
									<div class="col-sm-6">
										<h6>최소 온도</h6>
										<input type="number" name="plaMinTem"
											class="form-control inputNumberKey"
											placeholder="숫자만 입력해주세요.">
									</div>
									<!-- /.col -->
									<div class="col-sm-6">
										<h6>최대 온도</h6>
										<input type="number" name="plaMaxTem"
											class="form-control inputNumberKey"
											placeholder="숫자만 입력해주세요.">
									</div>
									<!-- /.col -->
								</div>
								<!-- /.row -->

								<h4>적정 습도</h4>
								<div class="row">
									<div class="col-sm-6">
										<h6>최소 습도</h6>
										<input type="number" name="plaMinHum"
											class="form-control inputNumberKey"
											placeholder="숫자만 입력해주세요.">
									</div>
									<!-- /.col -->
									<div class="col-sm-6">
										<h6>최대 습도</h6>
										<input type="number" name="plaMaxHum"
											class="form-control inputNumberKey"
											placeholder="숫자만 입력해주세요.">
									</div>
									<!-- /.col -->
								</div>
								<!-- /.row -->

								<h4>적정 조도</h4>
								<div class="row">
									<div class="col-sm-6">
										<h6>최소 조도</h6>
										<input type="number" name="plaMinLux"
											class="form-control inputNumberKey"
											placeholder="숫자만 입력해주세요.">
									</div>
									<!-- /.col -->
									<div class="col-sm-6">
										<h6>최대 조도</h6>
										<input type="number" name="plaMaxLux"
											class="form-control inputNumberKey"
											placeholder="숫자만 입력해주세요.">
									</div>
									<!-- /.col -->
								</div>
								<!-- /.row -->

								<h4>등록할 사진 선택</h4>
								<div class="row">
									<div class="col-sm-12">
										<h6>목록페이지 사진 선택</h6>
										<input type="file" name="plantImg" class="form-control">
									</div>
									<!-- /.col -->
								</div>
								<!-- /.row -->
								<br>
								<h6>상세페이지 사진 선택</h6>
								<div id="fileDiv" class="row">
									<div class="col-sm-12">
										<input type="file" name="plantImg" class="form-control"><br>
									</div>

									<!-- /.col -->
								</div>
								<!-- /.row -->

								<a id="backBtn" href="#" class="btn pull-right writeMeunBtn">이전으로</a>
								<a id="writePlantInfoBtn" href="#"
									class="btn pull-right writeMeunBtn">정보 등록하기</a> <a href="#this"
									id="add" class="btn pull-right writeMeunBtn">사진 추가하기</a>

							</form>

							<div id="response"></div>

						</div>
						<!-- ./col -->

					</div>
					<!-- /.row -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->

		</div>
		<!-- /.container -->
	</section>

	<!-- ============================================================= SECTION â CONTACT FORM : END ============================================================= -->


	</main>

	<!-- ============================================================= MAIN : END ============================================================= -->


	<!-- ============================================================= JAVASCRIPT ============================================================= -->

	<jsp:include page="/WEB-INF/views/include/javascript/public-js.jsp" />

	<jsp:include page="/WEB-INF/views/plant/js/plant-jstl-js.jsp" />

	<!-- ============================================================= JAVASCRIPT : END ============================================================= -->

</body>
</html>