package com.action;

import java.io.IOException;
import java.sql.*;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.charvikent.dbconnection.DbUtility;
import com.google.gson.Gson;

public class JsonServlet2 extends HttpServlet {

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
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try{
			
		String className= request.getParameter("className");
		List<String> list = new ArrayList<String>();
		String json = null;
		list.add("Choose Section");
		PreparedStatement ps2=con.prepareStatement("select distinct section from classcreation where class_name='"+className+"' ");
		ResultSet rs2=ps2.executeQuery();
		while(rs2.next())
		{
			list.add(rs2.getString("section"));
		}


		json = new Gson().toJson(list);
		response.setContentType("application/json");
		response.getWriter().write(json);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
}