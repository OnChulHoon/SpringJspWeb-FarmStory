<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>

<html lang="ko">
<head>
	<!-- Meta -->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>FARM STORY - Introduce</title>
	
	<jsp:include page="/WEB-INF/views/include/style/public-style.jsp" />
	
	<style type="text/css">
	.introImg {
		border: 0px solid #888888;
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
			rgba(0, 0, 0, 0.19);
	}
	</style>
	
</head>

<body>
	
	<!-- ============================================================= HEADER ============================================================= -->
	
	<jsp:include page="/WEB-INF/views/include/header/public-header.jsp" />
	
	<!-- ============================================================= HEADER : END ============================================================= -->
	
	
	<!-- ============================================================= MAIN ============================================================= -->
	
	<main>
		
		<!-- ============================================================= SECTION – HERO ============================================================= -->
	
	<section class="light-bg img-bg img-bg-softer" style="background-image: url(/farmstory/resources/assets/images/art/image-background04.jpg);">
		<div id="registerTitle" class="container inner">
			<div class="row">
				<div class="col-md-8 center-block text-center aos-init aos-animate" data-aos="fade-up">
					<header>
						<h1>팜스토리 소개 </h1>
						<p>팜스토리를 소개합니다.</p>
					</header>
				</div>
				<!-- /.col -->
			</div>
			<!-- ./row -->
		</div>
	</section>
		
		<!-- ============================================================= SECTION – HERO : END ============================================================= -->
		
		<!-- ============================================================= SECTION – SERVICES ============================================================= -->
		
		<section id="services">
			<div class="container inner">
				<div class="row">
					<div class="col-xs-12">
						<div class="tabs tabs-services tabs-circle-top tab-container">
							
							<ul class="etabs text-center">
							<c:forEach var="cover" items="${ coverList }">
								<li class="tab" id="cover-tab-${ cover.covNo }" data-covno="${ cover.covNo }">
									<a href="#tab-${ cover.covNo }">
										<div><i class="icon-book-open"></i></div>
										${ cover.covTitle }
									</a>
								</li>
							</c:forEach>

							</ul><!-- /.etabs -->
							
							<div class="panel-container">
								
								<c:forEach var="cover" items="${ coverList }">
								<div class="tab-content" id="tab-${ cover.covNo }">
									<div class="row">
									<c:if test="${ empty cover.covLcontent and not empty cover.covRcontent }">
										<div class="col-md-5 col-md-offset-1 col-sm-6 inner-right-xs">
												<figure>
												<img class="introImg"
													src="/farmstory/resources/upload-image/cover-info/${cover.covImg}"
													style="width: 350px; height: 350px">
											</figure>
										</div><!-- /.col -->
										
										<div class="col-md-5 col-sm-6 inner-top-xs inner-left-xs">
											<h3>
												<span data-cover="title">${ cover.covTitle }</span>
											</h3>
											<p data-cover="rcontent">${ cover.covRcontent }</p>
										</div><!-- /.col -->
									</c:if>
									
									<c:if test="${ not empty cover.covLcontent and not empty cover.covRcontent }">
										<div class="col-md-4 col-md-push-3 col-md-offset-1 col-sm-6 inner-left-xs inner-right-xs aos-init aos-animate" data-aos="fade-up">
											<figure>
												<img class="introImg"
													src="/farmstory/resources/upload-image/cover-info/${cover.covImg}"
													style="width: 300px; height: 350px">
											</figure>
										</div><!-- /.col -->

										<div class="col-md-3 col-md-pull-4 col-sm-6 inner-top-xs aos-init aos-animate" data-aos="fade-up">
											<h3>
												<span data-cover="title">${ cover.covTitle }</span>
											</h3>
											<p data-cover="lcontent">${ cover.covLcontent }</p>

										</div>
										<!-- /.col -->

										<div class="col-md-3 col-sm-6 inner-top-xs aos-init aos-animate" data-aos="fade-up">
											<h3>
												<span data-cover="title">${ cover.covTitle }</span>
											</h3>
											<p data-cover="rcontent">${ cover.covRcontent }</p>
										</div>
									</c:if>
									
									<c:if test="${ not empty cover.covLcontent and empty cover.covRcontent }">
										<div class="col-md-5 col-md-push-5 col-md-offset-1 col-sm-6 col-sm-push-6 inner-left-xs">
												<figure>
													<img class="introImg"
														src="/farmstory/resources/upload-image/cover-info/${cover.covImg}"
														style="width: 350px; height: 350px">
												</figure>
											</div><!-- /.col -->
											
											<div class="col-md-5 col-md-pull-5 col-sm-6 col-sm-pull-6 inner-top-xs inner-right-xs">
												<h3>
												<span data-cover="title">${ cover.covTitle }</span>
											</h3>
											<p data-cover="lcontent">${ cover.covLcontent }</p>
											</div><!-- /.col -->
									</c:if>
									
									</div><!-- /.row -->
								</div><!-- /.tab-content -->
								</c:forEach>
								 
							</div><!-- /.panel-container -->
							 
						</div><!-- /.tabs -->
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.container -->
		</section>
		
		<!-- ============================================================= SECTION – SERVICES : END ============================================================= -->
		
		

		
	</main>
	
	<!-- ============================================================= MAIN : END ============================================================= -->
	
	
	<!-- ============================================================= FOOTER ============================================================= -->
		
	<jsp:include page="/WEB-INF/views/include/footer/public-footer.jsp"/>
	
	<!-- ============================================================= FOOTER : END ============================================================= -->
	
	<jsp:include page="/WEB-INF/views/include/javascript/public-js.jsp" />

	<script src="/farmstory/resources/assets/switchstylesheet/switchstylesheet.js"></script>
	
	<script>
		$(document).ready(function(){ 
			$(".changecolor").switchstylesheet( { seperator:"color"} );
			
			$('li[id^=cover-tab]').on('click', function(event) {
				//load data
				var covNo = $(this).attr('data-covno');
				loadCoverDetail(covNo);

			});
			
			var firstCoverTab = $('li[id^=cover-tab]').first();
			firstCoverTab.addClass('active')				
			var covNo = firstCoverTab.attr('data-covno');
			loadCoverDetail(covNo);
		});
		
		function loadCoverDetail(covNo) {
			$.ajax({
				"url" : 'ajax_cover_detailm.action',
				"method" : 'get',
				"data" : { "covNo" : covNo },
				"success" : function(data, status, xhr) {
					
					var targetTab = $('#tab-' + covNo);
					targetTab.find('span[data-cover=title]').html(data.covTitle);
					targetTab.find('p[data-cover=lcontent]').html(data.covLcontent.replace("<p>", "").replace("</p>", ""));
					targetTab.find('p[data-cover=rcontent]').html(data.covRcontent.replace("<p>", "").replace("</p>", ""));
					
				},
				"error" : function(err, status, xhr) {
					alert(status);
				}
			});

		}
	</script>
</body>
</html>