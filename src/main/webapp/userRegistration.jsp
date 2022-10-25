<%@ page import="java.sql.*"%>
<% 
	String userName = request.getParameter("userName"); 
	String password = request.getParameter("password"); 
	String firstName = request.getParameter("firstName"); 
	String lastName = request.getParameter("lastName"); 
	String email = request.getParameter("email"); 
	Class.forName ( "com.mysql.jdbc.Driver"); 
	Connection con = DriverManager.getConnection("jdbc:mysql://testdb1:3306/artiuser?useSSL=false&requireSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "testuser", "root");
	Statement st = con.createStatement();
    Statement ct = con.createStatement();
	
	    
    ct.executeUpdate("create table if not exists USER(first_name varchar(255), last_name varchar(255), email varchar(255), username varchar(255), password varchar(255), regdate varchar(255), primary key (username))");
	int i = st.executeUpdate("insert into USER(first_name, last_name, email, username, password, regdate) values ('" + firstName + "','" + lastName + "','" + email + "','" + userName + "','" + password + "', CURDATE())");
	if (i > 0) { 
				response.sendRedirect("welcome.jsp"); 
			} 
	else { 
		response.sendRedirect("index.jsp"); 
		} 
%>
