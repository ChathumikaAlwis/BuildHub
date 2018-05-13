<%-- 
    Document   : posttest
    Created on : May 14, 2018, 1:41:14 AM
    Author     : Chath
--%>

<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mypckg.Img"%>
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
          DbConnection con = new DbConnection(); 
            Img i=null;
        String sqpost = "SELECT Photo,task_id,name,description,user_id,post_id,date_time FROM post;";
        ResultSet rspost = con.executeSelect(sqpost);
        String userId1="";int it;
        
        while(rspost.next()){
        Blob img = rspost.getBlob(1);
            int taskId = rspost.getInt(2);
        String postName = rspost.getString(3);
        String postDesc = rspost.getString(4);       
        String userId = rspost.getString(5);
        String postId = rspost.getString(6);
        
        
        try{
        i =new Img();
        i.getImg(postId,img);
        }catch(Exception e){System.out.println(e.getMessage());}
        %>
                  
            <img style="" src="images/post/<%= postId %>.jpg" width="150px" height="150px">

        <%}%>
    </body>
</html>
