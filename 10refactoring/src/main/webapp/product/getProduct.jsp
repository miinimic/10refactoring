<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>

<title>��ǰ �� ��ȸ</title>
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
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 60px;
        }
     </style>
<script type="text/javascript">
	
$(function() {
	 
	$( "#ok" ).on("click" , function() {

		self.location = "/product/listProduct?menu=manage"
	});
	
	$( "#buy" ).on("click" , function() {
		self.location = "/purchase/addPurchaseView?prodNo=${product.prodNo}&userId=${user.userId}"
	});
	
	$( "#back" ).on("click" , function() {
		history.go(-1)
	});
});

</script>

</head>

<body bgcolor="#ffffff" text="#000000">
<jsp:include page="/layout/toolbar.jsp" />
<div class="container">
<div class="page-header">
	       <h3 class=" text-info">��ǰ����ȸ</h3>
</div>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�� ǰ �� ȣ </strong></div>
			<div class="col-xs-8 col-md-4">${ product.prodNo}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�� ǰ �� </strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName }</div>
		</div>
				<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>ī �� �� �� </strong></div>
			<div class="col-xs-8 col-md-4">${product.category }</div>
		</div>
						<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�� ��</strong></div>
			<div class="col-xs-8 col-md-4">${product.item }&nbsp;��</div>
		</div>
								<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ �̹���</strong></div>
			<div class="col-xs-8 col-md-4">		
			<c:choose>
		    <c:when test="${ ! empty product.fileName}">
		        <c:forEach var="fileName" items="${fn:split(product.fileName, ',')}">
		            <img src="<c:url value='/images/${fileName}'/>" width="300px" height="300px"/>
		        </c:forEach>
		    </c:when>
		    <c:otherwise>
		        �̹��� ����
		    </c:otherwise>
		</c:choose></div>
		</div>
								<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ ������</strong></div>
			<div class="col-xs-8 col-md-4">${ product.prodDetail}</div>
		</div>
										<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�� �� �� ��</strong></div>
			<div class="col-xs-8 col-md-4">${product.manuDate }</div>
		</div>
										<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�� ��</strong></div>
			<div class="col-xs-8 col-md-4">${product.price } &nbsp;��</div>
		</div>
												<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�� �� �� ��</strong></div>
			<div class="col-xs-8 col-md-4">${product.regDate}</div>
		</div>
														<hr/>
		<div class="row">
			<div class="col-md-12 text-center ">
			<c:choose>
				<c:when test="${!empty user.userId}">
					<c:choose>
					<c:when test="${ search.menu eq 'purchase' ||  search.menu eq 'manage' || product.item == '0'}">
						<c:choose>
							<c:when test="${ search.menu eq 'manage' }">
								<button type="button" class="btn btn-default" id="ok">Ȯ��</button>
							</c:when>
							<c:when test="${ search.menu eq 'cart' }">
								<button type="button" class="btn btn-primary" id="buy">����</button>
								<button type="button" class="btn btn-default" id="back">����</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-default" id="back">����</button>
							</c:otherwise>
						</c:choose>	
					</c:when>
					<c:otherwise>			
							<button type="button" class="btn btn-primary" id="buy">����</button>
							<button type="button" class="btn btn-default" id="back">����</button>	
					</c:otherwise>
					
					</c:choose>
						
				</c:when>
				<c:otherwise>
							<button type="button" class="btn btn-default" id="back">����</button>
				</c:otherwise>
				</c:choose>		
			
			
			</div>
		</div>
</div>
</body>
</html>