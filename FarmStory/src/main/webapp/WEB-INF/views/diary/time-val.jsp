<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>

<html lang="ko" dir="ltr">
<head>
<!-- Meta -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta name="description" content="">
<meta name="author" content="">

<title>FARM STORY - TimeVal</title>

<!-- JQ-PLOT의 CSS를 설정 -->
<link class="include" rel="stylesheet" type="text/css"
	href="/farmstory/resources/chart/jquery.jqplot.css" />

<!-- Core CSS & AddOn/Plugin CSS & Custom CSS & Fonts & Icons/Glyphs & Favicon -->
<jsp:include page="/WEB-INF/views/include/style/public-style.jsp" />

<style type="text/css">
.valName{
	font-size: 50px;
	color: white;
}
#flowerpotGraph{
	padding-top: 0px;
}
.dateFont {
	font-size: 15px;
}
</style>
</head>

<body>

	<!-- ============================================================= HEADER ============================================================= -->

	<jsp:include page="/WEB-INF/views/include/header/public-header.jsp" />

	<!-- ============================================================= HEADER : END ============================================================= -->


	<!-- ============================================================= MAIN ============================================================= -->

	<main> <!-- ============================================================= SECTION â PRICING TABLES ============================================================= -->

	<section id="pricing-tables">
		<div class="container inner">

			<div class="row">
				<div class="col-md-8 col-sm-9 center-block text-center">
					<header>
						<h1>나의 화분 정보 보기</h1>
						<p>화분 번호 : ${ regPotNo }</p>
					</header>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->

			<div class="row pricing col-4">

				<div class="col-lg-3 col-sm-6 inner-top-sm">
					<div class="plan">

						<header>
							<h2>Temperature</h2>

							<div class="price">
								<span class="valName" ><b>온도</b></span> 
							</div>
							<!-- /.price -->

							<!-- <a href="#" class="btn">Change to this plan</a> -->
						</header>

						<ul class="features">
						
							<span>날짜</span>
							<span class="pull-right">온도&nbsp;</span>
							
							<c:forEach var="val" items="${ vals }" end="20">
								<c:if test="${ val.plvType eq '온도' }">
									<li><span class="dateFont" >${ val.plvDateTime }</span> <span
										class="pull-right" >${ val.plvVal } <sup>o</sup>C</span></li>
								</c:if>
							</c:forEach>
						</ul>
						<!-- /.features -->

					</div>
					<!-- /.plan -->
				</div>
				<!-- /.col -->

				<div class="col-lg-3 col-sm-6 inner-top-sm">
					<div class="plan">

						<header>
							<h2>Moisture</h2>

							<div class="price">
								<span class="valName"><b>수분량</b></span>
							</div>
							<!-- /.price -->

							<!-- <a href="#" class="btn">Change to this plan</a> -->
						</header>

						<ul class="features">
						
							<span>날짜</span>
							<span class="pull-right">수분량&nbsp;</span>
							
							<c:forEach var="val" items="${ vals }" end="20">
								<c:if test="${ val.plvType eq '습도' }">
									<li><span class="dateFont">${ val.plvDateTime }</span> <span
										class="pull-right">${ val.plvVal } %</span></li>
								</c:if>
							</c:forEach>
						</ul>
						<!-- /.features -->

					</div>
					<!-- /.plan -->
				</div>
				<!-- /.col -->

				<div class="col-lg-3 col-sm-6 inner-top-sm">
					<div class="plan">

						<header>
							<h2>Illuminance</h2>

							<div class="price">
								<span class="valName"><b>조도</b></span>
							</div>
							<!-- /.price -->

							<!-- <a href="#" class="btn">Change to this plan</a> -->
						</header>

						<ul class="features">
						
							<span>날짜</span>
							<span class="pull-right">조도&nbsp;</span>
							
							<c:forEach var="val" items="${ vals }" end="20">
								<c:if test="${ val.plvType eq '조도' }">
									<li><span class="dateFont">${ val.plvDateTime }</span> <span
										class="pull-right">${ val.plvVal } lux</span></li>
								</c:if>
							</c:forEach>
						</ul>
						<!-- /.features -->

					</div>
					<!-- /.plan -->
				</div>
				<!-- /.col -->
				
				<div class="col-lg-3 col-sm-6 inner-top-sm">
					<div class="plan">

						<form id="frm" action="findTime.action" method="post">
						<input type="hidden" name="regPotNo" value=${ regPotNo }>
						<h4>검색할 날짜 선택</h4>
						<input type="date" id="date" name="date" value=${ date }>
							<input class="btn" type="submit" value="선택한 날짜 정보 보기">
						</form>
						<button type="button"
						class="btn btn-xs dropdown-toggle"
						data-toggle="dropdown">
						검색할 기간 선택 <span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu">
						<li><a href="findTime.action?regPotNo=${ regPotNo }">실시간</a></li>
						<li><a href="findDay.action?regPotNo=${ regPotNo }">일간</a></li>
						</ul>

					</div>
					<!-- /.plan -->
				</div>
				<!-- /.col -->

			</div>
			<!-- /.row -->

		</div>
		<!-- /.container -->
	</section>

	<!-- ============================================================= SECTION – PRICING TABLES : END ============================================================= -->

