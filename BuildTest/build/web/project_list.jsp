<%-- 
    Document   : project_list
    Created on : Apr 17, 2018, 5:26:15 PM
    Author     : Shenal Menuka
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
            username    ---> email
            usergroup   --->(Customer || BusinessUser || Supplier)
            userID      ---> Based on usergroup
            projectRole ---> BusinessUser - Role
            */
            
        DbConnection con    = new DbConnection();    
        String oid          = null;
        String usergroup    = null; 
        String userRole     = null;
        
        try
        {
            oid          = (String) session.getAttribute("userID");
            usergroup    = (String) session.getAttribute("usergroup");
            userRole     = (String) session.getAttribute("projectRole");                      
                        
        
        System.out.println("Project_List = oid " +oid );
        System.out.println("Project_List = usergroup " +usergroup );
        System.out.println("Project_List = userRole " +userRole );
        
        if(usergroup.equals("Customer"))
        {                   
            System.out.println(oid);
            String sql = "SELECT name,status,id FROM project WHERE owner="+ oid +";";
            ResultSet r = con.executeSelect(sql);

                    while(r.next()){

            String pname = r.getString(1);
            String status = r.getString(2);
            String pId = r.getString(3);
        %>
        
            <a href="<%=request.getContextPath()%>/project.jsp?pid=<%= pId%>"><%= pname %></a>   
            <p><%= status %></p> 

        <% }
         }
        else
            if(usergroup.equals("BusinessUser"))
            {
                if(userRole.equals("Contractor"))
                {
                    String ProjID = null;
                    String sql1 = "SELECT Project_Id FROM project_workers WHERE Contractor_Id = "+ oid + ";";


                    ResultSet r1 = con.executeSelect(sql1);
                    r1.next();

                    ProjID = r1.getString(1);
                    String sql2 = "SELECT name,status,id FROM project WHERE ID="+ ProjID +";";
                    ResultSet r2 = con.executeSelect(sql2);

                    System.out.println(ProjID + " PROJID");
                    System.out.println("Project_List = oid " +oid );

                    while(r2.next())
                    {       
                    String pname    = r2.getString(1);
                    String status   = r2.getString(2);
                    String pId      = r2.getString(3);
                %>
                    <a href="<%=request.getContextPath()%>/project.jsp?pid=<%= pId%>"><%= pname %></a>   
                    <p><%= status %></p> 
                <%  }
                }
                else
                    if(userRole.equals("Architect"))
                    {
                        String ProjID = null;
                        String sql1 = "SELECT Project_Id FROM project_workers WHERE Architect_Id = "+ oid + ";";
                        

                        ResultSet r1 = con.executeSelect(sql1);
                        r1.next();

                        ProjID = r1.getString(1);
                        String sql2 = "SELECT name,status,id FROM project WHERE ID="+ ProjID +";";
                        ResultSet r2 = con.executeSelect(sql2);
                        
                        System.out.println(ProjID + " PROJID");
                        System.out.println("Project_List = oid " +oid );
                        
                        while(r2.next())
                        {       
                        String pname    = r2.getString(1);
                        String status   = r2.getString(2);
                        String pId      = r2.getString(3);
                    %>
                        <a href="<%=request.getContextPath()%>/project.jsp?pid=<%= pId%>"><%= pname %></a>   
                        <p><%= status %></p> 
                    <%  }
                    }
                    else
                        if(userRole.equals("Interior Designer"))
                        {
                            String ProjID = null;
                            String sql1 = "SELECT Project_Id FROM project_workers WHERE IntDesigner_Id = "+ oid + ";";


                            ResultSet r1 = con.executeSelect(sql1);
                            r1.next();

                            ProjID = r1.getString(1);
                            String sql2 = "SELECT name,status,id FROM project WHERE ID="+ ProjID +";";
                            ResultSet r2 = con.executeSelect(sql2);

                            System.out.println(ProjID + " PROJID");
                            System.out.println("Project_List = oid " +oid );

                            while(r2.next())
                            {       
                            String pname    = r2.getString(1);
                            String status   = r2.getString(2);
                            String pId      = r2.getString(3);
                        %>
                            <a href="<%=request.getContextPath()%>/project.jsp?pid=<%= pId%>"><%= pname %></a>   
                            <p><%= status %></p> 
                        <%  }
                        }
                        else
                            if(userRole.equals("Quantity Surveyor"))
                            {
                                String ProjID = null;
                                String sql1 = "SELECT Project_Id FROM project_workers WHERE Quantity_surv_Id = "+ oid + ";";


                                ResultSet r1 = con.executeSelect(sql1);
                                r1.next();

                                ProjID = r1.getString(1);
                                String sql2 = "SELECT name,status,id FROM project WHERE ID="+ ProjID +";";
                                ResultSet r2 = con.executeSelect(sql2);

                                System.out.println(ProjID + " PROJID");
                                System.out.println("Project_List = oid " +oid );

                                while(r2.next())
                                {       
                                String pname    = r2.getString(1);
                                String status   = r2.getString(2);
                                String pId      = r2.getString(3);
                            %>
                                <a href="<%=request.getContextPath()%>/project.jsp?pid=<%= pId%>"><%= pname %></a>   
                                <p><%= status %></p> 
                            <%  }
                            }
                            else
                                if(userRole.equals("Carpenter"))
                                {
                                    String ProjID = null;
                                    String sql1 = "SELECT Project_Id FROM project_workers WHERE Carpenter_Id = "+ oid + ";";


                                    ResultSet r1 = con.executeSelect(sql1);
                                    r1.next();

                                    ProjID = r1.getString(1);
                                    String sql2 = "SELECT name,status,id FROM project WHERE ID="+ ProjID +";";
                                    ResultSet r2 = con.executeSelect(sql2);

                                    System.out.println(ProjID + " PROJID");
                                    System.out.println("Project_List = oid " +oid );

                                    while(r2.next())
                                    {       
                                    String pname    = r2.getString(1);
                                    String status   = r2.getString(2);
                                    String pId      = r2.getString(3);
                                %>
                                    <a href="<%=request.getContextPath()%>/project.jsp?pid=<%= pId%>"><%= pname %></a>   
                                    <p><%= status %></p> 
                                <%  }
                                }
              
            }  
            }
            catch(Exception e)
            {
                response.sendRedirect("login.jsp");
            } 
        %>       
         
        
    </body>
</html>
