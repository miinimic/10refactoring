<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<head>
<title>상품 목록조회</title>

<style>
  body {
            padding-top : 60px;
        }
 .thumbnail{
 			height : 500px; }

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
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">


function fncGetProductList(currentPage) { 
	
	var searchCondition = $("select[name='searchCondition']").val();

	if( searchCondition == '2'){ 

		var result = '';
		$('input[name=searchKeyword]').map(function() {

		    result += $(this).val()+",";
		});
		
		var keywordArray = result.split(",");

		// 첫 번째 값과 두 번째 값을 추출		
		var firstValue = parseInt(keywordArray[0]);
		var secondValue = parseInt(keywordArray[1]);
		
		if(firstValue > secondValue ) {
			alert("더 작은 수를 첫번째 칸에 입력해주세요!");
			var check = 1;

		} else {
			// 마지막 값에는 ','를 붙이지 않음
			$('input[name=searchKeyword]').val(result.slice(0, -1));
		}
	
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
		
		if(searchCondition == '2' && check == '1'){
			location.reload();
		}else {
		
		var encodeSearchKeyword = $("input[name='searchKeyword']").val();

		var searchKeyword = encodeURIComponent(encodeSearchKeyword);
		
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=manage&searchCondition="+searchCondition+"&searchKeyword="+searchKeyword).submit();	
		}
	} else if ( ${! search.menu eq 'manage'} && ${ ! empty search.order} && ${ ! empty search.category} ){
		
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=search&order=${search.order }&category=${search.category}").submit();	
				
	} else if( ${! search.menu eq 'manage'} && ${ ! empty search.order} && ${ empty search.category} ){
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=search&order=${search.order  }").submit();
	} else if(${search.menu eq 'search'} && ${ empty search.order} && ${ ! empty search.category}) {
		

		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=search&category=${search.category }").submit();


	} else if( ${search.menu eq 'search'} && ${ empty search.order} && ${ empty search.category} ){
		
		if(searchCondition == '2' && check == '1'){
			location.reload();
		}else {
		
		var encodeSearchKeyword = $("input[name='searchKeyword']").val();

		var searchKeyword = encodeURIComponent(encodeSearchKeyword);
		
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=search&searchCondition="+searchCondition+"&searchKeyword="+searchKeyword).submit();
	}
		

		
	} else if( ${ search.menu eq 'logout'} ) {

		if(searchCondition == '2' && check == '1'){
			location.reload();
		}else {
		
		var encodeSearchKeyword = $("input[name='searchKeyword']").val();

		var searchKeyword = encodeURIComponent(encodeSearchKeyword);
		
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=logout&searchCondition="+searchCondition+"&searchKeyword="+searchKeyword).submit();	
	}
		
}
}
	$(function() {
	 
	 $( "#searchButton" ).on("click" , function() {
		 
		 fncGetProductList(1);
	});
	 
	 $( "#ManageAsc" ).on("click" , function() {
		 self.location = "/product/listProduct?order=asc&menu=manage"
		 
	});
	 
	 $( "#ManageDesc" ).on("click" , function() {
		 self.location = "/product/listProduct?order=desc&menu=manage"
	});
	 
	 $( "#ManageCategoryAsc" ).on("click" , function() {
		 self.location = "/product/listProduct?order=asc&menu=manage&category=${search.category }"
	 });
	 
	 $( "#ManageCategoryDesc" ).on("click" , function() {
		 self.location = "/product/listProduct?order=desc&menu=manage&category=${search.category}"
	 });
	 
	 $( "#SearchAsc" ).on("click" , function() {
		 self.location = "/product/listProduct?order=asc&menu=search"
	});
	 
	 $( "#SearchDesc" ).on("click" , function() {
		 self.location = "/product/listProduct?order=desc&menu=search"
	});
	 
	 $( "#SearchCategoryAsc" ).on("click" , function() {
		 self.location = "/product/listProduct?order=asc&menu=search&category=${search.category}"
	 });
	 
	 $( "#SearchCategoryDesc" ).on("click" , function() {
		 self.location = "/product/listProduct?order=desc&menu=search&category=${search.category }"
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
			self.location = "/product/getProduct?prodNo="+encodedProdNo+"&menu=search"
			
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
		//self.location = "/product/deleteProduct?currentPage=${resultPage.currentPage}&prodNo="+encodedProdNo+"&menu=manage"	
				
		$.ajax( 
				{
					url : "/product/json/deleteProduct/"+prodNo+"" ,
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
							alert("삭제가 완료되었습니다.");
							location.reload();

						}else{
							alert("삭제 오류");
							location.reload();
						}

					}
			});		
				
				
				
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
		    
		 var prodNo1 = data[1];
		 var userId1 = data[2];

		var prodNo = encodeURIComponent(prodNo1);
		var userId = encodeURIComponent(userId1);
		
		//self.location = "/product/addCart?prodNo="+encodedProdNo+"&userId="+encodeduserId+""	
		
		$.ajax( 
				{
					url : "/product/json/addCart/"+prodNo+"/"+userId+"" ,
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
							alert("장바구니에 담았습니다.");
							location.reload();

						}else{
							alert("장바구니 담기 오류");
							location.reload();
						}

					}
			});
		
				
	});
	
	$( ".GoCart" ).on("click" , function() {	
		self.location = "/purchase/listCart"	
	});
	
});
	
	$(function() {
		
		$( "#chicken" ).on("click" , function() {
			self.location = "/product/listProduct?category=chicken"
		});
		
		$( "#beef" ).on("click" , function() {
			self.location = "/product/listProduct?category=beef"
		});
		
		$( "#pork" ).on("click" , function() {
			self.location = "/product/listProduct?category=pork"
		});
		
		$( "#egg" ).on("click" , function() {
			self.location = "/product/listProduct?category=egg"
		});
		
		$( "#seafood" ).on("click" , function() {
			self.location = "/product/listProduct?category=seafood"
		});
		
		$( "#vegan" ).on("click" , function() {
			self.location = "/product/listProduct?category=vegan"
		});
});	
	

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
});

