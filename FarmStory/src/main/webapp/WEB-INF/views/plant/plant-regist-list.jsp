<%@page import="com.farmstory.vo.Plant"%>
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

<title>FARM STORY - My Flowerpot</title>

<!-- Core CSS & AddOn/Plugin CSS & Custom CSS & Fonts & Icons/Glyphs & Favicon -->
<jsp:include page="/WEB-INF/views/include/style/public-style.jsp" />

<style type="text/css">
#owl-latest-works {
	padding: 25px 0px 5px 5px;
	margin-top: 5px;
	border-top: 2px solid #efefef;
	font-size: 12px;
}
</style>

</head>

<body>

	<!-- ============================================================= HEADER ============================================================= -->

	<jsp:include page="/WEB-INF/views/include/header/public-header.jsp" />

	<!-- ============================================================= HEADER : END ============================================================= -->


	<!-- ============================================================= MAIN ============================================================= -->

	<main> <!-- ============================================================= SECTION â LATEST WORKS ============================================================= -->

	<section id="latest-works" class="white-bg">
		<div class="container inner">

			<div class="row">
				<div class="col-md-8 col-sm-9 center-block text-center">
					<header>
						<h1>나의 화분 목록</h1>
						<p>
							등록한 화분 목록입니다.<br> 화분에 대한 다이어리를 작성해보세요.
						</p>
					</header>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
			<div class="row inner-top-sm">
				<div id="owl-latest-works" class="owl-carousel owl-item-gap">

<c:if test="${ empty myFlowerpots }">
	<div align="center">
	<h4>등록된 화분이 없습니다. 등록하신 후 이용해주세요.</h4>
	<a class="btn">화분 등록하기</a>
	</div>
</c:if>
					<c:forEach var="myFlowerpots" items="${ myFlowerpots }"
						varStatus="status">
						<div class="item">
							<figure>
								<figcaption class="text-overlay">
									<div class="info">
										<h4>${ myFlowerpots.plaName }</h4>
										<p>화분 번호 : ${ myFlowerpots.regPotNo }</p>
										<!-- <a class="btn">수정</a> -->
										<a class="btn deletePotBtn"
											data-index="${ status.index }">삭제</a>
									</div>
									<!-- /.info -->
								</figcaption>
								<img
									src="/farmstory/resources/upload-image/plant-info/${ myFlowerpots.pliImg }"
									alt="">
							</figure>
							<a id="myDiaryBtn"
								href="/farmstory/diary_book_write.action?regPotNo=${ myFlowerpots.regPotNo }&plaNo=${ myFlowerpots.plaNo }"
								class="btn">다이어리 만들기</a>
								<!-- <a id="flowerPotInfoBtn"  class="btn" data-toggle="modal" data-target="#modal-value">화분정보 보기</a> -->
								<a id="flowerPotInfoBtn" href="/farmstory/value/findTime.action?regPotNo=${ myFlowerpots.regPotNo }" class="btn" >화분정보 보기</a>
						</div>
						<input id="myPotNo${ status.index }" type="hidden" name="regPotNo"
							value="${ myFlowerpots.regPotNo }">
					</c:forEach>
					<!-- /.item -->
				</div>
				<!-- /.owl-carousel -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	
	</section>

	<!-- ============================================================= SECTION â LATEST WORKS : END ============================================================= -->

	</main>

	<!-- ============================================================= MAIN : END ============================================================= -->


	<!-- ============================================================= FOOTER ============================================================= -->

	<jsp:include page="/WEB-INF/views/include/footer/public-footer.jsp" />

	<!-- ============================================================= FOOTER : END ============================================================= -->

	<!-- ============================================================= JAVASCRIPT ============================================================= -->

	<jsp:include page="/WEB-INF/views/include/javascript/public-js.jsp" />

	<!-- ============================================================= JAVASCRIPT : END ============================================================= -->
	<script type="text/javascript">
		$("a.deletePotBtn").on("click", function(event) {
			event.preventDefault();
			var index = $(this).data("index");
			var regPotNo = $("#myPotNo" + index).val();

			if (confirm("정말로 삭제하시겠습니까?")) {
				$.ajax({
					"url" : "/farmstory/my_flowerpot_delete.action",
					"method" : "GET",
					"data" : {
						"regPotNo" : regPotNo
					},
					"success" : function(data, status, xhr) {
						location.href = "/farmstory/my_flowerpot_list.action";
						alert("[ " + regPotNo + " ]" + "번 화분이 삭제되었습니다.");
					},
					"error" : function(xhr, status, err) {
						alert("삭제에 실패하였습니다. 관리자에게 문의하세요.");
					}
				});

			}
		});
		
		$("a.deletePotBtn").on("click", function(event) {
			
		});
	</script>
</body>
</html>