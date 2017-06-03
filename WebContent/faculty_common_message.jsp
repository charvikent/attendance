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
  <title>Faculty | Student(s) Common Message</title>
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
	
	String board_name=request.getParameter("board");
	String medium_name=request.getParameter("medium");
	String class_name=request.getParameter("clas");
	String section_name=request.getParameter("section");
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
              <li class="current"><a href="faculty_common_message.jsp">Common Message</a></li>
<!--               <li class=""><a href="faculty_view_attendance.jsp">View Attendance</a></li> -->
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
        <div class="">       <div class="mainbar">

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
                  <div class="pull-left">Common Message</div>
                  <div class="widget-icons pull-right">
                    <a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a> 
                    <a href="#" class="wclose"><i class="fa fa-times"></i></a>
                  </div>  
                  <div class="clearfix"></div>
                </div>
                <div class="widget-content">
                  <div class="padd">
                    
	<form id="msg-form" data-parsley-validate="" class="form-horizontal form-label-left" method="post" action="Faculty_SendSMSEmail">
                     <div class="col-lg-12">
<!--                      	<div class="col-lg-10"> -->
<% 	
		String fac_id=null;	String fac_name=null;
		ps=con.prepareStatement("select Sno,faculty_name from faculty where faculty_name='"+uname+"'");
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			fac_id= rs.getString(1);
			fac_name= rs.getString(2);
		}
%>
		<input type="hidden" name="fac_id" value="<%= fac_id %>">
		<input type="hidden" name="fac_name" value="<%= fac_name %>">							
							<div class="form-group">
                            	<label class="col-lg-4 control-label">Type of Board</label>
                            	<div class="col-lg-5">
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
                            	<label class="col-lg-4 control-label">Medium</label>
                            	<div class="col-lg-5">
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
                            	<label class="col-lg-4 control-label">Select Class</label>
                            	<div class="col-lg-5">
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
                            	<label class="col-lg-4 control-label">Select Section</label>
                                <div class="col-lg-5">
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


      						<div class="form-group">
      							<div class="control-group">
       								<label class="col-lg-4 control-label" for="class"></label>
									<div class="controls">
          								<div class="col-lg-8">
        									<input type="checkbox" name="otherlanguage" id="otherlanguage" value="1">
        									Check this to send your message in any other language?
        
					        			</div>
					        		</div>
					        	</div>
        
        						<div class="slanguage" style="display: none;">
     								<div class="form-group">
							        	<label class="control-label col-md-4 col-sm-6 col-xs-12" for="class">Select SMS Language</label>
       									<div class="col-md-5 col-sm-6 col-xs-12">
        									<div class="controls"></div>
           									<div class="col-lg-4">
         										<div style="" id="unicode" class="rowcontent curve">
										      		<div class="row_col">
        												<div class="row_col_small">
          													<div id="translControl"><div class="inputapi-inline-block inputapi-transliterate-button" title="" role="button" style="user-select: none;" tabindex="0" aria-haspopup="true" aria-expanded="false" aria-activedescendant=""><div class="inputapi-inline-block inputapi-transliterate-button-outer-box"><div class="inputapi-inline-block inputapi-transliterate-button-caption"></div></div></div></div>
        												</div>
      												</div>
    											</div>
      										</div>
      									</div>
									</div>
			      					<div class="slanguage" style="display: none;">
     									<div class="form-group">
        									<label class="control-label col-md-4 col-sm-6 col-xs-12" for="class">Message</label>
       										<div class="col-md-5 col-sm-6 col-xs-12">
       											<textarea name="messagedata" id="messagedata" placeholder="Please Enter Message" style="line-height: 1.5em;font-family: Arial,Helvetica,sans-serif;font-size: 12px;margin: 0px;width: 264px;height: 73px;"></textarea>
									        	<span class="messagedata_error" id="messagedata_error"></span>
									        </div>
							        	</div>
							        </div>
      							</div>
      
        						<div class="elanguage" style="display: block;">
     								<div class="form-group">
        								<label class="control-label col-md-4 col-sm-6 col-xs-12" for="class">Message</label>
       									<div class="col-md-6 col-sm-6 col-xs-12">
											<textarea name="emessagedata" id="emessagedata" placeholder="Please Enter Message" style="line-height: 1.5em;font-family: Arial,Helvetica,sans-serif;font-size: 12px;margin: 0px;width: 264px;height: 73px;" aria-required="true"></textarea>
        									<span class="emessagedata_error" id="emessagedata_error"></span>
						        		</div>
						        	</div>
						        </div>

        						<div class="smschar" style="display: none;">
     								<div class="form-group">
        								<label class="control-label col-md-4 col-sm-6 col-xs-12" for="class">&nbsp;</label>
       									<div class="col-md-6 col-sm-6 col-xs-12">
        									Char Count: <input style="width: 25px; text-align: right; padding: 0px 5px 0px 0px;" readonly="readonly" value="40" id="charcount" name="charcount" gtbfieldid="2" size="10" type="text">
											<input type="hidden" id="schoolnamecount" value="40">
        									SMS Count: <input style="width: 25px; text-align: right;padding: 0px 5px 0px 0px; " readonly="readonly" value="1" id="msgcount" name="msgcount" gtbfieldid="2" size="10" type="text">
          								</div>
          							</div>
        						</div>

            					<div class="form-group">
        							<div class="control-group">
           								<label class="col-lg-4 control-label">Notification Type  &nbsp; &nbsp;</label>
          								<div class="col-md-5 col-sm-3 col-xs-6">
								        	<select class="form-control select_class" name="notify_type" id="notify_type" aria-required="true">
									            <option value="" selected disabled>-- Select --</option>
												<option value="1">Email</option>
												<option value="2">SMS</option>
												<option value="3">SMS+Email</option>
								        	</select>
								        	<span class="notify_type_error" id="notify_type_error" style="display:block"></span>
								        </div>
						        	</div>
						        </div>

    							<div style="display:none" id="schedule_time">
									<p class="stdformbutton"></p>
									<div class="form-group">
								        <label class="col-lg-4 control-label" for="class">&nbsp;</label>
       									<div class="col-md-7 col-sm-6 col-xs-12">
          									<a class="btn btn-primary " href="javascript:void(0);" id="schedule_message">Click Here for Schedule Messages</a>
      										<p></p>
										</div>
									</div>
								</div>
