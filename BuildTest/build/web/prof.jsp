<%-- 
    Document   : prof
    Created on : May 12, 2018, 11:47:04 PM
    Author     : Chath
--%>

<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.InputStream"%>
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
        <%
            String fpath =null;
        String sql = "SELECT Profile_Pic FROM customer WHERE email='c6';";
        DbConnection con = new DbConnection();    
        

        try{
    ResultSet rs = con.executeSelect(sql);
    fpath = "C:\\Users\\Chath\\Documents\\NetBeansProjects\\BuildTest\\web\\images\\c6.jpg";
    rs.next();
    Blob b= rs.getBlob(1);
    System.out.println(fpath);
    InputStream ips = b.getBinaryStream();
    System.out.println("FileSaved!");
    OutputStream ops = new FileOutputStream(fpath);
    System.out.println("FileSaved22222222222222!");
    int bytesread = -1;
    byte[] buffer = new byte[4096];
    while((bytesread=ips.read(buffer))!=-1){
    ops.write(buffer, 0, bytesread);
    }
    
    ips.close(); ops.close();
    System.out.println("FileSaved2!");
    con.close();
    }
    
    catch(Exception e){System.out.println(e.getMessage())
         ;}
    
    

        %>
        
        <img src="C:\\Users\\Chath\\Documents\\NetBeansProjects\\BuildTest\\web\\images\\c6.jpg" height="100px" width="100px">
        <h1>Hello World!</h1>
    </body>
</html>
