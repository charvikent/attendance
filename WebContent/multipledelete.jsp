<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.charvikent.dbconnection.DbUtility"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Administrator | Multiple Delete</title>
</head>
<body>
<%
Connection con=null;
PreparedStatement ps=null;
int i=0;
if((session.getAttribute("username")==null)||(session.getAttribute("username")==""))
{
	response.sendRedirect("AdminLogin");
}
else
{
	String url=application.getInitParameter("url");
	String username=application.getInitParameter("username");
	String password=application.getInitParameter("password");
	con=DbUtility.getConnection(url,username,password);
	String uname=session.getAttribute("username").toString();
	
	
	String sl_nos=request.getParameter("ids");
	System.out.println(sl_nos);
    String s[]=sl_nos.split(",", sl_nos.length());
	for(int r=0; r<s.length; r++)
	{
		if(s[r] != null)
	    {
	    	ps=con.prepareStatement("delete from addstudent where Sno='"+s[r]+"'");
	    	i=ps.executeUpdate();
	    }
	}
	if(i>=0)
	{
		session.setAttribute("mul_delete", "Successfully Student'(s) details Deleted");
	}
	else
	{
	    session.setAttribute("error", "Failed to Delete the Student");
	}
}%>
</body>
</html>