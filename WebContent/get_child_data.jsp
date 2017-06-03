<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.charvikent.dbconnection.DbUtility"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Parent | Children Details</title>
</head>
<body>
<%
Connection con=null;
PreparedStatement ps=null;
int i=0;

if((session.getAttribute("parent_name")==null)||(session.getAttribute("parent_name")==""))
{
	response.sendRedirect("AdminLogin");
}
else
{
	String url=application.getInitParameter("url");
	String username=application.getInitParameter("username");
	String password=application.getInitParameter("password");
	con=DbUtility.getConnection(url,username,password);
	String uname=session.getAttribute("parent_name").toString();
	
	String sno=request.getParameter("id");
	
	String sql = "SELECT * FROM addstudent where Sno='"+sno+"'"; 
	ps = con.prepareStatement(sql); 
	ResultSet rs = ps.executeQuery();
	if(rs.next())
	{
%>
<div class="mainbar">
      
      <div class="page-head">
        <h2 class="pull-left"><i class="fa fa-file-o"></i> Student Details</h2>

        <!-- Breadcrumb -->
        <div class="bread-crumb pull-right">
          <a href="parenthome.jsp"><i class="fa fa-home"></i> Home</a> 
          <!-- Divider -->
          <span class="divider">/</span> 
          <a href="" class="bread-current">Student Details</a>
        </div>

        <div class="clearfix"></div>
      </div>
      <div class="matter">
      	<div class="container">
			<div class="row">
        		<div class="col-md-7 col-md-offset-2">
              <!-- Quick setting -->
              <div class="widget">
                <div class="widget-head">
					<div class="x_panel" id="view_one">
				        <div class="x_title">
				            <div class="pull-left">Student Name: <%= rs.getString(2)%></div>
				            <div class="widget-icons pull-right">
<!-- 				            	<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>  -->
				                <a onclick="getBack()" class="wclose"><i class="fa fa-times"></i></a>
				            </div> 
				            <div class="clearfix"></div>
				        </div>
				    </div>
				</div>
				
        		<div class="widget-content">
                  	<div class="padd">
                    
                <!-- Table -->
			<table class="table1" style="float: left;line-height: 3em;">
<%-- 				<tr><td class="ralign" style="width:20%;">Name</td><td>:</td><td style="width:50%"><%= rs.getString(2)%></td></tr> --%>
				<% if(rs.getString(9) != null || rs.getString(9) == "") { %>
				<tr><th class="ralign">Father Name</th><td>:</td><td><%= rs.getString(9)%></td></tr>
				<% } %>
				
				<% if(rs.getString(5) != null || rs.getString(5) == "") { %>
				<tr><th class="ralign">Class</th><td>:</td><td><%= rs.getString(5)%></td></tr>
				<% } %>
				
				<% if(rs.getString(6) != null || rs.getString(6) == "") { %>
				<tr><th class="ralign">Section</th><td>:</td><td><%= rs.getString(6)%></td></tr>
				<% } %>
				
				<% if(rs.getString(7) != null || rs.getString(7) == "") { %>
				<tr><th class="ralign">Roll No</th><td>:</td><td><%= rs.getString(7)%></td></tr>
				<% } %>
				
				<% if(rs.getString(8) != null || rs.getString(8) == "") { %>
				<tr><th class="ralign">Admission No</th><td>:</td><td><%= rs.getString(8)%></td></tr>
				<% } %>
				
				<% if(rs.getString(4) != null || rs.getString(4) == "") { %>
				<tr><th class="ralign">Medium</th><td>:</td><td><%= rs.getString(4)%></td></tr>
				<% } %>
				
				<% if(rs.getString(10) != null || rs.getString(10) == "") { %>
				<tr><th class="ralign">Mobile No</th><td>:</td><td><%= rs.getString(10)%></td></tr>
				<% } %>
				
				<% if(rs.getString(11) != null || rs.getString(11) == "") { %>
				<tr><th class="ralign">Alternative No</th><td>:</td><td><%= rs.getString(11)%></td></tr>
				<% } %>
				
				<% if(rs.getString(12) != null || rs.getString(12) == "") { %>
				<tr><th class="ralign">Email</th><td>:</td><td><%= rs.getString(12)%></td></tr>
				<% } %>
				
				<% if(rs.getString(13) != null || rs.getString(13) == "") { %>
				<tr><th class="ralign">Blood Group</th><td>:</td><td><%= rs.getString(13)%></td></tr>
				<% } %>
				
				<% if(rs.getString(14) != null || rs.getString(14) == "") { %>
				<tr><th class="ralign">Gender</th><td>:</td><td><%= rs.getString(14)%></td></tr>
				<% } %>
				
				<% if(rs.getString(15) != null || rs.getString(15) == "") { %>
				<tr><th class="ralign">Date Of Birth</th><td>:</td><td><%= rs.getString(15)%></td></tr>
				<% } %>
				
				<% if(rs.getString(16) != null || rs.getString(16) == "") { %>
				<tr><th class="ralign">Religion</th><td>:</td><td><%= rs.getString(16)%></td></tr>
				<% } %>
				
				<% if(rs.getString(17) != null || rs.getString(17) == "") { %>
				<tr><th class="ralign">Address</th><td>:</td><td><%= rs.getString(17)%></td></tr>
				<% } %>
				
				<% if(rs.getString(18) != null || rs.getString(18) == "") { %>
				<tr><th class="ralign">Previous Institute</th><td>:</td><td><%= rs.getString(18)%></td></tr>
				<% } %>
				
				<% if(rs.getString(19) != null || rs.getString(19) == "") { %>
				<tr><th class="ralign">Caste</th><td>:</td><td><%= rs.getString(19)%></td></tr>
				<% } %>
				
				<% if(rs.getString(20) != null || rs.getString(20) == "") { %>
				<tr><th class="ralign">Accommodation</th><td>:</td><td><%= rs.getString(20)%></td></tr>
				<% } %>
				
				<% if(rs.getString(21) != null || rs.getString(21) == "") { %>
				<tr><th class="ralign">Bus facility</th><td>:</td><td><%= rs.getString(21)%></td></tr>
				<% } %>
				
				<% if(rs.getString(22) != null || rs.getString(22) == "") { %>
				<tr><th class="ralign">Bus Route</th><td>:</td><td><%= rs.getString(22)%></td></tr>
				<% } %>
				
			</table>
		<div>
		<%
            String path=application.getRealPath("/upload/");
// 			System.out.println(path);
            File file=new File(path+rs.getString(23));
			if(file.exists()){
        %>
			<img src='upload/<%= rs.getString(23)%>' style="width: 113px;height: 150px;" alt="Profile Image"/>
		<%  }else{ %>
    		<img src="upload/default.png" style="width: 113px;height: 150px;" alt="Profile Image"/>
    	<%  }  %>
		</div>
					</div>
		<div class="clearfix"></div>
              </div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>	
<% } %>	
	<script type="text/javascript">
	function getBack()
	{
		$('#get_data').html('');
		$('#view_list').show();
	}
	</script>

<% } %>
</body>
</html>