<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="Refresh" content="5,url=Managerlogin.html">
<title>Manager Login</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%

String email = request.getParameter("uname");
String pwd = request.getParameter("pwd");

if(email.equals("admin") && pwd.equals("system")){
	response.sendRedirect("Managerhome.html");
}
else{
	response.sendRedirect("Managerlogin.html");
}



%>
</body>
</html>