</script>
</head>

<body bgcolor="#ffffff" text="#000000">
<jsp:include page="/layout/toolbar.jsp" />
<div class="container">
<!-- 
<c:choose>
	<c:when test="${search.menu eq 'manage' }">
		<c:choose>
			<c:when test="${! empty search.order }">
				<c:choose>
					<c:when test="${ !empty search.category }">
						<form name="detailForm" action="/product/listProduct?menu=manage&order=${search.order }&category=${search.category}" method="post">					
					</c:when>
					<c:otherwise>
						<form name="detailForm" action="/product/listProduct?menu=manage&order=${search.order }" method="post">
					</c:otherwise>			
				</c:choose>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${! empty search.category }">
						<form name="detailForm" action="/product/listProduct?menu=manage&category=${search.category}" method="post">
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
				<c:when test="${!empty search.order }">
					<c:choose>
						<c:when test="${! empty search.category }">
							<form name="detailForm" action="/product/listProduct?menu=search&order=${search.order }&category=${search.category}" method="post">
						</c:when>
						<c:otherwise>
							<form name="detailForm" action="/product/listProduct?menu=search&order=${search.order }" method="post">
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${! empty search.category }">
							<form name="detailForm" action="/product/listProduct?menu=search&category=${search.category}" method="post">
						</c:when>
						<c:otherwise>
							<form name="detailForm" action="/product/listProduct?menu=search" method="post">
						</c:otherwise>	
					</c:choose>
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>		 -->	

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
				
					<form class="form-inline"></form>
				
		    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			  <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
					<c:choose>
						<c:when test="${search.menu eq 'manage' || user.role eq 'admin' }" >
							<c:choose>
								<c:when test="${ !empty search.searchCondition}" >
									<select name="searchCondition" class="form-control" style="width:120px" id="optionSelect">		
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
										</c:choose>	
										</select>	
							</c:when>		
							<c:otherwise>
						<select name="searchCondition" class="form-control" style="width:120px" id="optionSelect">
							<option value="0">상품번호</option>
							<option value="1">상품명</option>
							<option value="2">가격범위</option>
						</select>		
					</c:otherwise>	
				</c:choose>
		</c:when>
		<c:otherwise>
			<c:choose>
					<c:when test="${ !empty search.searchCondition }" >
						<select name="searchCondition" class="form-control" style="width:120px" id="optionSelect">		
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
					</c:when>		
					<c:otherwise>
						<select name="searchCondition" class="form-control" style="width:120px" id="optionSelect">
							<option value="1">상품명</option>
							<option value="2">가격범위</option>
						</select>		
					</c:otherwise>	
				</c:choose>
		</c:otherwise>
	</c:choose>
	</div>
				  
