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
					    	  window.location.href = '../index.jsp';
					    	  
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
	    	  $(window.parent.frames["rightFrame"].document.location).attr("href","../user/addUserView.jsp");
	    	  
	      } else if(response.userId != null) {
	    	  console.log('null�� �ƴ�');
	    	  alert("�α��εǾ����ϴ�.")
	    	  window.location.href = '../index.jsp';
	    	  
	      }

	    },
	    error: function (error) {
	      // ���� �� ����
	      console.log('������ ���� ����:', error);
	    }
	  });
	}

	
//īī���α׾ƿ�  
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
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
		<!--  row Start /////////////////////////////////////-->
		<div class="row">
		
			<div class="col-md-6">
					<img src="/images/logo-spring.png" class="img-rounded" width="100%" />
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
						<!-- 
					      <a href="javascript:void(0)" onclick="kakaoLogout();">
					          <span>īī�� �α׾ƿ�</span>
					      </a>
						 -->
					</div>
					</form>
			   	 </div>
			
			</div>
			
  	 	</div>
  	 	<!--  row Start /////////////////////////////////////-->
  	 	
 	</div>
 	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>

</html>