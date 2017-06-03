<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.charvikent.dbconnection.DbUtility"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <!-- Title and other stuffs -->
  <title>Administrator | Edit Student</title>
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
  <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.3.min.js"></script>
  <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/jquery.validate.min.js"></script>
  <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/additional-methods.min.js"></script>
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <![endif]-->

  <!-- Favicon -->
  <link rel="shortcut icon" href="img/favicon/school.png">
  <style type="text/css">
    span.has-error, #already_exist, .subjects_error{
  font-weight:normal;
  color:red;
  }
  </style>
<script>
//     history.forward();
</script>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<!-- <script type="text/javascript" src="validation/student_registration.js"></script> -->
<script src="js/jquery-1.11.1.js" type="text/javascript"></script>
  <script src="js/jquery.js"></script>
  <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/jquery.validate.min.js"></script>
  <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/additional-methods.min.js"></script>
  <script src="js/dependent.js"></script>
 
</head>
<body ng-app="">
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
              <li class="current"><a href="add_student.jsp">Add Student</a></li>
              <li class=""><a href="view_student.jsp">View Students</a></li>
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
          </li>		 -->  
          <!-- <li><a href="charts.html"><i class="fa fa-bar-chart-o"></i> Charts</a></li> 
          <li><a href="forms.html"><i class="fa fa-tasks"></i> Forms</a></li>
          <li><a href="ui.html"><i class="fa fa-magic"></i> User Interface</a></li> -->
        </ul>
    </div>

    <!-- Sidebar ends -->


   <div class="clearfix"></div>

