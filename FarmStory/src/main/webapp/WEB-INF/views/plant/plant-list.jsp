<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>

<html lang="ko">
	<head>
		<!-- Meta -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
		<meta name="description" content="">
		<meta name="author" content="">
		
		<title>FARM STORY - Plant</title>
		
		<!-- Core CSS & AddOn/Plugin CSS & Custom CSS & Fonts & Icons/Glyphs & Favicon -->
		<jsp:include page="/WEB-INF/views/include/style/public-style.jsp"/>
		
	</head>
	
	<body>
		
		<!-- ============================================================= HEADER ============================================================= -->
		
		<jsp:include page="/WEB-INF/views/include/header/public-header.jsp"/>
		
		<!-- ============================================================= HEADER : END ============================================================= -->
		
		
		<!-- ============================================================= MAIN ============================================================= -->
		
		<main>
			
			<!-- ============================================================= SECTION â PORTFOLIO ============================================================= -->
		
			<section id="portfolio">
				<div class="container inner">
					<div class="row">
						<div class="col-md-8 col-sm-9 center-block text-center">
							<header>
								<h1>어떻게 키워야할까?</h1>
								<p>여기서 식물에 대한 정보를 보고가세요.</p>
							</header>
						</div><!-- /.col -->
					</div><!-- /.row -->
				</div><!-- /.container -->
				
				<div class="container inner-bottom">
					<div class="row">
						<div class="col-sm-12 portfolio">
							
							<ul class="filter text-center">
								<li><a href="#" data-filter="*" class="active">전체</a></li>
								<li><a href="#" data-filter=".꽃">꽃</a></li>
								<li><a href="#" data-filter=".관엽식물">관엽식물</a></li>
								<li><a href="#" data-filter=".허브">허브</a></li>
								<li><a href="#" data-filter=".다육">다육</a></li>
							</ul><!-- /.filter -->
							
							<ul class="isotope items col-3 gap">
							
							<c:forEach var="plantInfos" items="${ plantInfos }">
								<li class="item thumb ${ plantInfos.plaType }">
									<figure>
										
										<div class="icon-overlay icn-link">
											<a href="/farmstory/plant_detail.action?plaNo=${ plantInfos.plaNo }"><img src="/farmstory/resources/upload-image/plant-info/${ plantInfos.pliImg }" alt=""></a>
										</div><!-- /.icon-overlay -->
										
										<figcaption class="bordered no-top-border">
											<div class="info">
												<h4><a href="/farmstory/plant_detail.action?plaNo=${ plantInfos.plaNo }">[${ plantInfos.plaType }] ${ plantInfos.plaName }</a></h4>
												<p>${ plantInfos.plaSimple }</p>
											</div><!-- /.info -->
										</figcaption>
										
									</figure>
								</li><!-- /.item -->
							</c:forEach>
								
								
							</ul><!-- /.items -->
							
						</div><!-- /.col -->
					</div><!-- /.row -->
				</div><!-- /.container -->
			</section>
			
			<!-- ============================================================= SECTION â PORTFOLIO : END ============================================================= -->
			<div id="modifyOk" class="modal fade" role="dialog">
			<div id="modal-dialog-ok" class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">
							&nbsp;<i class="icon-login-1"></i>&nbsp;확인 메시지
						</h4>
					</div>
					<div class="modal-body" align="center">
						<h4>
							정보 수정이 완료되었습니다.
						</h4>
					</div>
					<div class="modal-footer">
						<a class="btn" data-dismiss="modal" aria-hidden="true">확인</a>
					</div>
				</div>
			</div>
		</div>
		</main>
		
		<!-- ============================================================= MAIN : END ============================================================= -->
		
		
		<!-- ============================================================= FOOTER ============================================================= -->
		
		<jsp:include page="/WEB-INF/views/include/footer/public-footer.jsp"/>
		
		<!-- ============================================================= FOOTER : END ============================================================= -->
		
		<!-- ============================================================= JAVASCRIPT ============================================================= -->
		
		<jsp:include page="/WEB-INF/views/include/javascript/public-js.jsp"/>
		
		<!-- ============================================================= JAVASCRIPT : END ============================================================= -->
		
	</body>
</html>