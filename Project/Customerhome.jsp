<%@ page import="java.sql.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><!DOCTYPE HTML>

	<head>
		<title>Customer home page</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body>
	<%
String unm=(String)session.getAttribute("uid");

if(unm==null)
{
  response.sendRedirect("Home.html");
}
%>


		<!-- Header -->
			<header id="header">
				<div class="inner">
					<a href="Customerhome.jsp" class="logo">Health Care Logistics</a>
					<nav id="nav">
						<a href="Home.html">Home</a>
						<a href="Customerviewbills.jsp">View Bills</a>
<%


Connection con = null;
Class.forName("com.mysql.jdbc.Driver");
System.out.println("Driver Class Loaded ");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epskill","root","root");
System.out.println("Connection Established");
PreparedStatement pstmt = con.prepareStatement("select * from registration");
ResultSet rs=pstmt.executeQuery();


while(rs.next())
{
	%>

						<a href="profile.jsp?id=<%=rs.getString("uname")%>">Profile</a>
						<a href="logout.jsp">Logout</a>
<% 
}
%>
					</nav>
				</div>
			</header>
			<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>

		<!-- Banner -->
			<section id="banner">
				<div class="inner">
					<h1 align = "center">WELCOME CUSTOMER<span><br /><br />
					</span></h1>
				</div>
			</section>


		
		<!-- Two -->
			<section id="two">
				<div class="inner">
					<article>
						<div class="content">
							<header>
								<h3></h3>
							</header>
							<div class="image fit">
								<img src="https://d3tl80hy6t5toy.cloudfront.net/wp-content/uploads/sites/6/2017/08/23150804/Health-Informatics-Tech.jpg" alt="" />
							</div>
							<ul class="actions">
								<li><a href="Customerviewtechnician.jsp" class="button alt">VIEW TECHNICIAN</a></li>
							</ul>
						</div>
					</article>
					<article class="alt">
						<div class="content">
							<header>
								<h3></h3>
							</header>
							<div class="image fit">
								<img src="https://i.pinimg.com/originals/a5/7c/4e/a57c4ef5a4b53afa16c7b7ea43b5d69e.jpg" alt="" />
							</div>
							<ul class="actions">
								<li><a href="Customerviewtests.jsp" class="button alt">VIEW TESTS</a></li>
							</ul>
						</div>
					</article>
				</div>
			</section>


		<!-- Footer -->
			<section id="footer">
				<div class="inner">
					<header>
						<h2>ASK US</h2>
					</header>
					<form method="post" action="#">
						<div class="field half first">
							<label for="name">Name</label>
							<input type="text" name="name" id="name" />
						</div>
						<div class="field half">
							<label for="email">Email</label>
							<input type="text" name="email" id="email" />
						</div>
						<div class="field">
							<label for="message">Message</label>
							<textarea name="message" id="message" rows="3"></textarea>
						</div>
						<ul class="actions">
							<li><input type="submit" value="Send query" class="alt" /></li>
						</ul>
					</form>
					
				</div>
			</section>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>