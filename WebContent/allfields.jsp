<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.charvikent.dbconnection.DbUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.io.*, java.util.*, java.sql.*, javax.servlet.http.*, javax.servlet.annotation.MultipartConfig"%>
<%@page import="org.apache.poi.hssf.usermodel.*"%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <!-- Title and other stuffs -->
  <title>Administrator | All Fields</title>
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <![endif]-->

  <!-- Favicon -->
  <link rel="shortcut icon" href="img/favicon/school.png">
</head>
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
    MultipartRequest m=new MultipartRequest(request,path);
    String fileName="D:\\mfile.xls";
    m.getOriginalFileName(fileName);
    
//     String fileName="D:\\mfile.xls";
    System.out.println(fileName);
%>
<table border="1">
<%
	short a=0;  short b=1;  short c=2;
	int i=0;int count=0;
	String v1=null, v2=null, v3=null, ph=null;
    if (fileName != null && !fileName.equals("") && fileName.length()>0)
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
				
				String c_0_0_value = null;
				c_0_0_value = sheet.getRow(0).getCell((short)0).getStringCellValue();
				
				String c_0_1_value = null;
				c_0_1_value = sheet.getRow(0).getCell((short)1).getStringCellValue();
				
				String c_0_2_value = null;
				
				if(cell0_2 != null)
				{
					switch(cell0_2.getCellType())
					{
					case HSSFCell.CELL_TYPE_FORMULA :
						c_0_2_value = "FORMULA ";
						break;
				
						case HSSFCell.CELL_TYPE_NUMERIC :
						c_0_2_value = ""+cell0_2.getNumericCellValue();
						break;
				
						case HSSFCell.CELL_TYPE_STRING :
						c_0_2_value = cell0_2.getStringCellValue();
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
				    	if(c_0_0_value.equals("class") && c_0_1_value.equals("student name") && c_0_2_value.equals("mobile"))
						{
						    int cells = row.getPhysicalNumberOfCells(); 
						    out.write("<br>");
						    HSSFCell cell1  = row.getCell(a);
						    if (cell1 != null) 
							{ 
								switch (cell1.getCellType())
								{
									case HSSFCell.CELL_TYPE_FORMULA :
									v1 = "FORMULA ";
									break;
							
									case HSSFCell.CELL_TYPE_NUMERIC :
									v1 = ""+cell1.getNumericCellValue();
									break;
							
									case HSSFCell.CELL_TYPE_STRING :
									v1 = cell1.getStringCellValue();
									break;
							
									default :
								}
							}
						    HSSFCell cell2  = row.getCell(b);
						    if (cell2 != null) 
							{ 
								switch (cell2.getCellType())
								{
									case HSSFCell.CELL_TYPE_FORMULA :
									v2 = "FORMULA ";
									break;
							
									case HSSFCell.CELL_TYPE_NUMERIC :
									v2 = ""+cell2.getNumericCellValue();
									break;
							
									case HSSFCell.CELL_TYPE_STRING :
									v2 = cell2.getStringCellValue();
									break;
							
									default :
								}
							}
						    HSSFCell cell3  = row.getCell(c);
						    if (cell3 != null) 
							{ 
								switch (cell3.getCellType())
								{
									case HSSFCell.CELL_TYPE_FORMULA :
									v3 = "FORMULA ";
									break;
							
									case HSSFCell.CELL_TYPE_NUMERIC :
									v3 = ""+cell3.getNumericCellValue();
									break;
							
									case HSSFCell.CELL_TYPE_STRING :
									v3 = cell3.getStringCellValue();
									break;
							
									default :
								}
								ph = v3.replace(".","");
								ph = ph.replace("E9","");
							}
%>
			    			<tr><td><%=v1%></td><td><%=v2%></td><td><%=ph%></td></tr>
<%
if(v2 != null && v1 != null && ph != null)
{
	String sql = "select name,class_name,mobile from addstudent where name='"+v2+"' and class_name='"+v1+"' and mobile='"+ph+"'"; 
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
		
		String query="insert into addstudent(Sno,name,class_name,mobile,registeredon) values(null,'"+v2+"','"+v1+"','"+ph+"',DATE_FORMAT(NOW(),'%b %d %Y %h:%i %p'))";							
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
	    catch(Exception e)
	    {
	        System.out.println(e);
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