<!-- ============================================================= SECTION â CONTACT US ============================================================= -->

	<section id="contact-us" class="tint-bg">
		<div class="container inner-sm">
			<div class="row">
				<div class="col-sm-10 center-block text-center">
					<h1 class="single-block">
						실시간 그래프
					</h1>
					<p>화분 정보를 실시간 그래프로 확인하실 수 있어요.</p>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</section>

	<!-- ============================================================= SECTION â CONTACT US : END ============================================================= -->


	<!-- ============================================================= SECTION â FAQ ============================================================= -->

	<section id="faq" class="light-bg">
		<div id="flowerpotGraph" class="container inner">

			
			<div class="row">

				<div align="center" class="col-sm-12 inner-right-sm inner-top-sm">
					<h2>실시간 온도</h2>
					<div id="graphDiv1"></div>
				</div>
				<!-- /.col -->
				
				<div align="center" class="col-sm-12 inner-right-sm inner-top-sm">
					<h2>실시간 수분량</h2>
					<div id="graphDiv2"></div>
				</div>
				<!-- /.col -->
				
				<div align="center" class="col-sm-12 inner-right-sm inner-top-sm">
					<h2>실시간 조도</h2>
					<div id="graphDiv3"></div>
				</div>
				<!-- /.col -->
				
				<div align="center" class="col-sm-12 inner-right-sm inner-top-sm">
					<h2>실시간 압력</h2>
					<div id="graphDiv4"></div>
				</div>
				<!-- /.col -->

			</div>
			<!-- /.row -->

		</div>
		<!-- /.container -->
	</section>

	<!-- ============================================================= SECTION â FAQ : END ============================================================= -->


	

	</main>

	<!-- ============================================================= MAIN : END ============================================================= -->


	<!-- ============================================================= FOOTER ============================================================= -->

	<jsp:include page="/WEB-INF/views/include/footer/public-footer.jsp" />

	<!-- ============================================================= FOOTER : END ============================================================= -->

	<!-- ============================================================= JAVASCRIPT ============================================================= -->

	<jsp:include page="/WEB-INF/views/include/javascript/public-js.jsp" />

	<!-- ============================================================= JAVASCRIPT : END ============================================================= -->
	<!-- JQ-PLOT의 기본 설정 -->
	<script type="text/javascript"
		src="/farmstory/resources/chart/jquery.jqplot.js"></script>
	<!-- Highlighter(마우스 접근시 데이터정보 표시) 설정 -->
	<script type="text/javascript"
		src="/farmstory/resources/chart/jqplot.highlighter.js"></script>
	<!-- 좌표에 관한 정보나 Zoom 기능 사용시 설정 -->
	<script type="text/javascript"
		src="/farmstory/resources/chart/jqplot.cursor.js"></script>
	<!-- 축의 데이터를 날짜형태로 입력하기 위해서 설정 -->
	<script type="text/javascript"
		src="/farmstory/resources/chart/jqplot.dateAxisRenderer.js"></script>
	<!-- 축의 데이터의 Label Option을 설정 -->
	<script type="text/javascript"
		src="/farmstory/resources/chart/jqplot.canvasAxisLabelRenderer.js"></script>
	<!-- Legend(Line에대한 간단한 범례)의 Option을 설정 -->
	<script type="text/javascript"
		src="/farmstory/resources/chart/jqplot.enhancedLegendRenderer.js"></script>
	<!-- 축의 데이터를 순서에 상관없이 자동정렬을 설정 -->
	<script type="text/javascript"
		src="/farmstory/resources/chart/jqplot.categoryAxisRenderer.js"></script>
	<!-- 축의 데이터 표현설정과 그래프위의 점의 Option을 설정 -->
	<script type="text/javascript"
		src="/farmstory/resources/chart/jqplot.canvasAxisTickRenderer.js"></script>
	<script type="text/javascript">
