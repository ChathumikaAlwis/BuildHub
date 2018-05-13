<%-- 
    Document   : projectOverview
    Created on : Apr 17, 2018, 5:28:57 PM
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
    <body style="background-color: #0077e2">

        <%  String oid = (String) session.getAttribute("userID");
        DbConnection con = new DbConnection(); 
            System.out.println(oid);
        String sql = "SELECT name,status,start_date,end_date,est_start,est_end,Location_address,description FROM project WHERE owner="+ oid +";";
        ResultSet r = con.executeSelect(sql);
        r.next();
        String pname = r.getString(1);
        String status = r.getString(2);
        String sd = r.getString(3);
        String ed = r.getString(4);
        String esd = r.getString(5); 
        String eed = r.getString(6);
        String loc = r.getString(7);
        String desc = r.getString(8);

        %>
        
     <h1><%= pname %></h1>
     
     <h1><%= status %></h1>
     <h1><%= esd %></h1>
     <h1><%= eed %></h1>
     <h1><%= sd %></h1>
     <h1><%= ed %></h1> <h1><%= loc %></h1> <h1><%= desc %></h1>
     
    </body>
</html>