</div>
 <div class="right_col" role="main">
        <div class="">           <div class="mainbar">

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
			String registered=null;
			registered=(String)session.getAttribute("registered");
	        if(registered!=null)
	        {
				out.println("<h4 class='text-center' style='color: green'>"+registered+"</h4><br>");
				session.setAttribute("registered", null);
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

            <div class="col-md-12">


              <div class="widget wgreen">
                
                <div class="widget-head">
                  <div class="pull-left" Creation>Student Creation</div>
                  <div class="widget-icons pull-right">
                    <a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a> 
                    <a href="#" class="wclose"><i class="fa fa-times"></i></a>
                  </div>
                  <div class="clearfix"></div>
                </div>

                <div class="widget-content">
                  <div class="padd">

<%
	String nam=null;	nam=(String)session.getAttribute("nam");
	String brd=null;	brd=(String)session.getAttribute("brd");
	String mdm=null;	mdm=(String)session.getAttribute("mdm");
	String cls=null;	cls=(String)session.getAttribute("cls_nam");
	String sct=null;	sct=(String)session.getAttribute("sct");
	String rlno=null;	rlno=(String)session.getAttribute("rlno");
	String adno=null;	adno=(String)session.getAttribute("adno");
	String fnam=null;	fnam=(String)session.getAttribute("fnam");
	String mbl=null;	mbl=(String)session.getAttribute("mbl");
	String altr=null;	altr=(String)session.getAttribute("altr");
	String eml=null;	eml=(String)session.getAttribute("eml");
	String bg=null;		bg=(String)session.getAttribute("bg");
	String gnd=null;	gnd=(String)session.getAttribute("gnd");
	String db=null;		db=(String)session.getAttribute("db");
	String rlgn=null;	rlgn=(String)session.getAttribute("rlgn");
	String adr=null;	adr=(String)session.getAttribute("adr");
	String pri=null;	pri=(String)session.getAttribute("pri");
	String cast=null;	cast=(String)session.getAttribute("cast");
	String acdm=null;	acdm=(String)session.getAttribute("acdm");
	String busfc=null;	busfc=(String)session.getAttribute("busfc");
	String busrt=null;	busrt=(String)session.getAttribute("busrt");
	
	session.setAttribute("nam", null);
	session.setAttribute("brd", null);
	session.setAttribute("mdm", null);
	session.setAttribute("cls_nam", null);
	session.setAttribute("sct", null);
	session.setAttribute("rlno", null);
	session.setAttribute("adno", null);
	session.setAttribute("fnam", null);
	session.setAttribute("mbl", null);
	session.setAttribute("altr", null);
	session.setAttribute("eml", null);
	session.setAttribute("bg", null);
	session.setAttribute("gnd", null);
	session.setAttribute("db", null);
	session.setAttribute("rlgn", null);
	session.setAttribute("adr", null);
	session.setAttribute("pri", null);
	session.setAttribute("cast", null);
	session.setAttribute("acdm", null);
	session.setAttribute("busfc", null);
	session.setAttribute("busrt", null);
	
%>
                   
                    <!-- Form starts.  -->
                     <form id="demo-form2" action="EditStudentProfile" name="studentform" data-parsley-validate class="form-horizontal form-label-left" method="post" enctype="multipart/form-data">
						<input type="hidden" name="sno" value="<%= sno%>">
<% 
	ps=con.prepareStatement("select * from addstudent where Sno='"+sno+"'");
    ResultSet rs=ps.executeQuery();
    if(rs.next())
    {
    	if(nam==null || nam=="")
        {
        	nam=rs.getString(2);
        	brd=rs.getString(3);
        	mdm=rs.getString(4);
        	cls=rs.getString(5);
        	sct=rs.getString(6);
        	rlno=rs.getString(7);
        	adno=rs.getString(8);
        	fnam=rs.getString(9);
        	mbl=rs.getString(10);
        	altr=rs.getString(11);
        	eml=rs.getString(12);
        	bg=rs.getString(13);
        	gnd=rs.getString(14);
        	db=rs.getString(15);
        	rlgn=rs.getString(16);
        	adr=rs.getString(17);
        	pri=rs.getString(18);
        	cast=rs.getString(19);
        	acdm=rs.getString(20);
        	busfc=rs.getString(21);
        	busrt=rs.getString(22);
        }
%>
                     <div class="col-lg-12">
                              <div class="col-lg-8">
                                <div class="form-group">
                                  <label class="col-lg-4 control-label">Student Name</label>
                                  <div class="col-lg-6">
                                    <input type="text" class="form-control" value="<%= nam %>" placeholder="Enter Student Name" id="name" name="name" required>
                                  </div>
                                </div>

                                <div class="form-group ddiv">
                                  <label class="col-lg-4 control-label">Type Of Board</label>
                                  <div class="col-lg-6">
                                    <select class="form-control" id="board" name="board" required>
                                    <%
                                    	if(brd != null)
                                  		{
								      	PreparedStatement ps1=con.prepareStatement("select distinct board_name from classcreation");
							            ResultSet rs1=ps1.executeQuery();
							            if(!rs1.isBeforeFirst())
							            {
							        %>
							          	<option value="" disabled selected>Board Names are not added Yet..!</option>
							        <%  } else { %>
							          	<option value="" disabled selected>Choose Board</option>
							        <%
							            while(rs1.next()) { %>
										<option value="<%= rs1.getString(1) %>" <% if(rs1.getString(1).equals(brd)) { %>selected<% } %>><%= rs1.getString(1) %></option>
									 <% } } } else { %>
							          	<option value="" disabled selected>Choose Board</option>
                                    <% } %>
                                    </select>
                                  </div>
                                </div>    

                                  <div class="form-group eddiv">
                                  <label class="col-lg-4  control-label">Select Medium</label>
                                  <div class="col-lg-6 ">
                                    <select class="form-control" id="medium" name="medium" required>
                                    <%
				                        if(mdm != null)
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
										<option value="<%= rs2.getString(1) %>" <% if(rs2.getString(1).equals(mdm)) { %>selected<% } %>><%= rs2.getString(1) %></option>
									<% } } } else { %>
                                    	<option value="" selected disabled>Choose Medium</option>
                                    <% } %>
                                    </select>
                                  </div>
                                </div> 
  
                                <div class="form-group">
                                  <label class="col-lg-4 control-label">Select Class</label>
                                  <div class="col-lg-6 ">
                                    <select class="form-control select_class" id="clas" name="clas" required>
                                    <%
                                      	if(cls != null)
                                      	{
									      	PreparedStatement ps3=con.prepareStatement("select distinct class_name from classcreation");
								            ResultSet rs3=ps3.executeQuery();
								            if(!rs3.isBeforeFirst())
								            {
								    %>
								          	<option value="" disabled selected>Class Names are not added Yet..!</option>
								    <%  	} else { %>
	                                      	<option value="" selected disabled>Choose Class</option>
								    <%    
								            while(rs3.next()){
							        %>
										<option value="<%= rs3.getString(1) %>" <% if(rs3.getString(1).equals(cls)) { %>selected<% } %>><%= rs3.getString(1) %></option>
									<% } } } else { %>
	                                      	<option value="" selected disabled>Choose Class</option>
                                    <% } %>
                                    </select>
                                  </div>
                                </div>  
                                
                                <div class="form-group">
                                  <label class="col-lg-4 control-label">Section</label>
                                  <div class="col-lg-6">
                                  	<select class="form-control select_section" id="section" name="section" required>
                                    <%
                                      	if(sct != null)
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
										<option value="<%= rs4.getString(1) %>" <% if(rs4.getString(1).equals(sct)) { %>selected<% } %>><%= rs4.getString(1) %></option>
									<% } } } else { %>
	                                      	<option value="" selected disabled>Choose Section</option>
	                                <% } %>
                                    </select>
                                  </div>
                                </div>
                                
                                <div class="form-group">
                                  <label class="col-lg-4 control-label">Roll No.</label>
                                  <div class="col-lg-6">
                                    <input type="text" class="form-control" value="<%= rlno %>" placeholder="Enter Roll Number" onblur="this.placeholder='Enter Roll Number'" id="rollno" name="rollno" required>
                                  </div>
                                </div>

                                <div class="form-group">
                                  <label class="col-lg-4 control-label">Admission No.</label>
                                  <div class="col-lg-6">
                                    <input type="text" class="form-control" placeholder="Enter Admission No." id="admissionno" value="<%= adno %>" name="admissionno" required readonly>
                                  </div>
                                </div>

                                <div class="form-group">
                                  <label class="col-lg-4 control-label">Father Name</label>
                                  <div class="col-lg-6">
                                    <input type="text" class="form-control" placeholder="Enter Father Name" value="<%= fnam %>" id="fname" name="fname" required>
                                  </div>
                                </div>

                                <div class="form-group">
                                  <label class="col-lg-4 control-label">Mobile Number</label>
                                  <div class="col-lg-6">
                                    <input type="text" class="form-control" placeholder="ex:8888888888" value="<%= mbl %>" id="mobile" name="mobile" required>
                                  </div>
                                </div>

                                  <div class="form-group">
                                  <label class="col-lg-4 control-label">Alternate Number</label>
                                  <div class="col-lg-6">
                                    <input type="text" class="form-control" placeholder="ex:9999999999" value="<%= altr %>" id="altmobile" name="altmobile" />
                                  </div>
                                </div>

                                  <div class="form-group">
                                  <label class="col-lg-4 control-label">Email</label>
                                  <div class="col-lg-6">
                                    <input type="email" id="email" name="email" placeholder="john@email.com" class="form-control" onblur="this.placeholder='Enter Email Id'" value="<%= eml %>" />
                                  </div>
                                </div>

                                  <div class="form-group">
                                  <label class="col-lg-4 control-label">Blood Group</label>
                                  <div class="col-lg-6">
                                   	<select class="form-control" id="bgroup" name="bgroup" >
		                           		<option value="" selected disabled>Choose Blood Group</option>
	                                    <option <% if(bg != null && bg.equals("A+")) { %> value="A+" selected <% } %>>A+</option>
	                                    <option <% if(bg != null && bg.equals("B+")) { %> value="B+" selected <% } %>>B+</option>
	                                    <option <% if(bg != null && bg.equals("O+")) { %> value="O+" selected <% } %>>O+</option>
	                                    <option <% if(bg != null && bg.equals("AB+")) { %> value="AB+" selected <% } %>>AB+</option>
	                                    <option <% if(bg != null && bg.equals("A-")) { %> value="A-" selected <% } %>>A-</option>
	                                    <option <% if(bg != null && bg.equals("B-")) { %> value="B-" selected <% } %>>B-</option>
	                                    <option <% if(bg != null && bg.equals("O-")) { %> value="O-" selected <% } %>>O-</option>
	                                    <option <% if(bg != null && bg.equals("AB-")) { %> value="AB-" selected <% } %>>AB-</option>
                                    </select>
                                  </div>
                                </div>

                                 <div class="form-group">
                                  <label for="gender" class="col-lg-4 control-label">Gender</label>
                                  <div class="col-lg-6">
                                    <div class="radio">
                                      <label>
                                        <input type="radio" <% if(gnd != null && gnd.equals("Male")) { %> value="Male" checked <% } else {%> value="Male" <% } %> id="gender" name="gender" required>Male
                                        &nbsp; &nbsp; &nbsp; &nbsp;
                                        <input type="radio" <% if(gnd != null && gnd.equals("Female")) { %> value="Female" checked <% } else { %> value="Female" <% } %> id="gender" name="gender">Female
                                      </label>
                                    </div>
                                    <span class="gender_error"></span>
                                  </div>
                                </div>

                                <div class="form-group" id="dobpicker">
									<label for="dob" class="col-lg-4 control-label">Date Of Birth</label>
                                  	<div class="col-lg-6">
										<div  id="datetimepicker1" class="input-append input-group dtpicker">
		                                  	<input data-format="yyyy-MM-dd" type="text" class="form-control" placeholder="YYYY-MM-DD" value="<%= db %>" name="dob" id="dob" required>
											<span class="input-group-addon add-on">
	                                        	<i data-time-icon="fa fa-times" data-date-icon="fa fa-calendar" class="fa fa-calendar"></i>
	                                      	</span>
	                                    </div>
                                      	<span class="dob_error"></span>
                                  	</div>
                                </div>
                                     
                                <div class="form-group">
                                  <label class="col-lg-4 control-label">Religion</label>
                                  <div class="col-lg-6">
                                    <select class="form-control select_class" id="religion" name="religion" >
                                    <option value="" selected disabled>Choose Religion</option>
							          <option <% if(rlgn != null && rlgn.equals("Hindu")) { %> value="Hindu" selected <% } %>>Hindu</option>
							          <option <% if(rlgn != null && rlgn.equals("Muslim")) { %> value="Muslim" selected <% } %>>Muslim</option>
							          <option <% if(rlgn != null && rlgn.equals("Christian")) { %> value="Christian" selected <% } %>>Christian</option>
							          <option <% if(rlgn != null && rlgn.equals("Sikh")) { %> value="Sikh" selected <% } %>>Sikh</option>
								      <option <% if(rlgn != null && rlgn.equals("Jain")) { %> value="Jain" selected <% } %>>Jain</option>
								      <option <% if(rlgn != null && rlgn.equals("Parsi")) { %> value="Parsi" selected <% } %>>Parsi</option>
								      <option <% if(rlgn != null && rlgn.equals("Buddhist")) { %> value="Buddhist" selected <% } %>>Buddhist</option>
								      <option <% if(rlgn != null && rlgn.equals("Jewish")) { %> value="Jewish" selected <% } %>>Jewish</option>
							        <%-- <%
								      	PreparedStatement pst1=con.prepareStatement("select distinct religion from addstudent");
							            ResultSet rst1=pst1.executeQuery();
										if(!rst1.isBeforeFirst())
								        {
								    %>
								        <option value="" disabled selected>Religion Names are not added Yet..!</option>
								    <%  } else { %>
							          	<option value="" selected disabled>Choose Religion</option>
							        <%
							            while(rst1.next()){ 
							        %>
										<option value="<%= rst1.getString(1) %>"><%= rst1.getString(1) %></option>
									<% } } %> --%>	
        							</select>
                                  </div>
                                </div>

                                <div class="form-group">
                                	<label class="col-lg-4 control-label">Address</label>
                                  	<div class="col-lg-6">
                                    	<input id="address" name="address" class="form-control" rows="5" placeholder="Enter Address" value="<%= adr %>" required>
                                  	</div>
                                </div>  

                                <div class="form-group">
                                	<label class="col-lg-4 control-label">Previous Institute</label>
                                  	<div class="col-lg-6">
                                    	<input type="text" class="form-control" placeholder="Enter Previous Institute" value="<%= pri %>" id="pinstitute" name="pinstitute" />
                                  	</div>
                                </div>

                                <div class="form-group">
                                	<label class="col-lg-4 control-label">Caste</label>
                                  	<div class="col-lg-6">
	                                    <select class="form-control select_class" id="caste" name="caste" >
	                                    	<option value="" disabled selected>Choose Caste</option>
	                                    	<option <% if(cast != null && cast.equals("OC")) { %> value="OC" selected <% } %>>OC</option>
								          	<option <% if(cast != null && cast.equals("BC")) { %> value="BC" selected <% } %>>BC</option>
								          	<option <% if(cast != null && cast.equals("SC/ST")) { %> value="SC/ST" selected <% } %>>SC/ST</option>
								          	<option <% if(cast != null && cast.equals("OBC")) { %> value="OBC" selected <% } %>>OBC</option>
								          	<option <% if(cast != null && cast.equals("Others")) { %> value="Others" selected <% } %>>Others</option>
								        <%-- <%
									      	PreparedStatement pst2=con.prepareStatement("select distinct caste from addstudent");
								            ResultSet rst2=pst2.executeQuery();
								            if(!rst2.isBeforeFirst())
								            {
								        %>
								          	<option value="" disabled selected>Caste Names are not added Yet..!</option>
								        <%  } else { %>
								        	<option value="" disabled selected>Choose Caste</option>
								        <%
								            while(rst2.next()){ 
								        %>
											<option value="<%= rst2.getString(1) %>"><%= rst2.getString(1) %></option>
										<% } } %>	 --%>	
								        </select>
                                  	</div>
                                </div>

                                <div class="form-group">
                                	<label class="col-lg-4 control-label">Accommodation</label>
                                  	<div class="col-lg-6">
	                                    <div class="radio">
	                                    	<label>
	                                        	<input type="radio" <% if(acdm != null && acdm.equals("Hostel")) { %> value="Hostel" checked <% } else { %> value="Hostel" <% } %> id="accomodation" name="accomodation" >Hostel
	                                        	&nbsp; &nbsp; &nbsp; &nbsp;
	                                        	<input type="radio" <% if(acdm != null && acdm.equals("Day-Scholor")) { %> value="Day-Scholor" checked <% } else { %> value="Day-Scholor" <% } %> id="accomodation" name="accomodation">Day-Scholar
	                                      	</label>
	                                    </div>
                                    	<span class="accomodation_error"></span>
                                  </div>
                                </div>

                                <div class="form-group">
                                	<label class="col-lg-4 control-label">Bus Facility</label>
                                  	<div class="col-lg-6">
                                  		<div class="radio">
                                   			<label>
		                                    	<input type="radio" <% if(busfc != null && busfc.equals("Yes")) { %> value="Yes" checked <% } else { %> value="Yes" <% } %> id="busfacility" name="busfacility" class="busfacility"/>Yes
		                                    	&nbsp; &nbsp; &nbsp; &nbsp;
                                      			<input type="radio" <% if(busfc != null && busfc.equals("No")) { %> value="No" checked <% } else { %> value="No" <% } %> id="busfacility" name="busfacility" class="busfacility">No
                                          	</label>
                                  		</div>
                                  		<span class="busfacility_error"></span>
                                  	</div>
                                </div>
                                <div id="divdisp"></div>
                                
                                <div class="form-group" id="disp">
                                	<label class="col-lg-4 control-label">Bus Route</label>
                                  	<div class="col-lg-6">
                                    	<input type="text" class="form-control" placeholder="Please Enter Bus route" name="busroute" id="busroute" value="<%= busrt %>" />
                                    	<span style="" class="busroute_error" id="busroute_error"></span>
                                  	</div>
								</div>

							   <input type="hidden" value="insert" name="action_type">
                      		   <input type="hidden" value="" name="id">
							<div class="form-group">
	                      		<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-4">
			                        <button type="submit" class="btn btn-info" name="submit" id="submit" onclick="return registration()">Update</button>
			                        <a href="view_student.jsp" class="btn btn-default" id="cancel">Cancel</a>
								</div>
	            				<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-4" style="display:none" >
			                        <button type="submit" class="btn btn-success" name="submit" id="submit">Save</button>
			                        <button type="reset" class="btn btn-default">Cancel</button>
		                      	</div>
	                      </div>
                      </div>
