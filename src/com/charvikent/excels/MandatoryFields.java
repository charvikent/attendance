package com.charvikent.excels;

import java.io.*;
import java.sql.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.oreilly.servlet.MultipartRequest;

import com.charvikent.dbconnection.DbUtility;

@MultipartConfig
@WebServlet("/MandatoryFields")
public class MandatoryFields extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	Connection con=null;
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
//		application/vnd.openxmlformats-officedocument.spreadsheetml.sheet
		response.setContentType("text/html;charset=UTF-8");
//        PrintWriter pw = response.getWriter();
        HttpSession sess=request.getSession();
        ServletContext sc=request.getServletContext();
        String path=sc.getRealPath("/import/MandatoryFields/");
        System.out.println(path);
        try
        {
        	MultipartRequest m=new MultipartRequest(request,path);
        	
        	String message="Successfully File is Imported :-)";
	        sess.setAttribute("message", message);
	        response.sendRedirect("import_student.jsp");
        } // try closed here
        catch(Exception e)
        {
        	String error="Importing Failed..please try again later";
            sess.setAttribute("error", error);
            System.out.println(e);
        }
	}
}
