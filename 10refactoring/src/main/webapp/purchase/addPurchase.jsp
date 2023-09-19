<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>구매 완료</title>

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

/*$(function() {
	 $( "td.ct_btn01:contains('확인')" ).on("click" , function() {
		 $(window.parent.frames["rightFrame"].document.location).attr("href","/purchase/listPurchase");
	});
});	
*/

</script>

</head>

<body>

<form name="form">

다음과 같이 구매가 되었습니다.

<table border=1>
	<tr>
		<td>물품번호</td>
		<td>${purchase.purchaseProd.prodNo }</td>
		
		<td></td>
	</tr>
	<tr>
		<td>구매자아이디</td>
		<td>${purchase.buyer.userId }</td>
		<td></td>
	</tr>
	<tr>
		<td>구매방법</td>
		<td>		
			<c:choose>
				<c:when test="${ purchase.paymentOption eq '1'}">
					현금구매
				</c:when>
				<c:otherwise>
					신용구매
				</c:otherwise>			
			</c:choose>
		</td>
		<td></td>
	</tr>
	<tr>
		<td>구매수량</td>
		<td>${purchase.item }</td>
		<td></td>
	</tr>
	<tr>
		<td>구매자이름</td>
		<td>${purchase.receiverName }</td>
		<td></td>
	</tr>
	<tr>
		<td>구매자연락처</td>
		<td>${purchase.receiverPhone }</td>
		<td></td>
	</tr>
	<tr>
		<td>구매자주소</td>
		<td>${purchase.divyAddr }</td>
		<td></td>
	</tr>
		<tr>
		<td>구매요청사항</td>
		<td>${purchase.divyRequest }</td>
		<td></td>
	</tr>
	<tr>
		<td>배송희망일자</td>
		<td>${purchase.divyDate  }</td>
		<td></td>
	</tr>
</table>
</form>

</body>
</html>