<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="Refresh" content="5,url=Technicianlogin.html">
<title>Login</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%

String email = request.getParameter("uname");
String pwd = request.getParameter("pwd");

try
{
	 Class.forName("com.mysql.jdbc.Driver");
	 
	 Connection con = null;
	 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epskill","root","root");  
	  PreparedStatement pstmt = con.prepareStatement("select * from techregister where uname=? and pwd=?");
	  pstmt.setString(1,email);
	  pstmt.setString(2,pwd);
	  ResultSet rs = pstmt.executeQuery();
	  if(rs.next())
	  {
		 response.sendRedirect("Technicianhome.html");
	  }
	  else
	  {
		  %>
		  <script>
		  alert("Invalid Login Try again")
		  </script>
			<%
			response.sendRedirect("Technicianlogin.html");
	  }
}
catch(Exception e)
{
	out.println(e);
}



%>
</body>
</html>