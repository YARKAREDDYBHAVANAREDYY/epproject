<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1"> 
<meta http-equiv="Refresh" content="5;url=login.html">
<title>register</title>
</head>
<body>
<%
String userid= request.getParameter("uname");
String email= request.getParameter("mail");
String address= request.getParameter("add");
String mobile= request.getParameter("mob");
String pwd= request.getParameter("pwd");
String cpwd= request.getParameter("cpwd");
try{

Connection con = null;
Class.forName("com.mysql.jdbc.Driver");
System.out.println("Driver Class Loaded ");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epskill","root","root");
System.out.println("Connection Established");
PreparedStatement pstmt = con.prepareStatement("insert into registration values(?,?,?,?,?,?) ");
pstmt.setString(1,userid);
pstmt.setString(2,email);
pstmt.setString(3,address);
pstmt.setString(4,mobile);
pstmt.setString(5,pwd);
pstmt.setString(6,cpwd);

int n=pstmt.executeUpdate();
if(n>0){
  %>
  <h3 align=center>Registered Successfully</h3><br>
    <a href="Customerlogin.html">Login</a>
  <% 
}
else{
%>
<h3 align=center>Registration failed</h3><br>
<a href="Customerregister.html">Try register again</a>
<%
} 
}
catch(Exception e){
  System.out.println(e);
  
}
%>