<div class="form-group">				
<c:choose>
<c:when test="${search.menu eq 'manage' || user.role eq 'admin' }" >
			<c:choose>
					<c:when test="${ !empty search.searchCondition && search.searchCondition ne '2'}">
							<input 	type="text" name="searchKeyword"  class="form-control" value="${search.searchKeyword}" 
										id="searchBox" style="width:200px; height:34px">
							<div id="textInput" style="display: none; ">
							      부터  <input type="text" class="form-control" style="width:200px; height:34px" id="searchBox" name="searchKeyword" > 까지
							    	</div>			
					</c:when>
					<c:when test="${ !empty search.searchCondition && search.searchCondition eq '2'}">
							<input 	type="text" class="form-control" name="searchKeyword"  value="${search.from}" 
										style="width:200px; height:34px" id="searchBox">
							<div id="textInput">
							      부터  <input type="text" class="form-control" style="width:200px; height:34px" id="searchBox" name="searchKeyword" value="${search.to}"> 까지
							    	</div>
					</c:when>
					<c:otherwise>
						<input type="text" class="form-control" name="searchKeyword" style="width:200px; height:34px" id="searchBox" >
						<div id="textInput" style="display: none;">
							      부터 <input style="width:200px; height:34px" type="text" class="form-control" id="searchBox" name="searchKeyword"> 까지
							    	</div>		
					</c:otherwise>

			</c:choose>
</c:when>
<c:otherwise>
	<c:choose>

					<c:when test="${ !empty search.searchCondition && search.searchCondition ne '2'}">
							<input 	type="text" class="form-control" name="searchKeyword"  value="${search.searchKeyword}" 
										style="width:200px; height:34px"  id="searchBox">
							<div id="textInput" style="display: none; ">
							      부터  <input type="text" class="form-control" style="width:200px; height:34px" id="searchBox" name="searchKeyword"> 까지
							    	</div>
					</c:when>
					<c:when test="${ !empty search.searchCondition && search.searchCondition eq '2'}">
							<input 	type="text" class="form-control" name="searchKeyword"  value="${search.from}" 
										style="width:200px; height:34px" id="searchBox">
										<div id="textInput">
							       부터 <input type="text" style="width:200px; height:34px" class="form-control" id="searchBox" name="searchKeyword" value="${search.to}" > 까지
							    	</div>
					</c:when>		
					<c:otherwise>
						<input type="text" class="form-control" name="searchKeyword" style="width:200px; height:34px" id="searchBox" >
						<div id="textInput" style="display: none; ">
							       부터 <input type="text" style="width:200px; height:34px" class="form-control" id="searchBox" name="searchKeyword"> 까지
					</div>		
					</c:otherwise>	
				</c:choose>
				</c:otherwise>
				</c:choose>
			  </div>
				  
				  <button type="button" class="btn btn-default" id="searchButton">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
		</form>
			
</div>
</div>
<c:choose>
<c:when test="${ ! empty user }">
<form class="form-inline">
<div class="form-group">
<div class="btn-group" role="group" >
	  <button type="button" class="btn btn-default" id="chicken">chicken</button>
	  <button type="button" class="btn btn-default" id="beef">beef</button>
	  <button type="button" class="btn btn-default" id="pork">pork</button>
	  <button type="button" class="btn btn-default" id="egg">egg</button>
	  <button type="button" class="btn btn-default" id="seafood">seafood</button>
	  <button type="button" class="btn btn-default" id="vegan">vegan</button>
