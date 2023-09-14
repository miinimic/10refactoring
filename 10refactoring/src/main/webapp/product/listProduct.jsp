<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<html>
<head>
<title>��ǰ �����ȸ</title>

<style>


  .prodNoNoDisplay {
    color: transparent;

  }


</style>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

function fncGetProductList(currentPage) { 
	
	if( ${search.getMenu() eq 'manage'} && ${ ! empty search.getOrder()} && ${!empty search.getCategory() } ) {
			
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=manage&order=${search.getOrder()}&category=${search.getCategory()}").submit();	
	
	} else if( ${search.getMenu() eq 'manage'} && ${ ! empty search.getOrder()} && ${empty search.getCategory() } ) {
			
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=manage&order=${search.getOrder()}").submit();	
	
	} else if (${search.getMenu() eq 'manage'} && ${ empty search.getOrder()} && ${!empty search.getCategory() }){
		
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=manage&category=${search.getCategory() }").submit();	
		
	} else if ( ${search.getMenu() eq 'manage'} && ${ empty search.getOrder()} && ${empty search.getCategory() } ){
		
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=manage").submit();	
		
	} else if ( ${! search.getMenu() eq 'manage'} && ${ ! empty search.getOrder()} && ${ ! empty search.getCategory()} ){
		
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=search&order=${search.getOrder() }&category=${search.getCategory()}").submit();	
				
	} else if( ${! search.getMenu() eq 'manage'} && ${ ! empty search.getOrder()} && ${ empty search.getCategory()} ){
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=search&order=${search.getOrder()  }").submit();
	} else if(${! search.getMenu() eq 'manage'} && ${ empty search.getOrder()} && ${ ! empty search.getCategory()}) {
		
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=search&category=${search.getCategory() }").submit();
		
	} else if( ${! search.getMenu() eq 'manage'} && ${ empty search.getOrder()} && ${ empty search.getCategory()} ){
		
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=search").submit();
		
	} else {
		
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct").submit();	
	}
		
}