<script>
      jQuery(document).ready(function(){
        jQuery("#schedule_message").click(function() {
          jQuery("#mandatory").show();
          jQuery("#schedule_time_hour").show();
        });
      });
</script>
								<div class="form-group">
									<div class="form-group" id="mandatory" style="display:none; ">
                                  		<label for="class" class="col-lg-4 control-label">Date </label>
                                  		<div class="col-lg-8">
                                			<div id="datetimepicker1" class="input-append input-group dtpicker">
                                  				<input data-format="yyyy-MM-dd" type="text" class="form-control" value="" name="datepicker" id="datepicker">
                                    			<span class="input-group-addon add-on">
                                          			<i data-time-icon="fa fa-times" data-date-icon="fa fa-calendar" class="fa fa-calendar"></i>
                                      			</span>
                                     		</div>
                                      		<span class="dob_error" style="display:block"></span>  
                                  		</div>
                                  	</div>

        							<div class="form-group">
      									<div class="form-group" id="schedule_time_hour" style="display:none; ">
            								<label class="control-label col-md-4 col-sm-6 col-xs-12" for="class">Time</label>
								            <div class="col-lg-5">
            									<select name="schedule_hour" id="schedule_hour" class="uniformselect" style="width:18%">
									            	<option value="">Select</option>
									              	<option value="1">1</option>
									              	<option value="2">2</option>
									              	<option value="3">3</option>
									              	<option value="4">4</option>
									              	<option value="5">5</option>
									              	<option value="6">6</option>
									              	<option value="7">7</option>
									              	<option value="8">8</option>
									              	<option value="9">9</option>
									              	<option value="10">10</option>
									              	<option value="11">11</option>
									              	<option value="12">12</option>
            									</select>

            									<select name="schedule_min" id="schedule_min" class="uniformselect" style="width:18%">
              										<option value="">Select</option>
										            <option value="00">00</option>
										            <option value="15">15</option>
										            <option value="30">30</option>
									              	<option value="45">45</option>
									            </select>

            									<select name="schedule_type" id="schedule_type" class="uniformselect" style="width:18%">
									              	<option value="">Select</option>
									              	<option value="AM">AM</option>
									             	<option value="PM">PM</option>
            									</select>
            								</div>
            							</div>
        							</div>
								</div>
							</div>
