<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.charvikent.dbconnection.DbUtility"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <!-- Title and other stuffs -->
  <title>Administrator | Search Student</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta name="author" content="">
  <!-- Stylesheets -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <!-- Font awesome icon -->
  <link rel="stylesheet" href="css/font-awesome.min.css"> 
  <!-- jQuery UI -->
  <link rel="stylesheet" href="css/jquery-ui.css"> 
  <!-- Calendar -->
  <link rel="stylesheet" href="css/fullcalendar.css">
  <!-- prettyPhoto -->
  <link rel="stylesheet" href="css/prettyPhoto.css">  
  <!-- Star rating -->
  <link rel="stylesheet" href="css/rateit.css">
  <!-- Date picker -->
  <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">
  <!-- CLEditor -->
  <link rel="stylesheet" href="css/jquery.cleditor.css"> 
  <!-- Data tables -->
  <link rel="stylesheet" href="css/jquery.dataTables.css"> 
  <!-- Bootstrap toggle -->
  <link rel="stylesheet" href="css/jquery.onoff.css">
  <!-- Main stylesheet -->
  <link href="css/style.css" rel="stylesheet">
  <!-- Widgets stylesheet -->
  <link href="css/widgets.css" rel="stylesheet">   
  
  <script src="js/respond.min.js"></script>
<script src="js/jquery.js"></script> <!-- jQuery -->
<!--   <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.3.min.js"></script> -->
<script src="js/jquery-1.11.1.js" type="text/javascript"></script>
  <script src="js/jquery.js"></script>
  <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/jquery.validate.min.js"></script>
  <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/additional-methods.min.js"></script>
  <script src="js/dependent.js"></script>
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <![endif]-->

  <!-- Favicon -->
  <link rel="shortcut icon" href="img/favicon/school.png">
  <style type="text/css">
    span.has-error, #already_exist, .subjects_error{
  font-weight:normal;
  color:red;
  margin:0px;
  display: block !important;
  position: absolute;
  margin-top: -2px;
  }
  /* label{
  font-weight:normal;
  } */
  </style>
<script>
    history.forward();
</script>
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
	
	String board_name=request.getParameter("board");
	String medium_name=request.getParameter("medium");
	String class_name=request.getParameter("clas");
	String section_name=request.getParameter("section");
	
	
	String slno=request.getParameter("slno");
    if(slno != null)
    {
    	ps=con.prepareStatement("delete from addstudent where Sno='"+slno+"'");
    	i=ps.executeUpdate();
    	System.out.println(i);
    	if(i>=0)
    	{
    		session.setAttribute("deleted", "Successfully Student is Deleted");
            response.sendRedirect("search_student.jsp");
    	}
        else
        {
            session.setAttribute("error", "Faied to Delete the Student");
            response.sendRedirect("search_student.jsp");
        }
    }
%>

<div class="navbar navbar-fixed-top bs-docs-nav" role="banner">
  
    <div class="conjtainer">
      <!-- Menu button for smallar screens -->
      <div class="navbar-header">
		  <button class="navbar-toggle btn-navbar" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
			<span>Menu</span>
		  </button>
		  <!-- Site name for smallar screens -->
		  <a href="AdminHome" class="navbar-brand hidden-lg">Attendance Management </a>
		</div>
      
      

      <!-- Navigation starts -->
      <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">         


        <!-- Search form -->
       
        <!-- Links -->
         <div class="col-md-6">
          <!-- Logo. -->
          <div class="logo">
            <h2><a href="AdminHome">Attendance Management System</a></h2>
            <p class="meta"></p>
          </div>
          <!-- Logo ends -->
        </div>
        <ul class="nav navbar-nav pull-right">

          <li class="dropdown pull-right">            
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
              <i class="fa fa-user"></i> Admin <b class="caret"></b>              
            </a>
            
            <!-- Dropdown menu -->
            <ul class="dropdown-menu">
              <li><a href="javascript:void(0)"><i class="fa fa-user"></i> Logged in as <span style="color: red;"><%= uname%></span></a></li>
              <li><a href="Logout"><i class="fa fa-sign-out"></i> Logout</a></li>
            </ul>
          </li>
          
        </ul>
      </nav>

    </div>
  </div>


