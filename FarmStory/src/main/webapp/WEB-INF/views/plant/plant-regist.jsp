<%@page import="com.farmstory.vo.Plant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html lang="ko">
<head>
<!-- Meta -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta name="description" content="">
<meta name="author" content="">

<title>FARM STORY - Register Flowerpot</title>

<!-- Core CSS & AddOn/Plugin CSS & Custom CSS & Fonts & Icons/Glyphs & Favicon -->
<jsp:include page="/WEB-INF/views/include/style/public-style.jsp" />

<style type="text/css">
#modal-dialog-search{
	 
}
</style>

</head>

<body>

	<!-- ============================================================= HEADER ============================================================= -->
	<jsp:include page="/WEB-INF/views/include/header/public-header.jsp" />
	<!-- ============================================================= HEADER : END ============================================================= -->


	<!-- ============================================================= MAIN ============================================================= -->

	<main class="js-reveal">

	<!-- ============================================================= SECTION – CONTACT FORM ============================================================= -->
	<section id="register-plant-form">
		<div class="container inner">

			<div class="row">
				<div class="col-md-8 col-sm-9 center-block text-center">
					<header>
						<h1>화분 등록하기</h1>
					</header>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-sm-12">
					<div class="row">

						<div class="col-sm-6 outer-top-md inner-right-sm">

							<h2>상세내용을 등록하세요</h2>

							<form id="plantRegistform" 
								action="plant_regist.action" method="post">

								<%-- 	<input type="hidden" name="plaNo" class="form-control"
												value="${plant.plaNo}" > --%>

								<div class="row">
									<div class="col-sm-4">
									<input type="text" name="memId" class="form-control"
											value="${loginuser.memId}" readonly>
									</div>
								</div>
								<!-- /.row -->

								<div class="row">
									<div class="col-sm-8">
										<input type="text" name="regPotNo" class="form-control" id="regPotNo"
											placeholder="제품번호를 등록해주세요" required>
									</div>
									
									<button id="potNoTest" class="btn btn-default" style="width:100px">중복확인</button>
								</div>
								<!-- /.row -->

								<div class="row">
									<div class="col-sm-8">
										<input type="hidden" name="plaNo" id="searched-no"
											placeholder="식물번호 가져오는 히든 input" >
											
										<input type="text" name="plaName" class="form-control" id="searched-name"
											placeholder="키우고 싶은 식물을 검색 해주세요" required>


									</div>

									<a href="#" id="searchplant" data-toggle="modal"
										data-target="#SearchPlant"> <i class="icon-search"></i>
									</a>

									<!-- 모달 띄우는 버튼 -->
									<!-- <a href="#"data-toggle="modal" data-target="#SearchPlant">
									<i class="icon-search"></i>
									</a> -->
								</div>

								<button class="btn btn-default btn-submit" id="finished" 
										onclick="plant_regist.action">등록하기</button>

							</form>

							<div id="response"></div>

						</div>
						<!-- ./col -->

						<div class="col-sm-6 outer-top-md inner-left-sm border-left">

							<h2>화분번호란?</h2>
							<p>화분 구매시 주어지는 고유값입니다. 정확하게 입력을 하셔야 화분의 기능을 최대로 활용이 가능합니다.</p>

							<h3>건의사항</h3>
							<ul class="contacts">
								<li>궁금한 것이 있으시다면?</li>
								<li class="red"><a href="/farmstory/board/notice_list.action"><i
										class="icon-mail-1 contact"></i> 건의사항 가기</a></li>
							</ul>
							<!-- /.contacts -->


						</div>
						<!-- /.col -->

					</div>
					<!-- /.row -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->

		</div>
		<!-- /.container -->
	</section>
	</main>
	<!-- ============================================================= SECTION – CONTACT FORM : END ============================================================= -->



	<!-- ============================================================= MAIN : END ============================================================= -->

	<div id="SearchPlant" class="modal fade " role="dialog">
		<div id="modal-dialog-search" class="modal-dialog SearchPlant">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">
					&nbsp;<i class="icon-search"></i>&nbsp;검색
				</h4>
			</div>
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-body">
					<ul id="searched-plants">
					</ul>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-default" id="search-finished">완료</button>
			</div>
		</div>
	</div>
	<!-- ============================================================= FOOTER ============================================================= -->

	<jsp:include page="/WEB-INF/views/include/footer/public-footer.jsp" />

	<!-- ============================================================= FOOTER : END ============================================================= -->

	<!-- JavaScripts placed at the end of the document so the pages load faster -->

	<jsp:include page="/WEB-INF/views/include/javascript/public-js.jsp" />

	<!-- For demo purposes – can be removed on production : End -->

	<script type="text/javascript">
		$(function() {
			var testNo = 0;
			$('#searchplant').on('click',function(event) {
								event.preventDefault();		
								var plaName = $('#plantRegistform').find('[name=plaName]').val();
								$.ajax({
											url : "search_plant.action",
											method : "POST",
											data : {
												"plaName" : plaName
											},
											success : function(data, status,
													xhr) {
												var ul = $('#searched-plants');
												ul.empty();
												for (var i = 0; i < data.length; i++) {
													var li = $('<li></li>');
													var radio = $('<input type="radio" name="searched-plant-name" style="width:20px"><span data-plano=' + data[i].plaNo  + '>'
															+ data[i].plaName 
															+ '</span>');
													li.append(radio);
													ul.append(li);
													testNo = testNo + 1;
													}
												
											},
											error : function(xhr, status, err) {

											}
										});
							});//식물검색 닫음

			$('#search-finished').on('click', function(event) {

				$('#SearchPlant').modal('hide');
								
				//$('input[name=searched-plant-name]:selected').parent().find('span')
				var span = $('input[name=searched-plant-name]:checked').next();
				//alert(span.text());
				$('#searched-name').val(span.text());
				$('#searched-no').val(span.attr('data-plano'))
			});
			
			//potNo중복 검사
			$('#potNoTest').on('click',function(event){
				
				event.preventDefault();
				event.stopPropagation();
				
				var regPotNo = $("#regPotNo").val();
				
				
				if(regPotNo.length < 4){
						alert("제품번호는 4글자 이상입니다")
						$('#regPotNo').val("");
						return;
				}else{
					
				$.ajax({
					url : "potNo-test.action",
					method : "POST",
					data : {
						"regPotNo" : regPotNo
					},
					success : function(data, status, xhr) {
						
						if(data.cnt > 0){
							alert("중복되는 제품번호입니다.")
						
							} else {

								alert("사용가능한 제품번호입니다.")
								testNo = testNo + 1;
							}
						},
						error : function(xhr, status, err) {
						}
					}); //potNo 중복검사 ajax 닫음
				}//4자리 이하 입력 불가 닫음
			});//potNo중복검사 닫음

				$('#finished').on('click', function(event) {

					if (testNo >= 2) {
					alert("등록에 성공하셨습니다");
						$("#finished").submit();				
						
				} else{
					alert('중복검사 또는 식물을 선택하세요');
					return false;
				}	
			})//등록버튼 이벤트 닫음

		});//스크립트 닫음
	</script>
</body>
</html>