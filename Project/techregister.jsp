<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1"> 
<title>register</title>
</head>
<body>
<%
String userid= request.getParameter("uname");
String email= request.getParameter("email");
String address= request.getParameter("Add");
String mobile= request.getParameter("mob");
String availfrom= request.getParameter("Availfrom");
String availto= request.getParameter("Availto");
String pwd= request.getParameter("pwd");
String cpwd= request.getParameter("cpwd");
String charge= request.getParameter("charge");
try{

Connection con = null;
Class.forName("com.mysql.jdbc.Driver");
System.out.println("Driver Class Loaded ");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epskill","root","root");
System.out.println("Connection Established");
PreparedStatement pstmt = con.prepareStatement("insert into techregister values(?,?,?,?,?,?,?,?,?) ");
pstmt.setString(1,userid);
pstmt.setString(2,email);
pstmt.setString(3,address);
pstmt.setString(4,mobile);
pstmt.setString(5,availfrom);
pstmt.setString(6,availto);
pstmt.setString(7,pwd);
pstmt.setString(8,cpwd);
pstmt.setString(9,charge);

int n=pstmt.executeUpdate();
if(n>0){
  %>
     <h1>Registered Successfully"</h1>
     <%
  response.sendRedirect("Technicianlogin.html");
    
}
else{
	out.println("Registered failed");
	  response.sendRedirect("Technicianregister.html");
	    
	
} 
}
catch(Exception e){
  System.out.println(e);
  
}
%>