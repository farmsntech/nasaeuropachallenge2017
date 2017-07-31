<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
	  url : "http://api.textlocal.in/send/?username=ankuragrawal72@gmail.com&hash=970b3ad8544816b36d877db24ed61fb0e44c439044224a355f4632eab7fabead&sender=TXTLCL&numbers=+91"+<%=number%>+"&message=Your One Time Password is"+<%=n%>,
		  dataType : "jsonp",
		  success : function(parsed_json) {
		  	var temp = parsed_json['balance'];
			alert(temp);
			
		  }
	  });
	});</script>
	<%=number%>
	<%=n%>
<form action="registration.jsp">

Enter otp:<input type="integer" name="otp"/>
<input type=submit>

</form>
	


<body>

</body>
</html>