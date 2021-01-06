<%@ page language="java" import="java.io.*,java.sql.*"%>
<%@ include file="jdbc.jsp" %>
<%
	String authenticatedUser = null;
	session = request.getSession(true);
	try
	{
		authenticatedUser = validateLogi(out,request,session);
	}
	catch(IOException e)
	{	System.err.println(e); }
	if(authenticatedUser != null)
		response.sendRedirect("admin.jsp");	// Successful login
	else
		response.sendRedirect("adminlogin.jsp");		// Failed login - redirect back to login page with a message 
%>


<%!
	String validateLogi(JspWriter out,HttpServletRequest request, HttpSession session) throws IOException
	{
		String username = request.getParameter("username1");
		String password = request.getParameter("password1");
		String retStr = null;
		if(username == null || password == null)
				return null;
		if((username.length() == 0) || (password.length() == 0))
				return null;
		// Could make a database connection here and check password but for now just checking for single password
		String url = "jdbc:sqlserver://db:1433;DatabaseName=tempdb;";
			String uid = "SA";
			String pw = "YourStrong@Passw0rd";
	

		try (Connection con = DriverManager.getConnection(url, uid, pw);
			Statement stmt = con.createStatement();) {
			
			// Make database connection
			String query = "SELECT userid, password FROM customer WHERE userid = 'admin1ad' AND password = '1adadmin'";
			ResultSet rst = stmt.executeQuery(query);
			if (rst.next())
				retStr = username;
		}
		catch(SQLException e)
		{	out.println(e);}

		if(retStr != null)
		{	session.removeAttribute("loginMessage");
			session.setAttribute("authenticatedUser", username);
		}
		else 
			session.setAttribute("loginMessage","Could not connect to the system using that username/password.");
		return retStr;
	}
%>
