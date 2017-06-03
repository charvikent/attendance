package com.charvikent.admin;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.charvikent.mail.MailSender;

@WebServlet("/SendEmail")
public class SendEmail extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html;charset=UTF-8");
//        PrintWriter pw = response.getWriter();
        HttpSession session=request.getSession();
        
		String sname=request.getParameter("sname");
		String fname=request.getParameter("fname");
		String email=request.getParameter("email");
		String message=request.getParameter("message");
		
		try 
		{
			if(sname != null && fname != null && email != null && message != null)
			{
				MailSender.sendEmailWithAttachment(email, "Regarding, Your Children Attendance",message,null);
				System.out.println("Mail has been Sent");
				session.setAttribute("sended", "Successfully Mail has been Sent");
	            response.sendRedirect("attendance.jsp");
			}
			else
			{
				session.setAttribute("error", "Falied to Send the Mail");
				response.sendRedirect("attendance.jsp");
			}
		} 
		catch (Exception e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
