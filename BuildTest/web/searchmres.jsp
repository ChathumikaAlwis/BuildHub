<%-- 
    Document   : searchmres
    Created on : May 16, 2018, 12:32:04 AM
    Author     : Chath
--%>

<%@page import="mypckg.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%  String srchid="";
        DbConnection con = new DbConnection();
        String memtype= (String) request.getAttribute("memtype");
        ResultSet srchres = (ResultSet) request.getAttribute("serachres") ;
        while(srchres.next()){
            String res = srchres.getString(1);
                    String sqlusname = "SELECT fname,lname,id FROM business_user WHERE id="+res+";";
        ResultSet rsusname = con.executeSelect(sqlusname);
        rsusname.next(); 
        String userfname = rsusname.getString(1);
        String userlname = rsusname.getString(2);
        String userid = rsusname.getString(3);
       
        %>
        <form action="" post="addMemSrvlt">
        <div style="border: solid black 1px">
         <p><%=memtype%></p>
         <p><%=userfname%></p>
        <p><%=userlname%></p>
        <p><%=userid%></p>
        <input type="hidden" name="memtype" value="<%= memtype %>">
        <input type="submit" value="Add" name="addbtn" /></div>
        </form>
            <% }
        %>

    </body>
</html>
