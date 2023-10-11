<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<html>
<head>
<title>��ǰ����</title>
<style>

#imgArea {
    width: 300px;
    height: 300px;
    overflow: hidden; /* �̹����� ������ ����� �ʵ��� overflow�� ���� ó���մϴ�. */
}

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
		alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(price == null || price.length<1){
		alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
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
        
        // �̹����� �ε�� �Ŀ� ����ǵ��� �̺�Ʈ �����ʸ� �߰��մϴ�.
        image.onload = function() {
            // imgArea�� �ʺ�� ���̸� �����ɴϴ�.
            var imgAreaWidth = $("#imgArea").width();
            var imgAreaHeight = $("#imgArea").height();

            // �̹����� ���ο� ���� ũ�⸦ �����ɴϴ�.
            var imageWidth = image.width;
            var imageHeight = image.height;

            // �̹����� ���ο� ���� ũ�⸦ imgArea�� ũ�⿡ �°� �����մϴ�.
            if (imageWidth > imgAreaWidth || imageHeight > imgAreaHeight) {
                var scaleFactor = Math.min(imgAreaWidth / imageWidth, imgAreaHeight / imageHeight);
                image.width = imageWidth * scaleFactor;
                image.height = imageHeight * scaleFactor;
            }

            // �̹����� imgArea�� �߰��մϴ�.
            $("#imgArea").empty().append(image);
        };
    });
});

$.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd',
    prevText: '���� ��',
    nextText: '���� ��',
    monthNames: ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��'],
    monthNamesShort: ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��'],
    dayNames: ['��', '��', 'ȭ', '��', '��', '��', '��'],
    dayNamesShort: ['��', '��', 'ȭ', '��', '��', '��', '��'],
    dayNamesMin: ['��', '��', 'ȭ', '��', '��', '��', '��'],
    showMonthAfterYear: true,
    yearSuffix: '��',
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
	       <h3 class=" text-info">��ǰ����</h3>
</div>

		  <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�� <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName }">
		    </div>
		  </div>
				  <div class="form-group">
		    <label for="category" class="col-sm-offset-1 col-sm-3 control-label">ī�װ� <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>
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
		    <label for="item" class="col-sm-offset-1 col-sm-3 control-label">���� <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>
		    <div class="col-sm-4">
		      <input 	type="text" name="item" class="form-control" id="item" value="${product.item }">
		    </div>
		  </div>
		  
		  		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������ <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>
		    <div class="col-sm-4">
		     <input type="text" name="prodDetail" value="${product.prodDetail }" class="form-control">
		    </div>
		  </div>
		  
		  		  		  <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">�������� <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>
		    <div class="col-sm-4">
		     <c:set var="str" value="${product.manuDate.toString() }" />		
					<c:set var="arrayOfStrings" value="${fn:split(str, ' ')}" />
					<input type="text" name="manuDate" id="datepicker1" class="form-control" value="${arrayOfStrings[0] }"  />						
		    </div>
		  </div>
		  
		  		  		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">���� <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>
		    <div class="col-sm-4">
		     <input type="text" name="price" class="form-control" value="${product.price }"/>
		    </div>
		  </div>
		  
		  		  		  		  <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹��� <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>
		    <div class="col-sm-4">
		     ${product.fileName }
		     <input	multiple="multiple"	type="file" name="file" id="file" />
			<div id="imgArea"></div>
		    </div>
		  </div>
		  		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" id="updateProduct" >�� &nbsp;��</button>
			  <a class="btn btn-default btn" href="#" role="button" id="cancel">��&nbsp;��</a>
		    </div>
		  </div>

</form>
</div>
</body>
</html>