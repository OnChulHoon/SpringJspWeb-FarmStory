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

<title>FARM STORY - Modify Plant</title>

<!-- Core CSS & AddOn/Plugin CSS & Custom CSS & Fonts & Icons/Glyphs & Favicon -->
<jsp:include page="/WEB-INF/views/include/style/public-style.jsp" />

</head>

<body>

	<!-- ============================================================= HEADER ============================================================= -->

	<jsp:include page="/WEB-INF/views/include/header/public-header.jsp" />

	<!-- ============================================================= HEADER : END ============================================================= -->


	<!-- ============================================================= MAIN ============================================================= -->

	<main> <!-- ============================================================= SECTION – HERO ============================================================= -->

	<section class="light-bg img-bg img-bg-softer"
		style="background-image: url(/farmstory/resources/assets/images/art/image-background04.jpg);">
		<div id="modifyTitle" class="container inner">

			<div class="row">
				<div class="col-md-8 center-block text-center">
					<header>
						<h1>식물 정보 수정</h1>
						<p>
							등록한 식물 정보 수정해주세요.<br>사진 정보도 수정이 가능합니다.
						</p>
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
		<div id="modifyForm" class="container inner">

			<div class="row">
				<div class="col-sm-12">
					<div class="row">

						<div class="col-sm-12 outer-top-md inner-right-sm">

							<form id="modifyPlantInfoForm" class="forms"
								action="/farmstory/plant_update.action?plaNo=${ plant.plaNo }&lastImgIdx=${ lastImgIdx }"
								method="post" enctype="multipart/form-data">

								<div class="row">
									<div class="col-sm-6">
										<h4>식물 이름</h4>
										<input type="text" name="plaName" class="form-control"
											placeholder="식물의 이름을 입력해주세요" value="${ plant.plaName }">
									</div>
									<!-- /.col -->

									<div class="col-sm-6">
										<h4>식물 종류</h4>
										<select class="selectType" name="plaType"
											data-select="${ plant.plaType }">
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
											placeholder="식물의 간략한 정보를 입력해 주세요."
											value="${ plant.plaSimple }">
									</div>
									<!-- /.col -->
								</div>
								<!-- /.row -->

								<div class="row">
									<div class="col-sm-12">
										<h4>상세 설명</h4>
										<textarea name="plaContent" class="form-control"
											placeholder="식물의 상세한 정보를 입력해 주세요.">${ plant.plaContent }</textarea>
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
											placeholder="숫자만 입력해 주세요." value="${ plant.plaMinTem }">
									</div>
									<!-- /.col -->
									<div class="col-sm-6">
										<h6>최대 온도</h6>
										<input type="number" name="plaMaxTem"
											class="form-control inputNumberKey"
											placeholder="숫자만 입력해 주세요." value="${ plant.plaMaxTem }">
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
											placeholder="숫자만 입력해 주세요." value="${ plant.plaMinHum }">
									</div>
									<!-- /.col -->
									<div class="col-sm-6">
										<h6>최대 습도</h6>
										<input type="number" name="plaMaxHum"
											class="form-control inputNumberKey"
											placeholder="숫자만 입력해 주세요." value="${ plant.plaMinHum }">
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
											placeholder="숫자만 입력해 주세요." value="${ plant.plaMinLux }">
									</div>
									<!-- /.col -->
									<div class="col-sm-6">
										<h6>최대 조도</h6>
										<input type="number" name="plaMaxLux"
											class="form-control inputNumberKey"
											placeholder="숫자만 입력해 주세요." value="${ plant.plaMaxLux }">
									</div>
									<!-- /.col -->
								</div>
								<!-- /.row -->
								<br>
								<h4>등록된 사진들</h4>
								<div id="oldImageFiles">
									<div id="owl-popular-posts"
										class="owl-carousel owl-item-gap-sm">
										<c:forEach var="oldImages" items="${ oldImages }"
											varStatus="status">
											<div class="item">
												<figure>
													<figcaption class="text-overlay">
														<c:choose>
															<c:when test="${ oldImages.imgIdx eq '1'}">
																<div class="info">
																	<h4>목록페이지 사진</h4>
																	<p>
																		<a id="modifyThumnail" href="#" class="btn"
																			data-index="${ status.index }">수정하기</a>
																	</p>
																</div>
															</c:when>
															<c:otherwise>
																<div class="info">
																	<h4>상세페이지 사진</h4>
																	<p>
																		<a href="#" class="btn oldImgDelete"
																			data-index="${ status.index }">삭제하기</a>
																	</p>
																</div>
															</c:otherwise>
														</c:choose>
														<!-- /.info -->
													</figcaption>
													<img
														src="/farmstory/resources/upload-image/plant-info/${ oldImages.pliImg }"
														alt="">
												</figure>
											</div>
											<!-- /.item -->
											<input id="oldImgFileName${ status.index }" type="hidden"
												name="oldImgFileName" value="${ oldImages.pliImg }">
											<input id="oldImgIdx${ status.index }" type="hidden"
												name="oldImgIdx" value="${ oldImages.imgIdx }">
										</c:forEach>
									</div>
								</div>
								<br>
								<div id="fileAddAndModifyDiv"></div>
								<input id="plantInfoNumber" type="hidden" name="plaNo"
									value="${ plant.plaNo }"> <a id="backBtn" href="#"
									class="btn pull-right writeMeunBtn">이전으로</a><a id="modifyBtn"
									href="#" class="btn pull-right writeMeunBtn">정보 수정하기</a> <a
									href="#this" id="add" class="btn pull-right writeMeunBtn">상세페이지
									사진 추가선택</a> <a href="#this" id="modifyAndAddImg"
									class="btn pull-right writeMeunBtn">사진 수정하기</a>
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