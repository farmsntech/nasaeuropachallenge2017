<%@page import="com.farmsntech.crop.reading"%>
<%@page import="com.farmsntech.Temp"%>
<%@page import="com.farmsntech.crop.Prediction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
 String a=request.getParameter("name"); 
  int b=Integer.parseInt(request.getParameter("canal")); 
  int c= Integer.parseInt(request.getParameter("crop")); 
   int d=Integer.parseInt(request.getParameter("stage")); 
   
String message= Prediction.predict(a,b,c,d); 
%>


<%=message %>

<%-- <%Temp.add(); %> --%>
<%-- <%reading.read(); %> --%>

</body>
</html>