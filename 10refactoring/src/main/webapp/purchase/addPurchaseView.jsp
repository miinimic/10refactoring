<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
<title>�����ϱ�</title>
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
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" >
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" ></script>
    
<script type="text/javascript">

function requestPay() {
	
	var result='';
	$('input[name=address]').map(function(){
		result +=$(this).val();
	});
	
	$('input[name=receiverAddr]').val(result);
	
	var price=$("input[name='price']").val();
	var receiverName=$("input[name='receiverName']").val();
	var receiverPhone=$("input[name='receiverPhone']").val();
	var prodName=$("input[name='prodName']").val();
	var receiverAddr=$("input[name='receiverAddr']").val();
	
	var IMP = window.IMP;
	IMP.init("imp16061541");
	
    // IMP.request_pay(param, callback) ����â ȣ��
    IMP.request_pay({ // param
    	 pg : 'html5_inicis',
    	    pay_method : 'card',
    	    merchant_uid: "merchant_" + new Date().getTime(), // �������� �����ϴ� �ֹ� ��ȣ�� ����
    	    name : prodName,
    	    amount : price,
    	    buyer_name : receiverName,
    	    buyer_tel : receiverPhone,  //�ʼ��Է�
    	    buyer_addr : receiverAddr
    	    //buyer_postcode : '123-456',
    	    //m_redirect_url : '{/purchase/addPurchase.jsp}' // ��: https://www.my-service.com/payments/complete/mobile
    }, function (rsp) { // callback
        if (rsp.success) {
            alert("��������");
            fncAddPurchase();
          
        } else {
        	 alert("��������");
        }
    });
  }

