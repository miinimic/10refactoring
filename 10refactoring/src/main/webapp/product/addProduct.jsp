<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<title>상품등록</title>

	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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
});	

	
$(function() {
	 $( "#addProduct" ).on("click" , function() {
		 self.location = "../product/addProductView.jsp"
	});
});	
</script>

</head>

<body bgcolor="#ffffff" text="#000000">
<jsp:include page="/layout/toolbar.jsp" />
<div class="container">
<div class="page-header">
	       <h3 class=" text-info">상품등록</h3>
</div>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품명 </strong></div>
			<div class="col-xs-8 col-md-4">${ product.prodName}</div>
		</div>
		<hr/>
				<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>카테고리 </strong></div>
			<div class="col-xs-8 col-md-4">${ product.category}</div>
		</div>
				<hr/>
				<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>개수 </strong></div>
			<div class="col-xs-8 col-md-4">${product.item }&nbsp;개</div>
		</div>
						<hr/>
				<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품상세정보 </strong></div>
			<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
		</div>
								<hr/>
				<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>제조일자 </strong></div>
			<div class="col-xs-8 col-md-4">${product.manuDate}</div>
		</div>
										<hr/>
				<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>가격 </strong></div>
			<div class="col-xs-8 col-md-4">${product.price}&nbsp;원</div>
		</div>
												<hr/>
				<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품이미지</strong></div>
			<div class="col-xs-8 col-md-4">${product.fileName}</div>
		</div>
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-default btn" id="ok" >확 &nbsp;인</button>
		      <a class="btn btn-primary" href="#" role="button" id="addProduct">추가등록</a>
		    </div>
		  </div>
</div>
</body>
</html>
