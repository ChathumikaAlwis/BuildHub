<%-- 
    Document   : login
    Created on : Apr 18, 2018, 12:06:20 PM
    Author     : Shenal Menuka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Login</title>
        
        <script type="text/javascript">

       </script> 
    </head>
    <body>
        <jsp:include page="header.html"/>
        
        <div class="container">    
        <div id="loginbox" style="margin-top:120px; margin-bottom: 60px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading" style="background-color: #1B85D8 ">
                        <div class="panel-title"style="color: #fff">Sign In</div>
                        <div style="float:right; font-size: 80%; position: relative; top:-10px"><a href="#" style="color: #fff">Forgot password?</a></div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >
     
                        <form id="loginform" action="LoginServlet" method="post" class="form-horizontal" role="form">
                            
                            <div class="row col-sm-12 text-center">
                                <fieldset id="group1">
                                <div class="col-sm-4 ">
                                    <label class="radio-inline">
                                    <input type="radio" id="customer-Radio" name="group1" value="Customer">Customer 
                                    </label>
                                </div>
                                <div class="col-sm-4 ">
                                    <label class="radio-inline">
                                    <input type="radio" id="business-Radio" name="group1" value="BusinessUser">Business User
                                    </label>
                                </div>
                                <div class="col-sm-4 ">
                                    <label class="radio-inline">
                                    <input type="radio" id="supplier-Radio" name="group1" value="Supplier">Supplier  
                                    </label>
                                </div>
                                </fieldset>
                            </div>
                            
                            <br/><br/><br/>
                            <div class="col-sm-12">
                                <% String status = (String)request.getAttribute("status");
                                    if(status!=null){%>
                                        <h5 class="text-danger"><%= status %></h5>  <%}%>
                            </div>    
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>                                       
                                        <input id="login-username" type="text" class="form-control" name="Email" value="" placeholder="email" required>                                        
                                    </div>
                                
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input id="login-password" type="password" class="form-control" name="password" placeholder="password" required>
                                    </div>
                                    

                                
                            <div class="input-group">
                                      <div class="checkbox">
                                        <label>
                                          <input id="login-remember" type="checkbox" name="remember" value="1"> Remember me
                                        </label>
                                      </div>
                                    </div>


                                <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->

                                    <div class="col-sm-12 controls">
                                     <input type="submit" id="btn-login" class="btn btn-primary" value="Login" name="login" />
                                      
                                    </div>
                                </div>


                                <div class="form-group">
                                    <div class="col-md-12 control">
                                        <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%" >
                                            Don't have an account! 
                                        <a href="register.jsp">
                                            Sign Up Here
                                        </a>
                                        </div>
                                    </div>
                                </div>    
                            </form>     



                        </div>                     
                    </div>  
        </div>
        </div>
        
    <jsp:include page="footer.html"/>
    </body>
</html>
