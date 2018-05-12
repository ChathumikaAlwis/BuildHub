<%-- 
    Document   : registerUser
    Created on : Apr 18, 2018, 1:07:18 PM
    Author     : Shenal Menuka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href='https://fonts.googleapis.com/css?family=Faster One' rel='stylesheet'>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Register User</title>
    </head>
    <body>
        <jsp:include page="header.html"/>
        
        <div class="container text-center" style="margin-top: 160px; margin-bottom: 120px">
            
            <div class="col-sm-12">

                <div class="col-sm-4">
                    <img src="images/user1.jpg" alt="normaluser" class="img-responsive" style="margin: 0 auto;">
                    <h1 STYLE="font-family:Faster One; font-size: 33px">GENERAL USER</h1>
                    <a href="registerNormalUser.jsp"><button type="button" class="btn btn-primary btn-lg">REGISTER</button></a>
                </div>
                <div class="col-sm-4">
                    <img src="images/user2.png" alt="businessuser" class="img-responsive" style="margin: 0 auto;">
                    <h1 STYLE="font-family:Faster One; font-size: 33px">BUSINESS USER</h1>
        <a href="registerBusinessUser.jsp"><button type="button" class="btn btn-primary btn-lg">REGISTER</button></a>
                </div>
                <div class="col-sm-4">
                    <img src="images/user3.jpg" alt="supplier" class="img-responsive" style="margin: 0 auto;">
                    <h1 STYLE="font-family:Faster One; font-size: 33px">SUPPLIER</h1>
      <a href="registerSupplier.jsp"><button type="button" class="btn btn-primary btn-lg">REGISTER</button></a>
                </div>
                
            </div>

        </div>
        
        <jsp:include page="footer.html"/>
    </body>
</html>
