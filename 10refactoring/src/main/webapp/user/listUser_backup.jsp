<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	<title>ȸ�� ��� ��ȸ</title>
	
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	
	<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	
	
	<script type="text/javascript">
	
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

	
		// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
		function fncGetUserList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/user/listUser").submit();
		}


		 $(function() {		 

			 $( "td.ct_btn01:contains('�˻�')" ).on("click" , function() {
				fncGetUserList(1);
			});

			$( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {

					var userId = $(this).text().trim();
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

									//Debug...
									//alert(status);
									//Debug...
									//alert("JSONData : \n"+JSONData);
									
									var displayValue = "<h3>"
																+"���̵� : "+JSONData.userId+"<br/>"
																+"��  �� : "+JSONData.userName+"<br/>"
																+"�̸��� : "+JSONData.email+"<br/>"
																+"ROLE : "+JSONData.role+"<br/>"
																+"����� : "+JSONData.regDateString+"<br/>"
																+"</h3>";
									//Debug...									
									//alert(displayValue);
									$("h3").remove();
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
		 
		 //autocomplete
	/*	 $(document).ready(function () {
			  // input�ʵ忡 �ڵ��ϼ� ����� �ɾ��ش�
			  $('#searchBox').autocomplete({
			    source: locList,
			    focus: function (event, ui) {
			      return false;
			    },
			    select: function (event, ui) {},
			    minLength: 1,
			    delay: 100,
			    autoFocus: true,
			  });
			});
	*/
	
	$(document).ready(function () {	
		$("#searchBox").autocomplete({
			source: function (request, response) {
				
				var searchKeyword = $("#searchBox").val(); // �˻��� ��������
	            var searchCondition = $("select[name='searchCondition']").val(); // �˻� ���� ��������
	            
	         //  alert(searchKeyword);
	         //  alert(searchCondition);
	            
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
					
			            if(searchCondition == '0'){
			            for (var i = 0; i < JSONData.length; i++) {
			                var user = JSONData[i];
			                userList.push({
			                    label: user.userId,
			                    value: user.userId, // �Ǵ� ����� ������ ����
			                    test: user // �Ǵ� �ٸ� �ʿ��� ������ ����
			                });
			            }
			           } else if(searchCondition == '1'){
			        	   for (var i = 0; i < JSONData.length; i++) {
				                var user = JSONData[i];
				                userList.push({
				                    label: user.userName,
				                    value: user.userName, // �Ǵ� ����� ������ ����
				                    test: user // �Ǵ� �ٸ� �ʿ��� ������ ����
				                });
				            }
			        	   
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

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37" />
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">ȸ�� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>ȸ��ID</option>
				<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>ȸ����</option>
			</select>
			<input type="text" name="searchKeyword" id="searchBox"
						value="${! empty search.searchKeyword ? search.searchKeyword : ""}"  
						class="ct_input_g" style="width:200px; height:20px" > 
		</td>
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23"><img src="/images/ct_btnbg01.gif" width="17" height="23"></td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						�˻�
					</td>
					<td width="14" height="23"><img src="/images/ct_btnbg03.gif" width="14" height="23"></td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<table id="getUserList" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >
			 ��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������ 
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">
			ȸ��ID<br>
			<h7 >(id click:������)</h7>
		</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�̸���</td>		
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>

	<c:set var="i" value="0" />
	<c:forEach var="user" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
			<td align="center">${ i }</td>
			<td></td>
			<td align="left">${user.userId}</td>
			<td></td>
			<td align="left">${user.userName}</td>
			<td></td>
			<td align="left">${user.email}
			</td>
		</tr>
		<tr>
			<td id="${user.userId}" colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
	</c:forEach>
<tbody></tbody>	
</table>

</form>
</div>

</body>

</html>