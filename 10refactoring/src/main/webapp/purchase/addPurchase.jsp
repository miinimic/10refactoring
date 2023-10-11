<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>구매 완료</title>
<style>

 		body {
            padding-top : 60px;
        }

</style>

	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" >
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<script type="text/javascript">

</script>

</head>

<body>
<jsp:include page="/layout/toolbar.jsp" />
<div class="container">

<div class="page-header">
	       <h3 class=" text-info">다음과 같이 구매가 되었습니다.</h3>
</div>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매자아이디 </strong></div>
			<div class="col-xs-8 col-md-4">${purchase.buyer.userId }</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매방법 </strong></div>
			<div class="col-xs-8 col-md-4">			
			<c:choose>
				<c:when test="${ purchase.paymentOption eq '1'}">
					현금구매
				</c:when>
				<c:otherwise>
					신용구매
				</c:otherwise>			
			</c:choose></div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매수량 </strong></div>
			<div class="col-xs-8 col-md-4">${purchase.item } 개</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매자이름 </strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverName }</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매자연락처 </strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverPhone }</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매자주소 </strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyAddr }</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매요청사항 </strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyRequest }</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>배송희망일자 </strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyDate  }</div>
		</div>

</div>
</body>
</html>