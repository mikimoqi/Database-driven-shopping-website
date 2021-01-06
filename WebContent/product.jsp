<%@ page import="java.util.HashMap" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.sql.*,java.util.Locale" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp" %>

<html>
<head>
<title>MAJiK- Product Information</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	

<%@ include file="header.jsp" %>
<table>
	<h1><font face="cursive" color="#3399FF"><tr><th><a href="index.jsp">MAJiK Home </a></th><th> &nbsp;</th><th> &nbsp;</th><th> &nbsp;</th><th><a href="listprod.jsp">Products</a></th><th> &nbsp;</th><th> &nbsp;</th><th> &nbsp;</th><th><a href="login.jsp">Login</a></th></tr></font>
</table>


<%
// Get product name to search for
// TODO: Retrieve and display info for the product
 String productId = request.getParameter("id");
 //String productName = request.getParameter("productName");
 //String productPrice = request.getParameter("price");   

 boolean hasParameter = false;
	String sql = "SELECT productId, productName, productPrice, productImageURL, productImage, categoryName FROM Product JOIN Category ON Product.categoryId = Category.categoryId  WHERE productId = ?";;

	if (productId == null)
		productId = "";

	if (productId.equals("")) 
	{
		out.println("<h2>All Products</h2>");
		sql = "SELECT productId, productName, productPrice, categoryName FROM Product JOIN category ON Product.categoryId = category.categoryId";
	} 
	else 
	{
		//out.println("<h2>Products containing '" + productId + " "+productName+"'</h2>");
		hasParameter = true;
		sql = "SELECT productId, productName, productPrice, productImageURL,categoryName, productDesc FROM Product JOIN category ON Product.categoryId = category.categoryId WHERE productId LIKE ?";
        
    }
    String url = "jdbc:sqlserver://db:1433;DatabaseName=tempdb;";
	String uid = "SA";
	String pw = "YourStrong@Passw0rd";
	NumberFormat currFormat = NumberFormat.getCurrencyInstance(Locale.US);

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
		if (hasParameter)
			pstmt.setString(1, productId);
			
            

		ResultSet rst = pstmt.executeQuery();
      
          
		while (rst.next()) 
		{
			
			out.println("<h2>"+rst.getString(2)+"</h2>");
			//out.print("<img src=" + '"' + rst.getString(4) + '"' + ">"); 
			//out.print("<img src=\"displayImage.jsp?id=" + rst.getInt(1) + "\" >");
			String imageLoc = rst.getString(4);
		if (imageLoc != null)
			out.println("<img src=\""+imageLoc+"\">");
			

			out.print("<br>");
			out.print("<br>");
			out.println("ID : "  +rst.getInt(1)+ "<br>");
			//<br>
			out.println("Price :" +currFormat.format(rst.getDouble(3))+ "<br>");
			out.println(rst.getString(6));
			out.print("<h3><a href=\"addcart.jsp?id=" + rst.getInt(1) + "&name=" + rst.getString(2) 
				+ "&price=" + rst.getDouble(3) + "\">Add To Cart</a></h3>");
			out.print("<h5><a href =\"listprod.jsp?categoryName=" +rst.getString(5)+ "\">Here are some other products that may interest you</a></h5>");
			
			
			      
           
		}
		
		
              
       
	} 
	catch (SQLException ex) 
	{
		out.println(ex);
    } 
    
	

//String sql = "";

// TODO: If there is a productImageURL, display using IMG tag
//out.print("<img src="1.jpg">");
//out.print("<"img/1.jpg">");		
// TODO: Retrieve any image stored directly in database. Note: Call displayImage.jsp with product id as parameter.



		
// TODO: Add links to Add to Cart and Continue Shopping
//<h3><a href="addcart.jsp?id=1&name=Chai&price=18.0">Add to Cart</a></h3>
//out.println("<h2><a href=\"addcart.jsp?id=1&name=Chai&price=18.0\">Add To Cart</a></h2>");


%>

      
          
		

<H3><a href="listprod.jsp">Continue Shopping</a></H3>
		
</body>
</html>

