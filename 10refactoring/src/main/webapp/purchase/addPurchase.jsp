<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>���� �Ϸ�</title>

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

/*$(function() {
	 $( "td.ct_btn01:contains('Ȯ��')" ).on("click" , function() {
		 $(window.parent.frames["rightFrame"].document.location).attr("href","/purchase/listPurchase");
	});
});	
*/

</script>

</head>

<body>

<form name="form">

������ ���� ���Ű� �Ǿ����ϴ�.

<table border=1>
	<tr>
		<td>��ǰ��ȣ</td>
		<td>${purchase.getPurchaseProd().getProdNo() }</td>
		
		<td></td>
	</tr>
	<tr>
		<td>�����ھ��̵�</td>
		<td>${purchase.getBuyer().getUserId() }</td>
		<td></td>
	</tr>
	<tr>
		<td>���Ź��</td>
		<td>		
			<c:choose>
				<c:when test="${ purchase.getPaymentOption() eq '1'}">
					���ݱ���
				</c:when>
				<c:otherwise>
					�ſ뱸��
				</c:otherwise>			
			</c:choose>
		</td>
		<td></td>
	</tr>
	<tr>
		<td>���ż���</td>
		<td>${purchase.getItem() }</td>
		<td></td>
	</tr>
	<tr>
		<td>�������̸�</td>
		<td>${purchase.getReceiverName() }</td>
		<td></td>
	</tr>
	<tr>
		<td>�����ڿ���ó</td>
		<td>${purchase.getReceiverPhone() }</td>
		<td></td>
	</tr>
	<tr>
		<td>�������ּ�</td>
		<td>${purchase.getDivyAddr() }</td>
		<td></td>
	</tr>
		<tr>
		<td>���ſ�û����</td>
		<td>${purchase.getDivyRequest() }</td>
		<td></td>
	</tr>
	<tr>
		<td>����������</td>
		<td>${purchase.getDivyDate()  }</td>
		<td></td>
	</tr>
</table>
</form>

</body>
</html>