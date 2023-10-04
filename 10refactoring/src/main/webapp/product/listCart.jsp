<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
<title>장바구니</title>

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

function fncGetCartList(currentPage) { 
	
	$("#currentPage").val(currentPage)
	$("form").attr("method" , "POST").attr("action" , "/product/listCart").submit();
	
}

$(function() {
	 
	 $( "td.ct_btn01:contains('검색')" ).on("click" , function() {
		 $(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?order=asc&menu=manage");
	});
	 
	$( ".CartName" ).on("click" , function() {

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
				$(window.parent.frames["rightFrame"].document.location).attr("href","/product/getProduct?prodNo="+encodedProdNo+"&menu=cart");
				
		});

	$( ".deleteCart" ).on("click" , function() {

		var string = $(this).text().trim();

		var lines = string.split(",");
		var data = [];

		for (var i = 0; i < lines.length; i++) {
		    var fields = lines[i].split(",");
		    data.push(fields);
		}

		//  alert(data[1]);
		//  alert(data[2]);
		    
		 var prodNo = data[1];
		 var userId = data[2];

		var encodedProdNo = encodeURIComponent(prodNo);
		var encodedUserId = encodeURIComponent(userId);
		
			$(window.parent.frames["rightFrame"].document.location).attr("href","/product/deleteCart?prodNo="+encodedProdNo+"&userId="+encodedUserId+"");
			
	});
	 
});
</script>
</head>

<body bgcolor="#ffffff" text="#000000">
<jsp:include page="/layout/toolbar.jsp" />
<div class="container">

<form name="detailForm" action="/listCart" method="post">
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
						장바구니
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
		<td colspan="11" >전체  ${ resultPage.totalCount } 건수, 현재 ${resultPage.currentPage } 페이지 
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
		<td class="ct_list_b">삭제하기</td>	
		<td class="ct_line02"></td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>

	<c:set var="i" value="0" />
	<c:forEach var="cart" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
		<td align="center">${ i }</td>
		<td></td>
		<td align="left">				
		<span class="CartName">${cart.cartProd.prodName}<span class="prodNoNoDisplay">,${ cart.cartProd.prodNo }</span></span>
		</td>
		<td></td>
		<td align="left">${cart.cartProd.category }</td> 
		<td></td>
		<td align="left">${cart.cartProd.price} 원 ( 재고 : ${cart.cartProd.item} 개)</td> 
		<td></td>
		<td align="left">${cart.cartProd.regDate }</td>
		<td></td>	
		<td align="left">
		<span class="deleteCart">삭제하기<span class="prodNoNoDisplay">,${ cart.cartProd.prodNo },${cart.userId }</span></span>
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
<!--  페이지 Navigator 끝 -->

</form>

</div>
</body>
</html>
