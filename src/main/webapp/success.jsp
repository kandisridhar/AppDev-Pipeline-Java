<% if ((session.getAttribute("userName") == null) || (session.getAttribute("userName") == "")) { %> 
Welcome <%=session.getAttribute("userid")%> <a href='logout.jsp'>Log out</a>
<%} else { %> 
You are not logged in<br/> <a href="index.jsp">Kindly Login</a> 

<% } %>
