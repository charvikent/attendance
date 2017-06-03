<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <!-- Title and other stuffs -->
  <title>Attendance Management System | Login</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta name="author" content="">

  <!-- Stylesheets -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="css/font-awesome.min.css">
  <link href="css/style.css" rel="stylesheet">
  
  <script src="js/respond.min.js"></script>
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <![endif]-->

  <!-- Favicon -->
  <link rel="shortcut icon" href="img/favicon/school.png">
  <script src="js/jquery.js"></script>
  <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.3.min.js"></script>
  <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/jquery.validate.min.js"></script>
  <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/additional-methods.min.js"></script>
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
</head>
<body>
<%        
if((session.getAttribute("username")==null) || (session.getAttribute("username")==""))
{        
%>
<!-- Form area -->
<div class="admin-form">
  <div class="container">

    <div class="row">
      <div class="col-md-12">
        <!-- Widget starts -->
            <div class="widget worange">
              <!-- Widget head -->
              <div class="widget-head">
                <i class="fa fa-lock"></i> Login 
              </div>

              <div class="widget-content">
                <div class="padd">
                  <!-- Login form -->
                  <form id="admin-form" action="LoginServlet" data-parsley-validate class="form-horizontal form-label-left" method="post" role="form">
<%	
	String rl=null;	rl=(String)session.getAttribute("rl");
	String username=null;  	username=(String)session.getAttribute("uname");
	
	session.setAttribute("rl", null);
	session.setAttribute("uname", null);
%>      
                    <div class="form-group">
                      <label class="control-label col-lg-3">Role</label>
                      <div class="col-lg-9">
                        <select name="rol" id="rol" class="form-control" required>
                        	<option value="" disabled selected>-- Select Role --</option>
                        	<option <% if(rl != null && rl.equals("Administrator")) { %> value="Administrator" selected <% }else { %> value="Administrator" <% } %>>Administrator</option>
                        	<option <% if(rl != null && rl.equals("Faculty")) { %> value="Faculty" selected <% }else { %> value="Faculty" <% } %>>Faculty</option>
                        	<option <% if(rl != null && rl.equals("Parent")) { %> value="Parent" selected <% }else { %> value="Parent" <% } %>>Parent</option>
                        </select>
                      </div>
                    </div>
                    
                    <!-- Username -->
                    <div class="form-group">
                      <label class="control-label col-lg-3">Username</label>
                      <div class="col-lg-9">
         			<input type="text" class="form-control" placeholder="Enter Username" name="uname" id="uname" required
         			<% if(username != null) { %>value="<%= username %>" <% } %>> 
                      </div>
                    </div>
                    <!-- Password -->
                    <div class="form-group">
                      <label class="control-label col-lg-3">Password</label>
                      <div class="col-lg-9">
                        <input type="password" class="form-control" placeholder="Enter Password" name="upass" id="upass" required>
                      </div>
                    </div>
         			<span id="already_exist" class="already_exist"></span>
                    
                    <div class="col-lg-9 col-lg-offset-3">
						<button type="submit" class="btn btn-info btn-sm" name="submit" id="submit">Sign in</button>
						<button type="reset" class="btn btn-default btn-sm" name="cancel" id="cancel">Reset</button>
						<!-- &nbsp;&nbsp;&nbsp;
						<a href="FacultyLogin">Faculty Login</a> -->
					</div>

                    <div class="form-group">
						<div class="col-lg-9 col-lg-offset-3">
	                      <%
				            String error=null;
	                      	error=(String)session.getAttribute("error");
				            if(error != null && error != "")
				            {
								out.println("<h3 class='' style='color: red'>"+error+"</h3>");
								session.setAttribute("error", null);
							}
			        	   %>
						</div>
					</div>
                    
                  </form>
				</div>
                </div>
              
<!--                 <div class="widget-foot"> -->
<!--                   Not Registred? <a href="Register">Register here</a> -->
<!--                 </div> -->
            </div>  
      </div>
    </div>
  </div> 
</div>
	
<script type="text/javascript">
  $("#admin-form").validate({
	errorElement: 'span',
    errorClass: 'has-error',
	rules:
    {
		rol:
		{
			required: true
		},
		uname:
		{
			required: true
		},
		upass:
		{
			required: true
		},
	},
	messages:
   	{
		rol:
		{
			required: 'Please Select Role'
		},
		uname:
      	{
			required: 'Please Enter Username'
		},
		upass:
		{
			required: 'Please Enter Password'
		},
	}	
  });
  $('#cancel').click(function () {
    $("#admin-form").validate().resetForm();
    $("#admin-form").removeClass("has-error");
    $("#uname").val('');
    $("#upass").val('');
    
  });
  
  $(function () {
	    $('input[placeholder]').blur();
	    $('#rol').on('change',function () {
	        var ph = $(this).val();
	        if(ph == 'Administrator')
	        {
	        	$("#uname").attr("placeholder", "Enter Username").blur();
	            $("#upass").attr("placeholder", "Enter Password").blur();
	        }
	        else if(ph == 'Faculty') 
	        {
	            $("#uname").attr("placeholder", "Enter Registered Faculty Name as Username").blur();
	            $("#upass").attr("placeholder", "Enter Registered Mobile Number as Password").blur();
	        }
	        else if(ph == 'Parent') 
	        {
	            $("#uname").attr("placeholder", "Enter Registered Father Name as Username").blur();
	            $("#upass").attr("placeholder", "Enter Registered Mobile Number as Password").blur();
	        }
	    });
	});

</script>				

<!-- JS -->

<script src="js/bootstrap.min.js"></script>
<%
}
else
{
      response.sendRedirect("AdminHome");
}
%>
</body>

</html>