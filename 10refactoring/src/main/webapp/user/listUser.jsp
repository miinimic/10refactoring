<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
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
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetUserList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/user/listUser").submit();
		}
		
		
		//============= "검색"  Event  처리 =============	
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 //$( "button.btn.btn-default" ).on("click" , function() {
			//	fncGetUserList(1);
			//});
		 });
		
		
		//============= userId 에 회원정보보기  Event  처리(Click) =============	
		 $(function() {
		
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "td:nth-child(2)" ).on("click" , function() {
				 self.location ="/user/getUser?userId="+$(this).text().trim();
			});
						
			//==> userId LINK Event End User 에게 보일수 있도록 
			$( "td:nth-child(2)" ).css("color" , "red");
			
		});	
		
		
		//============= userId 에 회원정보보기  Event  처리 (double Click)=============
		 $(function() {
			 
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
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
																+"아이디 : "+JSONData.userId+"<br/>"
																+"이  름 : "+JSONData.userName+"<br/>"
																+"이메일 : "+JSONData.email+"<br/>"
																+"ROLE : "+JSONData.role+"<br/>"
																+"등록일 : "+JSONData.regDateString+"<br/>"
																+"</h6>";
									$("h6").remove();
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
		
		//무한스크롤
			var isLoading = false; // 데이터 로딩 중인지 여부
			
		    // 스크롤 이벤트 처리
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
		    
		    var previousData = []; // 이전에 로드한 데이터를 저장할 배열

		    // 데이터를 불러오고 게시판에 추가하는 함수
		    function loadMoreData() {
		    	
		    	isLoading = true;
		        
		         
		        curPage = curPage + 1; // 다음 페이지로 이동
		        //alert(curPage);

		        $.ajax({
		            url: "/user/json/listUser/" + curPage, // 데이터를 가져올 서버 API 또는 페이지 경로
		            method: "GET",
		            dataType: "json",
		            async: true,
				 	headers: {
		       	         "Accept": "application/json",
		       	         "Content-Type": "application/json"
		       	     	},
		            success: function (JSONData, status) {
		                // 가져온 데이터를 HTML로 변환하여 기존 게시판에 추가
		                       	
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
		                console.log("데이터 로드 중 오류 발생");

		                isLoading = false;
		            }
		        });
		    }
		    
		    $(document).ready(function () {	
				$("#searchBox").autocomplete({
					source: function (request, response) {
						
						var searchKeyword = $("#searchBox").val(); // 검색어 가져오기
			            var searchCondition = $("select[name='searchCondition']").val(); // 검색 조건 가져오기
			            
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

					            // 여기서 서버 응답 데이터를 가공하여 사용자 목록으로 변환해야 합니다.
					            var userList = [];

					            for (var i = 0; i < JSONData.length; i++) {
					                var user = JSONData[i];
					                userList.push({
					                    label: user.userId,
					                    value: user.userId, // 또는 사용자 설정값 설정
					                    test: user // 또는 다른 필요한 데이터 설정
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
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>회원목록조회</h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>회원ID</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>회원명</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchBox" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >회원 ID</th>
            <th align="left">회원명</th>
            <th align="left">이메일</th>
            <th align="left">간략정보</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="user" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  <td align="left"  title="Click : 회원정보 확인">${user.userId}</td>
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
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>