<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
<title>카테고리별 조회</title>

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
	
		$( "#chicken" ).on("click" , function() {
			self.location = "/product/listProduct?category=chicken"
		});
		
		$( "#beef" ).on("click" , function() {
			self.location = "/product/listProduct?category=beef"
		});
		
		$( "#pork" ).on("click" , function() {
			self.location = "/product/listProduct?category=pork"
		});
		
		$( "#egg" ).on("click" , function() {
			self.location = "/product/listProduct?category=egg"
		});
		
		$( "#seafood" ).on("click" , function() {
			self.location = "/product/listProduct?category=seafood"
		});
		
		$( "#vegan" ).on("click" , function() {
			self.location = "/product/listProduct?category=vegan"
		});
});	

</script>	

</head>

<body bgcolor="#ffffff" text="#000000">
<jsp:include page="/layout/toolbar.jsp" />
<div class="container">

<div class="page-header">
	       <h3 class=" text-info">상품 카테고리</h3>
</div>

<div class="btn-group" role="group" aria-label="...">
	  <button type="button" class="btn btn-default" id="chicken">chicken</button>
	  <button type="button" class="btn btn-default" id="beef">beef</button>
	  <button type="button" class="btn btn-default" id="pork">pork</button>
	  <button type="button" class="btn btn-default" id="egg">egg</button>
	  <button type="button" class="btn btn-default" id="seafood">seafood</button>
	  <button type="button" class="btn btn-default" id="vegan">vegan</button>
</div>


</div>
</body>
</html>
