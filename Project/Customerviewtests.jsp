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
<th style="color:purple">Test ID</th>
<th style="color:purple">Test Name</th>
<th style="color:purple">Hospital Name</th>
<th style="color:purple">Hospital Number</th>
</tr>
<%

Connection con = null;
Class.forName("com.mysql.jdbc.Driver");

con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epskill","root","root");
 
 PreparedStatement pstmt = con.prepareStatement("select * from test");
ResultSet rs = pstmt.executeQuery();
 while(rs.next())
{
  %>
  <tr bgcolor="lightblue">
  <td><%=rs.getString("id")%></td>
  <td><%=rs.getString("tname")%></td>
  <td><%=rs.getString("hospname")%></td>
  <td><%=rs.getString("hopsnumber")%></td>
  </tr>

  <%
}

%>
  </table>

	</body>
</html>