function fncAddPurchase(){
	
	//Form ��ȿ�� ����
	
	var result='';
		$('input[name=address]').map(function(){
			result +=$(this).val();
		});
		
	$('input[name=receiverAddr]').val(result);
		
	var item=$("input[name='item']").val();
	var receiverName=$("input[name='receiverName']").val();
	var receiverPhone=$("input[name='receiverPhone']").val();
	var receiverAddr=$("input[name='receiverAddr']").val();
	var divyDate=$("input[name='divyDate']").val();
	//alert(divyDate);
	
	
	

	if(item == null || item.length<1){
		alert("���� ������ �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if( ${product.item } < item ){
		alert("����� ���� ������ �Է����ּ���.");
		return;
		
	}
	if(receiverName == null || receiverName.length<1){
		alert("������ �̸��� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(receiverPhone == null || receiverPhone.length<1){
		alert("������ ����ó�� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(receiverAddr == null || receiverAddr.length<1){
		alert("������ �ּҴ� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	
	$("form").attr("method" , "POST").attr("action" , "/purchase/addPurchase").submit();
}


$(function() {
	 $( "#purchaseAdd" ).on("click" , function() {
		  
		 fncAddPurchase();
	});
});	

	
$(function() {
	 $( "#cancel" ).on("click" , function() {
		 history.go(-1);
	});
});	


function execDaumPostcode() {
	
    new daum.Postcode({
        oncomplete: function(data) {
        	
            // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

            // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
            // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
            var fullAddr = ''; // ���� �ּ� ����
            var extraAddr = ''; // ������ �ּ� ����

            // ����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
            if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                fullAddr = data.roadAddress;

            } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                fullAddr = data.jibunAddress;
            }

            // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����Ѵ�.
            if(data.userSelectedType === 'R'){
                //���������� ���� ��� �߰��Ѵ�.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // �ǹ����� ���� ��� �߰��Ѵ�.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // �������ּ��� ������ ���� ���ʿ� ��ȣ�� �߰��Ͽ� ���� �ּҸ� �����.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
            document.getElementById('postcode').value = data.zonecode; //5�ڸ� �������ȣ ���
            document.getElementById('address').value = fullAddr;

            // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
            document.getElementById('address_detail').focus();
        },
    
        theme: {
	 		bgColor: "#ECECEC", //���� ����
	 		searchBgColor: "#0B65C8", //�˻�â ����
	 		contentBgColor: "#FFFFFF", //���� ����(�˻����,��l������,ùȭ��,�˻�������Ʈ)
	 		pageBgColor: "#FAFAFA", //������ ����
	 		textColor: "#333333", //�⺻ ���ڻ�
	 		queryTextColor: "#FFFFFF", //�˻�â ���ڻ�
	 		postcodeTextColor: "#FA4256", //�����ȣ ���ڻ�
	 		emphTextColor: "#008BD3", //���� ���ڻ�
	 		outlineColor: "#E0E0E0" //�׵θ�
		}   
    
    }).open();
}

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
    minDate: 0   // ���ó�¥ ������ ���� ����
});

$(function() {
    $("#datepicker1").datepicker();
});


</script>
</head>

<body>
<jsp:include page="/layout/toolbar.jsp" />
<div class="container">
<form class="form-horizontal">
<div class="page-header">
	       <h3 class=" text-info">��ǰ����</h3>
</div>


<input type="hidden" name="prodNo" value="${product.prodNo }" />
<input type="hidden" name="buyerId" value="${user.userId }" />

		  <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�� </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName }" disabled>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������ </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" value="${product.prodDetail }" disabled>
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">�������� </label>
		    <div class="col-sm-4">
		     <c:set var="str" value="${product.manuDate.toString() }" />		
					<c:set var="arrayOfStrings" value="${fn:split(str, ' ')}" />
					<input type="text" name="manuDate" class="form-control" value="${arrayOfStrings[0] }"  disabled/>						
		    </div>
		  </div>
		  <div class="form-group">
	  		<label for="image" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹��� </label>
			<div class="col-sm-4">	
			<c:choose>
		    <c:when test="${ ! empty product.fileName}">
		        <c:forEach var="fileName" items="${fn:split(product.fileName, ',')}">
		            <img src="<c:url value='/images/${fileName}'/>" width="300px" height="300px"/>
		        </c:forEach>
		    </c:when>
		    <c:otherwise>
		        �̹��� ����
		    </c:otherwise>
		</c:choose></div>
		  </div>
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">���� </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" value="${product.price }" disabled>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="regDate" class="col-sm-offset-1 col-sm-3 control-label">������� </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="regDate" name=regDate value="${product.regDate }" disabled>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">�����ھ��̵� </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" value="${user.userId }" disabled>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">�������̸� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverName" name="receiverName" value="${user.userName }" >
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="phone" class="col-sm-offset-1 col-sm-3 control-label">�����ڿ���ó <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="phone" name="receiverPhone" value="${user.phone }" >
		    </div>
		  </div>
		  	 <div class="form-group">
		    <label for="item" class="col-sm-offset-1 col-sm-3 control-label">���ż��� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/> </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="item" name="item" >( ��� : ${product.item } ��)
		    </div>
		  </div>
		   <div class="form-group">
		    <label for="item" class="col-sm-offset-1 col-sm-3 control-label">���Ź�� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/> </label>
		    <div class="col-sm-4">
		     <select 	name="paymentOption"		class="form-control" >
				<option value="1" selected="selected">���ݱ���</option>
				<option value="2">�ſ뱸��</option>
			</select>
		    </div>
		  </div>		  
		  <div class="form-group">
		    <label for="item" class="col-sm-offset-1 col-sm-3 control-label">�������ּ� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/> </label>
		    <div class="col-sm-4">
				<input type="hidden" id="postcode" placeholder="�����ȣ" readonly="readonly"  >
				<input type="button" class="btn btn-default" onclick="execDaumPostcode()" value="�ּ� ã��" readonly="readonly" ><br>
				<input type="text" name="address" id="address" placeholder="�ּ�" class="form-control">
				<input type="text" name="address" id="address_detail" placeholder="���ּ�" class="form-control">
				<input type="hidden" name="receiverAddr" value="" >
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="receiverRequest" class="col-sm-offset-1 col-sm-3 control-label">���ſ�û���� </label>
		    <div class="col-sm-4">
		     <input		type="text" name="receiverRequest" 	class="form-control" />
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">���������� </label>
		    <div class="col-sm-4">
		      <input type="text" name="divyDate" class="form-control" id="datepicker1">
		    </div>
		  </div>
		  
</form>
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		    	<button type="button" class="btn btn-primary" onclick="requestPay()">�����ϱ�</button> 		  
		      <!-- <button type="button" class="btn btn-primary" id="purchaseAdd" >�� &nbsp;��</button> -->
			  <a class="btn btn-default btn" href="#" role="button" id="cancel">��&nbsp;��</a>
		    </div>
		  </div>

</div>
</body>
</html>