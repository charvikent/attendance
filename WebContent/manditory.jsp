<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.charvikent.dbconnection.DbUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.io.*, java.util.*, java.sql.*, javax.servlet.http.*, javax.servlet.annotation.MultipartConfig"%>
<%@page import="org.apache.poi.hssf.usermodel.*, org.apache.poi.xssf.usermodel.*"%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <!-- Title and other stuffs -->
  <title>Administrator | Mandatory Fields</title>
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <![endif]-->

  <!-- Favicon -->
  <link rel="shortcut icon" href="img/favicon/school.png">
</head>
<%!
 String getFileName(Part part) {
		for (String cd : part.getHeader("content-disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}
	%>
<%

Connection con=null;
PreparedStatement ps=null;
int dbInsert=0;

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
	
   	String path=application.getRealPath("/import/MandatoryFields/");
//     MultipartRequest m=new MultipartRequest(request,path);
    String fileName="E:\\mfile.xls";

	/* Part mfile = (Part) request.getPart("mfile");
    String fileName = getFileName(mfile);
    System.out.println(fileName);
    InputStream is = null;
	if (mfile != null) {
		is = mfile.getInputStream();
		InputStream isr2 = is;
		FileOutputStream f2 = new FileOutputStream(path + fileName); // downloads file
		int r2 = 0;
		while ((r2 = isr2.read()) != -1) {
			f2.write(r2);
		}
		System.out.println("File saved into given directory");
	}      */
%>

<table border="1">
<%
System.out.println("File location: "+path+fileName);
	short a=0, b=1, c=2, d=3, e=4, f=5;
	int i=0;int count=0;
	String v1=null, v2=null, v3=null, v4=null, v5=null, v6=null, ph=null;
    if (fileName != null && fileName.length()>0)
    {
	    try
	    {
		    FileInputStream fs =new FileInputStream(fileName);
		    HSSFWorkbook wb = new HSSFWorkbook(fs);
		    for (int k = 0; k < wb.getNumberOfSheets(); k++)
		    {
			    int j=i+1;
			    HSSFSheet sheet = wb.getSheetAt(k);
			    int rows = sheet.getPhysicalNumberOfRows();
			    
			    HSSFRow row_0 = sheet.getRow(0);
			    HSSFCell cell0_0 = row_0.getCell(a);
			    HSSFCell cell0_1 = row_0.getCell(b);
				HSSFCell cell0_2 = row_0.getCell(c);
				HSSFCell cell0_3 = row_0.getCell(d);
				HSSFCell cell0_4 = row_0.getCell(e);
				HSSFCell cell0_5 = row_0.getCell(f);
				
				String c_0_0_value = null;
				c_0_0_value = sheet.getRow(0).getCell((short)0).getStringCellValue();
				
				String c_0_1_value = null;
				c_0_1_value = sheet.getRow(0).getCell((short)1).getStringCellValue();
				
				String c_0_2_value = null;
				c_0_2_value = sheet.getRow(0).getCell((short)2).getStringCellValue();
				
				String c_0_3_value = null;
				c_0_3_value = sheet.getRow(0).getCell((short)3).getStringCellValue();
				
				String c_0_4_value = null;
				c_0_4_value = sheet.getRow(0).getCell((short)4).getStringCellValue();
				
				String c_0_5_value = null;
				
				if(cell0_5 != null)
				{
					switch(cell0_5.getCellType())
					{
					case HSSFCell.CELL_TYPE_FORMULA :
						c_0_5_value = "FORMULA ";
						break;
				
						case HSSFCell.CELL_TYPE_NUMERIC :
						c_0_5_value = ""+cell0_5.getNumericCellValue();
						break;
				
						case HSSFCell.CELL_TYPE_STRING :
						c_0_5_value = cell0_5.getStringCellValue();
						break;
				
						default :
					}
				}
			    for (int r = 1; r < rows; r++)
			    {
				    HSSFRow row = sheet.getRow(r);
				    count++;
				    if(row != null)
					{
				    	if(c_0_0_value.equalsIgnoreCase("Student name") && c_0_1_value.equalsIgnoreCase("Board name") && c_0_2_value.equalsIgnoreCase("Medium") && c_0_3_value.equalsIgnoreCase("Class") && c_0_4_value.equalsIgnoreCase("Section") && c_0_5_value.equalsIgnoreCase("Mobile"))
						{
						    int cells = row.getPhysicalNumberOfCells(); 
						    out.write("<br>");
						    HSSFCell cell1  = row.getCell(a);
						    if (cell1 != null) 
							{ 
								switch (cell1.getCellType())
								{
									case HSSFCell.CELL_TYPE_FORMULA : v1 = "FORMULA ";
									break;
							
									case HSSFCell.CELL_TYPE_NUMERIC : v1 = ""+cell1.getNumericCellValue();
									break;
							
									case HSSFCell.CELL_TYPE_STRING : v1 = cell1.getStringCellValue();
									break;
							
									default :
								}
							}
						    HSSFCell cell2  = row.getCell(b);
						    if (cell2 != null) 
							{ 
								switch (cell2.getCellType())
								{
									case HSSFCell.CELL_TYPE_FORMULA : v2 = "FORMULA ";
									break;
							
									case HSSFCell.CELL_TYPE_NUMERIC : v2 = ""+cell2.getNumericCellValue();
									break;
							
									case HSSFCell.CELL_TYPE_STRING : v2 = cell2.getStringCellValue();
									break;
							
									default :
								}
							}
						    HSSFCell cell3  = row.getCell(c);
						    if (cell3 != null) 
							{ 
								switch (cell3.getCellType())
								{
									case HSSFCell.CELL_TYPE_FORMULA : v3 = "FORMULA ";
									break;
							
									case HSSFCell.CELL_TYPE_NUMERIC : v3 = ""+cell3.getNumericCellValue();
									break;
							
									case HSSFCell.CELL_TYPE_STRING : v3 = cell3.getStringCellValue();
									break;
							
									default :
								}
							}
						    HSSFCell cell4  = row.getCell(d);
						    if (cell4 != null) 
							{ 
								switch (cell4.getCellType())
								{
									case HSSFCell.CELL_TYPE_FORMULA : v4 = "FORMULA ";
									break;
							
									case HSSFCell.CELL_TYPE_NUMERIC : v4 = ""+cell4.getNumericCellValue();
									break;
							
									case HSSFCell.CELL_TYPE_STRING : v4 = cell4.getStringCellValue();
									break;
							
									default :
								}
							}
						    HSSFCell cell5  = row.getCell(e);
						    if (cell5 != null) 
							{ 
								switch (cell5.getCellType())
								{
									case HSSFCell.CELL_TYPE_FORMULA : v5 = "FORMULA ";
									break;
							
									case HSSFCell.CELL_TYPE_NUMERIC : v5 = ""+cell5.getNumericCellValue();
									break;
							
									case HSSFCell.CELL_TYPE_STRING : v5 = cell5.getStringCellValue();
									break;
							
									default :
								}
							}
						    HSSFCell cell6  = row.getCell(f);
						    if (cell6 != null) 
							{ 
								switch (cell6.getCellType())
								{
									case HSSFCell.CELL_TYPE_FORMULA :
									v6 = "FORMULA ";
									break;
							
									case HSSFCell.CELL_TYPE_NUMERIC :
									v6 = ""+cell6.getNumericCellValue();
									break;
							
									case HSSFCell.CELL_TYPE_STRING :
									v6 = cell6.getStringCellValue();
									break;
							
									default :
								}
								ph = v6.replace(".","");
								ph = ph.replace("E9","");
							}
%>
			    			<%-- <tr><td><%=v1%></td><td><%=v2%></td><td><%=ph%></td></tr> --%>
<%
if(v1 != null && v2 != null && v3 != null && v4 != null && v5 != null && ph != null)
{
	String sql = "select name,board_name,medium,class_name,section,mobile from addstudent where name='"+v1+"' and board_name='"+v2+"' and medium='"+v3+"' and class_name='"+v4+"' and section='"+v5+"' and mobile='"+ph+"'"; 
	ps = con.prepareStatement(sql); 
	ResultSet rs = ps.executeQuery();
	if(rs.next())
	{
		session.setAttribute("error", "Already Existed Record(s)");
		%>		    
		<script>window.location.href="import_student.jsp";</script>
<%
	}
	else
	{
		
		String query="insert into addstudent(Sno,name,board_name,medium,class_name,section,mobile,registeredon) values(null,'"+v1+"','"+v2+"','"+v3+"','"+v4+"','"+v5+"','"+ph+"',NOW())";							
		ps=con.prepareStatement(query);
		int ins= ps.executeUpdate();
// 		con.setAutoCommit(false);
// 		ps.addBatch();
		
// 		int[] ins=ps.executeBatch();
// 		con.commit();
		
		System.out.println(ins);
		if(ins>0)
		{
			session.setAttribute("imported", "Students List Successfully Imported/Uploaded");
%>		    
			<script>window.location.href="view_student.jsp";</script>
<%			
		}
		else
		{
		    session.setAttribute("error", "Faied to Import/Add the Student");
		    response.sendRedirect("import_student.jsp");
		}
		
	}
}
						}
				    	else
						{
							%>
							<script>alert("Columns doesn\'t match.Please try Again");window.location.href="import_student.jsp";</script>
							<%
						}
					}
			    }
		        i++;
		    }
	    }
	    catch(Exception ex)
	    {
	        System.out.println(ex);
	    }
    }
    else
	{
		%>
		<script>alert("No File to Read..!");window.location.href="import_student.jsp";</script>
		<%
	}
} %>
			    	</table>
</html>