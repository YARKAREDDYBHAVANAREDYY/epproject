<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1"> 
<title>booking</title>
</head>
<body>
<%
String userid= request.getParameter("tname");
String date= request.getParameter("date");
String address= request.getParameter("add");
String mobile= request.getParameter("mob");
try{

Connection con = null;
Class.forName("com.mysql.jdbc.Driver");
System.out.println("Driver Class Loaded ");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epskill","root","root");
System.out.println("Connection Established");
PreparedStatement pstmt = con.prepareStatement("insert into bookings values(?,?,?,?) ");
pstmt.setString(1,userid);
pstmt.setString(2,date);
pstmt.setString(3,address);
pstmt.setString(4,mobile);

int n=pstmt.executeUpdate();
if(n>0){
  %>
  <h3 align=center>Booked Successfully</h3><br>
    <a href="Customerhome.html">Home</a>
  <% 
}
else{
%>
<h3 align=center>Booking failed</h3><br>
<a href="Customerbooktechnician.html">Try booking again</a>
<%
} 
}
catch(Exception e){
  System.out.println(e);
  
}
%>