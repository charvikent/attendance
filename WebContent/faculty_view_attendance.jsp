<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.charvikent.dbconnection.DbUtility"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <!-- Title and other stuffs -->
  <title>Faculty | View Attendance</title>
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
  margin-top: -3px;
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

if((session.getAttribute("fac_name")==null)||(session.getAttribute("fac_name")==""))
{
	response.sendRedirect("AdminLogin");
}
else
{
	String url=application.getInitParameter("url");
	String username=application.getInitParameter("username");
	String password=application.getInitParameter("password");
	con=DbUtility.getConnection(url,username,password);
	String uname=session.getAttribute("fac_name").toString();
	
	
// 	String sno=request.getParameter("sno");
%>

<div class="navbar navbar-fixed-top bs-docs-nav" role="banner">
  
    <div class="conjtainer">
      <!-- Menu button for smaller screens -->
 		<div class="navbar-header">
		  <button class="navbar-toggle btn-navbar" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
			<span>Menu</span>
		  </button>
		  <!-- Site name for smaller screens -->
		  <a href="facultyhome.jsp" class="navbar-brand hidden-lg">Attendance Management </a>
		</div>
      
      

      <!-- Navigation starts -->
      <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">         


        <!-- Search form -->
       
        <!-- Links -->
         <div class="col-md-6">
          <!-- Logo. -->
          <div class="logo">
            <h2><a href="facultyhome.jsp">Attendance Management System</a></h2>
            <p class="meta"></p>
          </div>
          <!-- Logo ends -->
        </div>
        <ul class="nav navbar-nav pull-right">

          <li class="dropdown pull-right">            
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
              <i class="fa fa-user"></i> Faculty <b class="caret"></b>              
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
          <li class=""><a href="facultyhome.jsp"><i class="fa fa-home"></i> Dashboard</a></li>
          <li class="has_sub">
			<a href="#"><i class="fa fa-tasks"></i> Faculty Details  <span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
            <ul>
              <li class=""><a href="view_faculty.jsp">View Profile</a></li>
<!--               <li class=""><a href="import_faculty.jsp">Import Faculty</a></li> -->
<!--               <li class=""><a href="export_faculty.jsp">Export Faculty</a></li> -->
            </ul>
          </li>
          <li class="has_sub">
			<a href="#"><i class="fa fa-tasks"></i> Students Details  <span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
            <ul>
              <li class=""><a href="faculty_view_student.jsp">View Students</a></li>
            </ul>
          </li> 
          <li class="open has_sub">
			<a href="#"><i class="fa fa-file-o"></i> Message  <span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
            <ul>
<!--               <li class=""><a href="faculty_attendance.jsp">Attendance</a></li> -->
              <li class=""><a href="faculty_common_message.jsp">Common Message</a></li>
<!--               <li class="current"><a href="faculty_view_attendance.jsp">View Attendance</a></li> -->
              <li class=""><a href="faculty_view_common_message.jsp">View Messages</a></li>
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
              <li><a href="">Tables</a></li>
              <li><a href="">Dynamic Tables</a></li>
            </ul>
          </li>		   -->
          <!-- <li><a href=""><i class="fa fa-bar-chart-o"></i> Charts</a></li>
          <li><a href=""><i class="fa fa-tasks"></i> Forms</a></li>
          <li><a href=""><i class="fa fa-magic"></i> User Interface</a></li> -->
        </ul>
    </div>

    <!-- Sidebar ends -->

   <div class="clearfix"></div>

</div>
 <div class="right_col" role="main">
        <div class="">
	<div id="view_list">
        <div class="mainbar">

         <div class="page-head">
        <h2 class="pull-left"><i class="fa fa-file-o"></i> Message</h2>

        <!-- Breadcrumb -->
        <div class="bread-crumb pull-right">
          <a href="facultyhome.jsp"><i class="fa fa-home"></i> Home</a> 
          <!-- Divider -->
          <span class="divider">/</span> 
          <a  class="bread-current">Message</a>
          </div>
            <div class="clearfix"></div>
      </div>

          <div class="matter">
        <div class="container">

          <div class="row">  

  <div class="col-md-12">
              <!-- Quick setting -->
              <div class="widget">
                <div class="widget-head">
                  <div class="pull-left">Attendance List</div>
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
                        <th>Slno</th>
                        <th>Student Name</th>
                        <th>Mobile</th>
<!--                         <th>Message</th> -->
                        <th>Sent by</th>
                        <th>Attendance <br>(AM | PM)</th>
                        <th>Date</th>
                      </tr>
             </thead>     
              <tbody>
<%
String sender_id=null;
ps=con.prepareStatement("select Sno from faculty where faculty_name='"+uname+"'");
ResultSet rs=ps.executeQuery();
if(rs.next())
{
	sender_id=rs.getString(1);
}

ps=con.prepareStatement("select * from attendance where sender_id='"+sender_id+"' and sent_by='"+uname+"'");
ResultSet rs1=ps.executeQuery();
if(!rs1.isBeforeFirst())
{
  %>
      <tr>
          <td colspan="7"><% out.print("<h3 style='color:red;text-align:center'>No Results found!</h3>"); %></td>
      </tr>
  <%
}    
else
{
	while(rs1.next())
  	{
%>
          <tr>
          <td><%= rs1.getString(1)%></td>
          <td><a style="cursor: pointer;" onClick="getApplicant(<%= rs1.getString(2)%>)"><%= rs1.getString(3)%></a></td>
          <td><%= rs1.getString(6)%></td>
<%--           <td><%= rs1.getString(7)%></td> --%>
          <td><%= rs1.getString(11)%></td>
          <td>
	          <% if(rs1.getString(8).equals("absent")) { %>
	          	<img src="images/ab.png" style="height: 20px;">
	          <%} else { %>
	          	<img src="images/p.jpeg" style="height: 20px;">
	          <% } %>
	          
	          &nbsp;|&nbsp;
	          
	          <% if(rs1.getString(9).equals("absent")) { %>
	          	<img src="images/ab.png" style="height: 20px;">
	          <%} else { %>
	          	<img src="images/p.jpeg" style="height: 20px;">
	          <% } %>
          </td>
          <td><%= rs1.getString(12)%></td>
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
		</div>
	</div>
    <!-- Matter ends -->     
   <div class="clearfix"></div>

          </div>

        <span id="get_data"></span>
    <!-- /page content -->
	<!-- form vaildation -->
	<div id="loading"></div>

<script type="text/javascript">

function getApplicant(id)
{
	$('#loading').html('<div class="loading"></div>');
	$.ajax({
   		type:"GET",
   		url:"get_student_data.jsp?id="+id,
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
            <p class="copy">Copyright &copy; 2017 | <a href="facultyhome.jsp">Attendance Management System</a> </p>
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