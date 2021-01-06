<!DOCTYPE html>
<html>
<head>
        <title>MAJiK Main Page</title>
</head>
<body>
<h1 align="center">Welcome to MAJiK</h1>

<h2 align="center"><a href="login.jsp">Login</a></h2>

<h2 align="center"><a href="listprod.jsp">Begin Shopping</a></h2>

<h2 align="center"><a href="listorder.jsp">List All Orders</a></h2>

<h2 align="center"><a href="customer.jsp">Customer Info</a></h2>

<h2 align="center"><a href="admin.jsp">Administrators</a></h2>

<h2 align="center"><a href="review.jsp"> Review a Product</a></h2>

<h2 align="center"><a href="editaccount.jsp"> Edit Your Account Information</a></h2>

<h2 align="center"><a href="logout.jsp">Log out</a></h2>
<h2 align="center"><a href="warehouseinvin.jsp">Inventory in each Warehouse</a></h2>
<h2 align="center"><a href="showcart.jsp">View Cart</a></h2>
<h2 align="center"><a href="adminlogin.jsp">Administrators Login</a></h2>



<%
// TODO: Display user name that is logged in (or nothing if not logged in)

String userName = (String) session.getAttribute("authenticatedUser");
	if (userName != null)
		out.println("<h4 align=\"right\">Signed in as: "+userName+"</h4>");	
%>
</body>
</head>


