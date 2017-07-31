<%@page import="com.farmsntech.FarmerUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
int no=Integer.parseInt(request.getParameter("otp"));
int one= (Integer)session.getAttribute("onetime");
if(no==one)
	{ FarmerUtils.insertfarmer(request,response);
	}
else
{%>
	<h2>Entered OTP was wrong.Kindly signup again!!!!</h2>
	<a href="signup.html">signup</a><%} %>





<body>

</body>
</html>