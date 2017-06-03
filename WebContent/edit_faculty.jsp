<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.charvikent.dbconnection.DbUtility"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <!-- Title and other stuffs -->
  <title>Administrator | Edit Faculty</title>
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
<!--   <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.3.min.js"></script> -->
  <script src="js/jquery-1.11.1.js" type="text/javascript"></script>
  <script src="js/jquery.js"></script>
  <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/jquery.validate.min.js"></script>
  <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/additional-methods.min.js"></script>
<script src="js/dependent.js">

</script>
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
  margin-top: 2.3em;
  }
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
	
	
	String sno=request.getParameter("sno");
	
    String slno=request.getParameter("slno");
    if(slno != null)
    {
    	ps=con.prepareStatement("delete from faculty where Sno='"+slno+"'");
    	i=ps.executeUpdate();
    	System.out.println(i);
    	if(i>=0)
    	{
    		session.setAttribute("added", "Successfully Faculty is Deleted");
            response.sendRedirect("add_faculty.jsp");
    	}
        else
        {
            session.setAttribute("error", "Faied to Delete the Faculty");
            response.sendRedirect("add_faculty.jsp");
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
          <li class="has_sub">
			<a href="#"><i class="fa fa-list-alt"></i> General Settings  <span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
            <ul>
              <li class=""><a href="ClassCreation">Class Creation</a></li>
              <!-- <li class=""><a href="SubjectCreation">Subject Creation</a></li>
              <li class=""><a href="AddSubject">Add Subject</a></li> -->
              <li class=""><a href="add_faculty.jsp">Add Faculty</a></li>
            </ul>
          </li>
          <!-- <li class="open has_sub">
			<a href="#"><i class="fa fa-tasks"></i> Faculty Details  <span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
            <ul>
              <li class="current"><a href="add_faculty.jsp">Add Faculty</a></li>
              <li class=""><a href="import_faculty.jsp">Import Faculty</a></li>
              <li class=""><a href="export_faculty.jsp">Export Faculty</a></li>
            </ul>
          </li> -->
          <li class=" has_sub">
			<a href="#"><i class="fa fa-tasks"></i> Students Details  <span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
            <ul>
              <li class="" > <a href="add_student.jsp">Add Student</a></li>
              <li class="" ><a href="view_student.jsp">View Students</a></li>
              <li class=""><a href="import_student.jsp">Import Students</a></li>
              <li class=""><a href="export.jsp">Export Students</a></li>
            </ul>
          </li> 
          <li class=" has_sub">
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
          <!-- <li><a href="charts.html"><i class="fa fa-bar-chart-o"></i> Charts</a></li> 
          <li><a href="forms.html"><i class="fa fa-tasks"></i> Forms</a></li>
          <li><a href="ui.html"><i class="fa fa-magic"></i> User Interface</a></li> -->
        </ul>
    </div>

    <!-- Sidebar ends -->

   <div class="clearfix"></div>

</div>
 <div class="right_col" role="main">
        <div class="">
          
     <div class="mainbar">
      
      <div class="page-head">
        <h2 class="pull-left"><i class="fa fa-tasks"></i> Faculty Details</h2>

        <!-- Breadcrumb -->
        <div class="bread-crumb pull-right">
          <a href="AdminHome"><i class="fa fa-home"></i> Home</a> 
          <!-- Divider -->
          <span class="divider">/</span> 
          <a href="javascript:void(0)" class="bread-current">Faculty Details</a>
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
                  <div class="pull-left">Edit Faculty</div>
                  <div class="widget-icons pull-right">
                    <a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a> 
                    <a href="#" class="wclose"><i class="fa fa-times"></i></a>
                  </div>  
                  <div class="clearfix"></div>
                </div>
                <div class="widget-content">
                  <div class="padd">
 <%
 	String fac=null;	fac=(String)session.getAttribute("fac");
	String gn=null;		gn=(String)session.getAttribute("gn");
	String bd_name=null;	bd_name=(String)session.getAttribute("bd_name");
	String md_name=null;	md_name=(String)session.getAttribute("md_name");
	String cl_name=null;	cl_name=(String)session.getAttribute("cl_name");
	String sc_name=null;	sc_name=(String)session.getAttribute("sc_name");
	String qual=null;	qual=(String)session.getAttribute("qual");
	String mob=null;	mob=(String)session.getAttribute("mob");
        String subject=null;	subject=(String)session.getAttribute("subject");
	
	session.setAttribute("fac", null);
        session.setAttribute("gn", null);
        session.setAttribute("bd_name",null);
	session.setAttribute("md_name",null);
	session.setAttribute("cl_name",null);
	session.setAttribute("sc_name",null);
	session.setAttribute("qual", null);
	session.setAttribute("mob", null);
	session.setAttribute("subject", null);
%>                
                    <div class="form quick-post">
                                      <!-- Quick setting form (not working)-->
                          <form id="fac-form" action="Edit" data-parsley-validate class="form-horizontal form-label-left" method="post" action="#"  role="form">
                          <!-- Name -->
                          <input type="hidden" name="snum" value="<%= sno%>">
<% 
	ps=con.prepareStatement("select * from faculty where Sno='"+sno+"'");
    ResultSet rs=ps.executeQuery();
    if(rs.next())
    {
        if(fac==null || fac=="")
        {
        	fac=rs.getString(2);
        	gn=rs.getString(3);
        	bd_name=rs.getString(4);
        	md_name=rs.getString(5);
        	cl_name=rs.getString(6);
        	sc_name=rs.getString(7);
        	qual=rs.getString(8);
        	mob=rs.getString(9);
        	subject=rs.getString(10);
        }
%>
                          <div class="form-group">
	                          <label class="control-label col-md-3" for="sitename"> Faculty Name</label>
	                          <div class="col-md-6">
		                      	<input type="text" required="required" placeholder="Enter Faculty Name" class="form-control col-md-7 col-xs-12" name="faculty_name" id="faculty_name" value="<%= fac%>">
	                          </div>
                          </div>
                          
                          <div class="form-group">
							  <label class="control-label col-md-3" for="sitename">Gender</label>
                              <div class="col-lg-6">
	                              <div class="radio">
	                              	<label>
	                                	<input type="radio" <% if(gn != null && gn.equals("Male")) { %> value="Male" checked <% } else {%> value="Male" <% } %> id="gender" name="gender" required>Male
	                                    &nbsp; &nbsp; &nbsp; &nbsp;
	                                    <input type="radio" <% if(gn != null && gn.equals("Female")) { %> value="Female" checked <% } else {%> value="Female" <% } %> id="gender" name="gender">Female
	                                </label>
	                              </div>
		                          <span class="gender_error"></span>
                              </div>
                          </div>
                          
                          <div class="form-group">
                                  <label class="control-label col-md-3" for="sitename">Type of Board</label>
                                  <div class="col-lg-6">
                                    <select class="form-control" id="board" name="board" required>
                                    <%
								      	PreparedStatement ps1=con.prepareStatement("select distinct board_name from classcreation");
							            ResultSet r=ps1.executeQuery();
							            if(!r.isBeforeFirst())
							            {
							        %>
							          	<option value="" disabled selected>Board Names are not added Yet..!</option>
							        <%  } else { %>
							          	<option value="" disabled selected>Choose Board</option>
							        <%	while(r.next()) { %>
										<option value="<%= r.getString(1) %>" <% if(r.getString(1).equals(bd_name)) { %>selected<% } %>><%= r.getString(1) %></option>
									  <% } } %>
                                    </select>
                                  </div>
                                </div>    

                                  <div class="form-group eddiv">
                                  <label class="control-label col-md-3" for="sitename">Select Medium</label>
                                  <div class="col-lg-6 ">
                                    <select class="form-control" id="medium" name="medium" required>
			                        	<%
				                        	if(md_name != null)
	                                  		{
			                        		PreparedStatement ps2=con.prepareStatement("select distinct medium from classcreation");
								            ResultSet rs2=ps2.executeQuery();
								            if(!rs2.isBeforeFirst())
								            {
								        %>
								          	<option value="" disabled selected>Medium Names are not added Yet..!</option>
								        <%  } else { %>
                                    	<option value="" selected disabled>Choose Medium</option>
                                    	<%
								            while(rs2.next()){ 
								        %>
											<option value="<%= rs2.getString(1) %>" <% if(rs2.getString(1).equals(md_name)) { %>selected<% } %>><%= rs2.getString(1) %></option>
										<% } } } %>
                                    </select>
                                  </div>
                                </div> 
  
                                <div class="form-group">
                                  <label class="control-label col-md-3" for="sitename">Select Class</label>
                                  <div class="col-lg-6 ">
                                    <select class="form-control select_class" id="clas" name="clas" required>
                                      	<%
                                      		if(cl_name != null)
                                      		{
									      	PreparedStatement ps3=con.prepareStatement("select distinct class_name from classcreation");
								            ResultSet rs3=ps3.executeQuery();
								            if(!rs3.isBeforeFirst())
								            {
								        %>
								          	<option value="" disabled selected>Class Names are not added Yet..!</option>
								        <%  } else { %>
	                                      	<option value="" selected disabled>Choose Class</option>
								        <%    
								            while(rs3.next()){ 
								        %>
											<option value="<%= rs3.getString(1) %>" <% if(rs3.getString(1).equals(cl_name)) { %>selected<% } %>><%= rs3.getString(1) %></option>
										<% } } } %>
                                    </select>
                                  </div>
                                </div>  
                                
                                <div class="form-group">
                                  <label class="control-label col-md-3" for="sitename">Section</label>
                                  <div class="col-md-6">
                                  	<select class="form-control select_section" id="section" name="section" required>
                                      	<%
                                      	if(sc_name != null)
                                  		{
									      	PreparedStatement ps4=con.prepareStatement("select distinct section from classcreation");
								            ResultSet rs4=ps4.executeQuery();
								            if(!rs4.isBeforeFirst())
								            {
								        %>
								          	<option value="" disabled selected>Section Names are not added Yet..!</option>
								        <%  } else { %>
	                                      	<option value="" selected disabled>Choose Section</option>
								        <%
								            while(rs4.next()){ 
								        %>
											<option value="<%= rs4.getString(1) %>" <% if(rs4.getString(1).equals(sc_name)) { %>selected<% } %>><%= rs4.getString(1) %></option>
										<% } } } %>
                                    </select>
                                  </div>
                                </div>
                                    
                        <div class="form-group">
                            <label class="control-label col-md-3" for="sitename">Subject Name</label>
                            <div class="col-lg-6">
                                <select class="form-control" id="subject_name" name="subject_name" required>
                                <%
                                    PreparedStatement pst=con.prepareStatement("select distinct subject_name from subjectcreation");
                                    ResultSet rt=pst.executeQuery();
                                    if(!rt.isBeforeFirst())
                                    {
                                %>
                                    <option value="" disabled selected>Subjects are not added Yet..!</option>
                                <%  } else { %>
                                    <option value="" disabled selected>Choose Subject</option>
				<% while(rt.next()) { %>
                                    <option value="<%= rt.getString(1) %>" <% if(rt.getString(1).equals(subject)) { %>selected<% } %>><%= rt.getString(1) %></option>
				<% } } %>
                                </select>
                            </div>
                        </div>
                          
                          <div class="form-group">
	                          <label class="control-label col-md-3" for="sitename"> Qualification</label>
	                          <div class="col-md-6">
		                      	<input type="text" required="required" placeholder="Enter Qualification" class="form-control col-md-7 col-xs-12" name="qualification" id="qualification" value="<%= qual%>">
	                          </div>
                          </div>
                          
                          <div class="form-group">
	                          <label class="control-label col-md-3" for="sitename"> Contact Number</label>
	                          <div class="col-md-6">
		                      	<input type="text" class="form-control col-md-7 col-xs-12" placeholder="Enter Mobile Number" onblur="this.placeholder='Eg: 8888888888'" id="mobile" name="mobile" value="<%= mob%>" required>
	                          </div>
                          </div>
<%   }   %>
                          <!-- Buttons -->
                          <div class="form-group">
                           <!-- Buttons -->
                           <div class="col-lg-9 col-lg-offset-3">
                            <button type="submit" class="btn btn-info" name="submit" id="submit">Update </button>
                            <a href="add_faculty.jsp" class="btn btn-default">Cancel</a>
                           </div>
                          </div>
 <%
		String error=null;
		error=(String)session.getAttribute("error");
		if(error!=null)
		{
			out.println("<h4 class='col-lg-9 col-lg-offset-3' style='color: red'>"+error+"</h4><br>");
			session.setAttribute("error", null);
		}
 %>       
                        </form>
                                    </div>

                  </div>
                </div>
</div><!-- widget closed -->
</div>

  <div class="col-md-9 col-lg-offset-1">
              <!-- Quick setting -->
              <div class="widget">
                <div class="widget-head">
                  <div class="pull-left">List of Subjects</div>
                  <div class="widget-icons pull-right">
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
                        <th>Sl.no</th>
                        <th>Faculty Name</th>
                        <th>Qualification</th>
                        <th>Contact Number</th>
                        <th>Action</th>
                      </tr>
             		</thead>     
              <tbody>
<%
ps=con.prepareStatement("select * from faculty");
ResultSet rs1=ps.executeQuery();
if(!rs1.isBeforeFirst())
{
  %>
      <tr>
          <td colspan="5"><% out.print("<h3 style='color:red;text-align:center'>No Results found!</h3>"); %></td>
      </tr>
  <%
}    
else
{
	while(rs1.next())
  	{
%>
          <tr>
          <td><%= rs1.getString(1)%>.</td>
          <td><%= rs1.getString(2)%></td>
          <td><%= rs1.getString(3)%></td>
          <td><%= rs1.getString(4)%></td>
          <td align='center'>
            <a href="edit_faculty.jsp?sno=<%= rs1.getString(1)%>">
              <button title='' data-placement='top' data-toggle='tooltip' data-original-title='Edit' class='btn btn-sm tooltips'><i class='fa fa-edit'></i>
              </button>
            </a>
            <a href="edit_faculty.jsp?slno=<%= rs1.getString(1)%>" onClick="return confirm('Are you sure you want to Delete');">
              <button title='' data-placement='top' data-toggle='tooltip' data-original-title='Delete' class='btn btn-sm tooltips'><i class='fa fa-trash-o'></i>
              </button>
            </a>
          </td>
        </tr>
  <% } 
} %>
                  </tbody>
                    
                  </table>
                  <div class="clearfix"></div>
                </div>
                </div>
              
                  </div>
                  <div class="widget-foot">
                    <!-- Footer goes here -->
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

        
        <!-- /page content -->
<script type="text/javascript">

jQuery.validator.addMethod('lettersonly', function(value, element) {
    return this.optional(element) || /^[a-z. áãâäàéêëèíîïìóõôöòúûüùçñ]+$/i.test(value);
}, "Please Enter Valid Name");

jQuery.validator.addMethod("mobileNO", function(phone_number, element) {
   phone_number = phone_number.replace(/\s+/g, ""); 
 return this.optional(element) || phone_number.length > 9 &&
   phone_number.match(/^[7-9]\d+$/);
}, "Invalid Mobile Number");
   
$("#fac-form").validate({
    errorElement: 'span',
    errorClass: 'has-error',
	rules:
	{
            faculty_name:
            {
		required: true,
		lettersonly:true
            },
            gender:
            {
                required: true
	    },
	    board:{
	        required:true
	    },
	    medium:{
	        required:true
	    },
	    clas:{
	        required:true
	    },  
	    section:{
	        required:true   
	    },
            subject_name:
            {
	        required:true
            },
            qualification:
            {
                required: true,
                lettersonly:true
            },
            mobile:
            {
                required:true,
                number:true,
                mobileNO:true,
                minlength:10,
                maxlength:10
            },
	},
	messages:
   	{
		faculty_name:
      	{
			required: 'Please Enter Faculty Name'
		},
		gender:
		{
	        required:'Please Choose Gender'
	    },
	    board:
	    {
	        required:'Please Choose Board'
	    },
	    medium:
	    {
	        required:'Please Choose Medium'
	    },
	    clas:
	    {
	        required:'Please Choose Class'
	    },
	    section:
	    {
	        required:'Please Choose Section'
	    },
            subject_name:
            {
	        required:'Please Choose Subject'
            },
            qualification:
            {
                    required:'Please Enter Qualification'
            },
            mobile:
            {
                    required:'Please Enter Mobile Number',
                number:'Please Enter only numbers'
            },
	},
	errorPlacement: function(error, element){
	      if(element.attr("name") == "gender")
	        error.insertAfter(".gender_error").css("color", "red");
	      else
	          error.insertAfter(element);
	}
  });

  $('#cancel').click(function () {
    $("#fac-form").validate().resetForm();
    $("#fac-form").removeClass("has-error");
    $("#faculty_name").val('');
    $("#subject_name").val('');
    $("#qualification").val('');
    $("#mobile").val('');
    $("#already_exist").html('');
   
   
  });
  $('#submit').click(function(){
    $("#already_exist").removeClass('');

  });

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
$(function () {

    /* Bar Chart starts */

    var d1 = [];
    for (var i = 0; i <= 20; i += 1)
        d1.push([i, parseInt(Math.random() * 30)]);

    var d2 = [];
    for (var i = 0; i <= 20; i += 1)
        d2.push([i, parseInt(Math.random() * 30)]);


    var stack = 0, bars = true, lines = false, steps = false;
    
    function plotWithOptions() {
        $.plot($("#bar-chart"), [ d1, d2 ], {
            series: {
                stack: stack,
                lines: { show: lines, fill: true, steps: steps },
                bars: { show: bars, barWidth: 0.8 }
            },
            grid: {
                borderWidth: 0, hoverable: true, color: "#777"
            },
            colors: ["#ff6c24", "#ff2424"],
            bars: {
                  show: true,
                  lineWidth: 0,
                  fill: true,
                  fillColor: { colors: [ { opacity: 0.9 }, { opacity: 0.8 } ] }
            }
        });
    }

    plotWithOptions();
    
    $(".stackControls input").click(function (e) {
        e.preventDefault();
        stack = $(this).val() == "With stacking" ? true : null;
        plotWithOptions();
    });
    $(".graphControls input").click(function (e) {
        e.preventDefault();
        bars = $(this).val().indexOf("Bars") != -1;
        lines = $(this).val().indexOf("Lines") != -1;
        steps = $(this).val().indexOf("steps") != -1;
        plotWithOptions();
    });

    /* Bar chart ends */

});


/* Curve chart starts */

$(function () {
    var sin = [], cos = [];
    for (var i = 0; i < 14; i += 0.5) {
        sin.push([i, Math.sin(i)]);
        cos.push([i, Math.cos(i)]);
    }

    var plot = $.plot($("#curve-chart"),
           [ { data: sin, label: "sin(x)"}, { data: cos, label: "cos(x)" } ], {
               series: {
                   lines: { show: true, fill: true},
                   points: { show: true }
               },
               grid: { hoverable: true, clickable: true, borderWidth:0 },
               yaxis: { min: -1.2, max: 1.2 },
               colors: ["#1eafed", "#1eafed"]
             });

    function showTooltip(x, y, contents) {
        $('<div id="tooltip">' + contents + '</div>').css( {
            position: 'absolute',
            display: 'none',
            top: y + 5,
            left: x + 5,
            border: '1px solid #000',
            padding: '2px 8px',
            color: '#ccc',
            'background-color': '#000',
            opacity: 0.9
        }).appendTo("body").fadeIn(200);
    }

    var previousPoint = null;
    $("#curve-chart").bind("plothover", function (event, pos, item) {
        $("#x").text(pos.x.toFixed(2));
        $("#y").text(pos.y.toFixed(2));

        if ($("#enableTooltip:checked").length > 0) {
            if (item) {
                if (previousPoint != item.dataIndex) {
                    previousPoint = item.dataIndex;
                    
                    $("#tooltip").remove();
                    var x = item.datapoint[0].toFixed(2),
                        y = item.datapoint[1].toFixed(2);
                    
                    showTooltip(item.pageX, item.pageY, 
                                item.series.label + " of " + x + " = " + y);
                }
            }
            else {
                $("#tooltip").remove();
                previousPoint = null;            
            }
        }
    }); 

    $("#curve-chart").bind("plotclick", function (event, pos, item) {
        if (item) {
            $("#clickdata").text("You clicked point " + item.dataIndex + " in " + item.series.label + ".");
            plot.highlight(item.series, item.datapoint);
        }
    });

});

/* Curve chart ends */
</script>
<% } %>
</body>

</html>