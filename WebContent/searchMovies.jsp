<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BB's Movie Database</title>
<style>
body {
		background-image:url("https://source.unsplash.com/random");
}
</style>

</head>

<body>
	<h2>Welcome to BB's Movie Database</h2>
	<form action="searchMovies.jsp" method="get">

		<h3>Search movies by category:</h3>
		<select name="category">
			<option disabled selected value=>-- select an option --</option>
			<option value="action">Action</option>
			<option value="animated">Animated</option>
			<option value="comedy">Comedy</option>
			<option value="drama">Drama</option>
		</select> <input type="submit" value="Submit">
	</form>

	<br>

	<h3>Search results:</h3>

	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection cnn = DriverManager.getConnection("jdbc:mysql://localhost:3306/MoviesDB", "root", "password");

		String category = request.getParameter("category");

		PreparedStatement stmt = cnn
				.prepareStatement("select title from movies where category = '" + category + "'");
		ResultSet rs = stmt.executeQuery("select title from movies where category = '" + category + "'");
		
		while (rs.next() == true) { //Checks and advances while there are rows.
	%>
	<p>
		<%=rs.getString(1)%>
	</p>
	<%
		}
	%>