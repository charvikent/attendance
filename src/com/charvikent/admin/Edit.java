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


public class Edit extends HttpServlet 
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
		response.setContentType("text/html;charset=UTF-8");
        PrintWriter pw = response.getWriter();
        HttpSession session=request.getSession();
        
        String snum=request.getParameter("snum");
    	
    	String faculty_name=request.getParameter("faculty_name");
    	String gender=request.getParameter("gender");
    	String board=request.getParameter("board");
    	String medium=request.getParameter("medium");
    	String clas=request.getParameter("clas");
    	String section=request.getParameter("section");
    	String qualification=request.getParameter("qualification");
    	String mobile=request.getParameter("mobile");
        String sub_name=request.getParameter("subject_name");
        
        String s_no=request.getParameter("s_no");
        String board_name=request.getParameter("board_name");
        String medium_name=request.getParameter("medium_name");
        String class_name=request.getParameter("class_name");
        String section_name=request.getParameter("section_name");
        
                
        String sno=request.getParameter("sno");
        String subject_name=request.getParameter("subject_name");
        
        String slno=request.getParameter("slno");
        String select_class=request.getParameter("select_class");
        String sb_name=request.getParameter("sb_name");
        
        
        try
        {
        	PreparedStatement ps=null;
        	int i=0;
//        	to edit the added faculty
        	if(snum != null)
        	{
        		String sql = "SELECT * FROM faculty where faculty_name='"+faculty_name+"' and gender='"+gender+"' and board_name='"+board+"' and medium='"+medium+"' and class_name='"+clas+"' and section='"+section+"' and qualification='"+qualification+"' and mobile='"+mobile+"'"; 
            	ps = con.prepareStatement(sql);
            	ResultSet rs = ps.executeQuery();
            	if(rs.next())
            	{
            		session.setAttribute("error", "Already Existed Record");
            		session.setAttribute("fac", faculty_name);
            		session.setAttribute("gn", gender);
            		session.setAttribute("bd_name", board);
            		session.setAttribute("md_name", medium);
            		session.setAttribute("cl_name", clas);
            		session.setAttribute("sc_name", section);
            		session.setAttribute("qual", qualification);
            		session.setAttribute("mob", mobile);
            		session.setAttribute("subject", sub_name);
	                response.sendRedirect("edit_faculty.jsp?sno="+snum);
            	}
            	else
            	{
            		ps=con.prepareStatement("update faculty set faculty_name='"+faculty_name+"',gender='"+gender+"',board_name='"+board+"',medium='"+medium+"',class_name='"+clas+"',section='"+section+"',qualification='"+qualification+"',mobile='"+mobile+"',subject_name='"+subject_name+"' where Sno='"+snum+"'");
	            	i=ps.executeUpdate();
		        	if(i>=0)
		        	{
                                    session.setAttribute("added", "Successfully Faculty is Updated");
                                    response.sendRedirect("add_faculty.jsp");
		        	}
		            else
		            {
		            	session.setAttribute("error", "Faied to Edit the Faculty");
		                response.sendRedirect("edit_faculty.jsp?sno="+snum);
		            }
            	}
        	}
//        	to edit created class
	        if(s_no !=null)
	        {
	        	String sql = "SELECT * FROM classcreation where board_name='"+board_name+"' and medium='"+medium_name+"' and class_name='"+class_name+"' and section='"+section_name+"'"; 
            	ps = con.prepareStatement(sql); 
            	ResultSet rs = ps.executeQuery();
            	if(rs.next())
            	{
            		session.setAttribute("error", "Already Existed Record");
            		session.setAttribute("b_name", board_name);
            		session.setAttribute("m_name", medium_name);
            		session.setAttribute("c_name", class_name);
            		session.setAttribute("s_name", section_name);
            		response.sendRedirect("EditClass?s_no="+s_no);
            	}
            	else
            	{
		        	ps=con.prepareStatement("update classcreation set board_name='"+board_name+"',medium='"+medium_name+"',class_name='"+class_name+"',section='"+section_name+"' where Sno='"+s_no+"'");
	            	i=ps.executeUpdate();
	            	System.out.println(i);
	            	System.out.println("Sno is: "+s_no);
		        	if(i>=0)
		        	{
		        		session.setAttribute("added", "Successfully Class is Updated");
		                response.sendRedirect("ClassCreation");
		        	}
		            else
		            {
		            	session.setAttribute("error", "Faied to Edit the Class");
		                response.sendRedirect("EditClass?s_no="+s_no);
		            }
            	}
			}
//        	to edit created subject
	        if(sno !=null)
	        {
	        	String sql = "SELECT subject_name FROM subjectcreation where subject_name='"+subject_name+"'"; 
            	ps = con.prepareStatement(sql);
            	ResultSet rs = ps.executeQuery();
            	if(rs.next())
            	{
            		session.setAttribute("error", "<b>"+subject_name+"</b> is Already Registered");
            		session.setAttribute("sub_name", subject_name);
	                response.sendRedirect("EditSubject?sno="+sno);
            	}
            	else
            	{
		        	ps=con.prepareStatement("update subjectcreation set subject_name='"+subject_name+"' where Sno='"+sno+"'");
	            	i=ps.executeUpdate();
	            	System.out.println(i);
	            	System.out.println("Sno is: "+sno);
		        	if(i>=0)
		        	{
		        		session.setAttribute("added", "Successfully Subject is Updated");
		                response.sendRedirect("SubjectCreation");
		        	}
		            else
		            {
		            	session.setAttribute("error", "Faied to Edit the Subject");
		                response.sendRedirect("EditSubject?sno="+sno);
		            }
            	}
			}
//        	to edit the added subject
	        if(slno !=null)
	        {
	        	String sql = "SELECT class_name,subject_name FROM addsubject where class_name='"+select_class+"' and subject_name='"+sb_name+"'"; 
            	ps = con.prepareStatement(sql);
            	ResultSet rs = ps.executeQuery();
            	if(rs.next())
            	{
            		session.setAttribute("error", "Already Existed Registered");
            		session.setAttribute("sl_cls", select_class);
            		session.setAttribute("sb_name", sb_name);
	                response.sendRedirect("edit_addedsubject.jsp?sno="+slno);
            	}
            	else
            	{
		        	ps=con.prepareStatement("update addsubject set class_name='"+select_class+"', subject_name='"+sb_name+"' where Sno='"+slno+"'");
	            	i=ps.executeUpdate();
	            	System.out.println(i);
	            	System.out.println("Sno is: "+slno);
		        	if(i>=0)
		        	{
		        		session.setAttribute("added", "Successfully Added Subject is Updated");
		                response.sendRedirect("AddSubject");
		        	}
		            else
		            {
		            	session.setAttribute("error", "Faied to Edit the Added Subject");
		                response.sendRedirect("edit_addedsubject.jsp?sno="+slno);
		            }
            	}
			}
        }
        catch(Exception e)
        {
        	pw.println(e);
        }
	}
}