$(document).ready(function(){
	
	  var array1 = [];
	  <c:forEach var="val" items="${ vals }" end="20">
	  <c:if test="${ val.plvType eq '온도' }">
	  	array1.push(['${ val.plvDateTime }', ${ val.plvVal }]);
	  </c:if>
	  </c:forEach>
	  var plot1 = $.jqplot('graphDiv1', [array1], {
	      //title:'실시간 온도', 
	      axes:{
	        xaxis:{
	          renderer:$.jqplot.DateAxisRenderer, 
	          //tickOptions:{formatString:'%Y-%m-%d %H:%M'},
	          tickInterval:'30 minutes'
	        },
	      },
	      series:[{lineWidth:4, markerOptions:{style:'square'}}]
	  });
	  
	  var array2 = [];
	  <c:forEach var="val" items="${ vals }" end="20">
	  <c:if test="${ val.plvType eq '습도' }">
	  	array2.push(['${ val.plvDateTime }', ${ val.plvVal }]);
	  </c:if>
	  </c:forEach>
	  var plot2 = $.jqplot('graphDiv2', [array2], {
	      //title:'실시간 습도', 
	      axes:{
	        xaxis:{
	          renderer:$.jqplot.DateAxisRenderer, 
	          //tickOptions:{formatString:'%Y-%m-%d %H:%M'},
	          tickInterval:'30 minutes'
	        },
	      },
	      series:[{lineWidth:4, markerOptions:{style:'square'}}]
	  });
	  
	  var array3 = [];
	  <c:forEach var="val" items="${ vals }" end="20">
	  <c:if test="${ val.plvType eq '조도' }">
	  	array3.push(['${ val.plvDateTime }', ${ val.plvVal }]);
	  </c:if>
	  </c:forEach>
	  var plot3 = $.jqplot('graphDiv3', [array3], {
	      //title:'실시간 조도', 
	      axes:{
	        xaxis:{
	          renderer:$.jqplot.DateAxisRenderer, 
	          //tickOptions:{formatString:'%Y-%m-%d %H:%M'},
	          tickInterval:'30 minutes'
	        },
	      },
	      series:[{lineWidth:4, markerOptions:{style:'square'}}]
	  });
	  
	  var array4 = [];
	  <c:forEach var="val" items="${ vals }" end="20">
	  <c:if test="${ val.plvType eq '압력' }">
	  	array4.push(['${ val.plvDateTime }', ${ val.plvVal }]);
	  </c:if>
	  </c:forEach>
	  var plot4 = $.jqplot('graphDiv4', [array4], {
	      //title:'실시간 압력', 
	      axes:{
	        xaxis:{
	          renderer:$.jqplot.DateAxisRenderer, 
	          //tickOptions:{formatString:'%Y-%m-%d %H:%M'},
	          tickInterval:'30 minutes'
	        },
	      },
	      series:[{lineWidth:4, markerOptions:{style:'square'}}]
	  });
	});

</script>
</body>
</html>