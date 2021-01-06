<%@ page import="java.util.HashMap" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp" %>
<%@ page import="java.sql.*,java.util.Locale" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
        <title>Review Page</title>
</head>
<body>

<form name="MyForm" method="post" action="productReview.jsp">
<table style="display:inline">
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Review:</font></div></td>
	<td><input type="text" name="reviewcomment"  size=1000 maxlength=1000></td>
</tr>
</table>

<H1 align="center"><font face="cursive" color="#3399FF"><a href="index.jsp">Return to Home Page</a></H1> 
<%
String review = request.getParameter("review");
out.println("<h1>Review product for " + review + "</h1>");

HashMap<String, ArrayList<Object>> reviewList = (HashMap<String, ArrayList<Object>>) session.getAttribute("reviewList");

if (reviewList == null) {
    reviewList = new HashMap<String, ArrayList<Object>>();
    session.setAttribute("reviewList", reviewList);
}




%>