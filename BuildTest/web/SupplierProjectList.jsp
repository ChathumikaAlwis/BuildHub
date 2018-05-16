<%-- 
    Document   : SupplierProjectList
    Created on : May 13, 2018, 11:44:59 PM
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
        <title>SupplierHome</title>
        <style>
            #contain {
    max-width: 750px; }
            </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        
        
        <div class="container" id="contain" style="margin-top:100px;margin-bottom: 40px; color: #1B85D8">
	<div class="col-lg-12 well">
        <h2 style="font-family: 'Contrail One', cursive;" class="text-center">Threads</h2>
        <br/>     
            <div class="tab-content">
            <hr>                     
        <div id="threads" class="tab-pane fade in active">    
    
        <%
        DbConnection con    = new DbConnection();    
        String oid = (String) session.getAttribute("userID");
        try
        {
            String sql3 = "SELECT * from thread";   
            ResultSet r2 = con.executeSelect(sql3);
            while(r2.next())
            {
                String tthreadID     = r2.getString(1);
                String tprojectID    = r2.getString(2);
                String tdateTime     = r2.getString(3);
                String tdescription  = r2.getString(4);
                String ttitle        = r2.getString(5);
                String tstatus       = r2.getString(6);
                
        %>

        <div class="row col-sm-12">
                <div class="col-sm-4 text-center">
                    <h4 style="font-family: 'Contrail One', cursive;" >Thread Name: </h4>  
                    <p style="font-family: 'Contrail One', cursive; color:#000"><%= ttitle %></p>
                </div>
                <div class="col-sm-6 text-center">
                   <h4 style="font-family: 'Contrail One', cursive;" >Description: </h4>  
                   <p style="font-family: 'Contrail One', cursive; color:#000"><%= tdescription %></p>
                </div>
                <div class="col-sm-2 text-center">      
                    <a href="<%=request.getContextPath()%>/supplierThreads.jsp?tid=<%= tthreadID%>" style="margin-top:14px" class="btn btn-primary" role="button">View Threads</a>
                </div>
            </div> <hr> 
        <%  }
        } 
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }  
                  
        %>
        </div>
            </div>
        </div>
        </div>
                
        <jsp:include page="footer.html"/>
    </body>
</html>