<script>
$(document).ready(function () 
{
	$('input[type=file]').change(function () 
	{
		var val = $(this).val().toLowerCase();
		var regex = new RegExp("(.*?)\.(png)$");
 		if(!(regex.test(val))) 
 		{
			$(this).val('');
			$('#blah').attr('src','upload/<%= rs.getString(23)%>');
			alert('Please Select .png format only..!');
		} 
 	});
});
</script>
					<div class="col-lg-4">
						<div class="form-group" >
							 <% if(adno !=null){ %>
       						<img id="blah" src='upload/<%= rs.getString(23)%>' alt="Image size should be (width X height) 240X320 ." align="middle" style="border-style:solid;height: 160px; width: 135px; border-bottom-style: none; border-left-style: none;
                                                border-top-style: none;">
                            <% } else{ %>
                            <img id="blah" src='upload/default.png' alt="Image size should be (width X height) 240X320 ." align="middle" style="border-style:solid;height: 160px; width: 135px; border-bottom-style: none; border-left-style: none;
                                                border-top-style: none;">
                            <% } %>
     						<label for="fileImage" class="col-lg-4 control-label">Student Image</label>
      						<div class="col-md-6 col-sm-6 col-xs-12" style="width: 280px;">
       							<input type="file" name="fileImage" id="fileImage" onchange="document.getElementById('blah').src = window.URL.createObjectURL(this.files[0])" accept=".png"/>
