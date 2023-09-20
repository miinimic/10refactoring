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
	
	if($('input[name=searchCondition]').val() == '2'){
		
		alert("aaa");
		
		var result = '';
		$('input[name=searchKeyword]').map(function() {
		    result += $(this).val()+",";
		});
		
		// ������ ������ ','�� ������ ����
		$('input[name=searchKeyword]').val(result.slice(0, -1));
		
	}

	
	if( ${search.menu eq 'manage'} && ${ ! empty search.order} && ${!empty search.category } ) {
			
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=manage&order=${search.order}&category=${search.category}").submit();	
	
	} else if( ${search.menu eq 'manage'} && ${ ! empty search.order} && ${empty search.category } ) {
			
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=manage&order=${search.order}").submit();	
	
	} else if (${search.menu eq 'manage'} && ${ empty search.order} && ${!empty search.category }){
		
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=manage&category=${search.category }").submit();	
		
	} else if ( ${search.menu eq 'manage'} && ${ empty search.order} && ${empty search.category} ){
		
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=manage").submit();	
		
	} else if ( ${! search.menu eq 'manage'} && ${ ! empty search.order} && ${ ! empty search.category} ){
		
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=search&order=${search.order }&category=${search.category}").submit();	
				
	} else if( ${! search.menu eq 'manage'} && ${ ! empty search.order} && ${ empty search.category} ){
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=search&order=${search.order  }").submit();
	} else if(${! search.menu eq 'manage'} && ${ empty search.order} && ${ ! empty search.category}) {
		
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=search&category=${search.category }").submit();
		
	} else if( ${! search.menu eq 'manage'} && ${ empty search.order} && ${ empty search.category} ){
		
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
		 $(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?order=asc&menu=manage&category=${search.category }");
	});
	 
	 $( ".ManageCategoryDesc:contains('���� ���� ��')" ).on("click" , function() {
		 $(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?order=desc&menu=manage&category=${search.category}");
	});
	 
	 $( ".SearchAsc:contains('���� ���� ��')" ).on("click" , function() {
		 $(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?order=asc&menu=search");
	});
	 
	 $( ".SearchDesc:contains('���� ���� ��')" ).on("click" , function() {
		 $(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?order=desc&menu=search");
	});
	 
	 $( ".SearchCategoryAsc:contains('���� ���� ��')" ).on("click" , function() {
		 $(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?order=asc&menu=search&category=${search.category}");
	});
	 
	 $( ".SearchCategoryDesc:contains('���� ���� ��')" ).on("click" , function() {
		 $(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?order=desc&menu=search&category=${search.category }");
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
	<c:when test="${search.menu eq 'manage'}">
		<c:choose>
			<c:when test="${ ! empty search.order}">
				<c:choose>
					<c:when test="${!empty search.category}">
						<form name="detailForm" action="/product/listProduct?menu=manage&order=${search.order}&category=${search.category}" method="post" >
					</c:when>
					<c:otherwise>
						<form name="detailForm" action="/product/listProduct?menu=manage&order=${search.order}" method="post">
					</c:otherwise>
				</c:choose>
				
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${!empty search.category }">
						<form name="detailForm" action="/product/listProduct?menu=manage&category=${search.category }" method="post">
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
			<c:when test="${ ! empty search.order}">
				<c:choose>
					<c:when test="${ ! empty search.category}">
						<form name="detailForm" action="/product/listProduct?menu=search&order=${search.order }&category=${search.category}" method="post">
					</c:when>
					<c:otherwise>
						<form name="detailForm" action="/product/listProduct?menu=search&order=${search.order  }" method="post">
					</c:otherwise>
				</c:choose>					
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${ ! empty search.category}">
						<form name="detailForm" action="/product/listProduct?menu=search&category=${search.category }" method="post">
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
						<c:when test="${search.menu eq 'manage' }" >
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
		<c:when test="${search.menu eq 'manage' || user.role eq 'admin' }" >
			<c:choose>
					<c:when test="${ !empty search.searchCondition}" >
						<td align="right">
						<select name="searchCondition" class="ct_input_g" style="width:80px" id="optionSelect">		
						<c:choose>				
							<c:when test="${search.searchCondition eq '0' }">
									<option value="0" selected>��ǰ��ȣ</option>
									<option value="1">��ǰ��</option>
									<option value="2">���ݹ���</option>
							</c:when>
							<c:when test="${search.searchCondition eq '1' }">
									<option value="0">��ǰ��ȣ</option>
									<option value="1" selected>��ǰ��</option>
									<option value="2">���ݹ���</option>
							</c:when>
							<c:when test="${search.searchCondition eq '2' }">
									<option value="0">��ǰ��ȣ</option>
									<option value="1">��ǰ��</option>
									<option value="2" selected>���ݹ���</option>
							</c:when>
							<c:otherwise>
								<option value="0">��ǰ��ȣ</option>
								<option value="1">��ǰ��</option>
								<option value="2">���ݹ���</option>				
							</c:otherwise>
							</c:choose>	
							</select>	
						<c:choose>
							<c:when test="${ empty search.searchCondition }">
								<input type="text" name="searchKeyword" class="ct_input_g" style="width:200px; height:19px" >
								<div id="textInput" style="display: none;">
							       ���� <input type="text" name="searchKeyword"  id="text"> ����
							    	</div>
							</c:when>
							<c:when test="${ !empty search.searchCondition && search.searchCondition ne '2'}">
							<input 	type="text" name="searchKeyword"  value="${search.searchKeyword}" 
										class="ct_input_g" style="width:200px; height:19px" >
							<div id="textInput" style="display: none;">
							      ����  <input type="text" id="text" name="searchKeyword"> ����
							    	</div>
							</c:when>
							<c:when test="${ !empty search.searchCondition && search.searchCondition eq '2'}">
							<input 	type="text" name="searchKeyword"  value="${search.from}" 
										class="ct_input_g" style="width:200px; height:19px" >
							<div id="textInput">
							      ����  <input type="text" id="text" name="searchKeyword" value="${search.to}"> ����
							    	</div>
							</c:when>
						</c:choose>
					</c:when>		
					<c:otherwise>
						<td align="right">
						<select name="searchCondition" class="ct_input_g" style="width:80px" id="optionSelect">
							<option value="0">��ǰ��ȣ</option>
							<option value="1">��ǰ��</option>
							<option value="2">���ݹ���</option>
						</select>
						<input type="text" name="searchKeyword" class="ct_input_g" style="width:200px; height:19px" >
						<div id="textInput" style="display: none;">
							      ���� <input type="text" id="text" name="searchKeyword"> ����
							    	</div>
						</td>			
					</c:otherwise>	
				</c:choose>
		</c:when>
		<c:otherwise>
			<c:choose>
					<c:when test="${ !empty search.searchCondition }" >
						<td align="right">
						<select name="searchCondition" class="ct_input_g" style="width:80px" id="optionSelect">		
						<c:choose>				
							<c:when test="${search.searchCondition eq '1' }">
									<option value="1" selected>��ǰ��</option>
									<option value="2">���ݹ���</option>
							</c:when>
							<c:when test="${search.searchCondition eq '2' }">
									<option value="1">��ǰ��</option>
									<option value="2" selected>���ݹ���</option>
							</c:when>
							<c:otherwise>
								<option value="1">��ǰ��</option>
								<option value="2">���ݹ���</option>				
							</c:otherwise>
							</c:choose>	
							</select>	
						<c:choose>
							<c:when test="${ empty search.searchCondition }">
								<input type="text" name="searchKeyword" class="ct_input_g" style="width:200px; height:19px" >
								<div id="textInput" style="display: none;">
							       ���� <input type="text" id="text" name="searchKeyword"> ����
							    	</div>
							</c:when>
							<c:when test="${ !empty search.searchCondition && search.searchCondition ne '2'}">
							<input 	type="text" name="searchKeyword"  value="${search.searchKeyword}" 
										class="ct_input_g" style="width:200px; height:19px" >
										<div id="textInput" style="display: none;">
							       ���� <input type="text" id="text" name="searchKeyword"> ����
							    	</div>
							</c:when>
							<c:when test="${ !empty search.searchCondition && search.searchCondition eq '2'}">
							<input 	type="text" name="searchKeyword"  value="${search.from}" 
										class="ct_input_g" style="width:200px; height:19px" >
										<div id="textInput">
							       ���� <input type="text" id="text" name="searchKeyword" value="${search.to}" > ����
							    	</div>
							</c:when>
						</c:choose>
					</c:when>		
					<c:otherwise>
						<td align="right">
						<select name="searchCondition" class="ct_input_g" style="width:80px" id="optionSelect">
							<option value="1">��ǰ��</option>
							<option value="2">���ݹ���</option>
						</select>
						<input type="text" name="searchKeyword" class="ct_input_g" style="width:200px; height:19px" >
						<div id="textInput" style="display: none;">
							       ���� <input type="text" id="text" name="searchKeyword"> ����
							    	</div>
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
		<td colspan="11" >��ü ��ǰ ${ resultPage.totalCount } ��, ���� ${resultPage.currentPage } ������ 
		
		<c:choose>
			<c:when test="${ ! empty category }">
			${search.category } ����  ${ category } ��
			</c:when>	
		</c:choose>
		
		<c:choose>
			<c:when test="${search.menu eq 'manage' || user.role eq 'admin'}">
				<c:choose>
					<c:when test="${empty search.category }">
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
					<c:when test="${empty search.category }">
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
			    <c:when test="${not empty product.proTranCode}">
			        <c:set var="tranCode" value="${fn:trim(product.proTranCode)}" />
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
			<c:when test="${search.menu eq 'manage' && empty product.proTranCode  || user.role eq 'admin' && empty product.proTranCode  }" >			
				<span class="ManageProduct">${product.prodName}<span class="prodNoNoDisplay">,${ product.prodNo }</span></span>
				<!-- <span class="ManageProduct">${product.getProdName()}, ${ product.getProdNo() }</span> -->
				
			</c:when>
			<c:when test="${search.menu eq 'search' && empty product.proTranCode }">		
				<span class="SearchProduct">${product.prodName}<span class="prodNoNoDisplay">,${ product.prodNo }</span></span>
			</c:when>
			<c:when test="${search.menu eq 'manage' && ! empty product.proTranCode  || user.role eq 'admin' && ! empty product.proTranCode }" >
				<span class="ManageGetProduct">${product.prodName}<span class="prodNoNoDisplay">,${ product.prodNo }</span></span>
			</c:when>
			<c:otherwise>
				<span class="GetProduct">${product.prodName}<span class="prodNoNoDisplay">,${ product.prodNo }</span></span>
			</c:otherwise>
		</c:choose>
		</td>
		<td></td>
		<td align="left">${product.category }</td> 
		<td></td>
		<td align="left">${product.price } ( ��� : ${product.item} ��)</td> 
		<td></td>
		<td align="left">${product.regDate }</td>
		<td></td>	
		<td align="left">
<c:choose>

     <c:when test="${ !(userId eq 'admin' || userId eq 'manager') && search.menu eq 'search'}">
        <c:choose>
            <c:when test="${empty product.proTranCode && product.item > '0'}">
                �Ǹ���
                <c:choose>
                			 <c:when test="${product.cartNo == '0'}">
                				<span class="PutCart">��ٱ��Ͽ� �ֱ�<span class="prodNoNoDisplay">,${ product.prodNo },${ user.userId }</span></span> 
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
    
    <c:when test="${search.menu eq 'manage'}">
        <c:choose>
            <c:when test="${product.item > '0'}">
                �Ǹ���
                <c:choose>
                	<c:when test="${ product.cartNo == '0'}">
                		<span class="delete">�����ϱ�<span class="prodNoNoDisplay">,${ product.prodNo }</span></span>
                	</c:when>
                	<c:otherwise>
                	
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
            <c:when test="${product.item > '0'}">
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
	<td id="${product.prodNo}" colspan="11" bgcolor="D6D7D6" height="1"></td>
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

<script>

//select ��ҿ� input ��Ҹ� �����ɴϴ�.
var optionSelect = document.getElementById("optionSelect");
var textInput = document.getElementById("textInput");

//select ����� ���� �̺�Ʈ�� �����ϰ� ó���մϴ�.
optionSelect.addEventListener("change", function() {
  // ���õ� �ɼ��� ���� �����ɴϴ�.
  var selectedOption = optionSelect.value;

  // ���õ� �ɼǿ� ���� input ��Ҹ� ��Ÿ���ų� ����ϴ�.
  if (selectedOption === "2") {
      textInput.style.display = "block"; // ��Ÿ����
  } else {
      textInput.style.display = "none"; // ���߱�
  }
});

</script>
</body>
</html>
