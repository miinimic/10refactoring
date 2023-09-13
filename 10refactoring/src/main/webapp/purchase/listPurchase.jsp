<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>구매 목록조회</title>
<style>


  .tranNoNoDisplay {
    color: transparent;
  }


</style>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

function fncGetPurchaseList(currentPage) {
	$("#currentPage").val(currentPage)
	$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();
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
	
	$( ".arrival" ).on("click" , function() {

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
			$(window.parent.frames["rightFrame"].document.location).attr("href","/purchase/updateTranCode?tranNo="+encodedTranNo+"&menu=purchase&tranCode=4&currentPage=${resultPage.getCurrentPage()}");
			
	});
	
	$( ".confirm" ).on("click" , function() {

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
			$(window.parent.frames["rightFrame"].document.location).attr("href","/purchase/updateTranCode?tranNo="+encodedTranNo+"&menu=purchase&tranCode=5&currentPage=${resultPage.getCurrentPage()}");
			
	});
	
	$( ".addReview" ).on("click" , function() {

		var string = $(this).text().trim();

		var lines = string.split(",");
		var data = [];

		for (var i = 0; i < lines.length; i++) {
		    var fields = lines[i].split(",");
		    data.push(fields);
		}

		  // alert(data[1]);
		  // alert(data[2]);
		    
		 var tranNo = data[1];
		 var prodNo = data[2];

		var encodedTranNo = encodeURIComponent(tranNo);
		var encodedProdNo = encodeURIComponent(prodNo);
		
		$(window.parent.frames["rightFrame"].document.location).attr("href","/purchase/addReviewView?tranNo="+encodedTranNo+"&prodNo="+encodedProdNo+"&tranCode=6");
			
	});
		
	$( ".Review" ).on("click" , function() {
		$(window.parent.frames["rightFrame"].document.location).attr("href","/purchase/listReview");
	});
	
	$( ".detail" ).on("click" , function() {

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
			$(window.parent.frames["rightFrame"].document.location).attr("href","/purchase/getPurchase?tranNo="+encodedTranNo+"&menu=user");
			
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
					<td width="93%" class="ct_ttl01">주문 내역 조회</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11" >전체  ${resultPage.getTotalCount() } 건수, 현재 ${resultPage.getCurrentPage() } 페이지</td>
	</tr>
	<tr>		
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">주문 상품</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="250">배송 현황</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">주문 현황</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="250">주문내역 상세보기</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>	
	<c:set var="i" value="0" />
	<c:forEach var="purchase" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		
			<c:choose>
			    <c:when test="${not empty purchase.tranCode}">
			        <c:set var="tranCode" value="${purchase.tranCode}" />
			    </c:when>
			    <c:otherwise>
			        <c:set var="tranCode" value="${null}" />
			    </c:otherwise>
			</c:choose>
			
			
	<tr class="ct_list_pop">

		<td></td>
		<td align="center">			
			<span class="prodName">${ purchase.getPurchaseProd().getProdName()}<span class="tranNoNoDisplay">,${  purchase.getPurchaseProd().getProdNo()}</span></span> 
		</td>
		<td></td>
		<td align="center">
		<c:choose>
			<c:when test="${tranCode eq '2'}" >
				배송 준비 중
			</c:when>
			<c:when test="${ tranCode eq '3' }">
				배송중
			</c:when>
			<c:when test="${ tranCode eq '4' || tranCode eq '5' || tranCode eq '6'}">
				배송완료
			</c:when>
			<c:otherwise>
				
			</c:otherwise>
		</c:choose>
		</td>
		<td></td>
		<td align="left">
		
		<c:choose>
			<c:when test="${tranCode eq '3' }">
				<span class="arrival">상품도착<span class="tranNoNoDisplay">,${ purchase.getTranNo()}</span></span> 
					
			</c:when>
			<c:when test="${tranCode eq '4'}">
			<span class="confirm">구매확정<span class="tranNoNoDisplay">,${ purchase.getTranNo()}</span></span> 
			</c:when>
			<c:when test="${tranCode eq '5'}">
				<span class="addReview">후기쓰기<span class="tranNoNoDisplay">,${ purchase.getTranNo()},${  purchase.getPurchaseProd().getProdNo()}</span></span> 
			</c:when>
			<c:when test="${ tranCode eq '6'}">
			<span class="Review">후기 작성 완료</span>

						
			</c:when>
			<c:otherwise>
			
			</c:otherwise>
		</c:choose>
		
		</td>
		<td></td>
		<td align="center">
		<span class="detail">상세보기<span class="tranNoNoDisplay">,${ purchase.getTranNo()}</span></span> 
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
			    <jsp:param name="pageNavigator" value="listPurchase" />
			</jsp:include>
		
    	</td>
	</tr>
</table>

<!--  페이지 Navigator 끝 -->
</form>

</div>

</body>
</html>