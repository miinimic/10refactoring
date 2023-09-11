<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<title>Lunch Box</title>

<link href="/css/left.css" rel="stylesheet" type="text/css">

	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
/*function history(){
	popWin = window.open("/history.jsp","popWin","left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
}*/

//==> jQuery ���� �߰��� �κ�
$(function() {
	 
	//==> ����������ȸ Event ����ó���κ�
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( ".Depth03:contains('����������ȸ')" ).on("click" , function() {
		//Debug..
		//alert(  $( ".Depth03:contains('����������ȸ')" ).html() );
		$(window.parent.frames["rightFrame"].document.location).attr("href","/user/getUser?userId=${user.userId}");
	});
	
	$( ".Depth03:contains('ī�װ��� ��ǰ��ȸ')" ).on("click" , function() {
		//Debug..
		//alert(  $( ".Depth03:contains('����������ȸ')" ).html() );
		$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listCategory.jsp");
	});
	
	$( ".Depth03:contains('�ı� ��� ��ȸ')" ).on("click" , function() {
		//Debug..
		//alert(  $( ".Depth03:contains('����������ȸ')" ).html() );
		$(window.parent.frames["rightFrame"].document.location).attr("href","/listReview");
	});
	
	//==> ȸ��������ȸ Event ����ó���κ�
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( ".Depth03:contains('ȸ��������ȸ')" ).on("click" , function() {

		$(window.parent.frames["rightFrame"].document.location).attr("href","/user/listUser");
	}); 
	
	$( ".Depth03:contains('�ǸŻ�ǰ���')" ).on("click" , function() {

		$(window.parent.frames["rightFrame"].document.location).attr("href","../product/addProductView.jsp");
	}); 
	
	$( ".Depth03:contains('�ǸŻ�ǰ����')" ).on("click" , function() {

		$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?menu=manage"); 
	}); 
	$( ".Depth03:contains('�� ǰ �� ��')" ).on("click" , function() { 

		$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?menu=search"); 
	}); 
	
	$( ".Depth03:contains('�ֹ� ���� ��ȸ')" ).on("click" , function() {

		$(window.parent.frames["rightFrame"].document.location).attr("href","/purchase/listPurchase"); 
	}); 
	
	$( ".Depth03:contains('��ٱ���')" ).on("click" , function() {

		$(window.parent.frames["rightFrame"].document.location).attr("href","/purchase/listCart"); 
	}); 
	
	$( ".Depth03:contains('�ֱ� �� ��ǰ')" ).on("click" , function() {

		popWin = window.open("/history.jsp","popWin","left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
	}); 
});	
</script>
</head>

<body background="/images/left/imgLeftBg.gif" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  >

<table width="159" border="0" cellspacing="0" cellpadding="0">

<!--menu 01 line-->
<tr>
<td valign="top"> 
	<table  border="0" cellspacing="0" cellpadding="0" width="159" >	
		<tr>
		<c:if test="${ !empty user }">
		<tr>
			<td class="Depth03">
				����������ȸ
			</td>
		</tr>			
		<tr>
			<td class="Depth03">
				ī�װ��� ��ǰ��ȸ
			</td>
		</tr>
		<tr>
			<td class="Depth03">
				�ı� ��� ��ȸ
			</td>
		</tr>
		</c:if>	
		
			
		<c:if test="${user.role == 'admin'}">
			<tr>
				<td class="Depth03" >
					ȸ��������ȸ
				</td>
			</tr>
		</c:if>
		<tr>
			<td class="DepthEnd">&nbsp;</td>
		</tr>
	</table>
</td>
</tr>

<c:if test="${user.role == 'admin'}">
<!--menu 02 line-->
<tr>
	<td valign="top"> 
		<table  border="0" cellspacing="0" cellpadding="0" width="159">
			<tr>
				<td class="Depth03">
					�ǸŻ�ǰ���
				</td>
			</tr>
			<tr>
				<td class="Depth03">
					�ǸŻ�ǰ����
				</td>
			</tr>
			<tr>
				<td class="DepthEnd">&nbsp;</td>
			</tr>
		</table>
	</td>
</tr>
</c:if>

<!--menu 03 line-->
<tr>
	<td valign="top"> 
		<table  border="0" cellspacing="0" cellpadding="0" width="159">
			<c:if test="${ empty user || ! empty user && user.role == 'user'}">
			<tr>
				<td class="Depth03">
					�� ǰ �� ��
				</td>
			</tr>
			</c:if>
			<c:if test="${ ! empty user && user.role == 'user'}">
			<tr>
				<td class="Depth03">
					�ֹ� ���� ��ȸ
				</td>
			</tr>	
			<tr>
				<td class="Depth03">
					��ٱ���
				</td>
			</tr>
			</c:if>

			
			<tr>
				<td class="DepthEnd">&nbsp;</td>
			</tr>
			<tr>
				<td class="Depth03">
					�ֱ� �� ��ǰ
				</td>
			</tr>
		</table>
	</td>
</tr>

</table>

</body>
</html>
