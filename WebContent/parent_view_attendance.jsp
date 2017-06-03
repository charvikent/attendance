<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.charvikent.dbconnection.DbUtility"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <!-- Title and other stuffs -->
  <title>Parent | View Children(s) Attendance</title>
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

if(session.getAttribute("parent_name")==null || session.getAttribute("parent_name")=="")
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
	
%>

<div class="navbar navbar-fixed-top bs-docs-nav" role="banner">
  
    <div class="conjtainer">
      <!-- Menu button for smaller screens -->
 		<div class="navbar-header">
		  <button class="navbar-toggle btn-navbar" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
			<span>Menu</span>
		  </button>
		  <!-- Site name for smaller screens -->
		  <a href="parenthome.jsp" class="navbar-brand hidden-lg">Attendance Management </a>
		</div>
      
      

      <!-- Navigation starts -->
      <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">         


        <!-- Search form -->
       
        <!-- Links -->
         <div class="col-md-6">
          <!-- Logo. -->
          <div class="logo">
            <h2><a href="parenthome.jsp">Attendance Management System</a></h2>
            <p class="meta"></p>
          </div>
          <!-- Logo ends -->
        </div>
        <ul class="nav navbar-nav pull-right">

          <li class="dropdown pull-right">            
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
              <i class="fa fa-user"></i> Parent <b class="caret"></b>              
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
          <li class=""><a href="parenthome.jsp"><i class="fa fa-home"></i> Dashboard</a></li>
          <li class="has_sub">
			<a href="#"><i class="fa fa-tasks"></i> Faculty Details  <span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
            <ul>
              <li class=""><a href="parent_views_faculty.jsp">View Faculty</a></li>
<!--               <li class=""><a href="import_faculty.jsp">Import Faculty</a></li> -->
<!--               <li class=""><a href="export_faculty.jsp">Export Faculty</a></li> -->
            </ul>
          </li>
          <li class="has_sub">
			<a href="#"><i class="fa fa-tasks"></i> Students Details  <span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
            <ul>
              <li class=""><a href="parent_views_student.jsp">View Students</a></li>
            </ul>
          </li> 
          <li class="open has_sub">
			<a href="#"><i class="fa fa-file-o"></i> Message  <span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
            <ul>
              <li class="current"><a href="parent_view_attendance.jsp">Attendance</a></li>
              <li class=""><a href="parent_view_notification.jsp">Notification</a></li>
              <!--<li><a href=#>Diary</a></li>
              <li><a href=#>Fee</a></li>
              <li><a href=#>Group Marks</a></li>
              <li><a href=#>Personal Message</a></li> -->
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
	<div class="mainbar">
      
		<div class="page-head">
			<h2 class="pull-left"><i class="fa fa-file-o"></i> Messages</h2>
	
	        <!-- Breadcrumb -->
	        <div class="bread-crumb pull-right">
	          <a href="parenthome.jsp"><i class="fa fa-home"></i> Home</a> 
	          <!-- Divider -->
	          <span class="divider">/</span> 
	          <a href="" class="bread-current">Message</a>
	        </div>
	
	        <div class="clearfix"></div>
		</div>

      <div class="matter">
        <div class="container">

          <div class="row">
        <div class="col-md-12">
              <!-- Quick setting -->
<!-- 			<form action="" method="post"> -->
              <div class="widget">
                <div class="widget-head">
                  <div class="pull-left">View Attendance</div>
                  <div class="widget-icons pull-right">
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
<!--                         <th><input id="checkAll" type="checkbox" class="checkbox" name="checkall" onclick="checkDelete()"></th> -->
                        <th>Name</th>
                        <th>Message</th>
                        <th>Sent_by</th>
                        <th align="center">Absent on</th>
                        
                      </tr>
             </thead>     
              <tbody>
<%
ps=con.prepareStatement("select * from attendance where father_name='"+uname+"'");
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
	  						<td><%= rs1.getString(3)%></td>
	  						<td><%= rs1.getString(7)%></td>
	  						<td><%= rs1.getString(11)%></td>
	 						<td><%= rs1.getString(12)%></td>
	  					</tr>
  <% } %>
<% } %>
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
    <!-- Matter ends -->     
   <div class="clearfix"></div>

</div>
          </div>


<!-- Footer starts -->
<footer>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
            <!-- Copyright info -->
            <p class="copy">Copyright &copy; 2017 | <a href="parenthome.jsp">Attendance Management System</a> </p>
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