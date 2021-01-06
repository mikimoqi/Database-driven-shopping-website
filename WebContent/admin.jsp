<!DOCTYPE html>
<html>
<head>
<title>Administrator Page</title>
</head>
<body>

<%@ include file="../auth.jsp"%>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>

//Checks if user is logged in
<%
	String userName = (String) session.getAttribute("authenticatedUser");
%>


<%
// Print out total order amount by Day 
String sql = "select year(orderDate), month(orderDate), day(orderDate), SUM(totalAmount) FROM OrderSummary GROUP BY year(orderDate), month(orderDate), day(orderDate)";

NumberFormat currFormat = NumberFormat.getCurrencyInstance();

try 
{	
	out.println("<h3>Administrator Sales Report by Day</h3>");
	
	getConnection();
	ResultSet rst = con.createStatement().executeQuery(sql);		
	out.println("<table class=\"table\" border=\"1\">");
	out.println("<tr><th>Order Date</th><th>Total Order Amount</th>");	

	while (rst.next())
	{
		out.println("<tr><td>"+rst.getString(1)+"-"+rst.getString(2)+"-"+rst.getString(3)+"</td><td>"+currFormat.format(rst.getDouble(4))+"</td></tr>");
	}
	out.println("</table>");		
}
catch (SQLException ex) 
{ 	out.println(ex); 
}
finally
{	
	closeConnection();	
}
%>

<%
//List all customers
String sql = "select customerId, firstName, lastName, email, phonenum, address, city, state, postalCode, country, userid, password FROM Customer "

try
{
   out.println("<h3>Customer List</h3>");

   getConnection();
   ResultSet custolist = con.createstatement().executeQuery(sql);
   out.println("<table class=\"table\" border=\1\">");
   out.println("<tr><th>Customer ID</th><th>First Name</th><th>Last Name</th><th>Email</th><th>Phone Number</th><th>Address</th><th>City</th><th>State</th><th>Postal Code</th><th>Country</th><th>User ID</th><th>Password</th></tr>")
   
   while (rst.next())
   {
	   out.println("<tr><td>"custolist.getString(1)"</td><td>"custolist.getString(2)"</td><td>"custolist.getString(3)</td><td>"custolist.getString(4)"</td><td>"custolist.getString(5)"</td><td>"custolist.getString(6)"</td><td>"custolist.getString(7)"</td><td>"custolist.getString(8)"</td><td>"custolist.getString(9)"</td><td>"custolist.getString(10)"</td><td>"custolist.getString(11)"</td><td>"custolist.getString(12)"</td></tr>")
   }
   out.println("</table>");		
}
catch (SQLException ex) 
{ 	out.println(ex); 
}
finally
{	
	closeConnection();	
}
%>

<h1>Add a new product</h1>
<form method="POST", action="newproduct.jsp">
	<table>
		<tr><td>"Enter Product Id:"</td><td><input type="number" name="productId" size="20"></td></tr>
		<tr><td>"Enter Product Price</td><td><input type="text" name="productPrice" size="20"></td></tr>
		<tr><td>"Enter Product Image URL:"</td><td><input type="text" name="productImageURL" size="20"></td></tr>
		<tr><td>"Upload Product Image:"</td><td><input type="file" name="productImage" size="20"></td></tr>
		<tr><td>"Add Product Description:"</td><td><input type="text" name="productDesc" size="20"></td></tr>
		<tr><td>"Category ID:"</td><td><input type="number" name="productId" size="20"></td></tr>
		<tr><td><input type="submit" value="Submit"></td><td><input type="reset" value="Reset"></td></tr>
	</table>
</form>



//delete product
<h1> Delete Product</h1> 
<form method="get" action="deleteproduct.jsp">
	<table>
		<tr><td>"Enter Product ID:"</td><td><input type="text" name="orderId" size="20"></td></tr>
		<tr><td><input type="submit" value="Submit"></td><td><input type="reset" value="Reset"></td></tr>
	</table>
</form>



<h1>Change order status/Ship order</h1>

<form method="POST" action="ship.jsp">
	<table>
		<tr><td>"Order ID:"</td><td><input type="text" name="orderId" size="20"></td></tr>
		<tr><td><input type="submit" value="Submit"></td><td><input type="reset" value="Reset"></td></tr>
	</table>
</form>

<h1>Add Warehouse</h1>
<form method="get" action = "addwarehouse.jsp">
	<table>
		<tr><td>"Enter New Warehouse ID :"</td><td><input type="number" name="warehouseId" size="20"></td></tr>
		<tr><td>"Enter New Warehouse Name:"</td><td><input type="text" name="warehouseName" size="20"></td></tr>
	</table>
</form>

<h1>Add Customer</h1>
<form method="POST" action="addcustomer.jsp">
	<table>
		<tr><td>"Customer ID:"</td><td><input type="text" name="customerId" size="20"></td></tr>
		<tr><td>"First Name:</td><td><input type="text" name="firstName" size="20"></td</tr>
		<tr><td>"Last Name:"</td><td><input type="text" name="lastName" size="20"></td></tr>	
		<tr><td>"Email:"</td><td><input type="text" name="email" size="20"></td></tr>
		<tr><td>"Phone Number:"</td><td><input type="text" name="phonenum" size="20"></td></tr>	
		<tr><td>"Address:</td><td><input type="text" name="address" size="20"></td></tr>
		<tr><td>"City:"</td><td><input type="text" name="city" size="20"></td></tr>
		<tr><td>"State:"</td><td><input type="text" name="state" size="20"></td</tr>
		<tr><td>"Postal Code:"</td><td><input type="text" name="postalCode" size="20"></td</tr>	
		<tr><td>"Country: "</td><td><input type="text" name="country" size="20"></td></tr>
		<tr><td>"User ID: "</td><td><input type="text" name="userid" size="20"></td></tr>		
		<tr><td>"Password: "</td><td><input type="text" name="password" size="20"></td></tr>
		<tr><td><input type="submit" value="Submit"></td><td><input type="reset" value="Reset"></td></tr>
	</table>
</form>


</body>
</html>

