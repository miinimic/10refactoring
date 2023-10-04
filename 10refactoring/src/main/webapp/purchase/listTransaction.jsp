<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<html>
<head>
<title>거래현황관리</title>

<style>


  .prodNoNoDisplay {
    color: transparent;

  }
  
  body {
            padding-top : 60px;
        }


</style>

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

<script type="text/javascript">

function fncGetProductList(currentPage) { 
	
	if( ${search.menu eq 'manage'} && ${ ! empty search.order} && ${!empty search.category } ) {
			
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=manage&order=${search.order}&category=${search.category}").submit();	
	
	} else if( ${search.menu eq 'manage'} && ${ ! empty search.order} && ${empty search.category } ) {
			
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=manage&order=${search.order}").submit();	
	
	} else if (${search.menu eq 'manage'} && ${ empty search.order} && ${!empty search.category }){
		
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=manage&category=${search.category }").submit();	
		
	} else if ( ${search.menu eq 'manage'} && ${ empty search.order} && ${empty search.category } ){
		
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
	 
	 $( "td.ct_btn01:contains('검색')" ).on("click" , function() {
		 fncGetProductList(1);
	});
	 
	 $( ".ManageAsc:contains('낮은 가격 순')" ).on("click" , function() {
		 $(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?order=asc&menu=manage");
	});
	 
	 $( ".ManageDesc:contains('높은 가격 순')" ).on("click" , function() {
		 $(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?order=desc&menu=manage");
	});
	 
	 $( ".ManageCategoryAsc:contains('낮은 가격 순')" ).on("click" , function() {
		 $(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?order=asc&menu=manage&category=${search.category }");
	});
	 
	 $( ".ManageCategoryDesc:contains('높은 가격 순')" ).on("click" , function() {
		 $(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?order=desc&menu=manage&category=${search.category}");
	});
	 
	 $( ".SearchAsc:contains('낮은 가격 순')" ).on("click" , function() {
		 $(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?order=asc&menu=search");
	});
	 
	 $( ".SearchDesc:contains('높은 가격 순')" ).on("click" , function() {
		 $(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?order=desc&menu=search");
	});
	 
	 $( ".SearchCategoryAsc:contains('낮은 가격 순')" ).on("click" , function() {
		 $(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?order=asc&menu=search&category=${search.category}");
	});
	 
	 $( ".SearchCategoryDesc:contains('높은 가격 순')" ).on("click" , function() {
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

<jsp:include page="/layout/toolbar.jsp" />
	<div class="container">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
					거래현황관리
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
					<c:when test="${ !empty search.searchCondition }" >
						<td align="right">
						<select name="searchCondition" class="ct_input_g" style="width:80px">		
						<c:choose>				
							<c:when test="${search.searchCondition eq '0' }">
									<option value="0" selected>상품번호</option>
									<option value="1">상품명</option>
									<option value="2">상품가격</option>
							</c:when>
							<c:when test="${search.searchCondition eq '1' }">
									<option value="0">상품번호</option>
									<option value="1" selected>상품명</option>
									<option value="2">상품가격</option>
							</c:when>
							<c:when test="${search.searchCondition eq '2' }">
									<option value="0">상품번호</option>
									<option value="1">상품명</option>
									<option value="2" selected>상품가격</option>
							</c:when>
							<c:otherwise>
								<option value="0">상품번호</option>
								<option value="1">상품명</option>
								<option value="2">상품가격</option>					
							</c:otherwise>
							</c:choose>	
							</select>	
						<c:choose>
							<c:when test="${ empty search.searchCondition}">
								<input type="text" name="searchKeyword" class="ct_input_g" style="width:200px; height:19px" >
							</c:when>
							<c:when test="${ !empty search.searchCondition }">
							<input 	type="text" name="searchKeyword"  value="${search.searchKeyword}" 
										class="ct_input_g" style="width:200px; height:19px" >
							</c:when>
						</c:choose>
					</c:when>		
					<c:otherwise>
						<td align="right">
						<select name="searchCondition" class="ct_input_g" style="width:80px">
							<option value="0">상품번호</option>
							<option value="1">상품명</option>
							<option value="2">상품가격</option>
						</select>
						<input type="text" name="searchKeyword" class="ct_input_g" style="width:200px; height:19px" >
						</td>			
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
						검색
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
		<td colspan="11" >전체  ${ resultPage.totalCount} 건수, 현재 ${resultPage.currentPage } 페이지 
	<!-- 	<c:choose>
			<c:when test="${search.getMenu() eq 'manage' || user.getRole() eq 'admin'}">
				<c:choose>
					<c:when test="${empty search.getCategory() }">
						<span class = "ManageAsc">낮은 가격 순</span>
						<span class="ManageDesc">높은 가격 순</span>		   
					</c:when>
					<c:otherwise>
						<span class="ManageCategoryAsc">낮은 가격 순</span>
						<span class="ManageCategoryDesc">높은 가격 순</span>
					</c:otherwise>
				</c:choose>			
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${empty search.getCategory() }">
						<span class="SearchAsc">낮은 가격 순</span>
						<span class="SearchDesc">높은 가격 순</span>
					</c:when>
				    <c:otherwise>
				    	<span class="SearchCategoryAsc">낮은 가격 순</span>
						<span class="SearchCategoryDesc">높은 가격 순</span>			    
				    </c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose> -->
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">상품명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">카테고리</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">가격</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">등록일</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">상품현황</td>		
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>

	<c:set var="i" value="0" />
	<c:forEach var="transaction" items="${transaction}">
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
		<td align="center">${ i }</td>
		<td></td>
		<td align="left">
				<span class="ManageGetProduct">${transaction.product.prodName}<span class="prodNoNoDisplay">,${ transaction.product.prodNo }</span></span>
		</td>
		<td></td>
		<td align="left">${transaction.product.category }</td> 
		<td></td>
		<td align="left">${transaction.product.price } 원</td> 
		<td></td>
		<td align="left">${transaction.product.regDate }</td>
		<td></td>	
		<td align="left">

        <c:choose>
            <c:when test="${transaction.purchase.tranCode eq '2'}">
                구매완료 <span class="delivery">배송하기<span class="prodNoNoDisplay">,${ transaction.product.prodNo },${ transaction.tranNo }</span></span>     
                <span class="purchaseDetail">구매상세보기<span class="prodNoNoDisplay">,${ transaction.tranNo  }</span></span>        
            </c:when>
            <c:when test="${transaction.purchase.tranCode eq '3'}">
                배송중
                <span class="purchaseDetail">구매상세보기<span class="prodNoNoDisplay">,${ transaction.tranNo  }</span></span>
            </c:when>
            <c:otherwise>
                배송완료
                <span class="purchaseDetail">구매상세보기<span class="prodNoNoDisplay">,${ transaction.tranNo  }</span></span>
            </c:otherwise>
        </c:choose>


 		
			</td>		
	</tr>
	<tr>
	<td id="${transaction.product.prodNo}" colspan="11" bgcolor="D6D7D6" height="1"></td>
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
<!--  페이지 Navigator 끝 -->

</form>

</div>
</body>
</html>
