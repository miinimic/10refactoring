<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>�ı� ��� ��ȸ</title>
<style>


  .prodNoNoDisplay {
    color: transparent;
  }


</style>
<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

function fncGetReviewList(currentPage) {
	$("#currentPage").val(currentPage)
	$("form").attr("method" , "POST").attr("action" , "/purchase/listReview").submit();
}
$(function() {
	
	$( ".prodName" ).on("click" , function() {

		var string = $(this).text().trim();

		var lines = string.split(",");
		var data = [];

		for (var i = 0; i < lines.length; i++) {
		    var fields = lines[i].split(",");
		    data.push(fields);
		}

		 //  alert(data[1]);
		    
		 var prodNo = data[1];

		var encodedProdNo = encodeURIComponent(prodNo);
			$(window.parent.frames["rightFrame"].document.location).attr("href","/product/getProduct?menu=purchase&prodNo="+encodedProdNo+"");
			
	});
	
	$( ".update" ).on("click" , function() {

		var string = $(this).text().trim();

		var lines = string.split(",");
		var data = [];

		for (var i = 0; i < lines.length; i++) {
		    var fields = lines[i].split(",");
		    data.push(fields);
		}

		 //  alert(data[1]);
		    
		 var tranNo = data[1];

		var encodedTranNo = encodeURIComponent(tranNo);
			$(window.parent.frames["rightFrame"].document.location).attr("href","/purchase/updateReviewView?tranNo="+encodedTranNo+"");
			
	});

	$( ".delete" ).on("click" , function() {

		var string = $(this).text().trim();

		var lines = string.split(",");
		var data = [];

		for (var i = 0; i < lines.length; i++) {
		    var fields = lines[i].split(",");
		    data.push(fields);
		}

		 //  alert(data[1]);
		    
		 var tranNo = data[1];

		var encodedTranNo = encodeURIComponent(tranNo);
			$(window.parent.frames["rightFrame"].document.location).attr("href","/purchase/deleteReview?tranNo="+encodedTranNo+"");
			
	});

});
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">�ı� ��� ��ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11" >��ü  ${resultPage.getTotalCount() } �Ǽ�, ���� ${resultPage.getCurrentPage() } ������</td>
		
	</tr>
	<tr>		
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="250">�ֹ� ��ǰ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="350">�ı�</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�ı� �����ϱ�</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�ı� �����ϱ�</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>	
	<c:set var="i" value="0" />
	<c:forEach var="purchase" items="${list}">
		<c:set var="i" value="${ i+1 }" />
			
			
	<tr class="ct_list_pop">

		<td></td>
		<td align="center">
			<span class="prodName">${ purchase.getPurchaseProd().getProdName()}<span class="prodNoNoDisplay">,${  purchase.getPurchaseProd().getProdNo()}</span></span> 
		</td>
		<td></td>
		<td align="center">
				${purchase.getReview() }
		</td>
		<td></td>
		<td align="center">
	
			<c:choose>
				<c:when test="${purchase.getBuyer().getUserId() eq user.getUserId() || user.getRole() eq 'admin' }">
					<span class="update">�����ϱ�<span class="prodNoNoDisplay">,${purchase.getTranNo() }</span></span> 
				</c:when>
				<c:otherwise>
					������ �ۼ��� �ı⸸ ���� �����մϴ�.
				</c:otherwise>
			</c:choose>
			
		</td>
		<td></td>
		<td align="center">
			<c:choose>
				<c:when test="${purchase.getBuyer().getUserId() eq user.getUserId() || user.getRole() eq 'admin' }">
					<span class="delete">�����ϱ�<span class="prodNoNoDisplay">,${purchase.getTranNo() }</span></span> 
				</c:when>
				<c:otherwise>
					������ �ۼ��� �ı⸸ ���� �����մϴ�.
				</c:otherwise>
			</c:choose>
		</td>
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
			    <jsp:param name="pageNavigator" value="listReview" />
			</jsp:include>
		
    	</td>
	</tr>
</table>

<!--  ������ Navigator �� -->
</form>

</div>

</body>
</html>