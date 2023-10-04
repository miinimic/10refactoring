<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


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
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	 <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
    	 body >  div.container{ 
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
        
        .kakaoLogin {
			  background-image: url('/images/kakao_login.png');
			  width: 65px; /* ��ư�� �ʺ� */
			  height: 30px; /* ��ư�� ���� */
			  /* �ٸ� ��Ÿ�� ���� */
			}
    </style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	

		//============= "�α���"  Event ���� =============
		$( function() {
			
			$("#userId").focus();
			
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button").on("click" , function() {
				var id=$("input:text").val();
				var pw=$("input:password").val();
				
				if(id == null || id.length <1) {
					alert('ID �� �Է����� �����̽��ϴ�.');
					$("#userId").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					alert('�н����带 �Է����� �����̽��ϴ�.');
					$("#password").focus();
					return;
				}
				
				//$("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
				
					  var userData = {
					    userId: id, // JSON ��ü�� �߰�
					    password: pw
					  };

					  // ������ �����͸� �����ϴ� Ajax ��û�� �����ϴ�.
					  $.ajax({
					    url: '/user/json/login', // �鿣�� ������ API ��������Ʈ �ּ�
					    method: 'POST',
					    data: JSON.stringify(userData), // JSON �����ͷ� ��ȯ�Ͽ� ����
					    contentType: 'application/json', // JSON �����͸� �����Ѵٰ� ���
					    success: function (response) {
					      // ���� �� ����
					      console.log('������ ���� ����:', response);
					      
					      if(response.userId == null){
					    	  //console.log('null��');
					    	  alert("ȸ���� �ƴմϴ�. �������ּ���.")
					    	  $(window.parent.frames["rightFrame"].document.location).attr("href","../user/addUserView.jsp");
					    	  
					      } else if(response.userId != null) {
					    	  console.log('null�� �ƴ�');
					    	  alert("�α��εǾ����ϴ�.")
					    	  window.location.href = 'http://localhost:8080/index.jsp';
					    	  
					      }

					    },
					    error: function (error) {
					      // ���� �� ����
					      console.log('������ ���� ����:', error);
					    }
					  });
	
				
			});
		});	
		
		
		//============= ȸ��������ȭ���̵� =============
		$( function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
		
		
	</script>		
	<script>
Kakao.init('5530bb913f2f77d28287f8a9b64fe265'); //�߱޹��� Ű �� javascriptŰ�� ������ش�.
console.log(Kakao.isInitialized()); // sdk�ʱ�ȭ�����Ǵ�
//īī���α���
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
	    email: email // �̸��� �ּҸ� JSON ��ü�� �߰�
	  };

	  // ������ �����͸� �����ϴ� Ajax ��û�� �����ϴ�.
	  $.ajax({
	    url: '/user/json/emailCheck', // �鿣�� ������ API ��������Ʈ �ּ�
	    method: 'POST',
	    data: JSON.stringify(emailData), // JSON �����ͷ� ��ȯ�Ͽ� ����
	    contentType: 'application/json', // JSON �����͸� �����Ѵٰ� ���
	    success: function (response) {
	      // ���� �� ����
	      console.log('������ ���� ����:', response);
	      
	      if(response.userId == null){
	    	  //console.log('null��');
	    	  alert("ȸ���� �ƴմϴ�. �������ּ���.")
	    	 // $(window.parent.frames["rightFrame"].document.location).attr("href","../user/addUserView.jsp");
	    	  window.location.href = 'http://localhost:8080/user/addUserView.jsp';
	    	  
	      } else if(response.userId != null) {
	    	  console.log('null�� �ƴ�');
	    	  alert("�α��εǾ����ϴ�.")
	    	  window.location.href = 'http://localhost:8080/index.jsp';
	    	  
	      }

	    },
	    error: function (error) {
	      // ���� �� ����
	      console.log('������ ���� ����:', error);
	    }
	  });
	}

</script>

	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Lunch Box</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->	
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
		<!--  row Start /////////////////////////////////////-->
		<div class="row">
		
			<div class="col-md-6">
					<img src="/images/lunchbox.jpg" class="img-rounded" width="100%" />
			</div>
	   	 	
	 	 	<div class="col-md-6">
	 	 	
		 	 	<br/><br/>
				
				<div class="jumbotron">	 	 	
		 	 		<h1 class="text-center">�� &nbsp;&nbsp;�� &nbsp;&nbsp;��</h1>

			        <form class="form-horizontal">
		  
					  <div class="form-group">
					    <label for="userId" class="col-sm-4 control-label">�� �� ��</label>
					    <div class="col-sm-6">
					      <input type="text" class="form-control" name="userId" id="userId"  placeholder="���̵�" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="password" class="col-sm-4 control-label">�� �� �� ��</label>
					    <div class="col-sm-6">
					      <input type="password" class="form-control" name="password" id="password" placeholder="�н�����" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-6 text-center">
					      <button type="button" class="btn btn-primary"  >�� &nbsp;�� &nbsp;��</button>
					      <a class="btn btn-primary btn" href="#" role="button">ȸ &nbsp;�� &nbsp;�� &nbsp;��</a>
					    </div>
					  </div>
					  <div>
					          <button type="button" class="kakaoLogin" onclick="kakaoLogin();" ></button>
					          
					         <div id="naver_id_login"></div> 

					</div>
					</form>
			   	 </div>
			
			</div>
			
  	 	</div>
  	 	<!--  row Start /////////////////////////////////////-->
  	 	
 	</div>
 	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
<script>

	        var naver_id_login = new naver_id_login("igomuMoiXz2Au79qZzXU", "http://localhost:8080/user/loginView.jsp");
	        var state = naver_id_login.getUniqState();
	        naver_id_login.setButton("white", 2,40);
	        naver_id_login.setDomain("http://localhost:8080/user/loginView.jsp");
	        naver_id_login.setState(state);
	        naver_id_login.setPopup();
	        naver_id_login.init_naver_id_login();
	        
	       // var naver_id_login = new naver_id_login("YOUR_CLIENT_ID", "YOUR_CALLBACK_URL");
	        // ���� ��ū �� ���
	        console.log(naver_id_login.oauthParams.access_token);
	        // ���̹� ����� ������ ��ȸ
	        naver_id_login.get_naver_userprofile("naverSignInCallback()");
	        // ���̹� ����� ������ ��ȸ ���� ������ ������ ó���� callback function
	        function naverSignInCallback() {
	          console.log(naver_id_login.getProfileData('email'));
	          console.log(naver_id_login.getProfileData('name'));
	          email = naver_id_login.getProfileData('email');
	          sendEmailToServer(email);
	          
	        }
	    </script>

</body>

</html>