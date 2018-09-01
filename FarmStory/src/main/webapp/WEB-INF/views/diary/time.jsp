<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>실시간 정보보기</title>

<!-- JQ-PLOT의 CSS를 설정 -->
<link class="include" rel="stylesheet" type="text/css"
	href="/farmstory/resources/chart/jquery.jqplot.css" />

<jsp:include page="/WEB-INF/views/include/style/public-style.jsp" />

</head>
<body>

	<jsp:include page="/WEB-INF/views/include/header/public-header.jsp" />

	<div class="panel panel-default">
		<div class="panel-heading">
			<i class="fa fa-bar-chart-o fa-fw"></i> 나의 화분 정보 <br>
			<div class="pull-right">
				<div class="btn-group">
					<button type="button"
						class="btn btn-default btn-xs dropdown-toggle"
						data-toggle="dropdown">
						기간선택 <span class="caret"></span>
					</button>
					<ul class="dropdown-menu pull-right" role="menu">
						<li><a href="findTime.action?regPotNo=${ regPotNo }">실시간</a></li>
						<li><a href="findDay.action?regPotNo=${ regPotNo }">일간</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- /.panel-heading -->
		<div class="panel-body">
			<div class="row">
				<div style="width: 50%">
					&emsp;&nbsp;화분 번호 : ${ regPotNo } <br>
					<form id="frm" action="findTime.action" method="post">
						<input type="hidden" name="regPotNo" value=${ regPotNo }>
						&emsp;&nbsp;날짜 입력: <input type="date" id="date" name="date"
							value=${ date }> <input type="submit" value="전송">
					</form>
				</div>
				<br>

				<div class="col-lg-4">
					<div class="table-responsive" style="width: 200%">
						<div id="graphDiv1"></div>
						<table class="table table-bordered table-hover table-striped">
							<thead>
								<tr>
									<th>날짜</th>
									<th>온도</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="val" items="${ vals }" end="27">
									<c:if test="${ val.plvType eq '온도' }">
										<tr>
											<td>${ val.plvDateTime }</td>
											<td>${ val.plvVal }</td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>

						<div id="graphDiv2"></div>
						<table class="table table-bordered table-hover table-striped">
							<thead>
								<tr>
									<th>날짜</th>
									<th>습도</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="val" items="${ vals }" end="27">
									<c:if test="${ val.plvType eq '습도' }">
										<tr>
											<td>${ val.plvDateTime }</td>
											<td>${ val.plvVal }</td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>

						<div id="graphDiv3"></div>
						<table class="table table-bordered table-hover table-striped">
							<thead>
								<tr>
									<th>날짜</th>
									<th>조도</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="val" items="${ vals }" end="27">
									<c:if test="${ val.plvType eq '조도' }">
										<tr>
											<td>${ val.plvDateTime }</td>
											<td>${ val.plvVal }</td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>

						<div id="graphDiv4"></div>
						<table class="table table-bordered table-hover table-striped">
							<thead>
								<tr>
									<th>날짜</th>
									<th>압력</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="val" items="${ vals }" end="27">
									<c:if test="${ val.plvType eq '압력' }">
										<tr>
											<td>${ val.plvDateTime }</td>
											<td>${ val.plvVal }</td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.row -->
		</div>
		<!-- /.panel-body -->
	</div>


	<jsp:include page="/WEB-INF/views/include/footer/public-footer.jsp" />

	<jsp:include page="/WEB-INF/views/include/javascript/public-js.jsp" />
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
	  <c:forEach var="val" items="${ vals }" end="27">
	  <c:if test="${ val.plvType eq '온도' }">
	  	array1.push(['${ val.plvDateTime }', ${ val.plvVal }]);
	  </c:if>
	  </c:forEach>
	  var plot1 = $.jqplot('graphDiv1', [array1], {
	      title:'실시간 온도', 
	      axes:{
	        xaxis:{
	          renderer:$.jqplot.DateAxisRenderer, 
	          tickOptions:{formatString:'%Y-%m-%d %H:%M'},
	          tickInterval:'10 minutes'
	        },
	      },
	      series:[{lineWidth:4, markerOptions:{style:'square'}}]
	  });
	  
	  var array2 = [];
	  <c:forEach var="val" items="${ vals }" end="27">
	  <c:if test="${ val.plvType eq '습도' }">
	  	array2.push(['${ val.plvDateTime }', ${ val.plvVal }]);
	  </c:if>
	  </c:forEach>
	  var plot2 = $.jqplot('graphDiv2', [array2], {
	      title:'실시간 습도', 
	      axes:{
	        xaxis:{
	          renderer:$.jqplot.DateAxisRenderer, 
	          tickOptions:{formatString:'%Y-%m-%d %H:%M'},
	          tickInterval:'10 minutes'
	        },
	      },
	      series:[{lineWidth:4, markerOptions:{style:'square'}}]
	  });
	  
	  var array3 = [];
	  <c:forEach var="val" items="${ vals }" end="27">
	  <c:if test="${ val.plvType eq '조도' }">
	  	array3.push(['${ val.plvDateTime }', ${ val.plvVal }]);
	  </c:if>
	  </c:forEach>
	  var plot3 = $.jqplot('graphDiv3', [array3], {
	      title:'실시간 조도', 
	      axes:{
	        xaxis:{
	          renderer:$.jqplot.DateAxisRenderer, 
	          tickOptions:{formatString:'%Y-%m-%d %H:%M'},
	          tickInterval:'10 minutes'
	        },
	      },
	      series:[{lineWidth:4, markerOptions:{style:'square'}}]
	  });
	  
	  var array4 = [];
	  <c:forEach var="val" items="${ vals }" end="27">
	  <c:if test="${ val.plvType eq '압력' }">
	  	array4.push(['${ val.plvDateTime }', ${ val.plvVal }]);
	  </c:if>
	  </c:forEach>
	  var plot4 = $.jqplot('graphDiv4', [array4], {
	      title:'실시간 압력', 
	      axes:{
	        xaxis:{
	          renderer:$.jqplot.DateAxisRenderer, 
	          tickOptions:{formatString:'%Y-%m-%d %H:%M'},
	          tickInterval:'10 minutes'
	        },
	      },
	      series:[{lineWidth:4, markerOptions:{style:'square'}}]
	  });
	});

</script>

</body>
</html>