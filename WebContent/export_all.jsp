<%@ page language="java" contentType="application/vnd.ms-excel; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="org.apache.poi.xssf.usermodel.*,org.apache.poi.xssf.util.*, org.apache.poi.hssf.usermodel.*,org.apache.poi.hssf.util.*, java.io.*,java.util.*,java.sql.*,com.charvikent.dbconnection.DbUtility"%>

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
// 	response.setHeader("Content-type", "application/octet-stream");
	
	
	String url=application.getInitParameter("url");
	String username=application.getInitParameter("username");
	String password=application.getInitParameter("password");
	con=DbUtility.getConnection(url,username,password);
	String uname=session.getAttribute("username").toString();
	
 
		Statement stmt = con.createStatement();
		String query = "select * from  addstudent";
		ResultSet rs = stmt.executeQuery(query);
		if(!rs.isBeforeFirst())
		{
			session.setAttribute("no_records", "No Records found!");
			response.sendRedirect("export.jsp");
		}
		else
		{

		HSSFWorkbook hwb = new HSSFWorkbook();
		HSSFCellStyle style = null;
		HSSFFont font = null;
	   	HSSFSheet sheet = hwb.createSheet("All-Students");

	   	// Style details for heading in new sheet
        
// 	   	style = hwb.createCellStyle();
//         style.setFillForegroundColor(HSSFColor.GREEN.index);
//         style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        
//         font = hwb.createFont();
//         font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
//         font.setColor(HSSFColor.WHITE.index);
//         style.setFont(font);
        
        

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
// 		FileOutputStream fileOut = new FileOutputStream(filename);
// 		hwb.write(fileOut);
		
// 		fileOut.close();
// 	 	session.setAttribute("updated", "All Students List has been Imported into Excel Sheet");
// 	 	response.sendRedirect("view_student.jsp");
		
		ByteArrayOutputStream outByteStream = new ByteArrayOutputStream();
		hwb.write(outByteStream);
		byte [] outArray = outByteStream.toByteArray();
		response.setContentType("application/ms-excel");
		response.setContentLength(outArray.length);
		response.setHeader("Expires:", "0"); // eliminates browser caching
		response.setHeader("Content-Disposition", "attachment; filename=AllStudentsList.xls");
		OutputStream outStream = response.getOutputStream();
		outStream.write(outArray);
		outStream.flush();
		}
}	
%>