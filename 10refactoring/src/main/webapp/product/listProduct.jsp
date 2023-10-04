<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<html>
<head>
<title>상품 목록조회</title>

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
	
	var searchCondition=$("input[name='searchCondition']").val();

	if( searchCondition == '2'){
		alert("22");
		var result = '';
		$('input[name=searchKeyword]').map(function() {

		    result += $(this).val()+",";
		});
		
		var keywordArray = result.split(",");

		// 첫 번째 값과 두 번째 값을 추출
		var firstValue = keywordArray[0];
		var secondValue = keywordArray[1];
		
		alert(firstValue);
		alert(secondValue);
		
		if(firstValue > secondValue ) {
			alert("더 작은 수를 첫번째 칸에 입력해주세요!")
		}
		
		// 마지막 값에는 ','를 붙이지 않음
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

	$(function() {
	 
	 $( "#searchButton" ).on("click" , function() {
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
			self.location = "/product/updateProductView?prodNo="+encodedProdNo+""
			
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
	

			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
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
				 
					self.location = "/product/getProduct?prodNo="+encodedProdNo+""
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
			self.location = "/product/deleteProduct?currentPage=${resultPage.currentPage}&prodNo="+encodedProdNo+"&menu=manage"	
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
	
/*
$(document).ready(function () {	
	$("#searchBox").autocomplete({
		source: function (request, response) {
			
			var searchKeyword = $("#searchBox").val(); // 검색어 가져오기
            var searchCondition = $("select[name='searchCondition']").val(); // 검색 조건 가져오기
            
         //  alert(searchKeyword);
         //  alert(searchCondition);
            
		    $.ajax({
		        url: "/product/json/listProductAuto/" + searchCondition + "/"+searchKeyword ,
		        method: "GET",
		        dataType: "json",
		        headers: {
		            "Accept": "application/json",
		            "Content-Type": "application/json"
		        },
		        success: function (JSONData, status) {
		            console.log(status);
		            console.log(JSONData);

		            // 여기서 서버 응답 데이터를 가공하여 사용자 목록으로 변환해야 합니다.
		            var productList = [];
				
		            if(searchCondition == '0'){
		            for (var i = 0; i < JSONData.length; i++) {
		                var product = JSONData[i];
		                productList.push({
		                    label: product.prodNo,
		                    value: product.prodNo, // 또는 사용자 설정값 설정
		                    test: product // 또는 다른 필요한 데이터 설정
		                });
		            }
		           } else if(searchCondition == '1'){
		        	   for (var i = 0; i < JSONData.length; i++) {
			                var product = JSONData[i];
			                productList.push({
			                    label: product.prodName,
			                    value: product.prodName, // 또는 사용자 설정값 설정
			                    test: product // 또는 다른 필요한 데이터 설정
			                });
			            }
		        	   
		           } else if(searchCondition == '2'){
		        	   for (var i = 0; i < JSONData.length; i++) {
			                var product = JSONData[i];
			                productList.push({
			                    label: product.price,
			                    value: product.price, // 또는 사용자 설정값 설정
			                    test: product // 또는 다른 필요한 데이터 설정
			                });
			            }
		        	   
		           }
		            
		            response(productList);
		        }
		    });
		},

	    focus: function (event, ui) {
	        return false;
	    },
	    select: function (event, ui) {
	    	console.log(ui.item.idx)
	    },
	    delay: 100,
	    autoFocus: true
	});
});*/


</script>
</head>

<body bgcolor="#ffffff" text="#000000">
<jsp:include page="/layout/toolbar.jsp" />
<div class="container">

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

					<c:choose>
						<c:when test="${search.menu eq 'manage' }" >
							<div class="page-header">
						       <h3 class=" text-info">상품 관리</h3>
						    </div>
						</c:when>
						<c:otherwise>
							<div class="page-header">
						       <h3 class=" text-info">상품 목록 조회</h3>
						    </div>
						</c:otherwise>
					</c:choose>
	<div style="white-space: nowrap;">				
	<c:choose>

		<c:when test="${search.menu eq 'manage' || user.role eq 'admin' }" >
			<c:choose>
					<c:when test="${ !empty search.searchCondition}" >

						<select name="searchCondition" class="ct_input_g" style="width:80px" id="optionSelect">		
						<c:choose>				
							<c:when test="${search.searchCondition eq '0' }">
									<option value="0" selected>상품번호</option>
									<option value="1">상품명</option>
									<option value="2">가격범위</option>
							</c:when>
							<c:when test="${search.searchCondition eq '1' }">
									<option value="0">상품번호</option>
									<option value="1" selected>상품명</option>
									<option value="2">가격범위</option>
							</c:when>
							<c:when test="${search.searchCondition eq '2' }">
									<option value="0">상품번호</option>
									<option value="1">상품명</option>
									<option value="2" selected>가격범위</option>
							</c:when>
							<c:otherwise>
								<option value="0">상품번호</option>
								<option value="1">상품명</option>
								<option value="2">가격범위</option>				
							</c:otherwise>
							</c:choose>	
							</select>	
						<c:choose>
							<c:when test="${ empty search.searchCondition }">
								<input type="text" name="searchKeyword" class="form-control" style="width:200px; height:19px" id="searchBox" >
								<div id="textInput" style="display: none;">
							       부터 <input type="text" class="form-control" name="searchKeyword"  id="searchBox"> 까지
							    	</div>
							</c:when>
							<c:when test="${ !empty search.searchCondition && search.searchCondition ne '2'}">
							<input 	type="text" name="searchKeyword"  class="form-control" value="${search.searchKeyword}" 
										class="ct_input_g" style="width:200px; height:19px" id="searchBox">
							<div id="textInput" style="display: none;">
							      부터  <input type="text" class="form-control" id="searchBox" name="searchKeyword"> 까지
							    	</div>
							</c:when>
							<c:when test="${ !empty search.searchCondition && search.searchCondition eq '2'}">
							<input 	type="text" class="form-control" name="searchKeyword"  value="${search.from}" 
										class="ct_input_g" style="width:200px; height:19px" id="searchBox">
							<div id="textInput">
							      부터  <input type="text" class="form-control" id="searchBox" name="searchKeyword" value="${search.to}"> 까지
							    	</div>
							</c:when>
						</c:choose>
					</c:when>		
					<c:otherwise>
						<select name="searchCondition" class="ct_input_g" style="width:80px" id="optionSelect">
							<option value="0">상품번호</option>
							<option value="1">상품명</option>
							<option value="2">가격범위</option>
						</select>
						<input type="text" class="form-control" name="searchKeyword" class="ct_input_g" style="width:200px; height:19px" id="searchBox">
						<div id="textInput" style="display: none;">
							      부터 <input type="text" class="form-control" id="searchBox" name="searchKeyword"> 까지
							    	</div>			
					</c:otherwise>	
				</c:choose>
		</c:when>
		<c:otherwise>
			<c:choose>
					<c:when test="${ !empty search.searchCondition }" >
						<select name="searchCondition" class="ct_input_g" style="width:80px" id="optionSelect">		
						<c:choose>				
							<c:when test="${search.searchCondition eq '1' }">
									<option value="1" selected>상품명</option>
									<option value="2">가격범위</option>
							</c:when>
							<c:when test="${search.searchCondition eq '2' }">
									<option value="1">상품명</option>
									<option value="2" selected>가격범위</option>
							</c:when>
							<c:otherwise>
								<option value="1">상품명</option>
								<option value="2">가격범위</option>				
							</c:otherwise>
							</c:choose>	
							</select>	
						<c:choose>
							<c:when test="${ empty search.searchCondition }">
								<input type="text" class="form-control" name="searchKeyword" class="ct_input_g" style="width:200px; height:19px" id="searchBox">
								<div id="textInput" style="display: none;">
							       부터 <input type="text" class="form-control" id="searchBox" name="searchKeyword"> 까지
							    	</div>
							</c:when>
							<c:when test="${ !empty search.searchCondition && search.searchCondition ne '2'}">
							<input 	type="text" class="form-control" name="searchKeyword"  value="${search.searchKeyword}" 
										class="ct_input_g" style="width:200px; height:19px" id="searchBox">
										<div id="textInput" style="display: none;">
							       부터 <input type="text" class="form-control" id="searchBox" name="searchKeyword"> 까지
							    	</div>
							</c:when>
							<c:when test="${ !empty search.searchCondition && search.searchCondition eq '2'}">
							<input 	type="text" class="form-control" name="searchKeyword"  value="${search.from}" 
										class="ct_input_g" style="width:200px; height:19px" id="searchBox">
										<div id="textInput">
							       부터 <input type="text" class="form-control" id="searchBox" name="searchKeyword" value="${search.to}" > 까지
							    	</div>
							</c:when>
						</c:choose>
					</c:when>		
					<c:otherwise>
					<div style="white-space: nowrap;">
						<select name="searchCondition" class="ct_input_g" style="width:80px; display: inline-block;" id="optionSelect">
							<option value="1">상품명</option>
							<option value="2">가격범위</option>
						</select>
						<input type="text" class="form-control" name="searchKeyword" class="ct_input_g" style="width:150px; height:19px; display: inline-block;" id="searchBox" >
						<div id="textInput" style="display: none; ">
							       부터 <input type="text" class="form-control" id="searchBox" style="width:150px; height:19px; display: inline-block;" name="searchKeyword"> 까지
							    	</div>	
					</div>		
					</c:otherwise>	
				</c:choose>
		</c:otherwise>
	</c:choose>

	<button type="button" class="btn btn-default" id="searchButton" style="display: inline-block;">검색</button>
</div>
<div>전체 상품 ${ resultPage.totalCount } 개, 현재 ${resultPage.currentPage } 페이지 

<c:choose>
			<c:when test="${ ! empty category }">
			${search.category } 개수  ${ category } 개
			</c:when>	
</c:choose>
<c:choose>
			<c:when test="${search.menu eq 'manage' || user.role eq 'admin'}">
				<c:choose>
					<c:when test="${empty search.category }">
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
					<c:when test="${empty search.category }">
						<span class="SearchAsc">낮은 가격 순</span>
						<span class="SearchDesc">높은 가격 순</span>
					</c:when>
				    <c:otherwise>
				    	<span class="SearchCategoryAsc">낮은 가격 순</span>
						<span class="SearchCategoryDesc">높은 가격 순</span>			    
				    </c:otherwise>
				</c:choose>
			</c:otherwise>
</c:choose>
</div>
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

		<c:choose>		
			<c:when test="${search.menu eq 'manage' && empty product.proTranCode  || user.role eq 'admin' && empty product.proTranCode  }" >			
				<div class="row">
				  <div class="col-sm-6 col-md-4">
				    <div class="thumbnail">
				      		<c:choose>
							    <c:when test="${ ! empty product.fileName}">
							        <c:forEach var="fileName" items="${fn:split(product.fileName, ',')}">
							            <img src="<c:url value='/images/${fileName}'/>" width="300px" height="300px"/>
							        </c:forEach>
							    </c:when>
							    <c:otherwise>
							        이미지 없음
							    </c:otherwise>
							</c:choose>
				      <div class="caption">
				        <h3>${product.prodName}</h3>
				        <p>카테고리 : ${product.category } 가격 : ${product.price } ( 재고 : ${product.item} 개) </p>
				        <p>등록일 : ${product.regDate }</p>
				        <p><a href="#" class="btn btn-primary" role="button"><span class="ManageProduct">상품수정<span class="hidden">,${ product.prodNo }</span></span></a> 
				      
				      
				      <c:choose>
					    <c:when test="${search.menu eq 'manage'}">
					        <c:choose>
					            <c:when test="${product.item > '0'}">
					                
					                <c:choose>
					                	<c:when test="${ product.cartNo == '0'}">
					                		<a class="btn btn-default" role="button"><span class="delete">삭제하기<span class="hidden">,${ product.prodNo }</span></span></a>
					                	</c:when>
					                	<c:otherwise>
					                	
					                	</c:otherwise>
					                </c:choose>
					                판매중               
					            </c:when>
					            <c:otherwise>
					               재고없음
					            </c:otherwise>
					        </c:choose>
					    </c:when>
					    
					    <c:otherwise>
					        <c:choose>
					            <c:when test="${product.item > '0'}">
					                판매중
					                		                  	
					            </c:when>
					            <c:otherwise>
					                재고없음
					            </c:otherwise>
					        </c:choose>
					    </c:otherwise>
					</c:choose>
   
				      </div>
				    </div>
				  </div>
				</div>
			</c:when>
			<c:when test="${search.menu eq 'search' && empty product.proTranCode }">		
				<span class="SearchProduct">${product.prodName}<span class="prodNoNoDisplay">,${ product.prodNo }</span></span>
			</c:when>
			<c:when test="${search.menu eq 'manage' && ! empty product.proTranCode  || user.role eq 'admin' && ! empty product.proTranCode }" >
				<span class="ManageGetProduct">${product.prodName}<span class="prodNoNoDisplay">,${ product.prodNo }</span></span>
			</c:when>
			<c:otherwise>
				<div class="row">
				  <div class="col-sm-6 col-md-4">
				    <div class="thumbnail">
				      		<c:choose>
							    <c:when test="${ ! empty product.fileName}">
							        <c:forEach var="fileName" items="${fn:split(product.fileName, ',')}">
							            <img src="<c:url value='/images/${fileName}'/>" width="300px" height="300px"/>
							        </c:forEach>
							    </c:when>
							    <c:otherwise>
							        이미지 없음
							    </c:otherwise>
							</c:choose>
				      <div class="caption">
				        <h3>${product.prodName}</h3>
				        <p>카테고리 : ${product.category } 가격 : ${product.price } ( 재고 : ${product.item} 개) </p>
				        <p>등록일 : ${product.regDate }</p>
				        <p><a href="#" class="btn btn-primary" role="button"><span class="GetProduct">상품조회<span class="hidden">,${ product.prodNo }</span></span></a> 				      
					        <c:choose>
					            <c:when test="${product.item > '0'}">
					                판매중				                		                  	
					            </c:when>
					            <c:otherwise>
					                재고없음
					            </c:otherwise>
					        </c:choose>
  
				      </div>
				    </div>
				  </div>
				</div>
			</c:otherwise>
		</c:choose>
	
	</c:forEach>

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

<script>

//select 요소와 input 요소를 가져옵니다.
var optionSelect = document.getElementById("optionSelect");
var textInput = document.getElementById("textInput");

//select 요소의 변경 이벤트를 감지하고 처리합니다.
optionSelect.addEventListener("change", function() {
  // 선택된 옵션의 값을 가져옵니다.
  var selectedOption = optionSelect.value;

  // 선택된 옵션에 따라 input 요소를 나타내거나 감춥니다.
  if (selectedOption === "2") {
      textInput.style.display = "block"; // 나타내기
  } else {
      textInput.style.display = "none"; // 감추기
  }
});

</script>
</body>
</html>
