<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- ToolBar Start /////////////////////////////////////-->
<div class="navbar  navbar-inverse navbar-fixed-top" style="margin-bottom:100px;">
	
	<div class="container">
	       
		<a class="navbar-brand" href="/index.jsp">Lunch Box</a>
		
		<!-- toolBar Button Start //////////////////////// -->
		<div class="navbar-header">
		    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		    </button>
		</div>
		<!-- toolBar Button End //////////////////////// -->
		
	    <!--  dropdown hover Start -->
		<div 	class="collapse navbar-collapse" id="target" 
	       			data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
	         
	         	<!-- Tool Bar 를 다양하게 사용하면.... -->
	             <ul class="nav navbar-nav">
	             
	              <!--  회원관리 DrowDown -->
	              <c:if test="${ !empty user }">
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >회원관리</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">개인정보조회 <span class="glyphicon glyphicon-user" aria-hidden="true"></span></a></li>
	                         
	                         <c:if test="${sessionScope.user.role == 'admin'}">
	                         	<li><a href="#">회원정보조회 <span class="glyphicon glyphicon-globe" aria-hidden="true"></span></a></li>
	                         </c:if>
	                         
	                        
	                     </ul>
	                 </li>
	                 </c:if>
	                 
	              <!-- 판매상품관리 DrowDown  -->
	               <c:if test="${sessionScope.user.role == 'admin'}">
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >상품관리</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                     	<c:if test="${sessionScope.user.role == 'admin'}">
		                         <li><a href="../product/addProductView.jsp">판매상품등록 <span class="glyphicon glyphicon-upload" aria-hidden="true"></span></a></li>
		                         <li><a href="/product/listProduct?menu=manage">판매상품관리 <span class="glyphicon glyphicon-duplicate" aria-hidden="true"></span></a></li>
		                         <li><a href="#">최근본상품 <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a></li>
		                      	</c:if>
		                         
		                     </ul>
		                </li>
	                 </c:if>
	                 
	             <c:if test="${ ! empty user && sessionScope.user.role != 'admin'}"> 
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >상품구매</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="/product/listProduct?menu=search">상품검색 <span class="glyphicon glyphicon-search" aria-hidden="true"></span></a></li>                                               
	                          <li><a href="/purchase/listCart">장바구니 <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span></a></li>
	                         <li><a href="#">최근본상품 <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a></li>
	                                              
	                     </ul>
	                 </li>
	                </c:if>
	                 
	                 <c:if test="${ ! empty user}">
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >구매관리</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                     	<c:if test="${sessionScope.user.role == 'admin'}">
		                         <li><a href="/purchase/listTransaction?menu=manage">거래현황관리 <span class="glyphicon glyphicon-transfer" aria-hidden="true"></span></a></li>
		                      	</c:if>
		                      	<c:if test="${sessionScope.user.role != 'admin'}">
		                         <li><a href="/purchase/listPurchase">주문내역조회 <span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span></a></li>
		                         <li><a href="/purchase/listReview">후기목록조회 <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a></li>
		                         </c:if>
		                     </ul>
		                </li>
	                 </c:if>
	                 
	              <!-- 구매관리 DrowDown -->

	                
	                <c:if test="${ empty user }"> 
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >상품검색</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="/product/listProduct?menu=logout">상품조회 <span class="glyphicon glyphicon-search" aria-hidden="true"></span></a></li>                                               
	                         <li><a href="#">최근본상품 <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a></li>	                                              
	                     </ul>
	                 </li>
	                </c:if>
	                 
	                 
	             </ul>
	             <c:if test="${ empty user }">
					<ul class="nav navbar-nav navbar-right">
	                	<li><a href="/user/login">로그인</a></li>
	            	</ul>
		           </c:if>
		           <c:if test="${ ! empty user }">
					<ul class="nav navbar-nav navbar-right">
	                	<li><a href="/user/logout">로그아웃</a></li>
	            	</ul>
		           </c:if>      
	            
		</div>
		<!-- dropdown hover END -->	       
	    
	</div>
</div>
		<!-- ToolBar End /////////////////////////////////////-->
 	
   	
   	
   	<script type="text/javascript">
	
		//============= logout Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('로그아웃')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
		 });
		
		//============= 회원정보조회 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('회원정보조회')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/user/listUser"
			}); 
		 });
		
		//=============  개인정보조회회 Event  처리 =============	
	 	$( "a:contains('개인정보조회')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});
		
	</script>  