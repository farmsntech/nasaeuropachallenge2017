<%@page import="java.util.List"%>
<%@page import="com.farmsntech.FarmerUtils"%>
<%@page import="com.farmsntech.Farmer"%>
<%@page import="com.farmsntech.db.DbUtils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<%

try{

	List<Farmer> list1=null;
	
	list1 = FarmerUtils.selectfarmer(request, response);
		int fid=0;
		long mobile=0;
	
for (Farmer farmer: list1){
	fid=farmer.getFid();
	mobile=farmer.getMobile();
	
}
session.setAttribute("fid",fid);
session.setAttribute("mobile",mobile);
int a=(Integer)session.getAttribute("fid");
System.out.println(a);
response.sendRedirect("mainpage.jsp"); 
	


}
catch(Exception sqe)
{
out.println(sqe);
} 

%>
</body>
</html>
