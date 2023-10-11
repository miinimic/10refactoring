<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<html>
<head>
<title>구매정보 수정</title>
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
    
 <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
 
<script type="text/javascript">
function fncAddPurchase(){
	//Form 유효성 검증
	
		var result='';
		$('input[name=address]').map(function(){
			result +=$(this).val();
		});
		 
		
		
	$('input[name=divyAddr]').val(result);
	
	var item=$("input[name='item']").val();
	var receiverName=$("input[name='receiverName']").val();
	var receiverPhone=$("input[name='receiverPhone']").val();
	var divyAddr=$("input[name='divyAddr']").val();
	

	if(item == null || item.length<1){
		alert("구매 수량은 반드시 입력하여야 합니다.");
		return;
	}
	if(receiverName == null || receiverName.length<1){
		alert("구매자 이름은 반드시 입력하여야 합니다.");
		return;
	}
	if(receiverPhone == null || receiverPhone.length<1){
		alert("구매자 연락처는 반드시 입력하셔야 합니다.");
		return;
	}
	if(divyAddr == null || divyAddr.length<1){
		alert("구매자 주소는 반드시 입력하셔야 합니다.");
		return;
	}
	
	$("form").attr("method" , "POST").attr("action" , "/purchase/updatePurchase?tranNo=${purchase.purchase.tranNo }&prodNo=${purchase.product.prodNo }").submit();
}


$(function() {
	 $( "#cancel" ).on("click" , function() {
			//$("form")[0].reset();
			history.go(-1)
	});
});	

$(function() {	
	 $( "#updatePurchase" ).on("click" , function() {
		 fncAddPurchase();
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

function execDaumPostcode() {
	
    new daum.Postcode({
        oncomplete: function(data) {
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('address').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('address_detail').focus();
        },
    
        theme: {
	 		bgColor: "#ECECEC", //바탕 배경색
	 		searchBgColor: "#0B65C8", //검색창 배경색
	 		contentBgColor: "#FFFFFF", //본문 배경색(검색결과,결l과없음,첫화면,검색서제스트)
	 		pageBgColor: "#FAFAFA", //페이지 배경색
	 		textColor: "#333333", //기본 글자색
	 		queryTextColor: "#FFFFFF", //검색창 글자색
	 		postcodeTextColor: "#FA4256", //우편번호 글자색
	 		emphTextColor: "#008BD3", //강조 글자색
	 		outlineColor: "#E0E0E0" //테두리
		}   
    
    }).open();
}

</script>

</head>

<body bgcolor="#ffffff" text="#000000">
<jsp:include page="/layout/toolbar.jsp" />
<div class="container">
<form class="form-horizontal">

<div class="page-header">
	       <h3 class=" text-info">구매 정보 수정</h3>
</div>
		  <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">구매자아이디 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>	    
		    <div class="col-sm-4">
		    <input type="hidden" name="buyerId" value="${purchase.user.userId }">
		      <input type="text" class="form-control" value="${purchase.user.userId }" disabled>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">구매방법 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>	    
		    <div class="col-sm-4">
		    			<select 	name="paymentOption" 	class="form-control" >
				<option value="1" selected="selected">현금구매</option>
				<option value="2">신용구매</option>
			</select>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">구매자 이름 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>	    
		    <div class="col-sm-4">
		    	<input 	type="text" name="receiverName" class="form-control" value="${purchase.purchase.receiverName }" />
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">구매자 연락처 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>	    
		    <div class="col-sm-4">
		    	<input 	type="text" name="receiverPhone" class="form-control" value="${purchase.purchase.receiverPhone  }" />
		    </div>
		  </div>
		  
		    <div class="form-group">
		    <label for="item" class="col-sm-offset-1 col-sm-3 control-label">구매자주소 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/> </label>
		    <div class="col-sm-4">
			    
				<input type="hidden" id="postcode" placeholder="우편번호" readonly="readonly"  >
				<input type="button" class="btn btn-default" onclick="execDaumPostcode()" value="주소 찾기" readonly="readonly" ><br>
				<input type="text" name="address" id="address" placeholder="주소" class="form-control">
				<input type="text" name="address" id="address_detail" placeholder="상세주소" class="form-control">
				<input type="hidden" name="divyAddr" value="" >
		    </div>

		  </div>
		  <div class="form-group">
		    <label for="item" class="col-sm-offset-1 col-sm-3 control-label">구매 수량 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>	    
		    <div class="col-sm-4">
		    	<input 	type="text" name="item" class="form-control"  value="${purchase.purchase.item }" />
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">구매요청사항 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>	    
		    <div class="col-sm-4">
		    	<input 	type="text" name="divyRequest" 	class="form-control"  value="${purchase.purchase.divyRequest }" />
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">배송희망일자 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>	    
		    <div class="col-sm-4">
		    	<c:set var="str" value="${purchase.purchase.divyDate.toString() }" />		
					<c:set var="arrayOfStrings" value="${fn:split(str, ' ')}" />
					<input type="text" class="form-control" name="divyDate" id="datepicker1" value="${arrayOfStrings[0] }">
				 </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" id="updatePurchase" >수 &nbsp;정</button>
			  <a class="btn btn-default btn" href="#" role="button" id="cancel">취&nbsp;소</a>
		    </div>
		  </div>

</form>
</div>
</body>
</html>