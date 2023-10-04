<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	<title>회원 목록 조회</title>
	
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	
	<!-- CDN(Content Delivery Network) 호스트 사용 -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	
	
	<script type="text/javascript">	
	
		// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
		function fncGetUserList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/user/listUser").submit();
		}


		 $(function() {		 

			 $( "td.ct_btn01:contains('검색')" ).on("click" , function() {
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
																+"아이디 : "+JSONData.userId+"<br/>"
																+"이  름 : "+JSONData.userName+"<br/>"
																+"이메일 : "+JSONData.email+"<br/>"
																+"ROLE : "+JSONData.role+"<br/>"
																+"등록일 : "+JSONData.regDateString+"<br/>"
																+"</h3>";
									//Debug...									
									//alert(displayValue);
									$("h3").remove();
									$( "#"+userId+"" ).html(displayValue);
								}
						});
						////////////////////////////////////////////////////////////////////////////////////////////
					
			});
			
			//==> userId LINK Event End User 에게 보일수 있도록 
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			$("h7").css("color" , "red");
			
			//==> 아래와 같이 정의한 이유는 ??
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		});	
		 
		 //autocomplete
	$(document).ready(function () {	
		$("#searchBox").autocomplete({
			source: function (request, response) {
				
				var searchKeyword = $("#searchBox").val(); // 검색어 가져오기
	            var searchCondition = $("select[name='searchCondition']").val(); // 검색 조건 가져오기
	            
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

			            // 여기서 서버 응답 데이터를 가공하여 사용자 목록으로 변환해야 합니다.
			            var userList = [];
					
			            if(searchCondition == '0'){
			            for (var i = 0; i < JSONData.length; i++) {
			                var user = JSONData[i];
			                userList.push({
			                    label: user.userId,
			                    value: user.userId, // 또는 사용자 설정값 설정
			                    test: user // 또는 다른 필요한 데이터 설정
			                });
			            }
			           } else if(searchCondition == '1'){
			        	   for (var i = 0; i < JSONData.length; i++) {
				                var user = JSONData[i];
				                userList.push({
				                    label: user.userName,
				                    value: user.userName, // 또는 사용자 설정값 설정
				                    test: user // 또는 다른 필요한 데이터 설정
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
					<td width="93%" class="ct_ttl01">회원 목록조회</td>
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
				<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>회원ID</option>
				<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>회원명</option>
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
						검색
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
			 전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지 
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">
			회원ID<br>
			<h7 >(id click:상세정보)</h7>
		</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">이메일</td>		
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
<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value=""/>
			<jsp:include page="../common/pageNavigator.jsp">
			    <jsp:param name="pageNavigator" value="listUser" />
			</jsp:include>
		
    	</td>
	</tr>
</table>
</form>
</div>

</body>

</html>