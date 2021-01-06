<!DOCTYPE html>
<html>
<head>
<title>Customer Page</title>
<style> td {
    border: 1px solid black;
    padding-left: .5em;
    padding-right: .5em;
  }
  table {
	border: 1px solid black;
    margin: .3em;
    width: 290px;
  }
  </style>
</head>
<body>

<%@ include file="auth.jsp" %> 
<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>
<%@ page import = "java.util.ArrayList" %>

<%
	 String userName = (String) session.getAttribute("authenticatedUser");
	String header = "Inventory";
	String warehousename = "Warehouse Name";
		
String url = "jdbc:sqlserver://db:1433;DatabaseName=tempdb;";
	String uid = "SA";
	String pw = "YourStrong@Passw0rd";
	ArrayList<String> list = new ArrayList<>();
	


%>

<%

// TODO: Print Customer information
// Write a SQL that can retrieve all information about a user
// 1) Check is userName refers to the customerId?
// 2) Check DDL for various information to see which tables you need to get the information from 
String sql = "SELECT warehouseName, productName  FROM warehouse JOIN productinventory ON warehouse.warehouseId=productinventory.warehouseId JOIN product ON productinventory.productId=product.productId ";
try ( Connection con = DriverManager.getConnection(url, uid, pw);) 
	{ PreparedStatement pstmt = con.prepareStatement(sql);	
	ResultSet rst = pstmt.executeQuery();
	out.print("<h1>"+ header + "</h1>");
	int j = 2; 
	if (rst.next()) {
		out.println("<table><tr><td><b>" + rst.getString(1) + "</td><tr>");
	for (int i = 2 ; i <= 11; i ++) {
		out.println("<tr><td><b>" + rst.getString(i) + "</td><tr>");
	}
	out.println("</table>");
}
	}
catch (SQLException ex)
	{ out.println(ex);
	}	

// Make sure to close connection
%>

</body>
</html>