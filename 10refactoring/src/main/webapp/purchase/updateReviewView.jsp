<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>후기 수정</title>
<style>

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
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<script type="text/javascript">


$(function() {
	 $( "#updateReview" ).on("click" , function() {
		  
		 $("form").attr("method" , "POST").attr("action" , "/purchase/updateReview?tranNo=${purchase.purchase.tranNo }").submit();
	});
});	

$(function() {
	 $( "#cancel" ).on("click" , function() {
		 history.go(-1);
	});
});	
</script>
</head>

<body bgcolor="#ffffff" text="#000000">
<jsp:include page="/layout/toolbar.jsp" />
<div class="container">
<form class="form-horizontal">

<div class="page-header">
	       <h3 class=" text-info">후기 수정</h3>
</div>
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">구매자아이디 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>	    
		    <div class="col-sm-4">
		    <input type="hidden" name="buyerId" value="${purchase.user.userId }">
		      <input type="text" class="form-control" value="${purchase.user.userId }" disabled>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">구매자이름 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>	    
		    <div class="col-sm-4">
		      <input type="text" class="form-control" value="${purchase.user.userName }" disabled>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>	    
		    <div class="col-sm-4">
		      <input type="text" class="form-control" value="${purchase.product.prodName }" disabled>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="category" class="col-sm-offset-1 col-sm-3 control-label">상품카테고리 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>	    
		    <div class="col-sm-4">
		      <input type="text" class="form-control" value="${purchase.product.category }" disabled>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>	    
		    <div class="col-sm-4">
		      <input type="text" class="form-control" value="${purchase.product.prodDetail }" disabled>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">상품가격 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>	    
		    <div class="col-sm-4">
		      <input type="text" class="form-control" value="${purchase.product.price }" disabled>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">후기 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>	    
		    <div class="col-sm-4">
		     <textarea class="form-control" rows="4" cols="50" name="review" placeholder="후기를 작성하세요."></textarea>
		    </div>
		  </div>		  
		 
		 		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" id="updateReview" >수 &nbsp;정</button>
			  <a class="btn btn-default btn" href="#" role="button" id="cancel">취&nbsp;소</a>
		    </div>
		  </div> 		  		  

</form>
</div>
</body>
</html>