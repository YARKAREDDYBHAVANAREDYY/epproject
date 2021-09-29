<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1"> 
<title>view</title>
</head>
<body>
<%

try{
String userid= request.getParameter("id");
Connection con = null;
Class.forName("com.mysql.jdbc.Driver");
System.out.println("Driver Class Loaded ");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epskill","root","root");
System.out.println("Connection Established");
PreparedStatement pstmt = con.prepareStatement("delete from techregister where uname=(?) ");
pstmt.setString(1,userid);
pstmt.executeUpdate();
response.sendRedirect("viewtechnician.jsp");

}
catch(Exception e){
  System.out.println(e);
  
}
%>