<%@ page import="java.sql.*,java.util.Locale" %>    
<html>
<head>
<title>Ray's Grocery</title>
</head>
<body>
<h1>Enter your customer id and password to complete the transaction:</h1>


<%
	String userName = (String) session.getAttribute("authenticatedUser");
    if (userName != null) {
        String sql = "SELECT customerId, password FROM customer WHERE userid = ?";
		
	String url = "jdbc:sqlserver://db:1433;DatabaseName=tempdb;";
	String uid = "SA";
	String pw = "YourStrong@Passw0rd";
    int userId = 0;
    String pass = ""; 

	try
	{	// Load driver class
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	}
	catch (java.lang.ClassNotFoundException e)
	{
		out.println("ClassNotFoundException: " +e);
	}

	try ( Connection con = DriverManager.getConnection(url, uid, pw);) 
	{
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, "arnold");
        ResultSet rst = pstmt.executeQuery();
        while(rst.next()) {
        userId = rst.getInt(1);
        pass = rst.getString(2);
        }
        String url1 = "order.jsp?customerId=" + userId + "&password=" + pass;
        response.sendRedirect(url1);
    }

    catch (SQLException ex)
	{ 	out.println(ex);
	}	
    }
%>

<form method="get" action="order.jsp">
<table>
<tr><td>Customer ID:</td><td><input type="text" name="customerId" size="20"></td></tr>
<tr><td>Password:</td><td><input type="password" name="password" size="20"></td></tr>
<tr><td><input type="submit" value="Submit"></td><td><input type="reset" value="Reset"></td></tr>
</table>
</form>

<%
out.print("<h2>OR CHECK OUT USING PAYMENT INFO<h2>");

%>

<form method="get" action=order.jsp>
<table>
<tr><td>Payment ID:</td><td><input type="text" name="customerId" size="20"></td></tr>
<tr><td><input type="submit" value="Submit"></td><td><input type="reset" value="Reset"></td></tr>
</table>
</form>

</body>
</html>

