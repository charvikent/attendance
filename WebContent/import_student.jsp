<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.charvikent.dbconnection.DbUtility"%>

<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from ashobiz.asia/wrapbootstrap/mac531/macadmin/ by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 16 Jan 2017 07:20:37 GMT -->
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <!-- Title and other stuffs -->
  <title>Administrator | Import Student</title>
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
	
// 	String sno=request.getParameter("sno");
	
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
              <li class=""><a href="add_student.jsp">Add Student</a></li>
              <li class=""><a href="view_student.jsp">View Students</a></li>
              <li class="current"><a href="import_student.jsp">Import Students</a></li>
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
          </li> -->		  
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
			String message=null;
			message=(String)session.getAttribute("message");
	        if(message!=null)
	        {
				out.println("<h4 class='text-center' style='color: green'>"+message+"</h4><br>");
				session.setAttribute("message", null);
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

          <div class="col-md-12 ">
              <!-- Quick setting -->
              <div class="widget">
                <div class="widget-head">
                  <div class="pull-left">Import Students</div>
                  <div class="widget-icons pull-right">
                    <a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a> 
                    <a href="#" class="wclose"><i class="fa fa-times"></i></a>
                  </div>  
                  <div class="clearfix"></div>
                </div>
                <div class="widget-content">
                  <div class="padd">
                   
                  

                                      <!-- Quick setting form (not working)-->

                          <!-- Name -->
<div class="form-group">
	<label class="control-label col-md-2" for="sitename"> Type of Upload :</label>
	<div class="col-md-7">
		<label style="align:left" for="gallery" class="form-horizontal form-label-left"></label>
		<div class="col-md-5 col-sm-3 col-xs-6">
			<select id="field_name" name="field_name" class="form-control">
				<option value="mandatory">Mandatory fields</option>
				<option value="allfields">All fields</option>
			</select>
		</div>
	</div>
	<div class="clearfix"></div>
	<div id="mandatory" style="padding: 40px; border: 1px solid rgb(187, 187, 187); margin-top: 15px; display: block;">
		<div class="control-group">
			<p>* Please enter columns names in excel sheet as show in sample file - Mandatory Fields (columns names should be matched)</p>
			<p>* Please enter Class names in excel sheet as :</p>
			<p>Nursery=Nursery; LKG=LKG; UKG=UKG; 1st class:1st; 2nd class:2nd; 3rd class:3rd; 4th class:4th; 5th class:5th; 6th class:6th; 7th class:7th; 8th class:8th; 9th class:9th; 10th class:10th; </p>
			<br>
			<p>Please Click here to download <a href="import/MandatoryFields.xls" style="font-size:18px; font-style:bold; color:#FF0000;">Sample file</a>  for Mandatory Fields </p>
		</div>
	    <form name="uploadform" method="post" enctype="multipart/form-data" action="manditory.jsp">
		    <div class="par control-group">
				<label class="control-label" for="gender">Please select .XLS file</label>
		      	<br>
		      	<div class="controls">
		      		<input type="file" name="mfile" id="mfile" accept=".xls" required>
		      		<span id="mfile-error" class="has-error"></span>
		      	</div>
		    </div>
<!-- 		    <img alt="" src="upload/99999999999.png"> -->
		    <br>
		    <p class="stdformbutton"><button type="submit" class="btn btn-primary" onclick="return mupload()">Submit</button></p>
	    </form>

<script>
function mupload()
{
	if(document.uploadform.mfile.value === null || document.uploadform.mfile.value === "")
	{
		document.uploadform.mfile.focus();
		document.getElementById("mfile").style.borderLeft = "2px solid #c00";
	    document.getElementById("mfile").style.borderBottom = "2px solid #c00";
	    document.getElementById("mfile-error").innerHTML = "Please Upload the Excel File..!";
		return false;
	}
	else
	{
		document.getElementById("mfile").style.borderLeft = "2px solid #4CAF50";
		document.getElementById("mfile").style.borderBottom = "2px solid #4CAF50";
		document.getElementById("mfile-error").innerHTML = "";
	}
	return true;
}
</script>

	</div>

<script>
$(document).ready(function () 
{
	$('input[type=file]').change(function () 
	{
		var val = $(this).val().toLowerCase();
		var regex = new RegExp("(.*?)\.(xls)$");
 		if(!(regex.test(val))) 
 		{
			$(this).val('');
			alert('Please Select xls or xlsx file format only..!');
		} 
 	});
});
</script>

	<div id="allfields" style="padding: 40px; border: 1px solid rgb(187, 187, 187); margin-top: 15px; display: none;">
    	<div class="control-group">
    		<p>* Please enter columns names in excel sheet as show in sample file - All Fields (columns names should be matched)</p>
    		<p>* Please enter Class names in excel sheet as :</p>
    		<p>Nursery=Nursery; LKG=LKG; UKG=UKG; 1st class:1st; 2nd class:2nd; 3rd class:3rd; 4th class:4th; 5th class:5th; 6th class:6th; 7th class:7th; 8th class:8th; 9th class:9th; 10th class:10th;</p>
    		<br>
    		<p>* Please Click here to download <a href="import/All Fields.xlsx" style="font-size:18px; font-style:bold;">Sample file</a> for All Fields </p>
    		<p>* Please Enter As below for fields of <br> <strong>Gender : </strong> Male ,Female <br>
    			<strong>Date format : </strong> YYYY-MM-DD <br><strong> Accomodation : </strong> Hostel, Day-Scholor <br>
    			<strong> Religion : </strong>Hindu , Muslim , Christian , Sikh , Jain , Parsi, Buddhist, Jewish, No Religion, Spiritual - not Religion, Other .. ( * Please Check Spelling Before Entering and should be of small letters) <br>
    			<strong> Bus Facility : </strong>If Yes,Fill the <strong>Bus route </strong> section as "any route(vijyawada)" <br /> If No,then fill as "No Bus Facility" 
  			</p>
  		</div>
  		<form name="auploadform" method="post" enctype="multipart/form-data" action="">
		    <div class="par control-group">
		    	<label class="control-label" for="gender">Please select .XLS file</label>
		      	<div class="controls">
		        	<input type="file" name="afile" id="afile" accept=".xls" value="1" required>
		        	<span id="afile-error" class="has-error"></span>
		        </div>
		    </div>
    		<br>
  			<p class="stdformbutton">
      			<button type="submit" name="allsubmit" class="btn btn-primary" onclick="return aupload()">Submit</button>
    		</p>
		</form>

<script>
function aupload()
{
	if(document.auploadform.afile.value === null || document.auploadform.afile.value === "")
	{
		document.auploadform.afile.focus();
		document.getElementById("afile").style.borderLeft = "2px solid #c00";
	    document.getElementById("afile").style.borderBottom = "2px solid #c00";
	    document.getElementById("afile-error").innerHTML = "Please Upload the Excel File..!";
		return false;
	}
	else
	{
		document.getElementById("afile").style.borderLeft = "2px solid #4CAF50";
		document.getElementById("afile").style.borderBottom = "2px solid #4CAF50";
		document.getElementById("afile-error").innerHTML = "";
	}
	return true;
}
</script>

	</div>
</div>   
                          <!-- description -->
                	</div>
            	</div>                
			</div>
                          <!-- Buttons -->
                          <div class="form-group">
                           <!-- Buttons -->
                          </div>

                 
 
          
                  </div>
                  <div class="widget-foot">
                    <!-- Footer goes here -->
                  </div>
                </div>
              
          </div>
    <!-- Matter ends -->     
   <div class="clearfix"></div>

</div>
          </div>
                
                <script type="text/javascript">
                

              //import_student

                $('#field_name').on('change',function(){
                  var val=$(this).val();
                  if(val == 'mandatory')
                  {
                    $("#mandatory").show();
                    $("#allfields").hide();
                  }
                  else
                  {
                    $("#mandatory").hide();
                    $("#allfields").show();
                  }
                  });

                </script>

              
  
<!-- Content ends -->

<!-- Footer starts -->
<footer>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
            <!-- Copyright info -->
            <p class="copy">Copyright &copy; 2017 | <a href="dashboard.php">Attendance Management System</a> </p>
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