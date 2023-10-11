<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>���Ż���ȸ</title>

	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   	<style>
 		body {
            padding-top : 60px;
        }
     </style>
<script type="text/javascript">
	
$(function() {
	 
	$( "#update" ).on("click" , function() {
		self.location = "/purchase/updatePurchaseView?tranNo=${purchase.purchase.tranNo }"
	});
	
	$( "#ok" ).on("click" , function() {
		//$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?menu=manage");
		history.go(-1)
	});
	

});

</script>
</head>

<body bgcolor="#ffffff" text="#000000">
<jsp:include page="/layout/toolbar.jsp" />
<div class="container">
<div class="page-header">
	       <h3 class=" text-info">�ֹ����� ����ȸ</h3>
</div>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�� ǰ �� ȣ </strong></div>
			<div class="col-xs-8 col-md-4">${purchase.product.prodNo}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>������ ���̵� </strong></div>
			<div class="col-xs-8 col-md-4">${purchase.user.userId }</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���Ź�� </strong></div>
			<div class="col-xs-8 col-md-4">
				<c:choose>
					<c:when test="${ purchase.purchase.paymentOption eq '1'}">
						���ݱ���
					</c:when>
					<c:otherwise>
						�ſ뱸��
					</c:otherwise>
				</c:choose>
				</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���ż��� </strong></div>
			<div class="col-xs-8 col-md-4">${purchase.purchase.item } ��</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>������ �̸� </strong></div>
			<div class="col-xs-8 col-md-4">${purchase.purchase.receiverName }</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>������ ����ó </strong></div>
			<div class="col-xs-8 col-md-4">${purchase.purchase.receiverPhone }</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>������ �ּ� </strong></div>
			<div class="col-xs-8 col-md-4">${purchase.purchase.divyAddr }</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���ſ�û���� </strong></div>
			<div class="col-xs-8 col-md-4">${purchase.purchase.divyRequest }</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�������� </strong></div>
			<div class="col-xs-8 col-md-4">
				<c:choose>
					<c:when test="${empty purchase.purchase.divyDate }" >
						<td class="ct_write01">${purchase.purchase.divyDate }   </td>
					</c:when>
					<c:otherwise>
						<c:set var="str" value="${purchase.purchase.divyDate.toString() }" />		
						<c:set var="arrayOfStrings" value="${fn:split(str, ' ')}" />
					<td class="ct_write01">${arrayOfStrings[0] }   </td>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�ֹ��� </strong></div>
			<div class="col-xs-8 col-md-4">${purchase.purchase.orderDate }</div>
		</div>
		<hr/>
		
		<div class="row">
			<div class="col-md-12 text-center ">
			<c:choose>
				<c:when test="${ purchase.purchase.tranCode eq '2' && search.menu  eq 'user'}">
					<button type="button" class="btn btn-primary" id="update">����</button>
					<button type="button" class="btn btn-default" id="ok">Ȯ��</button>
				</c:when>
				<c:when test="${ purchase.purchase.tranCode eq '2' &&  search.menu  eq 'manage'}">
					<button type="button" class="btn btn-primary" id="update">����</button>
					<button type="button" class="btn btn-default" id="ok">Ȯ��</button>
				</c:when>
				<c:when test="${ purchase.purchase.tranCode ne '2' &&  search.menu  eq 'manage'}">
					<button type="button" class="btn btn-default" id="ok">Ȯ��</button>
				</c:when>
				<c:otherwise>
					<button type="button" class="btn btn-default" id="ok">Ȯ��</button>
				</c:otherwise>
			</c:choose>				
			</div>
		</div>
</div>
</body>
</html>