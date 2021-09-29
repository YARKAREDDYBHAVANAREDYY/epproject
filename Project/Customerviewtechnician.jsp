<%@ page import="java.sql.*" %>

<html>
    <head>
        <title>View User</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
    </head>
    <body>
    <!-- Header -->
			<header id="header">
				<div class="inner">
					<a href="Customerhome.jsp" class="logo">Health Care Logistics</a>
					<nav id="nav">
						<a href="Home.html">Home</a>
						<a href="Home.html">Logout</a>
					</nav>
				</div>
			</header>
			<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>
<table>
<tr align="center" bgcolor="Aqua">
<th style="color:purple">Uname</th>
<th style="color:purple">Email</th>
<th style="color:purple">address</th>
<th style="color:purple">Mobile no</th>
<th style="color:purple">Available From</th>
<th style="color:purple">Available To</th>
<th style="color:purple">Charge</th>
<th style="color:purple">Book</th>
</tr>
<%

Connection con = null;
Class.forName("com.mysql.jdbc.Driver");

con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epskill","root","root");
 
 PreparedStatement pstmt = con.prepareStatement("select * from techregister");
ResultSet rs = pstmt.executeQuery();
 while(rs.next())
{
  %>
  <tr bgcolor="lightblue">
  <td><%=rs.getString("uname")%></td>
  <td><%=rs.getString("email")%></td>
  <td><%=rs.getString("addr")%></td>
  <td><%=rs.getString("mob")%></td>
  <td><%=rs.getString("availfrom")%></td>
  <td><%=rs.getString("availto")%></td>
  <td><%=rs.getString("charge")%></td>
  <td><a href="Customerbooktechnician.html">Book</a>
     </tr>

  <%
}

%>
  </table>

	</body>
</html>
