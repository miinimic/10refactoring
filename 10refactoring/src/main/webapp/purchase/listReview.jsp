<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
<title>후기 목록 조회</title>
<style>


  .thumbnail{
 			height : 400px;
 			}
  
	body {
            padding-top : 60px;
        }
#test_obj {
        position: absolute;
        right: 50px;
        top: 250px;
        border: 1px solid #dddddd;
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
$(function() {		 

	 $( "#goTop" ).on("click" , function() {
		 $('html, body').animate({scrollTop:0}, 300);
	});
	 
	 $( "#goHome" ).on("click" , function() {
		 self.location = "/index.jsp"
		});
	 
});

 $(document).ready(function () {
       var tmp = parseInt($("#test_obj").css('top'));

       $(window).scroll(function () {
           var scrollTop = $(window).scrollTop();
           var obj_position = scrollTop + tmp + "px";

           $("#test_obj").stop().animate({
               "top": obj_position
           }, 500);

       }).scroll();
   });
function fncGetReviewList(currentPage) {
	$("#currentPage").val(currentPage)
	$("form").attr("method" , "POST").attr("action" , "/purchase/listReview").submit();
}
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
			$(window.parent.frames["rightFrame"].document.location).attr("href","/product/getProduct?menu=purchase&prodNo="+encodedProdNo+"");
			
	});
	
	$( ".update" ).on("click" , function() {

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
			//$(window.parent.frames["rightFrame"].document.location).attr("href","/purchase/updateReviewView?tranNo="+encodedTranNo+"");
			self.location = "/purchase/updateReviewView?tranNo="+encodedTranNo+""
	});

	$( ".delete" ).on("click" , function() {

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
			//self.location = "/purchase/deleteReview?tranNo="+encodedTranNo+""
		$.ajax( 
				{
					url : "/purchase/json/deleteReview/"+tranNo+"" ,
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
							alert("후기가 삭제되었습니다.")
							location.reload();

						}else{
							alert("후기 삭제 오류");
							location.reload();
						}
					

					}
			});			
					
					
	});

});
</script>
</head>

<body bgcolor="#ffffff" text="#000000">
<div id="test_obj">
	<button type="button" class="btn btn-default" id="goTop"><a href="#"><span class="glyphicon glyphicon-menu-up" aria-hidden="true"><br/>top</span></a></button>
	<button type="button" class="btn btn-default" id="goHome"><a href="#"><span class="glyphicon glyphicon-home" aria-hidden="true"><br/>home</span></a></button>
</div>
<jsp:include page="/layout/toolbar.jsp" />
	<div class="container">
	
	<div class="page-header">
	       <h3 class=" text-info">후기 목록 조회</h3>
</div>
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  <span class="badge">${resultPage.totalCount }</span> 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
	    	
		</div>
		
		<form class="form-inline">
		<c:set var="i" value="0" />
		<c:forEach var="purchase" items="${list}">
		<c:set var="i" value="${ i+1 }" />
				<div class="form-group">
				    <div class="thumbnail">
				      		<c:choose>
							    <c:when test="${ ! empty purchase.purchaseProd.fileName}">
							        <c:forEach var="fileName" items="${fn:split(purchase.purchaseProd.fileName, ',')}">
							            <img src="<c:url value='/images/${fileName}'/>" width="300px" height="300px"/>
							        </c:forEach>
							    </c:when>
							    <c:otherwise>
							        이미지 없음
							    </c:otherwise>
							</c:choose>
				      <div class="caption">
				        <h3>${purchase.purchaseProd.prodName}</h3>
				        <p>${purchase.review } </p>
				        <p>			<c:choose>
							<c:when test="${purchase.buyer.userId eq user.userId || user.role eq 'admin' }">
								<a href="#" class="btn btn-primary" role="button"><span class="update">후기수정<span class="hidden">,${purchase.tranNo }</span></span></a> 
							</c:when>
							<c:otherwise>
								
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${purchase.buyer.userId eq user.userId || user.role eq 'admin' }">
								<a href="#" class="btn btn-default" role="button"><span class="delete">후기삭제<span class="hidden">,${purchase.tranNo }</span></span></a>		 
							</c:when>
							<c:otherwise>
								
							</c:otherwise>
						</c:choose>
						
						</p>
				      </div>
				    </div>
				  </div>
		</c:forEach>
		</form>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value=""/>			
			<jsp:include page="../common/pageNavigator.jsp">
			    <jsp:param name="pageNavigator" value="listReview" />
			</jsp:include>
		
    	</td>
	</tr>
</table>



</div>

</body>
</html>