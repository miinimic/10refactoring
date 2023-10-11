<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>���� �Ϸ�</title>
<style>

 		body {
            padding-top : 60px;
        }

</style>

	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
	       <h3 class=" text-info">������ ���� ���Ű� �Ǿ����ϴ�.</h3>
</div>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�����ھ��̵� </strong></div>
			<div class="col-xs-8 col-md-4">${purchase.buyer.userId }</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���Ź�� </strong></div>
			<div class="col-xs-8 col-md-4">			
			<c:choose>
				<c:when test="${ purchase.paymentOption eq '1'}">
					���ݱ���
				</c:when>
				<c:otherwise>
					�ſ뱸��
				</c:otherwise>			
			</c:choose></div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���ż��� </strong></div>
			<div class="col-xs-8 col-md-4">${purchase.item } ��</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�������̸� </strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverName }</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�����ڿ���ó </strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverPhone }</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�������ּ� </strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyAddr }</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���ſ�û���� </strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyRequest }</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���������� </strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyDate  }</div>
		</div>

</div>
</body>
</html>