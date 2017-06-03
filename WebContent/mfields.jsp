<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.io.*, java.util.*"%>
<%@page import="org.apache.poi.hssf.usermodel.*"%>
<html>
<!-- <link rel="stylesheet" href="css/bootstrap.min.css"> -->
<%
	short p1=0, p2=1, p3=2;
	String v1=null, v2=null, v3=null;
	String filename ="D:/mfile.xls";
	if (filename != null && !filename.equals("")) 
	{
		try
		{
			FileInputStream fs =new FileInputStream(filename);
			HSSFWorkbook wb = new HSSFWorkbook(fs);
			for (int k = 0; k < wb.getNumberOfSheets(); k++)
			{
				HSSFSheet sheet = wb.getSheetAt(k);
				int rows = sheet.getPhysicalNumberOfRows();
					HSSFRow row = sheet.getRow(0);
					
					HSSFCell cell = row.getCell(p3);
					String c_0_2_value = null;
					if(cell != null)
					{
						switch(cell.getCellType())
						{
						case HSSFCell.CELL_TYPE_FORMULA :
							c_0_2_value = "FORMULA ";
							break;
					
							case HSSFCell.CELL_TYPE_NUMERIC :
							c_0_2_value = ""+cell.getNumericCellValue();
							break;
					
							case HSSFCell.CELL_TYPE_STRING :
							c_0_2_value = cell.getStringCellValue();
							break;
					
							default :
						}
					}
				for (int r = 1; r < rows; r++)
				{
					HSSFRow row1 = sheet.getRow(r);
					if (row1 != null) 
					{
						if(sheet.getRow(0).getCell((short)0).getStringCellValue().equals("class") && sheet.getRow(0).getCell((short)1).getStringCellValue().equals("student name") && c_0_2_value.equals("mobile"))
						{
							int cells = row1.getPhysicalNumberOfCells();

							HSSFCell cell1 = row1.getCell(p1);
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
							HSSFCell cell2 = row1.getCell(p2);
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
							HSSFCell cell3 = row1.getCell(p3);
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
							}
%>
<table style="border: 2px solid;" class="table">
	<tr><td><%= v1%></td><td><%= v2%></td><td><%= v3%></td></tr>
</table>
<% 
						}
						else
						{
							%>
							<script>alert("Columns doesn\'t match.Please try Again");window.location.href="import_student.jsp";</script>
							<%
						}
					}
				}
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}

	}
%>
</html>