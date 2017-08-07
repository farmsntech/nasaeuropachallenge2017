<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Sign-Up/Login Form</title>
  <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  
      <link rel="stylesheet" href="cssotp/style.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head>
<%
long number =  Long.parseLong(request.getParameter("mobile"));
String password = request.getParameter("password");
session.setAttribute("mobile",number);
session.setAttribute("password",password);

Random rand = new Random();
int  n = rand.nextInt(99999) + 11111;
   session.setAttribute("onetime",n);
%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script>
	jQuery(document).ready(function($) {
	  $.ajax({
	  url : "http://api.textlocal.in/send/?username=prasanthaitha11@gmail.com&hash=83df433ec3bb9e346575e5b9eb0eca85e85318e7624d64608254e6814081b508&sender=TXTLCL&numbers=+91<%=number%>&message=Your One Time Password is"+<%=n%>,
		  dataType : "jsonp",
		  success : function(parsed_json) {
		  	var temp = parsed_json['balance'];
			alert(temp);
			
		  }
	  });
	});</script>
	

<body>
  <div class="form">
      
      <ul class="tab-group">
        <li class="tab active"><a href="#signup">Sign Up</a></li>
        <li class="tab"><a href="#login">Log In</a></li>
      </ul>
      
      <div class="tab-content">
        <div id="signup">   
          <h1>Sign Up for Free</h1>
          <p style="color:#ffffff; font-size:20px;"> OTP has been sent successfully to <%=number %> </p>
          
          <form action="mainpage.jsp" method="post">
          
         

          
          
          
          <div class="field-wrap">
            <label>
              Enter OTP<span class="req">*</span>
            </label>
            <input type="password"required autocomplete="off"/>
          </div>
          
          <button type="submit" class="button button-block"/>SUBMIT OTP</button>
          
          </form>

        </div>
        
        <div id="login">   
          <h1>Welcome Back!</h1>
          
          <form action="/" method="post">
          
            <div class="field-wrap">
            <label>
              Mobile No<span class="req">*</span>
            </label>
            <input type="int"required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input type="password"required autocomplete="off"/>
          </div>
          
          <p class="forgot"><a href="#">Forgot Password?</a></p>
          
          <button class="button button-block"/>Log In</button>
          
          </form>

        </div>
        
      </div><!-- tab-content -->
      
</div> <!-- /form -->
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    <script src="jsotp/index.js"></script>

<script>

    var check = function() {
  if (document.getElementById('password').value ==
    document.getElementById('confirm_password').value) {
    document.getElementById('message').style.color = 'black';
    document.getElementById('message').innerHTML = 'matching';
  } else {
    document.getElementById('message').style.color = 'red';
    document.getElementById('message').innerHTML = 'not matching';
  }
}

</script>

</body>
</html>