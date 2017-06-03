<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.charvikent.dbconnection.DbUtility"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <!-- Title and other stuffs -->
  <title>Administrator | View Student(s) List</title>
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
 <!-- jQuery -->
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
  </style>
<script>
    history.forward();
</script>

<script>
$("#tab1 #checkAll").click(function () {
    if ($("#tab1 #checkAll").is(':checked')) {
        $("#tab1 input[type=checkbox]").each(function () {
            $(this).prop("checked", true);
        });

    } else {
        $("#tab1 input[type=checkbox]").each(function () {
            $(this).prop("checked", false);
        });
    }
});
</script>
</head>
<body>
<%
Connection con=null;
PreparedStatement ps=null;
int i=0;

if(session.getAttribute("username")==null || session.getAttribute("username")=="")
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
	
// 	String sno=request.getParameter("sno");
	
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
            response.sendRedirect("view_student.jsp");
    	}
        else
        {
            session.setAttribute("error", "Faied to Delete the Student");
            response.sendRedirect("view_student.jsp");
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
              <li><a href="javascript:void(0)"><i class="fa fa-user"></i> Logged in as <span style="color: red;"> <%= uname %></span></a></li>
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
          <li class=""><a href="AdminHome"><i class="fa fa-home"></i> Dashboard</a></li>
          <li class="has_sub">
			<a href="#"><i class="fa fa-list-alt"></i> General Settings  <span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
            <ul>
              <li><a href="ClassCreation">Class Creation</a></li>
              <!-- <li><a href="SubjectCreation">Subject Creation</a></li>
              <li><a href="AddSubject">Add Subject</a></li> -->
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
              <li><a href="add_student.jsp">Add Student</a></li>
              <li class="current"><a href="view_student.jsp">View Students</a></li>
              <li><a href="import_student.jsp">Import Students</a></li>
              <li><a href="export.jsp">Export Students</a></li>
            </ul>
          </li> 
          <li class="has_sub">
			<a href="#"><i class="fa fa-file-o"></i> Message  <span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
            <ul>
              <li><a href="attendance.jsp">Attendance</a></li>
              <li><a href="common_message.jsp">Common Message</a></li>
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
          <!-- <li><a href="charts.html"><i class="fa fa-bar-chart-o"></i> Charts</a></li> 
          <li><a href="forms.html"><i class="fa fa-tasks"></i> Forms</a></li>
          <li><a href="ui.html"><i class="fa fa-magic"></i> User Interface</a></li> -->
        </ul>
    </div>

    <!-- Sidebar ends -->

   <div class="clearfix"></div>

</div>
 <div class="right_col" role="main">
        <div class="">	<style type="text/css">
		.table1{
			border-collapse: collapse;
			width: 80%;
			height: auto;
		}
	</style>
	<div id="view_list">
	<div class="mainbar">
      
      <div class="page-head">
        <h2 class="pull-left"><i class="fa fa-tasks"></i> Student Details</h2>

        <!-- Breadcrumb -->
        <div class="bread-crumb pull-right">
          <a href="AdminHome"><i class="fa fa-home"></i> Home</a> 
          <!-- Divider -->
          <span class="divider">/</span> 
          <a href="" class="bread-current">Student Details</a>
        </div>

        <div class="clearfix"></div>
      </div>
<%
			String updated=null;
			updated=(String)session.getAttribute("updated");
	        if(updated!=null)
	        {
				out.println("<h4 class='text-center' style='color: green'>"+updated+"</h4><br>");
				session.setAttribute("updated", null);
			}
	        
	        String deleted=null;
	        deleted=(String)session.getAttribute("deleted");
	        if(deleted!=null)
	        {
				out.println("<h4 class='text-center' style='color: green'>"+deleted+"</h4><br>");
				session.setAttribute("deleted", null);
			}
	        
	        String mul_delete=null;
	        mul_delete=(String)session.getAttribute("mul_delete");
	        if(mul_delete!=null)
	        {
				out.println("<h4 class='text-center mul_delete' style='color: green'>"+mul_delete+"</h4><br>");
				session.setAttribute("mul_delete", null);
			}
	        
	        String imported=null;
	        imported=(String)session.getAttribute("imported");
	        if(imported!=null)
	        {
				out.println("<h4 class='text-center' style='color: green'>"+imported+"</h4><br>");
				session.setAttribute("imported", null);
			}
	        
            String error=null;
            error=(String)session.getAttribute("error");
            if(error!=null)
            {
				out.println("<h4 class='text-center' style='color: red'>"+error+"</h4><br>");
				session.setAttribute("error", null);
			}
%>
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
                          <form id="msg-form1" action="view_student.jsp" class="form-horizontal form-label-left" method="post" role="form">
                          <!-- Name -->
					<div class="form-group">
                    	<label class="control-label col-md-3" for="sitename">Board Name</label>
                        <div class="col-lg-6 ">
							<select class="form-control" name="board" id="board">
							<option value="" selected disabled>Choose Board</option>
							<%
						      	PreparedStatement ps1=con.prepareStatement("select distinct board_name from classcreation");
					            ResultSet rst=ps1.executeQuery();
					            while(rst.next()){ 
					        %>
								<option value="<%= rst.getString(1) %>" <% if(rst.getString(1).equals(board_name)) { %> selected<% } %>><%= rst.getString(1) %></option>
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
                        	<button type="submit" class="btn btn-info" name="submit" id="submit" <% if(board_name != null && medium_name != null && class_name != null && section_name != null) { %> style="display: none;" <% } %>>Search</button>
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
            /* String error=null;
            error=(String)session.getAttribute("error");
            if(error!=null)
            {
				out.println("<h4 class='text-center' style='color: red'>"+error+"</h4><br>");
				session.setAttribute("error", null);
			} */
%>        
                        </form>
                                    </div>

                  </div>
                </div>
</div><!-- widget closed -->
</div>
          
          
        <div class="col-md-12">
              <!-- Quick setting -->
<!-- 			<form action="" method="post"> -->
              <div class="widget">
                <div class="widget-head">
                  <div class="pull-left">View Students</div>
                  <div class="widget-icons pull-right">
<!--                   	<form><button type="submit" style="visibility:hidden;" id="delbtn" onclick="return confirm('Are you sure you want to delete it?')"><i class="fa fa-trash"></i></button></form> -->
                  	<button type="button" id="delbtn" style="display: none;border: none;margin-top: -2%;"><i class="fa fa-trash" style="color: red;"></i></button>
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
                <div class="table-responsive">

                  <table cellpadding="0" cellspacing="0" border="0" id="data-table-1" width="100%">
                    <thead>
                      <tr>
                        <th><input id="checkAll" type="checkbox" class="checkbox" name="checkall" onclick="checkDelete()"></th>
                        <th>Sl.no</th>
                        <th>Name</th>
<!--                         <th>Board</th> -->
                        <th>Class</th>
                        <th>Section</th>
                        <th>Roll Number</th>
<!--                         <th>email</th> -->
                        <th>Mobile No.</th>
                        <th align="center">Action</th>
                        
                      </tr>
             </thead>     
              <tbody>
<%
if(board_name !=null && medium_name != null && class_name != null && section_name != null)
{
	String sql = "select * from addstudent where board_name='"+board_name+"' and medium='"+medium_name+"' and class_name='"+class_name+"' and section='"+section_name+"'"; 
	ps = con.prepareStatement(sql); 
	ResultSet rs = ps.executeQuery();
	if(!rs.isBeforeFirst())
	{
	  %>
	      <tr>
	          <td colspan="9"><% out.print("<h3 style='color:red;text-align:center'>No Results found!</h3>"); %></td>
	      </tr>
	  <%
	}
	else
	{
		while(rs.next())
	  	{
	%>
	  	  					<tr>
		  						<td><input type="checkbox" name="sl_no[]" class="sl_no" value="<%= rs.getString(1)%>" onclick="checkDelete()"></td>
		  						<td><%= rs.getString(1)%>.</td>
		  						<td><%= rs.getString(2)%></td>
	<%-- 	  						<td><%= rs.getString(3)%></td> --%>

		 						<td><%= rs.getString(5)%></td>
		  						<td><%= rs.getString(6)%></td>
		 						<td><%= rs.getString(7)%></td>
	<%-- 	  						<td><%= rs.getString(12)%></td> --%>
		  						<td><%= rs.getString(10)%></td>
		  						<td align="center">
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
		  							<a href="view_student.jsp?slno=<%= rs.getString(1)%>" onClick="return confirm('Are sure you want Delete ');">
		  								<button type="button" title='' data-placement='top' data-toggle='tooltip' data-original-title='Delete' class='btn btn-sm tooltips'>
		  									<i class='fa fa-trash-o'></i>
		  								</button>
		  							</a>
		  						</td>
		  					</tr>
	  <% }  } } else {
	
ps=con.prepareStatement("select * from addstudent");
ResultSet rs1=ps.executeQuery();
if(!rs1.isBeforeFirst())
{
  %>
      <tr>
          <td colspan="9"><% out.print("<h3 style='color:red;text-align:center'>No Results found!</h3>"); %></td>
      </tr>
  <%
}
else
{
	while(rs1.next())
  	{
%>
  	  					<tr>
	  						<td><input type="checkbox" name="sl_no[]" class="sl_no" value="<%= rs1.getString(1)%>" onclick="checkDelete()"></td>
	  						<td><%= rs1.getString(1)%>.</td>
	  						<td><%= rs1.getString(2)%></td>
<%-- 	  						<td><%= rs1.getString(3)%></td> --%>

	 						<td><%= rs1.getString(5)%></td>
	  						<td><%= rs1.getString(6)%></td>
	 						<td><%= rs1.getString(7)%></td>
<%-- 	  						<td><%= rs1.getString(12)%></td> --%>
	  						<td><%= rs1.getString(10)%></td>
	  						<td align="center">
	   							<a onClick="getApplicant(<%= rs1.getString(1)%>)">
									<button type="button" title='' data-placement='top' data-toggle='tooltip' data-original-title='Open' class='btn btn-sm tooltips'>
										<i class="fa fa-file-text"></i>
									</button>
								</a>
	  							<a href="edit_student.jsp?sno=<%= rs1.getString(1)%>">
	  								<button type="button" title='' data-placement='top' data-toggle='tooltip' data-original-title='Edit' class='btn btn-sm tooltips'>
	  									<i class='fa fa-edit'></i>
	  								</button>
	  							</a>
	  							<a href="view_student.jsp?slno=<%= rs1.getString(1)%>" onClick="return confirm('Are sure you want Delete ');">
	  								<button type="button" title='' data-placement='top' data-toggle='tooltip' data-original-title='Delete' class='btn btn-sm tooltips'>
	  									<i class='fa fa-trash-o'></i>
	  								</button>
	  							</a>
	  						</td>
	  					</tr>
  <% } %>
<% }  } %>
			                </tbody>
                    
                  </table>
                  </div>
                  <div class="clearfix"></div>
                </div>
                </div>
              </div>

          
                  </div>
<!-- 				</form> -->
                  <div class="widget-foot">
                    <!-- Footer goes here -->
                  </div>
                </div>
              </div>  
              </div>
              </div>
              </div>

            </div>

          </div>
    <!-- Matter ends -->     
   <div class="clearfix"></div>

</div>
          </div>


	<span id="get_data"></span>
    <!-- /page content -->
	<!-- form vaildation -->
	<div id="loading"></div>
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
	
	$("#checkAll").change(function () {
	$("input:checkbox").prop('checked', $(this).prop("checked"));
	var len=$("[name='sl_no[]']:checked").length;
	if(len!=0)
	{
		$('#delbtn').show();
	}
	else
	{
		$('#delbtn').hide();
	}
	});
	
	
		$("#demo-form2").validate({
	 	    errorElement: 'span',
	  	    errorClass: 'has-error',
			rules:
				{
					subject_name:
						{
							required: true
						}
				},
			messages:
				{
					subject_name:
						{
							required: 'Please Enter Subject Name'
						}
				}	
		});

		$('#cancel').click(function (){
   			$("#demo-form2").validate().resetForm();
  			$("#demo-form2").removeClass("has-error");
   			$("#subject_name").val('');
   			$("#already_exist").html('');
		});

		$("#subject_name").change(function(){
		  	$("#already_exist").html('');
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

<!-- Script for this page -->
<script type="text/javascript">

function checkDelete()
{
	var len=$("[name='sl_no[]']:checked").length;
	if(len!=0)
	{
		$('#delbtn').show();
	}
	else
	{
		$('#delbtn').hide();
	}
}

$('#delbtn').click(function(){
	var check=confirm('Are you sure you want to delete it?');
	if(check)
	{
		var ids='';
			$('.sl_no').each(function(){
				if($(this).prop('checked'))
				{
					ids+=$(this).val()+',';	
				}
			});
// 			alert(ids);
			ids=ids.substring(0,(ids.length-1));
			$.ajax({
		   		type:"GET",
		   		url:"multipledelete.jsp?ids="+ids,
		   		data: "",
		   		success:function(data)
		   		{
					if(data!="")
					{
						window.location.href="view_student.jsp";
			 		}
			  		else alert('No Records');
		   		}
	   		});
	}
	else
	{
		return false;
	}
});

</script>
<% } %>
</body>
</html>