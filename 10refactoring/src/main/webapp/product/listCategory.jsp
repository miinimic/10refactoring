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
	
		$( ".category:contains('chicken')" ).on("click" , function() {
			$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?category=chicken");
		});
		
		$( ".category:contains('beef')" ).on("click" , function() {
			$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?category=beef");
		});
		
		$( ".category:contains('pork')" ).on("click" , function() {
			$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?category=pork");
		});
		
		$( ".category:contains('egg')" ).on("click" , function() {
			$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?category=egg");
		});
		
		$( ".category:contains('seafood')" ).on("click" , function() {
			$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?category=seafood");
		});
		
		$( ".category:contains('vegan')" ).on("click" , function() {
			$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?category=vegan");
		});
});	

</script>	

</head>

<body bgcolor="#ffffff" text="#000000">
<jsp:include page="/layout/toolbar.jsp" />
<div class="container">
<form name="detailForm" >
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
						상품 카테고리
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">

	<tr>
		<td class="ct_list_b" width="100">카테고리</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>		
	
			<tr>
				<td class="category">
				chicken
				</td>
				</tr>
				<tr>
				<td colspan="11" bgcolor="808285" height="1"></td>	
				</tr>
				<tr><td class="category">beef </td></tr>
				<tr>
				<td colspan="11" bgcolor="808285" height="1"></td>	
				</tr>
				<tr><td class="category">pork</td></tr>
				<tr>
				<td colspan="11" bgcolor="808285" height="1"></td>	
				</tr>
				<tr><td class="category">egg </td></tr>
				<tr>
				<td colspan="11" bgcolor="808285" height="1"></td>	
				</tr>
				<tr><td class="category">seafood </td></tr>
				<tr>
				<td colspan="11" bgcolor="808285" height="1"></td>	
				</tr>
				<tr><td class="category">vegan</td></tr>
		</tr>

</table>

<!--  페이지 Navigator 끝 -->

</form>

</div>
</body>
</html>
