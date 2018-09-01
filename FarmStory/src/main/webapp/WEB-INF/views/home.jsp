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
		
		<title>FARM STORY</title>
		
		<!-- Core CSS & AddOn/Plugin CSS & Custom CSS & Fonts & Icons/Glyphs & Favicon -->
		<jsp:include page="/WEB-INF/views/include/style/public-style.jsp"/>
		
		<style type="text/css">
		.main-img {
			border: 1px solid #888888;
			box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
				rgba(0, 0, 0, 0.19);
		}
		</style>
	</head>
	
	<body>
		
		<!-- ============================================================= HEADER ============================================================= -->
		
		<jsp:include page="/WEB-INF/views/include/header/public-header.jsp"/>
		
		<!-- ============================================================= HEADER : END ============================================================= -->
		
		
		<!-- ============================================================= MAIN ============================================================= -->
		
		<main>
			
			<!-- ============================================================= SECTION – HERO ============================================================= -->
			
			<section id="hero">
				<div id="owl-main" class="owl-carousel height-md owl-inner-nav owl-ui-lg">
					
					<div class="item" style="background-image: url(http://och1110.cdn3.cafe24.com/farmstory/resources/assets/images/main/main-plant1.jpg);">
						<div class="container">
							<div class="caption vertical-center text-center">
								
								<h1 class="fadeInDown-1 light-color">공기 정화 식물은<br> 어떻게 키울까?</h1>
								<p class="fadeInDown-2 light-color">당신을 위한 식물 정보 가이드<br> 팜스토리와 함께 키우세요.</p>
								<div class="fadeInDown-3">
									<a href="/farmstory/plant_list.action" class="btn btn-large">식물 정보 보기</a>
								</div><!-- /.fadeIn -->
								
							</div><!-- /.caption -->
						</div><!-- /.container -->
					</div><!-- /.item -->
					
					<div class="item" style="background-image: url(http://och1110.cdn3.cafe24.com/farmstory/resources/assets/images/main/main-plant2.jpg);">
						<div class="container">
							<div class="caption vertical-center text-right">
								
								<h1 class="fadeInLeft-1 light-color">구매한 화분을<br> 등록해보세요</h1>
								<p class="fadeInLeft-2 light-color">식물을 키우는 일이 보다 쉬워집니다.<br>매일 상태를 알려주는 서비스를 이용해보세요.</p>
								<div class="fadeInLeft-3">
									<a href="/farmstory/plant_regist.action" class="btn btn-large">나의 화분 등록하기</a>
								</div><!-- /.fadeIn -->
								
							</div><!-- /.caption -->
						</div><!-- /.container -->
					</div><!-- /.item -->
					
					
					
					<div class="item" style="background-image: url(http://och1110.cdn3.cafe24.com/farmstory/resources/assets/images/main/main-diary.jpg);">
						<div class="container">
							<div class="caption vertical-top text-center" style="padding-top: 150px;">
								
								<h1 class="fadeInDown-1 light-color">나만의 다이어리로 남기세요</h1>
								<p class="fadeInDown-2 light-color">팜스토리와 함께 생육 일기를 써보세요.</p>
								<div class="fadeInDown-3">
									<a href="/farmstory/diary_book_list.action" class="btn btn-large">다이어리 쓰기</a>
								</div><!-- /.fadeIn -->
								
							</div><!-- /.caption -->
						</div><!-- /.container -->
					</div><!-- /.item -->
					
				</div><!-- /.owl-carousel -->
			</section>
			
			<!-- ============================================================= SECTION – HERO : END ============================================================= -->
			
			
			<!-- ============================================================= SECTION – PRODUCT ============================================================= -->
			
			<section id="product">
				<div class="container inner">
					
					<div class="row">
						
						<div class="col-sm-6 inner-right-xs text-right">
							<figure><img class="main-img" src="http://och1110.cdn3.cafe24.com/farmstory/resources/assets/images/main/main-content1.jpg" alt=""></figure>
						</div><!-- /.col -->
						
						<div class="col-sm-6 inner-top-xs inner-left-xs">
							<h2>어떻게 키워야 할까?</h2>
							<br><p>미세먼지가 습격이 많은 요즘.<br>공기정화식물을 키우고 싶으시나요?<br>어떻게 키워야하는지 정보를 보고 가세요.<br>팜스토리가 보다 쉽게 키울 수 있게 도와드릴게요.</p>
							<a href="/farmstory/plant_list.action" class="txt-btn">식물 정보 보기</a>
						</div><!-- /.col -->
						
					</div><!-- /.row -->
					
					<div class="row inner-top-md">
						
						<div class="col-sm-6 col-sm-push-6 inner-left-xs">
							<figure><img class="main-img" src="http://och1110.cdn3.cafe24.com/farmstory/resources/assets/images/main/main-content2.jpg" alt=""></figure>
						</div><!-- /.col -->
						
						<div class="col-sm-6 col-sm-pull-6 inner-top-xs inner-right-xs">
							<h2>구매한 화분을 등록해볼까?</h2>
							<br><p>언제 물을 줘야하는지, 햇빛은 언제 받았는지,<br>혹시 화분이 넘어졌는지,<br>스마트 화분이 당신의 식물을 보다 쉽게 키울 수 있게 도와줄거예요.<br>이제 구매한 화분을 등록해 보세요.</p>
							<a href="/farmstory/plant_regist.action" class="txt-btn">나의 화분 등록하기</a>
						</div><!-- /.col -->
						
					</div><!-- /.row -->
					
					<div class="row inner-top-md">
						
						<div class="col-sm-6 inner-right-xs text-right">
							<figure><img class="main-img" src="http://och1110.cdn3.cafe24.com/farmstory/resources/assets/images/main/main-content3.jpg" alt=""></figure>
						</div><!-- /.col -->
						
						<div class="col-sm-6 inner-top-xs inner-left-xs">
							<h2>이제 생육 일기를 써보자!</h2>
							<br><p>사람도 식물도 사랑을 줘야 행복해져요.<br>하루하루 관심을 갖고 사랑을 듬뿍 주세요~<br>사랑의 기록을 남겨보세요~</p>
							<a href="/farmstory/my_flowerpot_list.action" class="txt-btn">다이어리 만들기</a>
						</div><!-- /.col -->
						
					</div><!-- /.row -->
				
				</div><!-- /.container -->
			</section>
			
			<!-- ============================================================= SECTION – PRODUCT : END ============================================================= -->
			
			
			
			
			
			
			
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