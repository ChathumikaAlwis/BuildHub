<%-- 
    Document   : threadDisplay
    Created on : Apr 17, 2018, 5:33:02 PM
    Author     : RavianXReaver
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="mypckg.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                <h5 style="font-family: 'Contrail One', cursive; color:#000" class="text-right"> Time Created : <%= dateTime%> </h5>
                 <h1 style="font-family: 'Contrail One', cursive;" class="text-center"><%= title %></h1>
                <br/>
                    <div class="col-sm-12 text-center">
                      <h3 style="font-family: 'Contrail One', cursive;"> <%= description%> </h3>  
                    </div> 
                    <br/><br/>
                    <div class="row text-center">
                        <div class="col-sm-6 text-center">
                          <h4 style="font-family: 'Contrail One', cursive; color:#000"> Posted By : <%= fName%> <%= lName%></h4>  
                        </div>
                        <div class="col-sm-6 text-center">
                         <h4 style="font-family: 'Contrail One', cursive; color:#000"> Contact   : <%= contact%>  </h4>    
                        </div>
                    </div>    
                <br/> 
                
        </div>
        </div>
        <jsp:include page="footer.html"/>      
    </body>
</html>