<!-- 				      	</div> -->
    				</div>

    				<div class="control-group" style="display:none;" id="notification_time">
						<label class="control-label" for="class">Notification Time</label>
			        	<div class="controls">
        					<select name="notify_time" id="notify_time" class="uniformselect">
					        	<option value="">Select</option>
					          	<option value="1">1</option>
					          	<option value="2">2</option>
					          	<option value="3">3</option>
					          	<option value="4">4</option>
					          	<option value="5">5</option>
					          	<option value="6">6</option>
					         	<option value="7">7</option>
					          	<option value="8">8</option>
					          	<option value="9">9</option>
					          	<option value="10">10</option>
					          	<option value="11">11</option>
					          	<option value="12">12</option>
        					</select>
				        </div>
				    </div>

                 	<div class="form-group">
	                 	<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-4">
	                    	<button type="submit" class="btn btn-info" name="submit" id="submit">Submit</button>
	                        <button type="reset" class="btn btn-default" id="cancel">Reset</button>
	                 	</div>
                 	</div>
			      	<!-- <div class="col-lg-2">
			       		<div class="form-group"></div>
					</div> -->
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

<style type="text/css">
  form input.error, textarea.error, select.error, #s2id_subject.error {border: 1px solid red !important;}
</style>
<script type="text/javascript" src="http://www.google.com/jsapi"></script>

<script>
jQuery(document).ready(function(){

  jQuery('#messagedata').keyup(function(){
var schoolnamecount=jQuery('#schoolnamecount').val();
      var chars = parseInt(schoolnamecount) + parseInt(this.value.length),

            messages = Math.ceil(chars / 70);

      jQuery("#charcount").val(chars);

      jQuery("#msgcount").val(messages);

    });
  jQuery('#emessagedata').keyup(function(){
var schoolnamecount=jQuery('#schoolnamecount').val();
      var chars = parseInt(schoolnamecount) + parseInt(this.value.length),

            messages = Math.ceil(chars / 160);

      jQuery("#charcount").val(chars);

      jQuery("#msgcount").val(messages);

    });

  jQuery('#notify_type').change(function(){

      var a=this.value;

      if(a==3)

      {

        jQuery("#schedule_time").show();

        jQuery("#notification_time").hide();
        jQuery("#messagetitle").show();
        
        
      }if(a==2)

      {

        jQuery("#schedule_time").show();

        jQuery("#notification_time").hide();
        jQuery("#messagetitle").hide();
        

      }else if(a==1){

        jQuery("#notification_time").hide();

        jQuery("#schedule_time").hide();
        jQuery("#messagetitle").show();
        jQuery("#mandatory").hide();
         jQuery("#schedule_time_hour").hide();


      }

    });
 jQuery( "#notify_type" ).change(function () {
 if(jQuery( this ).val()!='1')
 {
 jQuery('.smschar').show();
 }
 else
 {
 jQuery('.smschar').hide();
 }
  });



});