$(document).ready(function() {
	$(function() {
	 
	 $( "td.ct_btn01:contains('�˻�')" ).on("click" , function() {
		 fncGetProductList(1);
	});
	 
	 $( ".ManageAsc:contains('���� ���� ��')" ).on("click" , function() {
		 $(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?order=asc&menu=manage");
	});
	 
	 $( ".ManageDesc:contains('���� ���� ��')" ).on("click" , function() {
		 $(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?order=desc&menu=manage");
	});
	 
	 $( ".ManageCategoryAsc:contains('���� ���� ��')" ).on("click" , function() {
		 $(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?order=asc&menu=manage&category=${search.getCategory() }");
	});
	 
	 $( ".ManageCategoryDesc:contains('���� ���� ��')" ).on("click" , function() {
		 $(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?order=desc&menu=manage&category=${search.getCategory() }");
	});
	 
	 $( ".SearchAsc:contains('���� ���� ��')" ).on("click" , function() {
		 $(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?order=asc&menu=search");
	});
	 
	 $( ".SearchDesc:contains('���� ���� ��')" ).on("click" , function() {
		 $(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?order=desc&menu=search");
	});
	 
	 $( ".SearchCategoryAsc:contains('���� ���� ��')" ).on("click" , function() {
		 $(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?order=asc&menu=search&category=${search.getCategory()}");
	});
	 
	 $( ".SearchCategoryDesc:contains('���� ���� ��')" ).on("click" , function() {
		 $(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?order=desc&menu=search&category=${search.getCategory() }");
	});
	 
	$( ".ManageProduct" ).on("click" , function() {

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
			$(window.parent.frames["rightFrame"].document.location).attr("href","/product/updateProductView?prodNo="+encodedProdNo+"");
			
	});
	
	$( ".SearchProduct" ).on("click" , function() {

		var string = $(this).text().trim();

		var lines = string.split(",");
		var data = [];

		for (var i = 0; i < lines.length; i++) {
		    var fields = lines[i].split(",");
		    data.push(fields);
		}

		  // alert(data[1]);
		    
		 var prodNo = data[1];

		var encodedProdNo = encodeURIComponent(prodNo);
			$(window.parent.frames["rightFrame"].document.location).attr("href","/product/getProduct?prodNo="+encodedProdNo+"&menu=search");
			
	});
	
	$( ".ManageGetProduct" ).on("click" , function() {

		var string = $(this).text().trim();

		var lines = string.split(",");
		var data = [];

		for (var i = 0; i < lines.length; i++) {
		    var fields = lines[i].split(",");
		    data.push(fields);
		}

		  // alert(data[1]);
		    
		 var prodNo = data[1];

		var encodedProdNo = encodeURIComponent(prodNo);
			$(window.parent.frames["rightFrame"].document.location).attr("href","/product/getProduct?prodNo="+encodedProdNo+"&menu=manage");
			
	});
	
	$( ".GetProduct" ).on("click" , function() {

		var string = $(this).text().trim();

		var lines = string.split(",");
		var data = [];

		for (var i = 0; i < lines.length; i++) {
		    var fields = lines[i].split(",");
		    data.push(fields);
		}

		//   alert(data[1]);
		    
		 var prodNo = data[1];

		var encodedProdNo = encodeURIComponent(prodNo);
			$(window.parent.frames["rightFrame"].document.location).attr("href","/product/getProduct?prodNo="+encodedProdNo+"");
			
	});

	$( ".delete" ).on("click" , function() {

		var string = $(this).text().trim();

		var lines = string.split(",");
		var data = [];

		for (var i = 0; i < lines.length; i++) {
		    var fields = lines[i].split(",");
		    data.push(fields);
		}

		//   alert(data[1]);
		    
		 var prodNo = data[1];

		var encodedProdNo = encodeURIComponent(prodNo);
			$(window.parent.frames["rightFrame"].document.location).attr("href","/product/deleteProduct?currentPage=${resultPage.currentPage}&prodNo="+encodedProdNo+"&menu=manage");
			
	});
	
	$( ".delivery" ).on("click" , function() {

		var string = $(this).text().trim();

		var lines = string.split(",");
		var data = [];

		for (var i = 0; i < lines.length; i++) {
		    var fields = lines[i].split(",");
		    data.push(fields);
		}

		 //  alert(data[1]);
		 // alert(data[2]);
		    
		 var prodNo = data[1];
		 var tranNo = data[2];

		var encodedProdNo = encodeURIComponent(prodNo);
		var encodedTranNo = encodeURIComponent(tranNo);
		
			$(window.parent.frames["rightFrame"].document.location).attr("href","/purchase/updateTranCode?tranNo="+encodedTranNo+"&menu=manage&prodNo="+encodedProdNo+"&tranCode=3&currentPage=${resultPage.currentPage}");
			
	});
	
	$( ".purchaseDetail" ).on("click" , function() {

		var string = $(this).text().trim();

		var lines = string.split(",");
		var data = [];

		for (var i = 0; i < lines.length; i++) {
		    var fields = lines[i].split(",");
		    data.push(fields);
		}
		    
		 var tranNo = data[1];

		var encodedTranNo = encodeURIComponent(tranNo);
		
			$(window.parent.frames["rightFrame"].document.location).attr("href","/purchase/getPurchase?tranNo="+encodedTranNo+"&menu=manage");
			
	});
	
	$( ".PutCart" ).on("click" , function() {

		var string = $(this).text().trim();

		var lines = string.split(",");
		var data = [];

		for (var i = 0; i < lines.length; i++) {
		    var fields = lines[i].split(",");
		    data.push(fields);
		}

		  // alert(data[1]);
		  //alert(data[2]);
		    
		 var prodNo = data[1];
		 var userId = data[2];

		var encodedProdNo = encodeURIComponent(prodNo);
		var encodeduserId = encodeURIComponent(userId);
		
			$(window.parent.frames["rightFrame"].document.location).attr("href","/product/addCart?prodNo="+encodedProdNo+"&userId="+encodeduserId+"");
			
	});
	
	$( ".GoCart" ).on("click" , function() {
		$(window.parent.frames["rightFrame"].document.location).attr("href","/purchase/listCart");			
	});
	
});
	
});

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<c:choose>
	<c:when test="${search.getMenu() eq 'manage'}">
		<c:choose>
			<c:when test="${ ! empty search.getOrder()}">
				<c:choose>
					<c:when test="${!empty search.getCategory() }">
						<form name="detailForm" action="/product/listProduct?menu=manage&order=${search.getOrder()}&category=${search.getCategory()}" method="post">
					</c:when>
					<c:otherwise>
						<form name="detailForm" action="/product/listProduct?menu=manage&order=${search.getOrder()}" method="post">
					</c:otherwise>
				</c:choose>
				
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${!empty search.getCategory() }">
						<form name="detailForm" action="/product/listProduct?menu=manage&category=${search.getCategory() }" method="post">
					</c:when>
					<c:otherwise>
						<form name="detailForm" action="/product/listProduct?menu=manage" method="post">
					</c:otherwise>			
				</c:choose>			
			</c:otherwise>	
		</c:choose>	
	</c:when>
	<c:otherwise>
		<c:choose>
			<c:when test="${ ! empty search.getOrder()}">
				<c:choose>
					<c:when test="${ ! empty search.getCategory()}">
						<form name="detailForm" action="/product/listProduct?menu=search&order=${search.getOrder() }&category=${search.getCategory()}" method="post">
					</c:when>
					<c:otherwise>
						<form name="detailForm" action="/product/listProduct?menu=search&order=${search.getOrder()  }" method="post">
					</c:otherwise>
				</c:choose>					
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${ ! empty search.getCategory()}">
						<form name="detailForm" action="/product/listProduct?menu=search&category=${search.getCategory() }" method="post">
					</c:when>
					<c:otherwise>
						<form name="detailForm" action="/product/listProduct?menu=search" method="post">
					</c:otherwise>
				</c:choose>	
			</c:otherwise>
		</c:choose>		
	</c:otherwise>
</c:choose>

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
					<c:choose>
						<c:when test="${search.getMenu() eq 'manage' }" >
							��ǰ����
						</c:when>
						<c:otherwise>
							��ǰ ��� ��ȸ
						</c:otherwise>
					</c:choose>
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
	<c:choose>
		<c:when test="${search.getMenu() eq 'manage' || user.getRole() eq 'admin' }" >
			<c:choose>
					<c:when test="${ !empty search.getSearchCondition() }" >
						<td align="right">
						<select name="searchCondition" class="ct_input_g" style="width:80px">		
						<c:choose>				
							<c:when test="${search.getSearchCondition() eq '0' }">
									<option value="0" selected>��ǰ��ȣ</option>
									<option value="1">��ǰ��</option>
									<option value="2">��ǰ����</option>
							</c:when>
							<c:when test="${search.getSearchCondition() eq '1' }">
									<option value="0">��ǰ��ȣ</option>
									<option value="1" selected>��ǰ��</option>
									<option value="2">��ǰ����</option>
							</c:when>
							<c:when test="${search.getSearchCondition() eq '2' }">
									<option value="0">��ǰ��ȣ</option>
									<option value="1">��ǰ��</option>
									<option value="2" selected>��ǰ����</option>
							</c:when>
							<c:otherwise>
								<option value="0">��ǰ��ȣ</option>
								<option value="1">��ǰ��</option>
								<option value="2">��ǰ����</option>					
							</c:otherwise>
							</c:choose>	
							</select>	
						<c:choose>
							<c:when test="${ empty search.getSearchCondition() }">
								<input type="text" name="searchKeyword" class="ct_input_g" style="width:200px; height:19px" >
							</c:when>
							<c:when test="${ !empty search.getSearchCondition() }">
							<input 	type="text" name="searchKeyword"  value="${search.getSearchKeyword()}" 
										class="ct_input_g" style="width:200px; height:19px" >
							</c:when>
						</c:choose>
					</c:when>		
					<c:otherwise>
						<td align="right">
						<select name="searchCondition" class="ct_input_g" style="width:80px">
							<option value="0">��ǰ��ȣ</option>
							<option value="1">��ǰ��</option>
							<option value="2">��ǰ����</option>
						</select>
						<input type="text" name="searchKeyword" class="ct_input_g" style="width:200px; height:19px" >
						</td>			
					</c:otherwise>	
				</c:choose>
		</c:when>
		<c:otherwise>
			<c:choose>
					<c:when test="${ !empty search.getSearchCondition() }" >
						<td align="right">
						<select name="searchCondition" class="ct_input_g" style="width:80px">		
						<c:choose>				
							<c:when test="${search.getSearchCondition() eq '1' }">
									<option value="1" selected>��ǰ��</option>
									<option value="2">��ǰ����</option>
							</c:when>
							<c:when test="${search.getSearchCondition() eq '2' }">
									<option value="1">��ǰ��</option>
									<option value="2" selected>��ǰ����</option>
							</c:when>
							<c:otherwise>
								<option value="1">��ǰ��</option>
								<option value="2">��ǰ����</option>					
							</c:otherwise>
							</c:choose>	
							</select>	
						<c:choose>
							<c:when test="${ empty search.getSearchCondition() }">
								<input type="text" name="searchKeyword" class="ct_input_g" style="width:200px; height:19px" >
							</c:when>
							<c:when test="${ !empty search.getSearchCondition() }">
							<input 	type="text" name="searchKeyword"  value="${search.getSearchKeyword()}" 
										class="ct_input_g" style="width:200px; height:19px" >
							</c:when>
						</c:choose>
					</c:when>		
					<c:otherwise>
						<td align="right">
						<select name="searchCondition" class="ct_input_g" style="width:80px">
							<option value="1">��ǰ��</option>
							<option value="2">��ǰ����</option>
						</select>
						<input type="text" name="searchKeyword" class="ct_input_g" style="width:200px; height:19px" >
						</td>			
					</c:otherwise>	
				</c:choose>
		</c:otherwise>
	</c:choose>
				
				</td>
					
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						�˻�
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >��ü  ${ resultPage.getTotalCount() } �Ǽ�, ���� ${resultPage.getCurrentPage() } ������ 
		<c:choose>
			<c:when test="${search.getMenu() eq 'manage' || user.getRole() eq 'admin'}">
				<c:choose>
					<c:when test="${empty search.getCategory() }">
						<span class = "ManageAsc">���� ���� ��</span>
						<span class="ManageDesc">���� ���� ��</span>		   
					</c:when>
					<c:otherwise>
						<span class="ManageCategoryAsc">���� ���� ��</span>
						<span class="ManageCategoryDesc">���� ���� ��</span>
					</c:otherwise>
				</c:choose>			
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${empty search.getCategory() }">
						<span class="SearchAsc">���� ���� ��</span>
						<span class="SearchDesc">���� ���� ��</span>
					</c:when>
				    <c:otherwise>
				    	<span class="SearchCategoryAsc">���� ���� ��</span>
						<span class="SearchCategoryDesc">���� ���� ��</span>			    
				    </c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
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
		<td class="ct_list_b">��ǰ��Ȳ</td>		
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>

	<c:set var="i" value="0" />
	<c:forEach var="product" items="${list}">
		<c:set var="i" value="${ i+1 }" />
			<c:choose>
			    <c:when test="${not empty product.getProTranCode()}">
			        <c:set var="tranCode" value="${fn:trim(product.getProTranCode())}" />
			    </c:when>
			    <c:otherwise>
			        <c:set var="tranCode" value="${null}" />
			    </c:otherwise>
			</c:choose>
		<tr class="ct_list_pop">
		<td align="center">${ i }</td>
		<td></td>
		<td align="left">
		<c:choose>		
			<c:when test="${search.getMenu() eq 'manage' && empty product.getProTranCode()  || user.getRole() eq 'admin' && empty product.getProTranCode()  }" >			
				<span class="ManageProduct">${product.getProdName()}<span class="prodNoNoDisplay">,${ product.getProdNo() }</span></span>
				<!-- <span class="ManageProduct">${product.getProdName()}, ${ product.getProdNo() }</span> -->
				
			</c:when>
			<c:when test="${search.getMenu() eq 'search' && empty product.getProTranCode() }">		
				<span class="SearchProduct">${product.getProdName()}<span class="prodNoNoDisplay">,${ product.getProdNo() }</span></span>
			</c:when>
			<c:when test="${search.getMenu() eq 'manage' && ! empty product.getProTranCode()  || user.getRole() eq 'admin' && ! empty product.getProTranCode()  }" >
				<span class="ManageGetProduct">${product.getProdName()}<span class="prodNoNoDisplay">,${ product.getProdNo() }</span></span>
			</c:when>
			<c:otherwise>
				<span class="GetProduct">${product.getProdName()}<span class="prodNoNoDisplay">,${ product.getProdNo() }</span></span>
			</c:otherwise>
		</c:choose>
		</td>
		<td></td>
		<td align="left">${product.getCategory() }</td> 
		<td></td>
		<td align="left">${product.getPrice() } ( ��� : ${product.getItem() } ��)</td> 
		<td></td>
		<td align="left">${product.getRegDate() }</td>
		<td></td>	
		<td align="left">
<c:choose>
    <c:when test="${search.getMenu() eq 'manage'}">
        <c:choose>
            <c:when test="${empty product.getProTranCode()}">
                �Ǹ��� 
                <c:choose>
                	<c:when test="${ product.getCartNo() == '0'}">
                		<span class="delete">�����ϱ�<span class="prodNoNoDisplay">,${ product.getProdNo() }</span></span>
                	</c:when>
                	<c:otherwise>
                	
                	</c:otherwise>
                </c:choose>               
            </c:when>
            <c:when test="${tranCode eq '2'}">
                ���ſϷ� <span class="delivery">����ϱ�<span class="prodNoNoDisplay">,${ product.getProdNo() },${ product.getTranNo() }</span></span>     
                <span class="purchaseDetail">���Ż󼼺���<span class="prodNoNoDisplay">,${ product.getTranNo() }</span></span>        
            </c:when>
            <c:when test="${tranCode eq '3'}">
                �����
                <span class="purchaseDetail">���Ż󼼺���<span class="prodNoNoDisplay">,${ product.getTranNo() }</span></span>
            </c:when>
            <c:otherwise>
                ��ۿϷ�
                <span class="purchaseDetail">���Ż󼼺���<span class="prodNoNoDisplay">,${ product.getTranNo() }</span></span>
            </c:otherwise>
        </c:choose>
     
    </c:when>
    <c:when test="${(userId eq 'admin' || userId eq 'manager') && search.getMenu() eq 'search'}">
        <c:choose>
            <c:when test="${empty product.getProTranCode()}">
                �Ǹ���
            </c:when>
            <c:when test="${product.getProTranCode() eq '2'}">
                ���ſϷ�
                <span class="purchaseDetail">���Ż󼼺���<span class="prodNoNoDisplay">,${ product.getTranNo() }</span></span>
            </c:when>
            <c:when test="${product.getProTranCode() eq '3'}">
                �����
                <span class="purchaseDetail">���Ż󼼺���<span class="prodNoNoDisplay">,${ product.getTranNo() }</span></span>
            </c:when>
            <c:otherwise>
                ��ۿϷ�
                <span class="purchaseDetail">���Ż󼼺���<span class="prodNoNoDisplay">,${ product.getTranNo() }</span></span>
            </c:otherwise>
        </c:choose>
    </c:when>
     <c:when test="${ !(userId eq 'admin' || userId eq 'manager') && search.getMenu() eq 'search'}">
        <c:choose>
            <c:when test="${empty product.getProTranCode() && product.getItem() > '0'}">
                �Ǹ���
                <c:choose>
                			 <c:when test="${product.getCartNo() == '0'}">
                				<span class="PutCart">��ٱ��Ͽ� �ֱ�<span class="prodNoNoDisplay">,${ product.getProdNo() },${ user.getUserId() }</span></span> 
                			</c:when>
                			<c:otherwise>
                				<span class="GoCart">��ٱ��� Ȯ���ϱ�</span>
                			</c:otherwise>             		
                		</c:choose> 
  
            </c:when>
           
            <c:otherwise>
               ������
            </c:otherwise>
        </c:choose>
    </c:when>
    <c:otherwise>
        <c:choose>
            <c:when test="${product.getItem() > '0'}">
                �Ǹ���
                		                  	
            </c:when>
            <c:otherwise>
                ������
            </c:otherwise>
        </c:choose>
    </c:otherwise>
</c:choose>

 		
			</td>		
	</tr>
	<tr>
	<td id="${product.getProdNo()}" colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	
	</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value=""/>
			<jsp:include page="../common/pageNavigator.jsp">
			    <jsp:param name="pageNavigator" value="listProduct" />
			</jsp:include>
		
    	</td>
	</tr>
</table>
<!--  ������ Navigator �� -->

</form>

</div>
</body>
</html>
