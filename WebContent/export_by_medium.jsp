<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="org.apache.poi.xssf.usermodel.*,org.apache.poi.xssf.util.*, org.apache.poi.hssf.usermodel.*,org.apache.poi.hssf.util.*, java.io.*,java.util.*,java.sql.*,com.charvikent.dbconnection.DbUtility"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--         <meta http-equiv='refresh' content='.1; url=export.jsp'> -->
        <title>Administrator | Export by Medium</title>
    </head>
<body>
<%
Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;
int i=0;

if((session.getAttribute("username")==null)||(session.getAttribute("username")==""))
{
	response.sendRedirect("AdminLogin");
}
else
{
// 	response.setHeader("Content-type", "application/octet-stream");
	
	
	String url=application.getInitParameter("url");
	String username=application.getInitParameter("username");
	String password=application.getInitParameter("password");
	con=DbUtility.getConnection(url,username,password);
	String uname=session.getAttribute("username").toString();
	
	String medium=request.getParameter("medium").toString();
	
	
	if(medium != null)
	{
		String query = "select * from  addstudent where medium='"+medium+"'";
		ps=con.prepareStatement(query);
		rs=ps.executeQuery();
		if(!rs.isBeforeFirst())
		{
			session.setAttribute("no_medium", "No Records found!");
			response.sendRedirect("export.jsp");
		}
		else
		{
			HSSFWorkbook hwb = new HSSFWorkbook();
			HSSFSheet sheet = hwb.createSheet("Students-by-Medium");
		   	
		   	HSSFRow rowhead = sheet.createRow((short)0);
			rowhead.createCell((short) 0).setCellValue("SNo");		
			rowhead.createCell((short) 1).setCellValue("Student Name");
		    rowhead.createCell((short) 2).setCellValue("Board Name");
		   	rowhead.createCell((short) 3).setCellValue("Medium");
		   	rowhead.createCell((short) 4).setCellValue("Class");
		   	rowhead.createCell((short) 5).setCellValue("Section");
		   	rowhead.createCell((short) 6).setCellValue("Roll Number");
		   	rowhead.createCell((short) 7).setCellValue("Admission Number");
		   	rowhead.createCell((short) 8).setCellValue("Father Name");
		   	rowhead.createCell((short) 9).setCellValue("Mobile");
		   	rowhead.createCell((short) 10).setCellValue("Alternate Number");
		   	rowhead.createCell((short) 11).setCellValue("E-mail");
		   	rowhead.createCell((short) 12).setCellValue("Blood Group");
		   	rowhead.createCell((short) 13).setCellValue("Gender");
		   	rowhead.createCell((short) 14).setCellValue("DOB");
		   	rowhead.createCell((short) 15).setCellValue("Religion");
		   	rowhead.createCell((short) 16).setCellValue("Address");
		   	rowhead.createCell((short) 17).setCellValue("Previous Institute");
		   	rowhead.createCell((short) 18).setCellValue("Caste");
		   	rowhead.createCell((short) 19).setCellValue("Accommodation");
		   	rowhead.createCell((short) 20).setCellValue("Bus Facility");
		   	rowhead.createCell((short) 21).setCellValue("Bus Route");
		   	rowhead.createCell((short) 22).setCellValue("Registered On");
		   	
		   	int index=1;
		  	int sno=0;
		  	String name="";
			while(rs.next()) 
			{
		    	sno++;
					
			 	HSSFRow row = sheet.createRow((short)index);
				row.createCell((short) 0).setCellValue(sno);
				row.createCell((short) 1).setCellValue(rs.getString(2));
				row.createCell((short) 2).setCellValue(rs.getString(3));
				row.createCell((short) 3).setCellValue(rs.getString(4));
				row.createCell((short) 4).setCellValue(rs.getString(5));
				row.createCell((short) 5).setCellValue(rs.getString(6));
				row.createCell((short) 6).setCellValue(rs.getString(7));
				row.createCell((short) 7).setCellValue(rs.getString(8));
				row.createCell((short) 8).setCellValue(rs.getString(9));
				row.createCell((short) 9).setCellValue(rs.getString(10));
				row.createCell((short) 10).setCellValue(rs.getString(11));
				row.createCell((short) 11).setCellValue(rs.getString(12));
				row.createCell((short) 12).setCellValue(rs.getString(13));
				row.createCell((short) 13).setCellValue(rs.getString(14));
				row.createCell((short) 14).setCellValue(rs.getString(15));
				row.createCell((short) 15).setCellValue(rs.getString(16));
				row.createCell((short) 16).setCellValue(rs.getString(17));
				row.createCell((short) 17).setCellValue(rs.getString(18));
				row.createCell((short) 18).setCellValue(rs.getString(19));
				row.createCell((short) 19).setCellValue(rs.getString(20));
				row.createCell((short) 20).setCellValue(rs.getString(21));
				row.createCell((short) 21).setCellValue(rs.getString(22));
				row.createCell((short) 22).setCellValue(rs.getString(24));
				index++;
			}
			
			ByteArrayOutputStream outByteStream = new ByteArrayOutputStream();
			hwb.write(outByteStream);
			byte [] outArray = outByteStream.toByteArray();
			response.setContentType("application/ms-excel");
			response.setContentLength(outArray.length);
			response.setHeader("Expires:", "0"); // eliminates browser caching
			response.setHeader("Content-Disposition", "attachment; filename=Medium_StudentsList.xls");
			OutputStream outStream = response.getOutputStream();
			outStream.write(outArray);
			outStream.flush();
			outStream.close();
			out.clear(); // where out is a JspWriter 
			out = pageContext.pushBody();
			response.sendRedirect("export.jsp");
		}
	}
}
%>
</body>
</html>