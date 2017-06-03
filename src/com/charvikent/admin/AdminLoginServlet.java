package com.charvikent.admin;

import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.charvikent.dbconnection.DbUtility;



//@WebServlet(name = "AdminLoginServlet", urlPatterns = {"/AdminLoginServlet"})
public class AdminLoginServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
    Connection con=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    @Override
    public void init()
            throws ServletException
    {
        String url=getServletContext().getInitParameter("url");
        String username=getServletContext().getInitParameter("username");
        String password=getServletContext().getInitParameter("password");
        con=DbUtility.getConnection(url,username,password);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html;charset=UTF-8");
        PrintWriter pw = response.getWriter();
		HttpSession session=request.getSession();
		
		String rol=request.getParameter("rol");
		session.setAttribute("rl", rol);
		
        String uname=request.getParameter("uname");
        session.setAttribute("uname", uname);
        
        String pwd=request.getParameter("upass");
        
//        String facname=request.getParameter("facname");
//        session.setAttribute("facname", facname);
//        
//        String facpass=request.getParameter("facpass");
        
        try
        {
        if(rol != null && uname != null && pwd != null)
        {
        	if(rol.equals("Administrator"))
        	{
		        	ps=con.prepareStatement("select * from logindetails where username='"+uname+"' and password='"+pwd+"'");
		        	rs = ps.executeQuery();
		        	if(rs.next())
		        	{
				        if(uname.equals(rs.getString(1)) && pwd.equals(rs.getString(2)))
				        {
				        	session.setAttribute("username", uname);
				            response.sendRedirect("AdminHome");
				        }
				        else
			        	{
			        		String error="Invalid Credentials";
			        		session.setAttribute("error", error);
			        		response.sendRedirect("AdminLogin");
			        	}
		        	}
        	}
        	if(rol.equals("Faculty"))
        	{
		        	ps=con.prepareStatement("select faculty_name,mobile from faculty where faculty_name='"+uname+"' and mobile='"+pwd+"'");
		        	rs = ps.executeQuery();
		        	if(rs.next())
		        	{
				        if(uname.equals(rs.getString(1)) && pwd.equals(rs.getString(2)))
				        {
				        	session.setAttribute("fac_name", uname);
				            response.sendRedirect("facultyhome.jsp");
				        }
				        else
			        	{
			        		String error="Invalid Credentials";
			        		session.setAttribute("error", error);
			        		response.sendRedirect("AdminLogin");
			        	}
		        	}
        	}
        	if(rol.equals("Parent"))
        	{
		        	ps=con.prepareStatement("select father_name,mobile from addstudent where father_name='"+uname+"' and mobile='"+pwd+"'");
		        	rs = ps.executeQuery();
		        	if(rs.next())
		        	{
//		        		System.out.println(rs.getString(1));
//		        		System.out.println(rs.getString(2));
				        if(uname.equals(rs.getString(1)) && pwd.equals(rs.getString(2)))
				        {
				        	session.setAttribute("parent_name", uname);
				            response.sendRedirect("parenthome.jsp");
				        }
				        else
			        	{
			        		String error="Invalid Credentials";
			        		session.setAttribute("error", error);
			        		response.sendRedirect("AdminLogin");
			        	}
		        	}
        	}
        	else
	        {
	            String error="Invalid Credentials";
	            session.setAttribute("error", error);
	            response.sendRedirect("AdminLogin");
	        }
        }
        }
        catch(Exception e)
        {
        	pw.println(e);
        }
	}
}
