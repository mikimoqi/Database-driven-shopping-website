
<%@ page trimDirectiveWhitespaces="true" import="java.sql.*,java.io.*" %>
<%@ include file="jdbc.jsp" %>
<% 
int prdid = request.getParameter("productId");
String sql = "delete from product where productId = ?";
try{
	getConnection();
	prepareStatement ptsmt = con.prepareStatement(sql);
	ptsmt.setInt(1,prdid)
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