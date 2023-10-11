<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<html>
<head>
<title>상품수정</title>
<style>

#imgArea {
    width: 300px;
    height: 300px;
    overflow: hidden; /* 이미지가 영역을 벗어나지 않도록 overflow를 숨김 처리합니다. */
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

function fncUpdateProduct(){

	var name=$("input[name='prodName']").val();
	var detail=$("input[name='prodDetail']").val();
	var manuDate=$("input[name='manuDate']").val();
	var price=$("input[name='price']").val();
	

	if(name == null || name.length<1){
		alert("상품명은 반드시 입력하여야 합니다.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("상품상세정보는 반드시 입력하여야 합니다.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("제조일자는 반드시 입력하셔야 합니다.");
		return;
	}
	if(price == null || price.length<1){
		alert("가격은 반드시 입력하셔야 합니다.");
		return;
	}
	
	$("form").attr("method" , "POST").attr("action" , "/product/updateProduct").submit();
}

$(function() {	
	 $( "#cancel" ).on("click" , function() {
		 history.go(-1)
	});
});	

$(function() {	
	 $( "#updateProduct" ).on("click" , function() {
		fncUpdateProduct();
	});
});	

$(function(){
    $("#file").change(function(event){
        const file = event.target.files;

        var image = new Image();
        var ImageTempUrl = window.URL.createObjectURL(file[0]);

        image.src = ImageTempUrl;
        
        // 이미지가 로드된 후에 실행되도록 이벤트 리스너를 추가합니다.
        image.onload = function() {
            // imgArea의 너비와 높이를 가져옵니다.
            var imgAreaWidth = $("#imgArea").width();
            var imgAreaHeight = $("#imgArea").height();

            // 이미지의 가로와 세로 크기를 가져옵니다.
            var imageWidth = image.width;
            var imageHeight = image.height;

            // 이미지의 가로와 세로 크기를 imgArea의 크기에 맞게 조절합니다.
            if (imageWidth > imgAreaWidth || imageHeight > imgAreaHeight) {
                var scaleFactor = Math.min(imgAreaWidth / imageWidth, imgAreaHeight / imageHeight);
                image.width = imageWidth * scaleFactor;
                image.height = imageHeight * scaleFactor;
            }

            // 이미지를 imgArea에 추가합니다.
            $("#imgArea").empty().append(image);
        };
    });
});

$.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear: true,
    yearSuffix: '년',
    minDate: 0
});

$(function() {
    $("#datepicker1").datepicker();
});

</script>
</head>

<body bgcolor="#ffffff" text="#000000">
<jsp:include page="/layout/toolbar.jsp" />
<div class="container">
<form class="form-horizontal" enctype="multipart/form-data">
<input type="hidden" name="prodNo" value="${product.prodNo}"/>
<input type="hidden" name="reg_date" value="${product.regDate}"/>
<input type="hidden" name="menu" value="manage"/>

<div class="page-header">
	       <h3 class=" text-info">상품수정</h3>
</div>

		  <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName }">
		    </div>
		  </div>
				  <div class="form-group">
		    <label for="category" class="col-sm-offset-1 col-sm-3 control-label">카테고리 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>
		    <div class="col-sm-4">
		      <input 	type="text" class="form-control" value="${product.category }">
		      	<select id="category" name="category">
			        <option value="chicken">chicken</option>
			        <option value="beef">beef</option>
			        <option value="pork">pork</option>
			        <option value="egg">egg</option>
			        <option value="seafood">seafood</option>
			        <option value="vegan">vegan</option>
			    </select>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="item" class="col-sm-offset-1 col-sm-3 control-label">개수 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>
		    <div class="col-sm-4">
		      <input 	type="text" name="item" class="form-control" id="item" value="${product.item }">
		    </div>
		  </div>
		  
		  		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>
		    <div class="col-sm-4">
		     <input type="text" name="prodDetail" value="${product.prodDetail }" class="form-control">
		    </div>
		  </div>
		  
		  		  		  <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>
		    <div class="col-sm-4">
		     <c:set var="str" value="${product.manuDate.toString() }" />		
					<c:set var="arrayOfStrings" value="${fn:split(str, ' ')}" />
					<input type="text" name="manuDate" id="datepicker1" class="form-control" value="${arrayOfStrings[0] }"  />						
		    </div>
		  </div>
		  
		  		  		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>
		    <div class="col-sm-4">
		     <input type="text" name="price" class="form-control" value="${product.price }"/>
		    </div>
		  </div>
		  
		  		  		  		  <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품이미지 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>
		    <div class="col-sm-4">
		     ${product.fileName }
		     <input	multiple="multiple"	type="file" name="file" id="file" />
			<div id="imgArea"></div>
		    </div>
		  </div>
		  		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" id="updateProduct" >수 &nbsp;정</button>
			  <a class="btn btn-default btn" href="#" role="button" id="cancel">취&nbsp;소</a>
		    </div>
		  </div>

</form>
</div>
</body>
</html>