<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
		function fncGetUserList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/user/listUser").submit();
		}
		
		
		//============= "�˻�"  Event  ó�� =============	
		 $(function() {
			 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 //$( "button.btn.btn-default" ).on("click" , function() {
			//	fncGetUserList(1);
			//});
		 });
		
		
		//============= userId �� ȸ����������  Event  ó��(Click) =============	
		 $(function() {
		
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "td:nth-child(2)" ).on("click" , function() {
				 self.location ="/user/getUser?userId="+$(this).text().trim();
			});
						
			//==> userId LINK Event End User ���� ���ϼ� �ֵ��� 
			$( "td:nth-child(2)" ).css("color" , "red");
			
		});	
		
		
		//============= userId �� ȸ����������  Event  ó�� (double Click)=============
		 $(function() {
			 
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(  "td:nth-child(5) > i" ).on("click" , function() {

					var userId = $(this).next().val();
				
					$.ajax( 
							{
								url : "/user/json/getUser/"+userId ,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {

									var displayValue = "<h6>"
																+"���̵� : "+JSONData.userId+"<br/>"
																+"��  �� : "+JSONData.userName+"<br/>"
																+"�̸��� : "+JSONData.email+"<br/>"
																+"ROLE : "+JSONData.role+"<br/>"
																+"����� : "+JSONData.regDateString+"<br/>"
																+"</h6>";
									$("h6").remove();
									$( "#"+userId+"" ).html(displayValue);
								}
						});
						////////////////////////////////////////////////////////////////////////////////////////////
					
			});
			
			//==> userId LINK Event End User ���� ���ϼ� �ֵ��� 
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			$("h7").css("color" , "red");
			
			//==> �Ʒ��� ���� ������ ������ ??
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		});	
		
		//���ѽ�ũ��
			var isLoading = false; // ������ �ε� ������ ����
			
		    // ��ũ�� �̺�Ʈ ó��
	 		$(window).on("scroll", function () {
		        var scrollTop = $(window).scrollTop();
		        var windowsHeight = $(window).height();
		        var documentHeight = $(document).height();
		        var isBottom = scrollTop + windowsHeight >= documentHeight;

		        if (isBottom && !isLoading) {
		            loadMoreData();
		        }
		    });
			
		
		
	 		//loadMoreData();
	 				
		    var curPage = ${resultPage.currentPage}; 
		    
		    var previousData = []; // ������ �ε��� �����͸� ������ �迭

		    // �����͸� �ҷ����� �Խ��ǿ� �߰��ϴ� �Լ�
		    function loadMoreData() {
		    	
		    	isLoading = true;
		        
		         
		        curPage = curPage + 1; // ���� �������� �̵�
		        //alert(curPage);

		        $.ajax({
		            url: "/user/json/listUser/" + curPage, // �����͸� ������ ���� API �Ǵ� ������ ���
		            method: "GET",
		            dataType: "json",
		            async: true,
				 	headers: {
		       	         "Accept": "application/json",
		       	         "Content-Type": "application/json"
		       	     	},
		            success: function (JSONData, status) {
		                // ������ �����͸� HTML�� ��ȯ�Ͽ� ���� �Խ��ǿ� �߰�
		                       	
	   	     			console.log(JSONData);	
		               alert(JSONData.list.length);
	 	
	   	     	 		var tableBody = $("#getUserList tbody");

	               
	                   for (var i = 0; i < JSONData.list.length; i++) {
	                	   var user = JSONData.list[i];

	                	   console.log(i);	
	                      var newRow = $("<tr class='ct_list_pop'>");
	                       newRow.append("<td align='center'>" +(i+1) + "</td>");
	                       newRow.append("<td></td>");
	                       newRow.append("<td align='left'>" + user.userId + "123123</td>");
	                       newRow.append("<td></td>");
	                       newRow.append("<td align='left'>" + user.userName + "</td>");
	                       newRow.append("<td></td>");
	                       newRow.append("<td align='left'>" + user.email + "</td>");    
	                       console.log(newRow);
	                       tableBody.append(newRow);
	                       var newRow2 = $("<tr>");
	                       newRow2.append("<td id='"+user.userId+"' colspan='11' bgcolor='D6D7D6' height='1'></td>");
	                       console.log(newRow2);
	                       tableBody.append(newRow2);

	                   }

		               
		                isLoading = false;

		            },
		            error: function () {
		                console.log("������ �ε� �� ���� �߻�");

		                isLoading = false;
		            }
		        });
		    }
		    
		    $(document).ready(function () {	
				$("#searchBox").autocomplete({
					source: function (request, response) {
						
						var searchKeyword = $("#searchBox").val(); // �˻��� ��������
			            var searchCondition = $("select[name='searchCondition']").val(); // �˻� ���� ��������
			            
			           // alert(searchKeyword);
			            //alert(searchCondition);
			            
					    $.ajax({
					        url: "/user/json/listUserAuto/" + searchCondition + "/"+searchKeyword ,
					        method: "GET",
					        dataType: "json",
					        headers: {
					            "Accept": "application/json",
					            "Content-Type": "application/json"
					        },
					        success: function (JSONData, status) {
					            console.log(status);
					            console.log(JSONData);

					            // ���⼭ ���� ���� �����͸� �����Ͽ� ����� ������� ��ȯ�ؾ� �մϴ�.
					            var userList = [];

					            for (var i = 0; i < JSONData.length; i++) {
					                var user = JSONData[i];
					                userList.push({
					                    label: user.userId,
					                    value: user.userId, // �Ǵ� ����� ������ ����
					                    test: user // �Ǵ� �ٸ� �ʿ��� ������ ����
					                });
					            }

					            response(userList);
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

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>ȸ�������ȸ</h3>
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>ȸ��ID</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>ȸ����</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchBox" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >ȸ�� ID</th>
            <th align="left">ȸ����</th>
            <th align="left">�̸���</th>
            <th align="left">��������</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="user" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  <td align="left"  title="Click : ȸ������ Ȯ��">${user.userId}</td>
			  <td align="left">${user.userName}</td>
			  <td align="left">${user.email}</td>
			  <td align="left">
			  	<i class="glyphicon glyphicon-ok" id= "${user.userId}"></i>
			  	<input type="hidden" value="${user.userId}">
			  </td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>