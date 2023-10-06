<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
<title>��ٱ���</title>

<style>
  
  body {
            padding-top : 60px;
        }


</style>

	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
	 
	 $( "td.ct_btn01:contains('�˻�')" ).on("click" , function() {
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
				self.location = "/product/getProduct?prodNo="+encodedProdNo+"&menu=cart"
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
	
			self.location = "/product/deleteCart?prodNo="+encodedProdNo+"&userId="+encodedUserId+""
	});
	 
});
</script>
</head>

<body bgcolor="#ffffff" text="#000000">
<jsp:include page="/layout/toolbar.jsp" />
<div class="container">

<div class="page-header">
	       <h3 class=" text-info">��ٱ���</h3>
</div>
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
	    	
		</div>

	<c:set var="i" value="0" />
	<c:forEach var="cart" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<div class="row">
				  <div class="col-sm-6 col-md-4">
				    <div class="thumbnail">
				      		<c:choose>
							    <c:when test="${ ! empty cart.cartProd.fileName}">
							        <c:forEach var="fileName" items="${fn:split(cart.cartProd.fileName, ',')}">
							            <img src="<c:url value='/images/${fileName}'/>" width="300px" height="300px"/>
							        </c:forEach>
							    </c:when>
							    <c:otherwise>
							        �̹��� ����
							    </c:otherwise>
							</c:choose>
				      <div class="caption">
				        <h3>${cart.cartProd.prodName}</h3>
				        <p>ī�װ� : ${cart.cartProd.category } ���� : ${cart.cartProd.price} �� ( ��� : ${cart.cartProd.item} ��) </p>
				        <p>����� : ${cart.cartProd.regDate }</p>
				        <a href="#" class="btn btn-primary" role="button"><span class="CartName">��ǰ��ȸ<span class="hidden">,${ cart.cartProd.prodNo }</span></span></a> 
					    <a href="#" class="btn btn-default" role="button"><span class="deleteCart">�����ϱ�<span class="hidden">,${ cart.cartProd.prodNo },${cart.userId }</span></span></a>		 
					        <c:choose>
					            <c:when test="${cart.cartProd.item > '0'}">
					            	�Ǹ���
					            </c:when>
					            <c:otherwise>
					                ������
					            </c:otherwise>
					        </c:choose>

				      </div>
				    </div>
				  </div>
				</div>
	</c:forEach>

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
</div>
</body>
</html>
