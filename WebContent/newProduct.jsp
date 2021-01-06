<!DOCTYPE html>
<html>
<head>
<title>Add new product</title>
</head>
<body>
<%@ page trimDirectiveWhitespaces="true" import="java.sql.*,java.io.*" %><%@ include file="jdbc.jsp" %>
<%
Int prdid= request.getParameter("productId");
String prdname = request.getParameter("productName");
Decimal prdprice = request.getParameter("productPrice");
String prdimgurl = request.getParameter("productImageURL");
binary prdimg = request.getParameter("productImage");
String prddesc = request.getParameter("productDesc");
Int catgid = request.getParameter("categoryId");

String sql = "insert into product values( prdid, "prdname", prdprice, "prdimgurl", prdimg, "prddesc", catgid )";
try
{
	getConnection();
	pstmt = con.prepareStatement(sql);   	   			
   	pstmt.executeUpdate();
}
catch (SQLException ex) 
{ 	out.println(ex); 
}
finally
{	
	closeConnection();	
}
%>