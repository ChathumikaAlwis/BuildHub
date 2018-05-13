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
        <h1>Hello World!</h1>
        <%
        String oid = (String) session.getAttribute("userID");
        DbConnection con = new DbConnection(); 
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
     
        <%}%>
         
        
    </body>
</html>