<!-- Header starts -->
  <header>
   

        <!-- Data section -->

       
  </header>

<!-- Header ends -->

<!-- Main content starts -->

<div class="content">

  	<!-- Sidebar -->
    <div class="sidebar">
    
        <div class="sidebar-dropdown"><a href="">Navigation</a></div>

        <!--- Sidebar navigation -->
        <!-- If the main navigation has sub navigation, then add the class "has_sub" to "li" of main navigation. -->
        <ul id="nav">
          <!-- Main menu with font awesome icon -->
          <li class=""><a href="AdminHome"><i class="fa fa-home"></i> Dashboard</a>
            <!-- Sub menu markup 
            <ul>
              <li><a href="#">Submenu #1</a></li>
              <li><a href="#">Submenu #2</a></li>
              <li><a href="#">Submenu #3</a></li>
            </ul>-->
          </li>
          <li class=" has_sub">
			<a href="#"><i class="fa fa-list-alt"></i> General Settings  <span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
            <ul>
              <li class=""><a href="ClassCreation">Class Creation</a></li>
              <!-- <li class=""><a href="SubjectCreation">Subject Creation</a></li>
              <li class=""><a href="AddSubject">Add Subject</a></li> -->
              <li class=""><a href="add_faculty.jsp">Add Faculty</a></li>
            </ul>
          </li>
          <!-- <li class="has_sub">
			<a href="#"><i class="fa fa-tasks"></i> Faculty Details  <span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
            <ul>
              <li class=""><a href="add_faculty.jsp">Add Faculty</a></li>
              <li class=""><a href="import_faculty.jsp">Import Faculty</a></li>
              <li class=""><a href="export_faculty.jsp">Export Faculty</a></li>
            </ul>
          </li> -->
          <li class="open has_sub">
			<a href="#"><i class="fa fa-tasks"></i> Students Details  <span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
            <ul>
              <li class="" ><a href="add_student.jsp">Add Student</a></li>
              <li class="" ><a href="view_student.jsp">View Students</a></li>
              <li class=""><a href="import_student.jsp">Import Students</a></li>
              <li class=""><a href="export.jsp">Export Students</a></li>
              <li class="current" ><a href="search_student.jsp">Search Students</a></li>
            </ul>
          </li> 
          <li class="has_sub">
			<a href="#"><i class="fa fa-file-o"></i> Message  <span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
            <ul>
              <li class=""><a href="attendance.jsp">Attendance</a></li>
              <li class=""><a href="common_message.jsp">Common Message</a></li>
              <li class=""><a href="view_attendance.jsp">View Attendance</a></li>
              <li class=""><a href="view_common_message.jsp">View Common Messages</a></li>
              <!-- <li><a href=#>Diary</a></li>
              <li><a href=#>Fee</a></li>
              <li><a href=#>Group Marks</a></li>
              <li><a href=#>Personal Message</a></li>
              <li><a href=#>Send Attachment</a></li>
              <li><a href=#>Send Message</a></li>
              <li><a href=#>Voice Message</a></li> -->
            </ul>
          </li>    
		  <!-- <li class="has_sub"><a href="#"><i class="fa fa-table"></i> Tables  <span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
            <ul>
              <li><a href="tables.html">Tables</a></li>
              <li><a href="dynamic-tables.html">Dynamic Tables</a></li>
            </ul>
          </li>		   -->
        </ul>
    </div>

    <!-- Sidebar ends -->

  	  	<!-- Main bar -->
  	
	    <!-- Page heading ends -->



	    <!-- Matter -->

	    <div class="matter">
        <div class="container">

                 

		<!-- Matter ends -->

    </div>
