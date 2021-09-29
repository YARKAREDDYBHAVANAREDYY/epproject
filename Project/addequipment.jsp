<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1"> 
<title>Add equipment</title>
</head>
<body>
<%
String eid= request.getParameter("eid");
String ename= request.getParameter("ename");
String hospname= request.getParameter("ehname");
String hospnumber= request.getParameter("enumber");
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/epskill","root","root");
System.out.println("connection established");
PreparedStatement pstmt = con.prepareStatement("insert into equipment values(?,?,?,?) ");
pstmt.setString(1,eid);
pstmt.setString(2,ename);
pstmt.setString(3,hospname);
pstmt.setString(4,hospnumber);
int n=pstmt.executeUpdate();
if(n>0){
	%>
	<h3 align=center>Equipment Added Successfully</h3><br>
	<a href="Addequipments.html">Add another Equipment</a>
	
	<% 
}
else{
%>
<h3 align=center>failed to add equipment</h3><br>
<a href="Addequipments.html">Try adding again</a>
<%
} 
}
catch(Exception e){
	System.out.println(e);
	
}


%>


</body>
</html>