</div>
</div>

<div class="form-group">

<c:choose>
			<c:when test="${ ! empty category }">
			${search.category } 개수  ${ category } 개
			</c:when>	
</c:choose>
<c:choose>
			<c:when test="${search.menu eq 'manage' || user.role eq 'admin'}">
				<c:choose>
					<c:when test="${empty search.category }">
						<a href="#" class="btn btn-default btn" id="ManageAsc" role="button">낮은 가격 순</a>
						<a href="#" class="btn btn-default btn" id="ManageDesc" role="button">높은 가격 순</a>	   
					</c:when>
					<c:otherwise>
						<a href="#" class="btn btn-default btn" id="ManageCategoryAsc" role="button">낮은 가격 순</a>
						<a href="#" class="btn btn-default btn" id="ManageCategoryDesc" role="button">높은 가격 순</a>
					</c:otherwise>
				</c:choose>			
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${empty search.category }">
						<a href="#" class="btn btn-default btn" id="SearchAsc" role="button">낮은 가격 순</a>
						<a href="#" class="btn btn-default btn" id="SearchDesc" role="button">높은 가격 순</a>
					</c:when>
				    <c:otherwise> 
				    	<a href="#"  class="btn btn-default btn" id="SearchCategoryAsc" role="button">낮은 가격 순</a>
						<a href="#" class="btn btn-default btn" id="SearchCategoryDesc" role="button">높은 가격 순</a>			    
				    </c:otherwise>
				</c:choose>
			</c:otherwise>
</c:choose>
</div>
</form>
</c:when>
</c:choose>
<form class="form-inline">
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
			<div class="form-group">	
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
				      <div class="caption" >
				        <h3>${product.prodName}</h3>
				        <p>카테고리 : ${product.category } 가격 : ${product.price } ( 재고 : ${product.item} 개) </p>
				        <p>등록일 : ${product.regDate }</p>
				        <p><a href="#" class="btn btn-primary" role="button"><span class="ManageProduct">상품수정<span class="hidden">,${ product.prodNo }</span></span></a> 
				      

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
   
				      </div>
				    </div>
				</div>
			</c:when>
			<c:when test="${search.menu eq 'search' && empty product.proTranCode }">		
			<div class="form-group">	
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
				        <a href="#" class="btn btn-primary" role="button"><span class="SearchProduct">상품조회<span class="hidden">,${ product.prodNo }</span></span></a>

					        <c:choose>
					            <c:when test="${product.item > '0'}">
					            <c:choose>
					            	<c:when test="${product.cartNo == '0' }">
					               <a class="btn btn-default" role="button"><span class="PutCart">장바구니에 넣기<span class="hidden">,${ product.prodNo },${user.userId }</span></span></a>		                  	
					            	</c:when>
					            	<c:otherwise>
					            		<a class="btn btn-default" role="button"><span class="GoCart">장바구니 확인하기</span></a>
					            	</c:otherwise>
					            </c:choose>
					            	판매중
					            </c:when>
					            <c:otherwise>
					                재고없음
					            </c:otherwise>
					        </c:choose>

				      </div>
				    </div>
				</div>
			</c:when>
			<c:when test="${search.menu eq 'manage' && ! empty product.proTranCode  || user.role eq 'admin' && ! empty product.proTranCode }" >
			<div class="form-group">
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
				        <p><a href="#" class="btn btn-primary" role="button"><span class="ManageGetProduct">상품조회<span class="hidden">,${ product.prodNo }</span></span></a> 

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
				      </div>
				    </div>
				</div>
			</c:when>
			<c:otherwise>
			<div class="form-group">
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
				      <div class="caption" > 
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
			</c:otherwise>
		</c:choose>
	
	</c:forEach>
</form>
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
