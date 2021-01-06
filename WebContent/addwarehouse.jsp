<%@ page language="java" import="java.io.*,java.sql.*"%>
<%@ include file="jdbc.jsp" %>
<%
String warhouseID = request.getParameter("warehouseId")
String warhousename = request.getParameter("warehouseName")

String sql = "Insert into warehouse VALUES (? , ?)"

try{
    getConnection();
	PreparedStatement ptsmt = con.prepareStatement(sql);
    ptsmt.setInt(1,warhouseID);
    ptsmt.setString(2,warhousename);
	ptsmt.executeUpdate(); 
}
catch (SQLException ex) 
{ 	out.println(ex); 
}
finally
{	
	closeConnection();	
}
%>