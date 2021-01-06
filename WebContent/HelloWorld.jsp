<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.NumberFormat" %>


<!DOCTYPE html>
<html>
<head>
   
<title>Hello World in JSP</title>
</head>
<body>
    <style>
		table, th, td {
		  border: 1px solid black;
		}
		</style>

    <% 
     String url = "jdbc:sqlserver://db:1433;DatabaseName=tempdb;";
	 String uid = "SA";
	 String pw = "YourStrong@Passw0rd";
    try 
    {	// Load driver class
        Class.forName("com.mysql.jdbc.Driver");
    }
    catch (java.lang.ClassNotFoundException e) {
        System.err.println("ClassNotFoundException: " +e);	
    }
    try ( Connection con = DriverManager.getConnection(url, uid, pw);
          Statement stmt = con.createStatement();) 
    {		
        ResultSet rst = stmt.executeQuery("SELECT orderId,orderDate,customer.customerId, (firstname + ' ' + lastname) AS cutomerName, totalAmount FROM ordersummary JOIN customer ON ordersummary.customerId=customer.customerId");	
        NumberFormat currFormat = NumberFormat.getCurrencyInstance(Locale.CANADA);
        //currFormat.setCurrency(Currency.getInstance(Locale.CANADA)); 
        
        while (rst.next())
        {	
            out.println("<table  ><tr><th>orderId</th><th>Order Date</th><th>CustomerId</th><th>Customer Name</th><th>Total Amount</th></tr>");
            int ordnum = rst.getInt(1);
            out.println("<tr><td>"+ordnum+"</td>"+" <td>"+rst.getDate(2)+" "+" "+rst.getTime(2)+"</td>"+"<td>"+rst.getInt(3)+" </td>"+" <td>"+rst.getString(4)+"</td>  "+" <td>"+currFormat.format(rst.getDouble(5))+"</td></tr>");
            //out.println("<tr style=text-align: right>");
        Statement stmt2 = con.createStatement();
        ResultSet rst2 = stmt2.executeQuery("SELECT productId, quantity, price FROM orderproduct WHERE orderId =" + ordnum);
       out.println("<tr> <td colspan=5>");
        out.println("<table align = right  ><tr><th>Product ID</th> <th>Quantity</th> <th>Price</th></tr>");
        

        while(rst2.next())
        { out.println("<tr><td>"+rst2.getInt(1)+"</td>"+" <td>"+rst2.getInt(2)+"</td> "+" <td>"+currFormat.format(rst2.getDouble(3))+"</td></tr>");}
        
       //out.println("</td>");
       out.println("</tr>");
        out.println("</table>");
        out.println("</td></tr>");
        }

       
        out.println("</table>");
        con.close();
    } 
    catch (SQLException ex) 
    { 	out.println(ex); 
    }
    %>

</body>
</html>