</div>
   <!-- Mainbar ends -->
   <div class="clearfix"></div>

</div>
 <div class="right_col" role="main">
        <div class="">       
 	<div id="view_list">
        <div class="mainbar">

         <div class="page-head">
        <h2 class="pull-left"><i class="fa fa-tasks"></i> Students Details</h2>

        <!-- Breadcrumb -->
        <div class="bread-crumb pull-right">
          <a href="AdminHome"><i class="fa fa-home"></i> Home</a> 
          <!-- Divider -->
          <span class="divider">/</span> 
          <a  class="bread-current">Students Details</a>
          </div>
            <div class="clearfix"></div>
      </div>

      <div class="matter">
        <div class="container">

          <div class="row">
          <div class="col-md-6 col-md-offset-2">
              <!-- Quick setting -->
              <div class="widget">
                <div class="widget-head">
                  <div class="pull-left">Search Students</div>
                  <div class="widget-icons pull-right">
                    <a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a> 
                    <a href="#" class="wclose"><i class="fa fa-times"></i></a>
                  </div>  
                  <div class="clearfix"></div>
                </div>
                <div class="widget-content">
                  <div class="padd">
                    
                    <div class="form quick-post">
                                      <!-- Quick setting form (not working)-->
                          <form id="msg-form1" action="search_student.jsp" class="form-horizontal form-label-left" method="post" role="form">
                          <!-- Name -->
					<div class="form-group">
                    	<label class="control-label col-md-3" for="sitename">Board Name</label>
                        <div class="col-lg-6 ">
							<select class="form-control" name="board" id="board">
							<option value="" selected disabled>Choose Board</option>
							<%
						      	PreparedStatement ps1=con.prepareStatement("select distinct board_name from classcreation");
					            ResultSet rs1=ps1.executeQuery();
					            while(rs1.next()){ 
					        %>
								<option value="<%= rs1.getString(1) %>" <% if(rs1.getString(1).equals(board_name)) { %> selected<% } %>><%= rs1.getString(1) %></option>
							<% } %>
   							</select>
							<span class="board_error" id="board_error"></span>
						</div>
					</div>

                  	<div class="form-group">
                    	<label class="control-label col-md-3" for="sitename">Medium</label>
                        <div class="col-lg-6 ">
                        	<select class="form-control" name="medium" id="medium" required>
                        	<option value="" selected disabled>Choose Medium</option>
                        	<%
	                        	if(medium_name != null)
						      	{
						      	PreparedStatement ps2=con.prepareStatement("select distinct medium from classcreation");
					            ResultSet rs2=ps2.executeQuery();
					            while(rs2.next()){ 
					        %>
								<option value="<%= rs2.getString(1) %>" <% if(rs2.getString(1).equals(medium_name)) { %> selected<% } %>><%= rs2.getString(1) %></option>
							<% } } %>
							</select>
							<span class="medium_error" id="medium_error"></span>
						</div>
					</div>

                    <div class="form-group">
                    	<label class="control-label col-md-3" for="sitename"> Class Name</label>
                        <div class="col-lg-6">
                        	<select class="form-control" name="clas" id="clas" required>
                        	<option value="" selected disabled>Choose Class</option>
                        	<%
	                        	if(class_name != null)
						      	{
						      	PreparedStatement ps3=con.prepareStatement("select distinct class_name from classcreation");
					            ResultSet rs3=ps3.executeQuery();
					            while(rs3.next()){ 
					        %>
								<option value="<%= rs3.getString(1) %>" <% if(rs3.getString(1).equals(class_name)) { %> selected<% } %>><%= rs3.getString(1) %></option>
							<% } } %>
							</select>
							<span class="clas_error" id="clas_error"></span>
                        </div>
                    </div>
                    
                    <div class="form-group">
                    	<label class="control-label col-md-3" for="sitename"> Section</label>
                        <div class="col-lg-6">
                        	<select class="form-control" name="section" id="section" required>
                        	<option value="" selected disabled>Choose Section</option>
                        	<%
	                        	if(section_name != null)
						      	{
						      	PreparedStatement ps4=con.prepareStatement("select distinct section from classcreation");
					            ResultSet rs4=ps4.executeQuery();
					            while(rs4.next()){ 
					        %>
								<option value="<%= rs4.getString(1) %>" <% if(rs4.getString(1).equals(section_name)) { %> selected<% } %>><%= rs4.getString(1) %></option>
							<% } } %>
							</select>
							<span class="section_error" id="section_error"></span>
                        </div>
                    </div>   
                          <!-- Buttons -->
					<div class="form-group">
                    	<div class="col-lg-9 col-lg-offset-3">
                        	<button type="submit" class="btn btn-info" name="submit" id="submit" <% if(board_name != null && medium_name != null && class_name != null && section_name != null) { %> style="display: none;" <% } %>>Submit</button>
                            <button type="reset" class="btn btn-default" id="cancel" <% if(board_name != null && medium_name != null && class_name != null && section_name != null) { %> style="display: none;" <% } %>>Reset</button>
                    	</div>
					</div>
