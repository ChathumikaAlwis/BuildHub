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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Project List</h1>
        
       <%           
            /*
                    1.List Of projects  
                    2.Show all Threads                         
           
            //Sessions          
            username    ---> email
            usergroup   --->(Customer || BusinessUser || Supplier)
            userID      ---> Based on usergroup
            projectRole ---> BusinessUser - Role
            */
            
        DbConnection con    = new DbConnection();    
        String oid = (String) session.getAttribute("userID");
        
        try
        {                                                              
            System.out.println("Project_List = oid " +oid );                               
            
            String ProjID = null;
            String sql1 = "SELECT Project_ID FROM proj_sup WHERE Supplier_ID = "+ oid + ";";


            ResultSet r1 = con.executeSelect(sql1);
            r1.next();
            ProjID = r1.getString(1);
            String sql = "SELECT name,status,id FROM project WHERE ID="+ ProjID +";";
            ResultSet r = con.executeSelect(sql);

            while(r.next())
            {
                String pname    = r.getString(1);
                String status   = r.getString(2);
                String pId      = r.getString(3);
        %>
                <a href="<%=request.getContextPath()%>/project.jsp?pid=<%= pId%>"><%= pname %></a>   
                <p><%= status %></p>
                
        <%  }
                   
        }
        catch(Exception e)
        {
            response.sendRedirect("login.jsp");
        } 
          
        %>
        
        
    </body>
</html>
