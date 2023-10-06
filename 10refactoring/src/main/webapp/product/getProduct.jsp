<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>

<title>상품 상세 조회</title>
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
	<style>
 		body {
            padding-top : 60px;
        }
     </style>
<script type="text/javascript">
	
$(function() {
	 
	$( "#ok" ).on("click" , function() {

		self.location = "/product/listProduct?menu=manage"
	});
	
	$( "#buy" ).on("click" , function() {
		self.location = "/purchase/addPurchaseView?prodNo=${product.prodNo}&userId=${user.userId}"
	});
	
	$( "#back" ).on("click" , function() {
		history.go(-1)
	});
});

</script>

</head>

<body bgcolor="#ffffff" text="#000000">
<jsp:include page="/layout/toolbar.jsp" />
<div class="container">
<div class="page-header">
	       <h3 class=" text-info">상품상세조회</h3>
</div>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상 품 번 호 </strong></div>
			<div class="col-xs-8 col-md-4">${ product.prodNo}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상 품 명 </strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName }</div>
		</div>
				<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>카 테 고 리 </strong></div>
			<div class="col-xs-8 col-md-4">${product.category }</div>
		</div>
						<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>개 수</strong></div>
			<div class="col-xs-8 col-md-4">${product.item }&nbsp;개</div>
		</div>
								<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품 이미지</strong></div>
			<div class="col-xs-8 col-md-4">		
			<c:choose>
		    <c:when test="${ ! empty product.fileName}">
		        <c:forEach var="fileName" items="${fn:split(product.fileName, ',')}">
		            <img src="<c:url value='/images/${fileName}'/>" width="300px" height="300px"/>
		        </c:forEach>
		    </c:when>
		    <c:otherwise>
		        이미지 없음
		    </c:otherwise>
		</c:choose></div>
		</div>
								<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품 상세정보</strong></div>
			<div class="col-xs-8 col-md-4">${ product.prodDetail}</div>
		</div>
										<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>제 조 일 자</strong></div>
			<div class="col-xs-8 col-md-4">${product.manuDate }</div>
		</div>
										<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>가 격</strong></div>
			<div class="col-xs-8 col-md-4">${product.price } &nbsp;원</div>
		</div>
												<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>등 록 일 자</strong></div>
			<div class="col-xs-8 col-md-4">${product.regDate}</div>
		</div>
														<hr/>
		<div class="row">
			<div class="col-md-12 text-center ">
			<c:choose>
				<c:when test="${!empty user.userId}">
					<c:choose>
					<c:when test="${ search.menu eq 'purchase' ||  search.menu eq 'manage' || product.item == '0'}">
						<c:choose>
							<c:when test="${ search.menu eq 'manage' }">
								<button type="button" class="btn btn-default" id="ok">확인</button>
							</c:when>
							<c:when test="${ search.menu eq 'cart' }">
								<button type="button" class="btn btn-primary" id="buy">구매</button>
								<button type="button" class="btn btn-default" id="back">이전</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-default" id="back">이전</button>
							</c:otherwise>
						</c:choose>	
					</c:when>
					<c:otherwise>			
							<button type="button" class="btn btn-primary" id="buy">구매</button>
							<button type="button" class="btn btn-default" id="back">이전</button>	
					</c:otherwise>
					
					</c:choose>
						
				</c:when>
				<c:otherwise>
							<button type="button" class="btn btn-default" id="back">이전</button>
				</c:otherwise>
				</c:choose>		
			
			
			</div>
		</div>
</div>
</body>
</html>