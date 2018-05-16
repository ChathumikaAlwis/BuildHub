<%-- 
    Document   : supplierThreads
    Created on : May 14, 2018, 5:32:32 PM
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
        <title>JSP Page</title>
        <style>
            #contain {
    max-width: 700px; }
            </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/> 
<%      
        DbConnection con    = new DbConnection();
        String tid          = request.getParameter("tid");System.out.println(tid+" tid");
        String project_ID   = null;     
        String dateTime     = null;
        String description  = null;
        String title        = null;
        String status       = null;
        String owner        = null;
        String contact      = null;
        String fName        = null;
        String lName        = null;
        String sql1 = "SELECT Project_ID, Date_Time, Description, Title, Status FROM thread WHERE Thread_ID ="+tid+";";  //Done 
        String sql2;
        String sql3;      
        
        try
        {
            ResultSet rs1 = con.executeSelect(sql1);      
            rs1.next();
            project_ID = rs1.getString(1);       
            dateTime = rs1.getString(2);
            description = rs1.getString(3);
            title = rs1.getString(4);
            status = rs1.getString(5);   
            
            sql2 = "SELECT Owner from project WHERE ID ="+ project_ID +";";
            ResultSet rs2 = con.executeSelect(sql2);
            rs2.next();
            owner = rs2.getString(1);
            
            sql3 = "SELECT Contact_No, Fname, Lname from customer WHERE ID ="+ owner + ";";
            ResultSet rs3 = con.executeSelect(sql3);
            rs3.next();
            contact = rs3.getString(1); 
            fName = rs3.getString(1); 
            lName = rs3.getString(1); 
            
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
%>       <div class="container" id="contain" style="margin-top:100px;margin-bottom: 40px; color: #1B85D8">
	<div class="col-lg-12 well">      
                 <h1 style="font-family: 'Contrail One', cursive;" class="text-center"><%= title %></h1>
                <br>
                <div class="row">
                    <div class="col-sm-8 text-center">
                      <h3 style="font-family: 'Contrail One', cursive;"> <%= description%> </h3>  
                    </div> 
                    <div class="col-sm-4 text-center">
                        <div>
                          <h4 style="font-family: 'Contrail One', cursive; color:#000"> Posted By : <%= fName%> <%= lName%></h4>  
                        </div>
                        <div>
                         <h4 style="font-family: 'Contrail One', cursive; color:#000"> Contact   : <%= contact%>  </h4>    
                        </div>
                    </div>
                </div>    
                <br/> 
                <div class="text-center">
                <h4 style="font-family: 'Contrail One', cursive; color:#000"> Time Created : <%= dateTime%> </h4>
                </div>
        </div>
        </div>
        <jsp:include page="footer.html"/>        
    </body>
</html>
