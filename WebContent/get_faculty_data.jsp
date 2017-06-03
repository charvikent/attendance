<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.charvikent.dbconnection.DbUtility"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Administrator | Student Details</title>
</head>
<body>
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
	String url=application.getInitParameter("url");
	String username=application.getInitParameter("username");
	String password=application.getInitParameter("password");
	con=DbUtility.getConnection(url,username,password);
	String uname=session.getAttribute("username").toString();
	
	String sno=request.getParameter("id");
	
	String sql = "SELECT * FROM faculty where Sno='"+sno+"'"; 
	ps = con.prepareStatement(sql); 
	ResultSet rs = ps.executeQuery();
	if(rs.next())
	{
%>
<div class="mainbar">
      
      <div class="page-head">
        <h2 class="pull-left"><i class="fa fa-file-o"></i> Faculty Details</h2>

        <!-- Breadcrumb -->
        <div class="bread-crumb pull-right">
          <a href="AdminHome"><i class="fa fa-home"></i> Home</a> 
          <!-- Divider -->
          <span class="divider">/</span> 
          <a href="" class="bread-current">Faculty Details</a>
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
				            <div class="pull-left">Faculty Name: <%= rs.getString(2)%></div>
				            <div class="widget-icons pull-right">
<!-- 				            	<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>  -->
				                <a style="cursor: pointer;" onclick="getBack()" class="wclose"><i class="fa fa-times"></i></a>
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
				
				<% if(rs.getString(3) != null || rs.getString(3) == "") { %>
				<tr><th class="ralign">Gender</th><td>:</td><td><%= rs.getString(3)%></td></tr>
				<% } %>

				<% if(rs.getString(4) != null || rs.getString(4) == "") { %>
				<tr><th class="ralign">Board Name</th><td>:</td><td><%= rs.getString(4)%></td></tr>
				<% } %>
				
				<% if(rs.getString(5) != null || rs.getString(5) == "") { %>
				<tr><th class="ralign">Medium</th><td>:</td><td><%= rs.getString(5)%></td></tr>
				<% } %>
				
				<% if(rs.getString(6) != null || rs.getString(6) == "") { %>
				<tr><th class="ralign">Class Name</th><td>:</td><td><%= rs.getString(6)%></td></tr>
				<% } %>
				
				<% if(rs.getString(7) != null || rs.getString(7) == "") { %>
				<tr><th class="ralign">Section</th><td>:</td><td><%= rs.getString(7)%></td></tr>
				<% } %>
				
				<% if(rs.getString(8) != null || rs.getString(8) == "") { %>
				<tr><th class="ralign">Qualification</th><td>:</td><td><%= rs.getString(8)%></td></tr>
				<% } %>
				
				<% if(rs.getString(9) != null || rs.getString(9) == "") { %>
				<tr><th class="ralign">Mobile Number</th><td>:</td><td><%= rs.getString(9)%></td></tr>
				<% } %>
				
				<% if(rs.getString(10) != null || rs.getString(10) == "") { %>
				<tr><th class="ralign">Subject Name</th><td>:</td><td><%= rs.getString(10)%></td></tr>
				<% } %>
				
				
			</table>
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