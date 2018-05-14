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
        <title>JSP Page</title>
    </head>
    <body>
         <div id="post" class="tab-pane fade" style="background-color: #ef1a1a">
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
%>             

                <h1> <%= title %> </h1>
                <br>
                <p> <%= description%> </p>
                <br>
                <p> Posted By : <%= fName%> <%= lName%> <br>
                    Contact   : <%= contact%>
                </p>                              
                <h5> Time Created : <%= dateTime%> </h5>
                
    </body>
</html>
