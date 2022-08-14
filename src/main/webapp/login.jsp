<%@ page import="java.sql.*"%>

<%
 String userName = request.getParameter("userName"); 
 
 String password = request.getParameter("password"); 
 
 Class.forName ("com.mysql.jdbc.Driver"); 
 Connection con = DriverManager.getConnection("jdbc:mysql://artimysqljava.mysql.database.azure.com:3306/artiuser?useSSL=false&requireSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "arti@artimysqljava", "A@Rt1CoR3!");
 Statement st = con.createStatement(); 
 ResultSet rs; 
 rs = st.executeQuery("select * from USER where username='" + userName + "' and password='" + password + "'");
	if (rs.next()) 
		{ 
			session.setAttribute("userid", userName); 
			response.sendRedirect("success.jsp"); 
		} 
	else 
		{ 
			out.println("Invalid password <a href='index.jsp'>try again</a>"); 
} 
%>
