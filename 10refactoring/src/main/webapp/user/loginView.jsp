<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


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
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
    	 body >  div.container{ 
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
        
        .kakaoLogin {
			  background-image: url('/images/kakao_login.png');
			  width: 65px; /* 버튼의 너비 */
			  height: 30px; /* 버튼의 높이 */
			  /* 다른 스타일 설정 */
			}
    </style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	

		//============= "로그인"  Event 연결 =============
		$( function() {
			
			$("#userId").focus();
			
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button").on("click" , function() {
				var id=$("input:text").val();
				var pw=$("input:password").val();
				
				if(id == null || id.length <1) {
					alert('ID 를 입력하지 않으셨습니다.');
					$("#userId").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					alert('패스워드를 입력하지 않으셨습니다.');
					$("#password").focus();
					return;
				}
				
				//$("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
				
					  var userData = {
					    userId: id, // JSON 객체에 추가
					    password: pw
					  };

					  // 서버로 데이터를 전송하는 Ajax 요청을 보냅니다.
					  $.ajax({
					    url: '/user/json/login', // 백엔드 서버의 API 엔드포인트 주소
					    method: 'POST',
					    data: JSON.stringify(userData), // JSON 데이터로 변환하여 전송
					    contentType: 'application/json', // JSON 데이터를 전송한다고 명시
					    success: function (response) {
					      // 성공 시 동작
					      console.log('데이터 전송 성공:', response);
					      
					      if(response.userId == null){
					    	  //console.log('null임');
					    	  alert("회원이 아닙니다. 가입해주세요.")
					    	  $(window.parent.frames["rightFrame"].document.location).attr("href","../user/addUserView.jsp");
					    	  
					      } else if(response.userId != null) {
					    	  console.log('null이 아님');
					    	  alert("로그인되었습니다.")
					    	  window.location.href = '../index.jsp';
					    	  
					      }

					    },
					    error: function (error) {
					      // 실패 시 동작
					      console.log('데이터 전송 실패:', error);
					    }
					  });
	
				
			});
		});	
		
		
		//============= 회원원가입화면이동 =============
		$( function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
		
		
	</script>		
	<script>
Kakao.init('5530bb913f2f77d28287f8a9b64fe265'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
        	  console.log(response.kakao_account.email)
        	  console.log(response.kakao_account.profile.nickname)
				email = response.kakao_account.email;
        	  sendEmailToServer(email);
        	  
        	  
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
  
function sendEmailToServer(email) {
	  var emailData = {
	    email: email // 이메일 주소를 JSON 객체에 추가
	  };

	  // 서버로 데이터를 전송하는 Ajax 요청을 보냅니다.
	  $.ajax({
	    url: '/user/json/emailCheck', // 백엔드 서버의 API 엔드포인트 주소
	    method: 'POST',
	    data: JSON.stringify(emailData), // JSON 데이터로 변환하여 전송
	    contentType: 'application/json', // JSON 데이터를 전송한다고 명시
	    success: function (response) {
	      // 성공 시 동작
	      console.log('데이터 전송 성공:', response);
	      
	      if(response.userId == null){
	    	  //console.log('null임');
	    	  alert("회원이 아닙니다. 가입해주세요.")
	    	  $(window.parent.frames["rightFrame"].document.location).attr("href","../user/addUserView.jsp");
	    	  
	      } else if(response.userId != null) {
	    	  console.log('null이 아님');
	    	  alert("로그인되었습니다.")
	    	  window.location.href = '../index.jsp';
	    	  
	      }

	    },
	    error: function (error) {
	      // 실패 시 동작
	      console.log('데이터 전송 실패:', error);
	    }
	  });
	}

	
//카카오로그아웃  
/*function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  */
</script>

	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->	
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		<!--  row Start /////////////////////////////////////-->
		<div class="row">
		
			<div class="col-md-6">
					<img src="/images/logo-spring.png" class="img-rounded" width="100%" />
			</div>
	   	 	
	 	 	<div class="col-md-6">
	 	 	
		 	 	<br/><br/>
				
				<div class="jumbotron">	 	 	
		 	 		<h1 class="text-center">로 &nbsp;&nbsp;그 &nbsp;&nbsp;인</h1>

			        <form class="form-horizontal">
		  
					  <div class="form-group">
					    <label for="userId" class="col-sm-4 control-label">아 이 디</label>
					    <div class="col-sm-6">
					      <input type="text" class="form-control" name="userId" id="userId"  placeholder="아이디" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="password" class="col-sm-4 control-label">패 스 워 드</label>
					    <div class="col-sm-6">
					      <input type="password" class="form-control" name="password" id="password" placeholder="패스워드" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-6 text-center">
					      <button type="button" class="btn btn-primary"  >로 &nbsp;그 &nbsp;인</button>
					      <a class="btn btn-primary btn" href="#" role="button">회 &nbsp;원 &nbsp;가 &nbsp;입</a>
					    </div>
					  </div>
					  <div>
					          <button type="button" class="kakaoLogin" onclick="kakaoLogin();" ></button>
						<!-- 
					      <a href="javascript:void(0)" onclick="kakaoLogout();">
					          <span>카카오 로그아웃</span>
					      </a>
						 -->
					</div>
					</form>
			   	 </div>
			
			</div>
			
  	 	</div>
  	 	<!--  row Start /////////////////////////////////////-->
  	 	
 	</div>
 	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>