<%
			String sended=null;
			sended=(String)session.getAttribute("sended");
	        if(sended!=null)
	        {
				out.println("<h4 class='text-center' style='color: green'>"+sended+"</h4><br>");
				session.setAttribute("sended", null);
			}
            String error=null;
            error=(String)session.getAttribute("error");
            if(error!=null)
            {
				out.println("<h4 class='text-center' style='color: red'>"+error+"</h4><br>");
				session.setAttribute("error", null);
			}
%>        
                        </form>
                                    </div>

                  </div>
                </div>
</div><!-- widget closed -->
</div>

<%

if(board_name !=null && medium_name != null && class_name != null && section_name != null)
{
	String sql = "select * from addstudent where board_name='"+board_name+"' and medium='"+medium_name+"' and class_name='"+class_name+"' and section='"+section_name+"'"; 
	ps = con.prepareStatement(sql); 
	ResultSet rs = ps.executeQuery();
%>
<!-- <form id="msg-form2" action="" method="post"> -->
<div class="col-md-12">
<!-- Quick setting -->
<div class="widget">
  <div class="widget-head">
    <div class="pull-left">Students List</div>
    <div class="widget-icons pull-right">
<!--     	<button type="button" id="chkbtn" style="display: none;border: none;margin-top: -2%;"><i class="fa fa-trash" style="color: red;"></i></button> -->
      <a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a> 
      <a href="#" class="wclose"><i class="fa fa-times"></i></a>
    </div>  
    <div class="clearfix"></div>
  </div>
  <div class="widget-content">
    <div class="padd">
      
<!-- Table Page -->
<div class="page-tables">
  <!-- Table -->
    
<%
	if(!rs.isBeforeFirst())
	{
%>
  	<div class="table-responsive">
		<div id="data-table-1_wrapper" class="dataTables_wrapper no-footer">
			<div class="dataTables_length" id="data-table-1_length">
			<label>Show <select name="data-table-1_length" aria-controls="data-table-1" class="valid" aria-invalid="false"><option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> entries</label></div><div id="data-table-1_filter" class="dataTables_filter"><label>Search:<input type="search" class="" placeholder="" aria-controls="data-table-1"></label></div>
			<table cellpadding="0" cellspacing="0" border="0" id="data-table-1" width="100%" class="dataTable no-footer" role="grid" aria-describedby="data-table-1_info" style="width: 100%;">
	        	<thead>
					<tr role="row"><th class="sorting_asc" tabindex="0" aria-controls="data-table-1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="#: activate to sort column descending" style="width: 22px;">#</th><th class="sorting" tabindex="0" aria-controls="data-table-1" rowspan="1" colspan="1" aria-label="Sl.no: activate to sort column ascending" style="width: 56px;">Sl.no</th><th class="sorting" tabindex="0" aria-controls="data-table-1" rowspan="1" colspan="1" aria-label="Image: activate to sort column ascending" style="width: 65px;">Image</th><th class="sorting" tabindex="0" aria-controls="data-table-1" rowspan="1" colspan="1" aria-label="Name: activate to sort column ascending" style="width: 64px;">Name</th><th class="sorting" tabindex="0" aria-controls="data-table-1" rowspan="1" colspan="1" aria-label="Board: activate to sort column ascending" style="width: 64px;">Board</th><th class="sorting" tabindex="0" aria-controls="data-table-1" rowspan="1" colspan="1" aria-label="Class: activate to sort column ascending" style="width: 60px;">Class</th><th class="sorting" tabindex="0" aria-controls="data-table-1" rowspan="1" colspan="1" aria-label="Section: activate to sort column ascending" style="width: 77px;">Section</th><th class="sorting" tabindex="0" aria-controls="data-table-1" rowspan="1" colspan="1" aria-label="Roll Number: activate to sort column ascending" style="width: 121px;">Roll Number</th><th class="sorting" tabindex="0" aria-controls="data-table-1" rowspan="1" colspan="1" aria-label="Father Name: activate to sort column ascending" style="width: 125px;">Father Name</th><th class="sorting" tabindex="0" aria-controls="data-table-1" rowspan="1" colspan="1" aria-label="Mobile No.: activate to sort column ascending" style="width: 106px;">Mobile No.</th></tr>
	        	</thead>     
	            <tbody><tr class="odd"><td valign="top" colspan="10" class="dataTables_empty">No data available in table</td></tr></tbody>
			</table>
			<div class="dataTables_info" id="data-table-1_info" role="status" aria-live="polite">Showing 0 to 0 of 0 entries</div>
			<div class="dataTables_paginate paging_full_numbers" id="data-table-1_paginate">
				<a class="paginate_button first disabled" aria-controls="data-table-1" data-dt-idx="0" tabindex="0" id="data-table-1_first">First</a><a class="paginate_button previous disabled" aria-controls="data-table-1" data-dt-idx="1" tabindex="0" id="data-table-1_previous">Previous</a><span></span><a class="paginate_button next disabled" aria-controls="data-table-1" data-dt-idx="2" tabindex="0" id="data-table-1_next">Next</a><a class="paginate_button last disabled" aria-controls="data-table-1" data-dt-idx="3" tabindex="0" id="data-table-1_last">Last</a>
			</div>
		</div>
        <div class="clearfix"></div>
	</div>
	<div class="form-group">
    	<div class="col-md-3 col-sm-6 col-xs-12" style="float: right;">
        	<a style="float: right;" href="search_student.jsp"><button id="reset" name="reset" type="button" class="btn btn-danger">Cancel</button></a>
		</div>
	</div>
    <br>
<%
	}    
	else
	{
%>
	<div class="table-responsive">
	<table cellpadding="0" cellspacing="0" border="0" id="data-table-1" width="100%">
      	<thead>
        <tr>
          <!-- <th>
          <input id="checkAll" type="checkbox" class="checkbox" name="checkall">
          </th> -->
          <th>Roll.no</th>
          <th>Image</th>
          <th>Student Name</th>
          <th>Board</th>
          <th>Medium</th>
          <th>Class</th>
          <th>Section</th>
          <th>Father Name</th>
          <th>Mobile</th>
          <th>Action</th>
        </tr>
		</thead>     
		<tbody>
<%	while(rs.next()) { %>
	<tr>
<%-- 		<td><input type="checkbox" name="student_id[]" id="student_id[]" value="<%= rs.getString(1)%>"></td> --%>
		<td><%= rs.getString(7)%></td>
		<td>
		<%
            String path=application.getRealPath("/upload/");
// 			System.out.println(path);
            File file=new File(path+rs.getString(23));
			if(file.exists()){
        %>
			<img src='upload/<%= rs.getString(8)%>.png' style="width: 65px;height: 65px;" alt="Profile Image"/>
		<%  }else{ %>
    		<img src="upload/default.png" style="width: 65px;height: 65px;" alt="Profile Image"/>
    	<%  }  %>
		</td>
		<td><%= rs.getString(2)%></td>
		<td><%= rs.getString(3)%></td>
		<td><%= rs.getString(4)%></td>
		<td><%= rs.getString(5)%></td>
		<td><%= rs.getString(6)%></td>
		<td><%= rs.getString(9)%></td>
		<td><%= rs.getString(10)%></td>
		<td>
			<a onClick="getApplicant(<%= rs.getString(1)%>)">
				<button type="button" title='' data-placement='top' data-toggle='tooltip' data-original-title='Open' class='btn btn-sm tooltips'>
					<i class="fa fa-file-text"></i>
				</button>
			</a>
			<a href="edit_student.jsp?sno=<%= rs.getString(1)%>">
	  			<button type="button" title='' data-placement='top' data-toggle='tooltip' data-original-title='Edit' class='btn btn-sm tooltips'>
	  				<i class='fa fa-edit'></i>
	  			</button>
	  		</a>
	  		<a href="search_student.jsp?slno=<%= rs.getString(1)%>" onClick="return confirm('Are sure you want Delete ');">
	  			<button type="button" title='' data-placement='top' data-toggle='tooltip' data-original-title='Delete' class='btn btn-sm tooltips'>
	  				<i class='fa fa-trash-o'></i>
	  			</button>
	  		</a>
		</td>
	</tr>
	<% } %>
    </tbody>
      
    </table>
    
  </div>
  </div>

    

  </div>
<!-- </form> -->
</div>
<% } %>
 
                </div>
                </div>
<% } %>
            </div>
		</div>
	</div>
         
    <!-- Matter ends -->     
   <div class="clearfix"></div>

