<%-- 
    Document   : createThread
    Created on : May 16, 2018, 10:14:08 PM
    Author     : RavianXReaver
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="mypckg.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Contrail+One" rel="stylesheet">
        <title>Create Thread</title>  
        <style>
             #contain {
    max-width: 700px;}  
            </style>
    </head>
    <body>       
        <jsp:include page="header.jsp"/>  
        <div class="container" id="contain" style="margin-top:120px;margin-bottom: 60px; color: #1B85D8">
	<div class="col-lg-12 well">
            
            <form name="createThread" action="CreateThread" method="POST">
               <h2 style="font-family: 'Contrail One', cursive;" class="text-center">Create Thread</h2>
               
                <div class="form-group">
                <label>Title</label>
                <input name="title" type="text" placeholder="Enter Title Here.." class="form-control" required  pattern="[^0123456789]+" title="Invalid input">
                </div>
                
                <div class="form-group">
                <label>Description</label>
                <textarea name="description" placeholder="Enter Description Here.." rows="3" class="form-control" required></textarea>
                </div>	
                
                <div>
                       <button type="submit" class="btn btn-lg btn-primary" name="submit" id="submit" >Submit</button>
                </div>

            </form>
            
        </div>
        </div>
    
        <jsp:include page="footer.html"/> 
    </body>
</html>
