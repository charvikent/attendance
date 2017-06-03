<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.charvikent.dbconnection.DbUtility"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <!-- Title and other stuffs -->
  <title>Administrator | Send Email</title>
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
          <li class=" has_sub">
			<a href="#"><i class="fa fa-tasks"></i> Students Details  <span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
            <ul>
              <li class="" > <a href="add_student.jsp">Add Student</a></li>
              <li class="" ><a href="view_student.jsp">View Students</a></li>
              <li class=""><a href="import_student.jsp">Import Students</a></li>
              <li class=""><a href="export.jsp">Export Students</a></li>
            </ul>
          </li> 
          <li class="open has_sub">
			<a href="#"><i class="fa fa-file-o"></i> Message  <span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
            <ul>
              <li class="current"><a href="attendance.jsp">Attendance</a></li>
              <li class=""><a href="common_message_new.jsp">Common Message</a></li>
              <li class=""><a href="view_attendance.jsp">View Attendance</a></li>
              <li class=""><a href="view_common_message.jsp">View Common Messages</a></li>
              <!-- <li><a href=#>Diary</a></li>
              <li><a href=#>Fee</a></li>
              <li><a href=#>Group Marks</a></li>
              <li><a href=#>Personal Message</a></li> -->
            </ul>
          </li>    
		  <!-- <li class="has_sub"><a href="#"><i class="fa fa-table"></i> Tables  <span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
            <ul>
              <li><a href="tables.html">Tables</a></li>
              <li><a href="dynamic-tables.html">Dynamic Tables</a></li>
            </ul>
          </li>		  
          <li><a href="charts.html"><i class="fa fa-bar-chart-o"></i> Charts</a></li> 
          <li><a href="forms.html"><i class="fa fa-tasks"></i> Forms</a></li>
          <li><a href="ui.html"><i class="fa fa-magic"></i> User Interface</a></li> -->
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
        <div class="">       <div class="mainbar">

         <div class="page-head">
        <h2 class="pull-left"><i class="fa fa-file-o"></i> Message</h2>

        <!-- Breadcrumb -->
        <div class="bread-crumb pull-right">
          <a href="AdminHome"><i class="fa fa-home"></i> Home</a> 
          <!-- Divider -->
          <span class="divider">/</span> 
          <a  class="bread-current">Message</a>
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
                  <div class="pull-left">Send E-mail</div>
                  <div class="widget-icons pull-right">
                    <a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a> 
                    <a href="#" class="wclose"><i class="fa fa-times"></i></a>
                  </div>  
                  <div class="clearfix"></div>
                </div>
                <div class="widget-content">
                  <div class="padd">
<%
ps=con.prepareStatement("select name,father_name,email from addstudent where Sno='"+sno+"'");
ResultSet rs=ps.executeQuery();
if(rs.next())
{
%>
                    <div class="form quick-post">
                                      <!-- Quick setting form (not working)-->
                          <form id="demo-form2" action="SendEmail" class="form-horizontal form-label-left" method="post" role="form">
                          <!-- Name -->
					<div class="form-group">
                    	<label class="control-label col-md-3" for="sitename">Student Name</label>
                        <div class="col-lg-6 ">
							<input class="form-control col-md-7 col-xs-12" name="sname" id="sname" value="<%= rs.getString(1)%>" required>
							<span class="sname_error" id="sname_error"></span>
						</div>
					</div>

                  	<div class="form-group">
                    	<label class="control-label col-md-3" for="sitename">Father Name</label>
                        <div class="col-lg-6 ">
                        	<input class="form-control col-md-7 col-xs-12" name="fname" id="fname" value="<%= rs.getString(2)%>" required>
							<span class="fname_error" id="fname_error"></span>
						</div>
					</div>
					
					<div class="form-group">
                    	<label class="control-label col-md-3" for="sitename">Email</label>
                        <div class="col-lg-6 ">
                        	<input class="form-control col-md-7 col-xs-12" name="email" id="email" value="<%= rs.getString(3)%>" required>
							<span class="email_error" id="email_error"></span>
						</div>
					</div>

                    <div class="form-group">
                    	<label class="control-label col-md-3" for="sitename">Message</label>
                        <div class="col-lg-6 ">
                        	<textarea class="form-control col-md-7 col-xs-12" name="message" id="message" rows="3" cols="5" required>Dear <%= rs.getString(2)%>, your child <%= rs.getString(1)%> is absent today. Please send your child regularly.</textarea>
							<span class="message_error" id="message_error"></span>
						</div>
					</div>
                          <!-- Buttons -->
                          <div class="form-group">
                           <!-- Buttons -->
                           <div class="col-lg-9 col-lg-offset-3">
                            <button type="submit" class="btn btn-info" name="submit" id="submit">Send</button>
                            <button type="reset" class="btn btn-default"  id="cancel">Reset</button>
                           </div>
                          </div>
                        </form>
                                    </div>
<% } %>
                  </div>
                </div>
</div><!-- widget closed -->
</div>

 
                </div>
                </div>

            </div>

         
    <!-- Matter ends -->     
   <div class="clearfix"></div>

</div>
          </div>

        <!-- /page content -->
<!-- form vaildation -->
<script type="text/javascript">
  $("#demo-form2").validate({
    errorElement: 'span',
    errorClass: 'has-error',
	  rules:
    {
       sname:
      {
        required: true
      },
		  fname:
      {
				required: true
			},
      email:
      {
        required: true
      },
      message:
      {
        required: true
      },
      
		},
	  messages:
      {
		sname:
        {
			required: 'Please Ente Name'
		},
		fname:
        {
			required: 'Please Enter Father Name'
		},
      	email:
        {
        	required: 'Please Enter Email-Id'   
        },
        message:
        {
        	required: 'Please Enter Message'
        },
      
      },
        errorPlacement: function(error, element){
      if(element.attr("name") == "class_name")
        error.insertAfter(".class_name_error").css("color", "red");
      else if(element.attr("name") == "board_name")
        error.insertAfter(".board_name_error").css("color", "red"); 
       else if(element.attr("name") == "medium_name")
        error.insertAfter(".medium_name_error").css("color", "red");
       else if(element.attr("name") == "section_name[]")
        error.insertAfter(".section_name_error").css("color", "red");
      else
        error.insertAfter(element);
		}	
  
  });

  $('#cancel').click(function () {
    $("#demo-form2").validate().resetForm();
    $("#demo-form2").removeClass("has-error");
    $("#class_name").val('');
    $("#board_name").val('');
    $("#section_name").val('');
    $("#medium_name").val('');
    $("#already_exist").html('');
   
   
  });
  $('#submit').click(function(){
    $("#already_exist").removeClass('');

  });
  $("#class_name").change(function(){
    $("#already_exist").html('');
  });
  $("#board_name").change(function(){
    $("#already_exist").html('');
  });
   $("#section_name").change(function(){
    $("#already_exist").html(''); 
  });
     $("#medium_name").change(function(){
    $("#already_exist").html('');
  });

</script>

<!-- Content ends -->

<!-- Footer starts -->
<footer>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
            <!-- Copyright info -->
            <p class="copy pull-right">Copyright &copy; 2017 | <a href="AdminHome">Attendance Management System</a> </p>
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