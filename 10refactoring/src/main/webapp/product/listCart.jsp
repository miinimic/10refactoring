<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
<title>��ٱ���</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

function fncGetCartList(currentPage) {
	$("#currentPage").val(currentPage)
	$("form").attr("method" , "POST").attr("action" , "/purchase/listCart").submit();
}

$(function() {
	
	$( ".category:contains('chicken')" ).on("click" , function() {
		$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?category=chicken");
	});
});	

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm">
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
						��ٱ���
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
		<td colspan="11" >��ü  ${ resultPage.getTotalCount() } �Ǽ�, ���� ${resultPage.getCurrentPage() } ������ 
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ī�װ�</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����ϱ�</td>	
		<td class="ct_line02"></td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>

	<c:set var="i" value="0" />
	<c:forEach var="purchase" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
		<td align="center">${ i }</td>
		<td></td>
		<td align="left">
		<a href="/getProduct.do?prodNo=${purchase.getPurchaseProd().getProdNo()}&menu=cart">${purchase.getPurchaseProd().getProdName()}</a>
		</td>
		<td></td>
		<td align="left">${purchase.getPurchaseProd().getCategory() }</td> 
		<td></td>
		<td align="left">${purchase.getPurchaseProd().getPrice() } ( ��� : ${purchase.getPurchaseProd().getItem()} ��)</td> 
		<td></td>
		<td align="left">${purchase.getPurchaseProd().getRegDate() }</td>
		<td></td>	
		<td align="left"><button><a href="/deleteCart.do?prodNo=${purchase.getPurchaseProd().getProdNo()}">�����ϱ�</a></button></td>
		<td></td>		
	</tr>	
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>	

	</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value=""/>
			<jsp:include page="../common/pageNavigator.jsp">
			    <jsp:param name="pageNavigator" value="listCart" />
			</jsp:include>
		
    	</td>
	</tr>
</table>
<!--  ������ Navigator �� -->

</form>

</div>
</body>
</html>
