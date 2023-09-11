<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
<title>카테고리별 조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
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

<div style="width:98%; margin-left:10px;">

<form name="detailForm" action="/product/listProduct" method="post">
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
