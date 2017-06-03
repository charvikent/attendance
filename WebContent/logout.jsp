<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Log out Page</title>
<script>
    history.forward();
</script>
</head>
<body>

<% 
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setHeader("Cache-Control","no-store"); // HTTP 1.1
response.setDateHeader("Expires", 0);

   session.setAttribute("username", null);
   session.setAttribute("fac_name", null);
   session.setAttribute("parent_name", null);
   session.invalidate();
   response.sendRedirect("AdminLogin");
   
%>

</body>
</html>