</script>
<script type="text/javascript">

  $("#msg-form").validate({
	errorElement: 'span',
    errorClass: 'has-error',
	rules:
    {
		board:{required: true},
		clas:{required: true},
	 	medium:{required: true},
		section:{required: true},
		messagedata:{required: true},
		emessagedata:{required:	true},
		notify_type:{required: true},
	},
	messages:
	{
		clas:{required: 'Please Choose Class'},
		section:{required: 'Please Choose Section'},
      	board:{required: 'Please Choose Board'},
        medium:{required: 'Please Choose Medium'},
        messagedata:{required: 'Please Enter the Message'},
        emessagedata:{required:	'Please Enter Message'},
		notify_type:{required: 'Please Choose Type of Notification'},
	},

	errorPlacement: function(error, element){
	      if(element.attr("name") == "board")
	        error.insertAfter(".board_error").css("color", "red");
	      else if(element.attr("name") == "class")
	        error.insertAfter(".class_error").css("color", "red"); 
	      
	      else if(element.attr("name") == "section")
	        error.insertAfter(".section_error").css("color","red");   
	      else if(element.attr("name") == "emessagedata")
	        error.insertAfter(".emessagedata_error").css("color","red");
	      else if(element.attr("name") == "messagedata")
	        error.insertAfter(".messagedata_error").css("color","red"); 
	      else if(element.attr("name") == "notify_type")
	        error.insertAfter(".notify_type_error").css("color","red");          
	      else
	        error.insertAfter(element);
	      }
	  });

  $('#cancel').click(function () {
    $("#msg-form").validate().resetForm();
    $("#msg-form").removeClass("has-error");
    $("#clas").val('');
    $("#board").val('');
    $("#section").val('');
    $("#medium").val('');
    $("#messagedata").val('');
    $("#notify_type").val('');
   
  });

  $('#dobpicker').click( function() { 
      if($('#dob').val() !=""){
        $("#dob_error").hide();
      }
      else
        $("#dob_error").show();


  });


jQuery(document).ready(function(){
jQuery('#otherlanguage').click(function(){

if(jQuery("#otherlanguage").is(':checked'))
{
  
  jQuery('.slanguage').show();
  jQuery("#messagedata").attr("required", false);
  jQuery("#emessagedata").attr("required", false);
  jQuery('.elanguage').hide();
  jQuery('#emessagedata').val('');
  var schoolnamecount=jQuery('#schoolnamecount').val();
  jQuery("#charcount").val(schoolnamecount);

    jQuery("#msgcount").val(1);
  
}
else
{
  jQuery('.elanguage').show();
  jQuery("#emessagedata").attr("required", true);
  jQuery("#messagedata").attr("required", false);
  jQuery('.slanguage').hide();
  jQuery('#messagedata').val('');
  var schoolnamecount=jQuery('#schoolnamecount').val();
  jQuery("#charcount").val(schoolnamecount);

    jQuery("#msgcount").val(1);
}
});
});
    google.load("elements", "1", {
          packages: "transliteration"
        });
      function onLoad() {
    
    //alert('sdf');
          var options = {
            sourceLanguage: 'en',
            destinationLanguage: ['hi','kn','ml','ta','or','te','mr','gu','bn','pa','ur','zh','ar','ne','ru','fa','el','sa','sr'],
            shortcutKey: 'ctrl+g',
            transliterationEnabled: true
          };

          // Create an instance on TransliterationControl with the required
          // options.
          var control =
              new google.elements.transliteration.TransliterationControl(options);

  

          // Enable transliteration in the textfields with the given ids.
          var ids = [ "messagedata"];
          control.makeTransliteratable(ids);          
          
          // Show the transliteration control which can be used to toggle between
          // English and Hindi and also choose other destination language.
          control.showControl('translControl');


      
}

google.setOnLoadCallback(onLoad);
  function languageChangeHandler() {

  
      var dropdown = document.getElementById('language');
      transliterationControl.setLanguagePair(
          google.elements.transliteration.LanguageCode.ENGLISH,
          dropdown.options[dropdown.selectedIndex].value);

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