<!--      							<span id="fileImage-error" class="has-error"></span> -->
      						</div>

            			</div>
                    </div>
			</div>
<% } %>
                    </form>
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

    <!-- Matter ends -->

    </div>

   <!-- Mainbar ends -->        
   <div class="clearfix"></div>

</div>
<style type="text/css">
  
  form input.error, textarea.error, select.error, #s2id_subject.error {border: 1px solid red !important;}
</style>


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


    $("#demo-form2").validate({
    errorElement: 'span',
    errorClass: 'has-error',
    rules:
	{
	    name:{required:	true, lettersonly: true},
	    board:{required: true},
	    medium:{required: true},
	    clas:{required: true},  
	    section:{required: true},
	    rollno:{required: true},
	    admissionno:{required: true},
	    fname:{required: true, lettersonly: true},
	    mobile:{required: true, number: true, mobileNO: true, minlength: 10, maxlength: 10},
	    gender:{required: true},
	    dob:{required: true},
	    address:{required: true},
/* 	    email:{required: true, email: true},
	    fileImage:{required: true, extension: "png|png"},
	    altmobile:{required: true, number: true},
	    bgroup:{required: true},
	    religion:{required: true},
	    pinstitute:{required: true, lettersonly: true},
	    caste:{required: true},
	    accomodation:{required: true},
	    busfacility:{required: true},
	    busroute:{required: true, lettersonly: true}, */
    },
	messages:
	{
	    name:{required: 'Please Enter Name'},
	    board:{required: 'Please Select Board'},
	    medium:{required: 'Please Choose Medium'},
	    clas:{required: 'Please Choose Class'},
	    section:{required: 'Please Choose Section'},
	    rollno:{required: 'Please Enter rollno'},
	    admissionno:{required: 'Please Enter Admission Number'},
	    fname:{required: 'Please Enter Father Name'},
	    gender:{required: 'Please Choose Gender'},
	    dob:{required: 'Please Enter Date Of Birth'},
	    mobile:{required: 'Please Enter Mobile Number', number: 'Please Enter 10 digit mobile number'},
	    address:{required: 'Please Enter Address'},
/* 		bgroup:{required: 'Please Enter Blood Group'},
	    fileImage:{required: 'Please Upload Image', extension: 'Please Choose Only .jpg or .png'},
	    altmobile:{required: 'Please Enter Alternate Mobile Number', number: 'Please Enter only numbers'},
	    religion:{required: 'Please Choose Religion'},
	    email:{required: 'Please Enter Email', email: 'Please Enter Valid Email'},
	    pinstitute:{required: 'Please Enter Previous Institute Name'},
	    caste:{required: 'Please Choose Caste'},
	    accomodation:{required: 'Please Choose Accomodation'},
	    busfacility:{required: 'Please Choose Bus Facility'},  
	    busroute:{required: 'Please Enter Bus route'}, */        
    },
    errorPlacement: function(error, element){
      if(element.attr("name") == "gender")
        error.insertAfter(".gender_error").css("color", "red");
      else if(element.attr("name") == "accomodation")
        error.insertAfter(".accomodation_error").css("color", "red"); 
      
      else if(element.attr("name") == "dob")
        error.insertAfter(".dob_error").css("color","red");   
      else if(element.attr("name") == "busroute")
        error.insertAfter(".busroute_error").css("color","red");
      else if(element.attr("name") == "busfacility")
        error.insertAfter(".busfacility_error").css("color","red"); 
      else if(element.attr("name") == "fileImaged")
        error.insertAfter(".fileImaged_error").css("color","red");          
       else if(element.attr("name") == "fileImage")
        error.insertAfter(".fileImage-error").css("color","red");  
      else
        error.insertAfter(element);
      }
});
    
	$(document).ready(function () { 
// 		$('#disp').hide();
      	$(".busfacility").click(function() 
      	{
    		$('#disp').show();
        	if ($("input[name=busfacility]:checked").val() == "No")
        	{
	        	$("#busroute").attr("disabled", true);
	            $("#busroute").val('--No Bus Facility--');
	            $("#busroute-error").hide();
        	}
      		else
      		{
	    	  	$("#busroute").attr("disabled", false);
	    	    $("#busroute").val(<%= busrt %>);
	    	    $("#busroute-error").show();
      		}   
    	});
    });

$('#cancel').click(function () {
   	$('#fileImage').val("");      //image will be cleared if selected
   	$('#blah').attr("src","upload/default.png");
  	$("#demo-form2").validate().resetForm();
    $("#demo-form2").removeClass("has-error");
    $('#disp').hide();
});
$('#fileImage').on('change', function() { // fires every time this field changes
        $(this).valid();                  // force a validation test on this field
    });
$('#fileImaged').on('change', function() { 
        $(this).valid();                  
    });
$('#dobpicker').click( function() { 
        if($('#dob').val() !=""){
          $("#dob_error").hide();
        }
        else
          $("#dob_error").show();


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


<% } %>
</body>
</html>