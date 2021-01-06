<html>
<head>
<title>Hello Newuser</title>
</head>
<body>

    <div style="margin:5 auto;text-align:center;display:inline"></div>

    <h3>Create New Account</h3>
    
    <br>
    <form name="MyForm" method=post action="login.jsp">
    <table style="display:inline">
    <tr>
        <td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Firstname:</font></div></td>
        <td><input type="text" name="Firstname"  size=10 maxlength=10></td>
    </tr>
    <tr>
        <td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Lastname:</font></div></td>
        <td><input type="text" name="Lastname"  size=10 maxlength=10></td>
    </tr>
    <tr>
        <td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Email:</font></div></td>
        <td><input type="text" name="Email"  size=10 maxlength=10></td>
    </tr>
    <tr>
        <td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Phonenum:</font></div></td>
        <td><input type="text" name="Phonenum"  size=10 maxlength=10></td>
    </tr>
    <tr>
        <td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Address:</font></div></td>
        <td><input type="text" name="Address"  size=10 maxlength=10></td>
    </tr>
    <tr>
        <td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">City:</font></div></td>
        <td><input type="text" name="City"  size=10 maxlength=10></td>
    </tr>
    <tr>
        <td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">State:</font></div></td>
        <td><input type="text" name="State"  size=10 maxlength=10></td>
    </tr>
    <tr>
        <td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Postalcode:</font></div></td>
        <td><input type="text" name="Postalcode"  size=10 maxlength=10></td>
    </tr>
    <tr>
        <td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Country:</font></div></td>
        <td><input type="text" name="Country"  size=10 maxlength=10></td>
    </tr>
    <tr>
        <td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Userid:</font></div></td>
        <td><input type="text" name="Userid"  size=10 maxlength=10></td>
    </tr>
    <tr>
        <td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Password:</font></div></td>
        <td><input type="password" name="Password" size=10 maxlength="10"></td>
    </tr>
    </table>
    <br/>
    <input class="submit" type="submit" name="Submit2" value="Register">
    </form>
    </div>

    

    
	String orderdb_sql(JspWriter out,HttpServletRequest request, HttpSession session) throws IOException
	{
	String fname = request.getParameter("Firstname");
    String lname = request.getParameter("Lastname");
    String emai = request.getParameter("Email");
    String phone = request.getParameter("Phonenum");
    String add = request.getParameter("Address");
    String cit = request.getParameter("City");
    String stat = request.getParameter("State");
    String poco = request.getParameter("Postalcode");
    String cou = request.getParameter("Country");
    String usid = request.getParameter("Userid");
	String pword = request.getParameter("Password");
		

		try (Connection con = DriverManager.getConnection(url, uid, pw);)
		{
			String sql = "INSERT INTO customer (firstName, lastName, email, phonenum, address, city, state, postalCode, country, userid, password) VALUES ('?', '?', '?', '?', '?', '?', '?', '?', '?', '?' , '?')";
			PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1,fname);
            pstmt.setString(2,lname);
            pstmt.setString(3,emai);
            pstmt.setString(4,phone);
            pstmt.setString(5,add);
            pstmt.setString(6,cit);
            pstmt.setString(7,stat);
            pstmt.setString(8,poco);
            pstmt.setString(9,cou);
            pstmt.setString(10,usid);
            pstmt.setString(11,pword);
			ResultSet retStr1 = pstmt.executeQuery(sql);
			}
</body>
</html>