</div>
          </div>

        <span id="get_data"></span>
    <!-- /page content -->
	<div id="loading"></div>
	
<!-- form vaildation -->

<script type="text/javascript">

  $("#msg-form1").validate({
	errorElement: 'span',
    errorClass: 'has-error',
	rules:
    {
		board:{required: true},
	 	medium:{required: true},
		clas:{required: true},
		section:{required: true},
	},
	messages:
	{
      	board:{required: 'Please Choose Board'},
        medium:{required: 'Please Choose Medium'},
		clas:{required: 'Please Choose Class'},
		section:{required: 'Please Choose Section'},
	},

	errorPlacement: function(error, element)
	{
       if(element.attr("name") == "board")
        error.insertAfter(".board_error").css("color", "red"); 
       else if(element.attr("name") == "medium")
        error.insertAfter(".medium_error").css("color", "red");
       else if(element.attr("name") == "clas")
        error.insertAfter(".clas_error").css("color", "red");
       else if(element.attr("name") == "section")
        error.insertAfter(".section_error").css("color", "red");
      else
        error.insertAfter(element);
	}	
  
  });

  $('#cancel').click(function () {
    $("#msg-form1").validate().resetForm();
    $("#msg-form1").removeClass("has-error");
    $("#board").val('');
    $("#medium").val('');
    $("#clas").val('');
    $("#section").val('');
   
  });

  			
  		  $("#msg-form2").validate({
//   			errorElement: 'span',
//   		    errorClass: 'has-error1',
  			rules:
  			{
  				"student_id[]":{required: true},absent_session:{required: true},messagedata:{required: true},notify_type:{required: true}
  			},
  			messages:
  			{
  				"student_id[]":{required: 'Please Select alteast One student to send SMS/Email'},
  				absent_session:{required: 'Please Select Absent Session'},
  				messagedata:{required: 'Please Enter Message'},notify_type:{required: 'Please Select type of Message'}
  			},
  			errorPlacement: function(error, element)
  			{
  		    	if(element.attr("name") == "student_id[]")
  		        	error.insertAfter(".student_id_error").css("color", "red");
  		      	else if(element.attr("name") == "absent_session")
  		        	error.insertAfter(".absent_session_error").css("color", "red"); 
  		      	else if(element.attr("name") == "messagedata")
  		        	error.insertAfter(".messagedata_error").css("color", "red"); 
  		       	else if(element.attr("name") == "notify_type")
  		        	error.insertAfter(".notify_type_error").css("color", "red");
  		      	else
  		        	error.insertAfter(element);
  			}	
  		  });
  		  
  		$("#checkAll").change(function () 
  				{
  					$("input:checkbox").prop('checked', $(this).prop("checked"));
  					/* var len=$("[name='slno[]']:checked").length;
  					if(len!=0)
  					{
  						$('#chkbtn').show();
  					}
  					else
  					{
  						$('#chkbtn').hide();
  					} */
  				});
  		function getApplicant(id)
		{
			$('#loading').html('<div class="loading"></div>');
			$.ajax({
		   		type:"GET",
		   		url:"get_data.jsp?id="+id,
		   		data: "",
		   		success:function(data)
		   		{
					if(data!="")
						{
				 			$('#get_data').html(data);
    						$('#loading').html('');
				  			$('#view_list').hide();
				  
			 			 }
			  		else alert('No Record');
    					$('#loading').html('');
		   		}
	   		});
		}
