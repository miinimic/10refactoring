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
	         
	         	<!-- Tool Bar �� �پ��ϰ� ����ϸ�.... -->
	             <ul class="nav navbar-nav">
	             
	              <!--  ȸ������ DrowDown -->
	              <c:if test="${ !empty user }">
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >ȸ������</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">����������ȸ <span class="glyphicon glyphicon-user" aria-hidden="true"></span></a></li>
	                         
	                         <c:if test="${sessionScope.user.role == 'admin'}">
	                         	<li><a href="#">ȸ��������ȸ <span class="glyphicon glyphicon-globe" aria-hidden="true"></span></a></li>
	                         </c:if>
	                         
	                        
	                     </ul>
	                 </li>
	                 </c:if>
	                 
	              <!-- �ǸŻ�ǰ���� DrowDown  -->
	               <c:if test="${sessionScope.user.role == 'admin'}">
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >��ǰ����</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                     	<c:if test="${sessionScope.user.role == 'admin'}">
		                         <li><a href="../product/addProductView.jsp">�ǸŻ�ǰ��� <span class="glyphicon glyphicon-upload" aria-hidden="true"></span></a></li>
		                         <li><a href="/product/listProduct?menu=manage">�ǸŻ�ǰ���� <span class="glyphicon glyphicon-duplicate" aria-hidden="true"></span></a></li>
		                         <li><a href="#">�ֱٺ���ǰ <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a></li>
		                      	</c:if>
		                         
		                     </ul>
		                </li>
	                 </c:if>
	                 
	             <c:if test="${ ! empty user && sessionScope.user.role != 'admin'}"> 
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >��ǰ����</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="/product/listProduct?menu=search">��ǰ�˻� <span class="glyphicon glyphicon-search" aria-hidden="true"></span></a></li>                                               
	                          <li><a href="/purchase/listCart">��ٱ��� <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span></a></li>
	                         <li><a href="#">�ֱٺ���ǰ <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a></li>
	                                              
	                     </ul>
	                 </li>
	                </c:if>
	                 
	                 <c:if test="${ ! empty user}">
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >���Ű���</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                     	<c:if test="${sessionScope.user.role == 'admin'}">
		                         <li><a href="/purchase/listTransaction?menu=manage">�ŷ���Ȳ���� <span class="glyphicon glyphicon-transfer" aria-hidden="true"></span></a></li>
		                      	</c:if>
		                      	<c:if test="${sessionScope.user.role != 'admin'}">
		                         <li><a href="/purchase/listPurchase">�ֹ�������ȸ <span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span></a></li>
		                         <li><a href="/purchase/listReview">�ı�����ȸ <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a></li>
		                         </c:if>
		                     </ul>
		                </li>
	                 </c:if>
	                 
	              <!-- ���Ű��� DrowDown -->

	                
	                <c:if test="${ empty user }"> 
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >��ǰ�˻�</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="/product/listProduct?menu=logout">��ǰ��ȸ <span class="glyphicon glyphicon-search" aria-hidden="true"></span></a></li>                                               
	                         <li><a href="#">�ֱٺ���ǰ <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a></li>	                                              
	                     </ul>
	                 </li>
	                </c:if>
	                 
	                 
	             </ul>
	             <c:if test="${ empty user }">
					<ul class="nav navbar-nav navbar-right">
	                	<li><a href="/user/login">�α���</a></li>
	            	</ul>
		           </c:if>
		           <c:if test="${ ! empty user }">
					<ul class="nav navbar-nav navbar-right">
	                	<li><a href="/user/logout">�α׾ƿ�</a></li>
	            	</ul>
		           </c:if>      
	            
		</div>
		<!-- dropdown hover END -->	       
	    
	</div>
</div>
		<!-- ToolBar End /////////////////////////////////////-->
 	
   	
   	
   	<script type="text/javascript">
	
		//============= logout Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('�α׾ƿ�')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
		 });
		
		//============= ȸ��������ȸ Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('ȸ��������ȸ')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/user/listUser"
			}); 
		 });
		
		//=============  ����������ȸȸ Event  ó�� =============	
	 	$( "a:contains('����������ȸ')" ).on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});
		
	</script>  