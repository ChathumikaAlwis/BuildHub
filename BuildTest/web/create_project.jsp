<%-- 
    Document   : create_project
    Created on : Apr 17, 2018, 5:25:31 PM
    Author     : Shenal Menuka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Project</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <link href='https://fonts.googleapis.com/css?family=Faster One' rel='stylesheet'>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
   <% 
        String uid  = (String) session.getAttribute("userID");

        if(uid == null)
            {
               response.sendRedirect("login.jsp"); 
            }                  
    %>
  
    </head>
    <body>
        <jsp:include page="header.html"/>
        
            
<div class="container-fluid text-center">    


    <div class="col-sm-12" style="margin: 120px auto;">

      <img src="images/oops.jpg" alt="oops" class="img-responsive">
      <h1 STYLE="font-family:Faster One; font-size: 33px">YOU DON'T HAVE PROJECTS!</h1>
      <button type="button" class="btn btn-primary btn-lg" onclick="window.location='addProject.jsp'">CREATE PROJECT</button>
    </div>

</div>

        <jsp:include page="footer.html"/>
    </body>
</html>
