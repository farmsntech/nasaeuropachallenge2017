<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<html><head>
<script>
var check = function() {
  if (document.getElementById('password').value ==
    document.getElementById('confirm_password').value) {
    document.getElementById('message').style.color = 'green';
    document.getElementById('message').innerHTML = 'matching';
  } else {
    document.getElementById('message').style.color = 'red';
    document.getElementById('message').innerHTML = 'not matching';
  }
}</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="otp.jsp">

Mobile no:<input type="integer" name="mobile" placeholder="mobile"></input><br>
<label>password :
  <input name="password" id="password" type="password" onkeyup='check();'/>
</label>
<br>
<label>confirm password:
  <input type="password" name="confirm_password" id="confirm_password" onkeyup='check();' />
  <span id='message'></span>
</label><br>
<input type="submit">

</form>
</body>
</html>