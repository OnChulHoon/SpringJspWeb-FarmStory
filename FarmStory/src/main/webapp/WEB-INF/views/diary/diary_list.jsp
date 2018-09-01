<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setLocale value="en" scope="request" />
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

<title>FARM STORY - My Diary</title>

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

	<main> <!-- ============================================================= SECTION �� POPULAR POSTS ============================================================= -->

	<section id="popular-posts" class="light-bg">
		<div class="container inner-top-md">
			<div class="row">
				<div class="col-sm-12">
					<div id="accordion" class="panel-group">
						<div class="panel panel-default">

							<div class="panel-heading">
								<h4 class="panel-title">
									<a class="panel-toggle" data-toggle="collapse"
										data-parent="#accordion" href="#content"> <span>다이어리
											갤러리</span>
									</a>
								</h4>
							</div>
							<!-- /.panel-heading -->

							<div id="content" class="panel-collapse collapse in">
								<div class="panel-body">
									<div id="owl-popular-posts"
										class="owl-carousel owl-item-gap-sm">
										<c:forEach var="diaryAllImg" items="${ diaryAllImg }">
											<div class="item">
												<a
													href="/farmstory/diary_detail.action?diaNo=${ diaryAllImg.diaNo }&diaName=${diaName}&
												plaName=${plaName}&diaCategory=${diaCategory}">
													<figure>
														<figcaption class="text-overlay">
															<div class="info">
																<<h4>이미지 클릭!</h4>
																<p>다이어리를 볼 수 있어요</p>
															</div>
															<!-- /.info -->
														</figcaption>
														<img
															src="/farmstory/resources/upload-image/diary-info/${diaryAllImg.diiImg}"
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
							</div>
							<!-- /.content -->

						</div>
						<!-- /.panel -->
					</div>
					<!-- /.accordion -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</section>

	<!-- ============================================================= SECTION �� POPULAR POSTS : END ============================================================= -->


	<!-- ============================================================= SECTION �� BLOG ============================================================= -->

	<section id="blog" class="light-bg">
		<div class="container inner-top-sm inner-bottom classic-blog">
			<form id="monthSearchForm" action="/farmstory/diaryMonthCheck.action">
				<div class="row inner-bottom-xs">
					<div class="col-sm-12">
						<ul class="format-filter text-center">
							<li><a href="#" class="active1" data-filter="*" title="All"
								data-rel="tooltip" data-placement="top"><i class="icon-th"></i></a></li>
							<li><a href="#" id="monthSearch" data-filter=".01"
								title="1월" data-rel="tooltip" data-placement="top"><i
									class="icon-edit"></i></a></li>
							<li><a href="#" id="monthSearch" data-filter=".02"
								title="2월" data-rel="tooltip" data-placement="top"><i
									class="icon-picture-1"></i></a></li>
							<li><a id="monthSearch" href="#" data-filter=".03"
								title="3월" data-rel="tooltip" data-placement="top"><i
									class="icon-picture"></i></a></li>
							<li><a id="monthSearch" href="#" data-filter=".04"
								title="4월" data-rel="tooltip" data-placement="top"><i
									class="icon-video-1"></i></a></li>
							<li><a id="monthSearch" href="#" data-filter=".05"
								title="5월" data-rel="tooltip" data-placement="top"><i
									class="icon-music-1"></i></a></li>
							<li><a id="monthSearch" href="#" data-filter=".06"
								title="6월" data-rel="tooltip" data-placement="top"><i
									class="icon-quote"></i></a></li>
							<li><a id="monthSearch" href="#" data-filter=".07"
								title="7월" data-rel="tooltip" data-placement="top"><i
									class="icon-quote"></i></a></li>
						</ul>
						<!-- /.format-filter -->
					</div>
					<input type="hidden" name="memId" value="${ loginuser.memId }">
					<!-- /.col -->
				</div>
			</form>
			<!-- /.row -->

			<div class="row">
				<div class="col-md-9 inner-right-sm">
					<div class="posts sidemeta">
						<c:forEach var="diary" items="${ diaries }">
							<div>
								<div
									class="post <fmt:formatDate value="${diary.diaDate}" type="date" pattern="MM" />">
									<div class="date-wrapper">
										<div class="date">
											<span class="day"><c:set var="diaDate"
													value="<%=new java.util.Date()%>" /><fmt:setLocale value="en_us"/><fmt:formatDate
													value="${diary.diaDate}" type="date" pattern="MM-dd" /></span>
											<!-- <span class="month">May</span> -->
										</div>
										<!-- /.date -->
									</div>
									<!-- /.date-wrapper -->

									<div class="format-wrapper">
										<a href="#" data-filter="."><i class="icon-picture"></i></a>
									</div>

									<!-- /.format-wrapper -->
									<div class="post-content">
										<div id="owl-work"
											class="owl-carousel owl-inner-pagination owl-inner-nav post-media">
											<c:forEach var="diaryImg" items="${ diary.attachment }">
												<div class="item">
													<figure>
														<img
															src="/farmstory/resources/upload-image/diary-info/${diaryImg.diiImg}"
															alt="">
													</figure>
												</div>
												<!-- /.item -->
											</c:forEach>
										</div>
										<!-- /.owl-carousel -->

										<h2 class="post-title">
											<a
												href="/farmstory/diary_detail.action?diaNo=${ diary.diaNo }&diaName=${diaName}&
												plaName=${plaName}&diaCategory=${diaCategory}">${ diary.diaTitle }</a>
										</h2>

										<ul class="meta">
											<li class="categories"><a href="#">${ diaName }</a></li>
											<li class=""><a href="#">${ plaName }</a></li>
											<li class=""><a href="#">${ diaCategory }</a></li>
										</ul>
										<!-- /.meta -->
										<a
											href="/farmstory/diary_detail.action?diaNo=${ diary.diaNo }&diaName=${diaName}&
												plaName=${plaName}&diaCategory=${diaCategory}"
											class="btn">더보기</a>

									</div>
								</div>
							</div>
							<!-- /.post -->
						</c:forEach>
					</div>
					<!-- /.posts -->

					<!-- pagination -->
					<div class="row">
						<div class="col-xs-12">
							<div class="paginationCenter">
								<ul class="pagination">
									<li><c:choose>
											<c:when test="${ pager.currentPage == 1 }">
												<a href="javascript:" aria-label="Prev"> <span
													aria-hidden="true"> <i class="fa fa-long-arrow-left"
														aria-hidden="true"></i>Prev
												</span>
												</a>
											</c:when>
											<c:otherwise>
												<a
													href="${ pager.linkUrl }?pageno=${ pager.currentPage - 1 }&memId=${ loginuser.memId }&dibNo=${diaries[0].dibNo}&diaName=${ diaName }&
													plaName=${ plaName }&diaCategory=${ diaCategory }"
													aria-label="Previous"> <span aria-hidden="true">
														<i class="fa fa-long-arrow-left" aria-hidden="true"></i>Prev
												</span>
												</a>
											</c:otherwise>
										</c:choose></li>
									<c:forEach var="idx" begin="${pager.pageFrom }"
										end="${ pager.pageCount > pager.pageTo ? pager.pageTo : pager.pageCount }">
										<c:choose>
											<c:when test="${ pager.currentPage == idx }">
												<li class="active"><a href="javascript:">${ idx }</a></li>
											</c:when>
											<c:otherwise>
												<li><a
													href="${ pager.linkUrl }?pageno=${ idx }&memId=${ loginuser.memId }&dibNo=${diaries[0].dibNo}&diaName=${ diaName }&
													plaName=${ plaName }&diaCategory=${ diaCategory }">${ idx }</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<li><c:choose>
											<c:when test="${ pager.currentPage < pager.pageCount }">
												<a
													href="${ pager.linkUrl }?pageno=${ pager.currentPage + 1 }&memId=${ loginuser.memId }&dibNo=${diaries[0].dibNo}&diaName=${ diaName }&
													plaName=${ plaName }&diaCategory=${ diaCategory }"
													aria-label="Next">
											</c:when>
											<c:otherwise>
												<a href="javascript:" aria-label="Next">
											</c:otherwise>
										</c:choose> <span aria-hidden="true"> <i
											class="fa fa-long-arrow-right" aria-hidden="true"></i>Next
									</span> </a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /.pagination -->
				</div>
				<!-- /.col -->
				<aside class="col-md-3">
					<div class="sidebox widget">
						<h4>Random Posts</h4>
						<div class="row thumbs gap-xs">
							<c:forEach var="diaryAllImg" end="3" items="${ diaryAllImg }">
								<div class="col-xs-6 thumb">
									<figure class="icon-overlay icn-link">
										<a
											href="/farmstory/diary_detail.action?diaNo=${ diaryAllImg.diaNo }&diaName=${diaName}&
												plaName=${plaName}&diaCategory=${diaCategory}">
											<img
											src="/farmstory/resources/upload-image/diary-info/${diaryAllImg.diiImg}"
											alt="">
										</a>
									</figure>
								</div>
								<!-- /.thumb -->
							</c:forEach>
						</div>
						<!-- /.row -->
					</div>
					<!-- /.widget -->

					<div class="sidebox widget">
						<h4>다이어리 검색</h4>
						<form action="/farmstory/diary_list.action" id="search-form"
							class="navbar-form search" role="search">
							<input name="dibNo" type="hidden" value="${diaries[0].dibNo}">
							<input name="diaName" type="hidden" value="${ diaName }">
							<input name="plaName" type="hidden" value="${ plaName }">
							<input name="diaCategory" type="hidden" value="${ diaCategory }">
							<input id="diaTitle" name="diaTitle" type="search"
								class="form-control" placeholder="제목으로 검색해보세요!">
							<button id="titleSearch"
								class="btn btn-default btn-submit icon-right-open"></button>
						</form>
					</div>
					<!-- /.widget -->

					<!-- <div class="sidebox widget">
						<h4>Categories</h4>
						<ul class="circled">
							<li><a href="#">Identity (114)</a></li>
							<li><a href="#">Interactive (93)</a></li>
							<li><a href="#">Graphic Design (82)</a></li>
							<li><a href="#">Motion Graphics (77)</a></li>
							<li><a href="#">Photography (63)</a></li>
							<li><a href="#">Technology (55)</a></li>
							<li><a href="#">Business (42)</a></li>
							<li><a href="#">Print (36)</a></li>
							<li><a href="#">Audio (23)</a></li>
						</ul>
						/.circled
					</div> -->
					<!-- /.widget -->

					<div class="sidebox widget">
						<h4>Archives</h4>

						<ul class="circled">
							<li><a href="#">March 2015</a></li>
							<li><a href="#">February 2015</a></li>
							<li><a href="#">January 2015</a></li>
							<li><a href="#">December 2013</a></li>
							<li><a href="#">November 2013</a></li>
							<li><a href="#">October 2013</a></li>
						</ul>
						<!-- /.circled -->

						<a href="#" class="txt-btn">All archives</a>
					</div>

				</aside>

			</div>
			<!-- /.row -->

		</div>
		<!-- /.container -->
	</section>

	<!-- ============================================================= SECTION �� BLOG : END ============================================================= -->

	</main>

	<!-- ============================================================= MAIN : END ============================================================= -->


	<!-- ============================================================= FOOTER ============================================================= -->

	<jsp:include page="/WEB-INF/views/include/footer/public-footer.jsp" />

	<!-- ============================================================= FOOTER : END ============================================================= -->

	<!-- JavaScripts placed at the end of the document so the pages load faster -->
	<jsp:include page="/WEB-INF/views/include/javascript/public-js.jsp" />
	<script type="text/javascript">
		$(function() {
			$('#titleSearch').on('click', function(event) {
				var diaTitle = $('#diaTitle').val();
				if (diaTitle == '') {
					alert('검색할 제목을 입력하세요.');
					return;
				}
				//location.href = '/farmstory/diary_list.action?diaTitle=' + diaTitle;
				$('#search-form').submit();

			});

			/* $('#review')
			.on(
					'click',
					function(event) {
						event.preventDefault();
						<c:choose>
						<c:when test="${ empty loginuser }">
						//alert('로그인 한 사용자만 리뷰를 작성할 수 있습니다.');
						$("#loginCheckModal").modal('show');
						</c:when>
						<c:otherwise>
						//$('#move_to_tourist_form').submit();
						var content = $('#move_to_tourist_form textarea')
								.val();
						if (content.length == 0) {
							alert('내용을 입력하세요.');
							return;
						}

						var data = $("#move_to_tourist_form").serialize();

						$
								.ajax({
									"url" : "tourist_review.action",
									"method" : "POST",
									"data" : data,
									"success" : function(data, status, xhr) {
										alert("등록 성공");
										$("#updateReviewModal").modal(
												"hide");
										$("#move_to_tourist_form textarea")
												.val("");
										var re_pageno = $("#review-pageno");
										var touristNo = $(
												'#move_to_tourist_form input[name=touristno]')
												.val();
										$("div#reviewMedia").load(
												"findReviews.action?touristNo="
														+ touristNo
														+ "&re_pageNo="
														+ re_pageno.val());
									},
									"error" : function(xhr, status, data) {
										alert("등록 실패");
									}
								});
						</c:otherwise>
						</c:choose>
					}); */
		});
	</script>

</body>
</html>