</script>

<!-- Content ends -->

<!-- Footer starts -->
<footer>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
            <!-- Copyright info -->
            <p class="copy">Copyright &copy; 2017 | <a href="AdminHome">Attendance Management System</a> </p>
      </div>
    </div>
  </div>
</footer> 	
</div>

    </div>

<!-- Footer ends -->

<!-- Scroll to top -->
<span class="totop"><a href="#"><i class="fa fa-chevron-up"></i></a></span> 

<!-- JS -->
<script src="js/bootstrap.min.js"></script> <!-- Bootstrap -->
<script src="js/jquery-ui.min.js"></script> <!-- jQuery UI -->
<script src="js/moment.min.js"></script> <!-- Moment js for full calendar -->
<script src="js/fullcalendar.min.js"></script> <!-- Full Google Calendar - Calendar -->
<script src="js/jquery.rateit.min.js"></script> <!-- RateIt - Star rating -->
<script src="js/jquery.prettyPhoto.js"></script> <!-- prettyPhoto -->
<script src="js/jquery.slimscroll.min.js"></script> <!-- jQuery Slim Scroll -->
<script src="js/jquery.dataTables.min.js"></script> <!-- Data tables -->

<!-- jQuery Flot -->
<!--<script src="js/excanvas.min.js"></script>
<script src="js/jquery.flot.js"></script>
<script src="js/jquery.flot.resize.js"></script>
<script src="js/jquery.flot.pie.js"></script>
<script src="js/jquery.flot.stack.js"></script>-->

<!-- jQuery Notification - Noty -->
<!--<script src="js/jquery.noty.js"></script> <!-- jQuery Notify -->
<!--<script src="js/themes/default.js"></script> <!-- jQuery Notify -->
<!--<script src="js/layouts/bottom.js"></script> <!-- jQuery Notify -->
<!--<script src="js/layouts/topRight.js"></script> <!-- jQuery Notify -->
<!--<script src="js/layouts/top.js"></script> <!-- jQuery Notify -->
<!-- jQuery Notification ends -->

<script src="js/sparklines.js"></script> <!-- Sparklines -->
<script src="js/jquery.cleditor.min.js"></script> <!-- CLEditor -->
<script src="js/bootstrap-datetimepicker.min.js"></script> <!-- Date picker -->
<script src="js/jquery.onoff.min.js"></script> <!-- Bootstrap Toggle -->
<script src="js/filter.js"></script> <!-- Filter for support page -->
<script src="js/custom.js"></script> <!-- Custom codes -->
<script src="js/charts.js"></script> <!-- Charts & Graphs -->


<% } %>
</body>
</html>