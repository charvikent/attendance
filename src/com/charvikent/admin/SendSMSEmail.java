package com.charvikent.admin;

import java.io.*;
import java.net.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.charvikent.dbconnection.DbUtility;
import com.charvikent.mail.MailSender;

@WebServlet("/SendSMSEmail")
public class SendSMSEmail extends HttpServlet 
{
    private static final long serialVersionUID = 1L;
    Connection con=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
//    int i=0;
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
        
        try 
        {
            String username = "RKKIDS";
            String password = "RK@kids987";
            String from = "RKKIDS";
            String requestUrl = null;

            String sid=null, student_name=null, father_name=null, mobile=null, email=null, morning_session=null, afternoon_session=null;
            int i=0;

            String[] sl_no=request.getParameterValues("student_id[]");
            if(sl_no != null)
            {
                String sl_nos="";
                for(int l=0; l<sl_no.length; l++)
                {
                    sl_nos+=sl_no[l]+",";
                }
                if (sl_nos.endsWith(","))
                {
                    sl_nos = sl_nos.substring(0, sl_nos.length() - 1);
                }

                String messagedata=request.getParameter("messagedata");
                String absent_session=request.getParameter("absent_session");
                String notify_type=request.getParameter("notify_type");

                String fname=null, message=null;

                String s[]=sl_nos.split(",", sl_nos.length());
                for(int r=0; r<s.length; r++)
                {
//     		System.out.print(s[r]);
                    if(s[r] != null)
                    {
                        ps=con.prepareStatement("select Sno,name,father_name,mobile,email from addstudent where Sno='"+s[r]+"'");
                        rs=ps.executeQuery();
                        if(rs.next())
                        {
                        	sid = rs.getString(1);
                            student_name = rs.getString(2);
                            father_name = rs.getString(3);
                            System.out.println("Dad: "+father_name);
                            mobile = rs.getString(4);
                            long recipient=Long.parseLong(mobile);
                            email = rs.getString(5);
                            System.out.println("Email-Id: "+email);
                            if(messagedata !=null && father_name != null)
                            {
                                fname=messagedata.replaceFirst("#2", father_name);
                                message=fname.replaceFirst("#1", student_name);
                            }
                            else
                            {
                            	fname=messagedata.replaceFirst("#2", "Parent");
                                message=fname.replaceFirst("#1", student_name);
                            }
//                            System.out.println(fname);
                            System.out.println(message);
                            if(absent_session.equals("fullday"))
                            {
                            	morning_session="absent";
                            	afternoon_session="absent";
                            }	
                            else if(absent_session.equals("morning"))
                            {
                            	morning_session="absent";
                            }
                            if(absent_session.equals("fullday") || absent_session.equals("morning"))
                            {
                            ps=con.prepareStatement("insert into attendance values(null,'"+sid+"','"+student_name+"','"+father_name+"','"+email+"','"+mobile+"','"+message+"','"+morning_session+"','"+afternoon_session+"',null,'admin',now())");
                            i=ps.executeUpdate();
                            }
                            if(absent_session.equals("afternoon"))
                            {
                            	afternoon_session="absent";
                            	ps=con.prepareStatement("update attendance set sid='"+s[r]+"',student_name='"+student_name+"',father_name='"+father_name+"',email='"+email+"',mobile='"+mobile+"',message='"+message+"',afternoon_session='"+afternoon_session+"',sender_id=null,sent_by='admin',absent_on=now() where sid='"+s[r]+"'");
                                i=ps.executeUpdate();
                            }	
                            if(notify_type.equals("sms"))
                            {
                                requestUrl  = "http://182.18.160.225/index.php/api/bulk-sms?username="+URLEncoder.encode(username, "UTF-8")+"&password="+ URLEncoder.encode(password, "UTF-8")+"&from="+from+"&to="+URLEncoder.encode(mobile, "UTF-8")+"&message="+URLEncoder.encode(message, "UTF-8")+"&sms_type=2";
                                URL url = new URL(requestUrl);
                                HttpURLConnection uc = (HttpURLConnection)url.openConnection();
                                System.out.println(uc.getResponseMessage());
                                uc.disconnect();
//                                pw.println("<script src='js/jquery.min.js'></script><script>$(document).ready(function(){$.ajax('http://182.18.160.225/index.php/api/bulk-sms?username="+URLEncoder.encode(username, "UTF-8")+"&password="+ URLEncoder.encode(password, "UTF-8")+"&from="+from+"&to="+URLEncoder.encode(mobile, "UTF-8")+"&message="+URLEncoder.encode(message, "UTF-8")+"&sms_type=2');});</script>");
                            }
                            if(notify_type.equals("em") && email != null)
                            {
                            	if(email !=null || email !="" || !email.equals("null"))
                            	{
                            		MailSender.sendEmailWithAttachment(email, "Regarding, Your Children Attendance",message,null);
                            	}
                            }
                            if(notify_type.equals("smem"))
                            {
                                requestUrl  = "http://182.18.160.225/index.php/api/bulk-sms?username="+URLEncoder.encode(username, "UTF-8")+"&password="+ URLEncoder.encode(password, "UTF-8")+"&from="+from+"&to="+URLEncoder.encode(mobile, "UTF-8")+"&message="+URLEncoder.encode(message, "UTF-8")+"&sms_type=2";
                                URL url = new URL(requestUrl);
                                HttpURLConnection uc = (HttpURLConnection)url.openConnection();
                                System.out.println(uc.getResponseMessage());
                                uc.disconnect();
//                                pw.println("<script src='http://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.3.min.js'></script><script>$(document).ready(function(){$.ajax('http://182.18.160.225/index.php/api/bulk-sms?username=RKKIDS&password=RK@kids987&from=RKKIDS&to="+recipient+"&message="+message+"&sms_type=2');});</script>");
                                if(email !=null || email !="" || !email.equals("null"))
                                {
                                	MailSender.sendEmailWithAttachment(email, "Regarding, Your Children Attendance",message,null);
                                }
                            }
                        }
                    }
                }
                if( i>0 && ( notify_type.equals("em") || notify_type.equals("sms") || notify_type.equals("smem") ) )
                {
                    session.setAttribute("sended", "Successfully Messsage/Email has been Sent");
                    response.sendRedirect("attendance.jsp");
                }
                else
                {
                    session.setAttribute("error", "Falied to Send the Message/Email");
                    response.sendRedirect("attendance.jsp");
                }
            }
            
            String board_name=request.getParameter("board");
            String medium_name=request.getParameter("medium");
            String class_name=request.getParameter("clas");
            String section_name=request.getParameter("section");
            
            if(board_name != null && medium_name != null && class_name != null && section_name != null)
            {
                String checkMSG=request.getParameter("otherlanguage");
                String messagedata=request.getParameter("messagedata");
                String emessagedata=request.getParameter("emessagedata");
                String notify_type=request.getParameter("notify_type");

                ps=con.prepareStatement("select Sno,name,father_name,mobile,email from addstudent where board_name='"+board_name+"' and medium='"+medium_name+"' and class_name='"+class_name+"' and section='"+section_name+"'");
                rs=ps.executeQuery();
                while(rs.next())
                {
                	sid = rs.getString(1);
                    student_name = rs.getString(2);
                    father_name = rs.getString(3);
                    mobile = rs.getString(4);
                    email = rs.getString(5);

                    System.out.println("Message Data is: "+messagedata);
                    System.out.println("EMessage Data is: "+emessagedata);
                    System.out.println("Language is: "+checkMSG);

                    if(notify_type.equals("1"))
                    {
                        if(checkMSG != null && checkMSG.equals("1") && email != null)
                            MailSender.sendEmailWithAttachment(email, "Regarding, Common Message from School",messagedata,null);
                        else if(email != null)
                            MailSender.sendEmailWithAttachment(email, "Regarding, Common Message from School",emessagedata,null);
                    }
                    if(notify_type.equals("2"))
                    {
                        if(checkMSG != null && checkMSG.equals("1"))
                            requestUrl  = "http://182.18.160.225/index.php/api/bulk-sms?username="+URLEncoder.encode(username, "UTF-8")+"&password="+ URLEncoder.encode(password, "UTF-8")+"&from="+from+"&to="+URLEncoder.encode(mobile, "UTF-8")+"&message="+URLEncoder.encode(messagedata, "UTF-8")+"&sms_type=2";
                        else
                            requestUrl  = "http://182.18.160.225/index.php/api/bulk-sms?username="+URLEncoder.encode(username, "UTF-8")+"&password="+ URLEncoder.encode(password, "UTF-8")+"&from="+from+"&to="+URLEncoder.encode(mobile, "UTF-8")+"&message="+URLEncoder.encode(emessagedata, "UTF-8")+"&sms_type=2";
                        URL url = new URL(requestUrl);
                        HttpURLConnection uc = (HttpURLConnection)url.openConnection();
                        System.out.println(uc.getResponseMessage());
                        uc.disconnect();
                    }
                    if(notify_type.equals("3"))
                    {
                        if(checkMSG != null && checkMSG.equals("1"))
                            requestUrl  = "http://182.18.160.225/index.php/api/bulk-sms?username="+URLEncoder.encode(username, "UTF-8")+"&password="+ URLEncoder.encode(password, "UTF-8")+"&from="+from+"&to="+URLEncoder.encode(mobile, "UTF-8")+"&message="+URLEncoder.encode(messagedata, "UTF-8")+"&sms_type=2";
                        else
                            requestUrl  = "http://182.18.160.225/index.php/api/bulk-sms?username="+URLEncoder.encode(username, "UTF-8")+"&password="+ URLEncoder.encode(password, "UTF-8")+"&from="+from+"&to="+URLEncoder.encode(mobile, "UTF-8")+"&message="+URLEncoder.encode(emessagedata, "UTF-8")+"&sms_type=2";
                        URL url = new URL(requestUrl);
                        HttpURLConnection uc = (HttpURLConnection)url.openConnection();
                        System.out.println(uc.getResponseMessage());
                        uc.disconnect();
                        if(checkMSG != null && checkMSG.equals("1") && email != null)
                            MailSender.sendEmailWithAttachment(email, "Regarding, Common Message from School",messagedata,null);
                        else if(email != null)
                            MailSender.sendEmailWithAttachment(email, "Regarding, Common Message from School",emessagedata,null);
                    }
//                    if(checkMSG != null && checkMSG.equals("otherlanguage")) messagedata=emessagedata;
//                    if( (messagedata != null && messagedata !="") || (messagedata.equals(null) && messagedata.equals("")) )
                    if(checkMSG != null && checkMSG.equals("1") && email!= null)
                    {
                    	ps=con.prepareStatement("insert into notification values(null,'"+sid+"','"+student_name+"','"+father_name+"','"+email+"','"+mobile+"','"+messagedata+"',null,'admin',now())");
                    	i=ps.executeUpdate();
                    }
                    else if(email!= null)
//                    if( (emessagedata != null && emessagedata !="") || (emessagedata.equals(null) && emessagedata.equals("")) )
                    {
                    	ps=con.prepareStatement("insert into notification values(null,'"+sid+"','"+student_name+"','"+father_name+"','"+email+"','"+mobile+"','"+emessagedata+"',null,'admin',now())");
                    	i=ps.executeUpdate();
                    }
                }
                if( i>0 && ( notify_type.equals("1") || notify_type.equals("2") || notify_type.equals("3") ))
                {
                    session.setAttribute("sended", "Successfully Messsage/Email has been Sent");
                    response.sendRedirect("common_message.jsp");
                }
                else
                {
                    session.setAttribute("error", "Falied to Send the Message");
                    response.sendRedirect("common_message.jsp");
                }
            }
	}
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
