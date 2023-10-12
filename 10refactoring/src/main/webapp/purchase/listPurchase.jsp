<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>구매 목록조회</title>
<style>


  .thumbnail{
 			height : 500px;
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
	
<script type="text/javascript">

function fncGetPurchaseList(currentPage) {
	$("#currentPage").val(currentPage)
	$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();
}

$(function() {
	 $( "#addReview" ).on("click" , function() {
		 $("form").attr("method" , "POST").attr("action" , "/purchase/addReview?tranNo=${purchase.purchase.tranNo }").submit();
	});
});	

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
			//$(window.parent.frames["rightFrame"].document.location).attr("href","/product/getProduct?menu=purchase&prodNo="+encodedProdNo+"");
			self.location = "/product/getProduct?menu=purchase&prodNo="+encodedProdNo+"";	
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
		    
		 var tranNo1 = data[1];

		var tranNo = encodeURIComponent(tranNo1);
			//self.location = "/purchase/updateTranCode?tranNo="+encodedTranNo+"&menu=purchase&tranCode=4&currentPage=${resultPage.currentPage}";	
	
	
			$.ajax( 
					{
						url : "/purchase/json/updateTranCode/"+tranNo+"/4" ,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData , status) {

							//Debug...
							//alert(status);
							//Debug...
							//alert("JSONData : \n"+JSONData);
							
							var jsonString = JSON.stringify(JSONData);
							console.log(jsonString);
							
							if(jsonString === "true"){
								location.reload();

							}else{
								alert("updateTranCode 오류");
								location.reload();
							}
						

						}
				});	
	
	
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
		    
		 var tranNo1 = data[1];

		var tranNo = encodeURIComponent(tranNo1);
			//self.location = "/purchase/updateTranCode?tranNo="+encodedTranNo+"&menu=purchase&tranCode=5&currentPage=${resultPage.currentPage}";	
	
			$.ajax( 
					{
						url : "/purchase/json/updateTranCode/"+tranNo+"/5" ,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData , status) {

							//Debug...
							//alert(status);
							//Debug...
							//alert("JSONData : \n"+JSONData);
							
							var jsonString = JSON.stringify(JSONData);
							console.log(jsonString);
							
							if(jsonString === "true"){
								location.reload();

							}else{
								alert("updateTranCode 오류");
								location.reload();
							}
						

						}
				});	
	
	
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
		
		//$(window.parent.frames["rightFrame"].document.location).attr("href","/purchase/addReviewView?tranNo="+encodedTranNo+"&prodNo="+encodedProdNo+"&tranCode=6");
		self.location = "/purchase/addReviewView?tranNo="+encodedTranNo+"&prodNo="+encodedProdNo+"&tranCode=6";	
	});
		
	$( ".Review" ).on("click" , function() {
		//$(window.parent.frames["rightFrame"].document.location).attr("href","/purchase/listReview");
		self.location = "/purchase/listReview";
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
			self.location = "/purchase/getPurchase?tranNo="+encodedTranNo+"&menu=user";
	});
	
});
</script>
</head>
<body bgcolor="#ffffff" text="#000000">
<jsp:include page="/layout/toolbar.jsp" />
<div class="container">



							<div class="page-header">
						       <h3 class=" text-info">주문 내역 조회</h3>
						    </div>
						    
						    <div class="row">
						    	 <div class="col-md-6 text-left">
						    	<p class="text-primary">
						    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
						    	</p>
		    					</div>
						    </div>
<form class="form-inline">					    
<c:set var="i" value="0" />
	<c:forEach var="transaction" items="${transaction}">
		<c:set var="i" value="${ i+1 }" />			
			<div class="form-group">	
				    <div class="thumbnail">
				      		<c:choose>
							    <c:when test="${ ! empty transaction.product.fileName}">
							        <c:forEach var="fileName" items="${fn:split(transaction.product.fileName, ',')}">
							            <img src="<c:url value='/images/${fileName}'/>" width="300px" height="300px"/>
							        </c:forEach>
							    </c:when>
							    <c:otherwise>
							        이미지 없음
							    </c:otherwise>
							</c:choose>
				      <div class="caption" >
				        <h3>${transaction.product.prodName}</h3>
				        <p> <c:choose>
							<c:when test="${transaction.purchase.tranCode eq '2'}" > 
								배송 준비 중
							</c:when>
							<c:when test="${ transaction.purchase.tranCode eq '3' }">
								배송중
							</c:when>
							<c:when test="${ transaction.purchase.tranCode eq '4' || transaction.purchase.tranCode eq '5' || transaction.purchase.tranCode eq '6'}">
								배송완료
							</c:when>
							<c:otherwise>
								
							</c:otherwise>
						</c:choose> </p>
				        <p>		<c:choose>
									<c:when test="${transaction.purchase.tranCode eq '3' }">
										<a href="#" class="btn btn-primary" role="button"><span class="arrival">상품도착<span class="hidden">,${ transaction.tranNo }</span></span></a>	
									</c:when>
									<c:when test="${transaction.purchase.tranCode eq '4'}">
									<a href="#" class="btn btn-primary" role="button"><span class="confirm">구매확정<span class="hidden">,${ transaction.tranNo }</span></span></a>
									</c:when>
									<c:when test="${transaction.purchase.tranCode eq '5'}">
										<a href="#" class="btn btn-primary" role="button"><span class="addReview">후기쓰기<span class="hidden">,${ transaction.tranNo},${  transaction.product.prodNo}</span></span></a> 
								</c:when>
									<c:when test="${ transaction.purchase.tranCode eq '6'}">
									<span class="Review">후기 작성 완료</span>
						
												
									</c:when>
									<c:otherwise>
									
									</c:otherwise>
								</c:choose></p>
				        <p><a href="#" class="btn btn-default" role="button"><span class="detail">주문내역 상세보기<span class="hidden">,${ transaction.tranNo }</span></span></a>    
				      		<a href="#" class="btn btn-default" role="button"><span class="prodName">상품 상세보기<span class="hidden">,${ transaction.product.prodNo }</span></span></a>   
				      	</p>	
				      </div>
				    </div>
				</div>	
			</c:forEach>		    				    

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