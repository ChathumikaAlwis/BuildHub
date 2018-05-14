<%-- 
    Document   : seePost
    Created on : May 14, 2018, 12:03:55 PM
    Author     : Chath
--%>

<%@page import="mypckg.DbConnection"%>
<%@page import="java.sql.Blob"%>
<%@page import="mypckg.Img"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
           <div id="post" class="tab-pane fade" style="background-color: #d2d1d1">
<%      
// select taskID from tasks where 
// Select post from post where taskID = 
DbConnection con = new DbConnection();
 String postID = request.getParameter("postid");System.out.println(postID+"pstid");
            Img i=null;
        String sqpost = "SELECT Photo,task_id,name,description,user_id,project_id,date_time FROM post where post_id="+postID+";";
        
        try{
        ResultSet rspost = con.executeSelect(sqpost);
        
        rspost.next();
        Blob img = rspost.getBlob(1);
            int taskId = rspost.getInt(2);System.out.println(taskId+"ssssssss");
        String postName = rspost.getString(3);
        String postDesc = rspost.getString(4);       
        String userId = rspost.getString(5);
        String projtId = rspost.getString(6);
        String postdt = rspost.getString(7);
        
String postuname="n/a";
        try{
        String sqlpostuname = "SELECT fname,lname FROM business_user WHERE id="+userId+";";
        ResultSet rspostuname = con.executeSelect(sqlpostuname);
        rspostuname.next(); postuname=rspostuname.getString(2);
}catch(Exception e){System.out.println(e.getMessage()+"userid");}   
String posttaskname="n/a";
        try{
        String sqltaskname = "SELECT name FROM task WHERE task_id="+taskId+";";System.out.println(taskId+"aaaaaaa");
        ResultSet rstaskname = con.executeSelect(sqltaskname);
        rstaskname.next(); posttaskname=rstaskname.getString(1);
}catch(Exception e){System.out.println(e.getMessage()+"tskname");}  
        

        try{
        i =new Img();
        i.getImg(postID,img);
        }catch(Exception e){System.out.println(e.getMessage()+"img");}
        %>
          
        <div id="postvw" style="border:solid black 3px">
        <h3>Posted By :<%= postuname %></h3><h4>Post Name :<%= postName %></h4><h6>Post Date :<%= postdt %></h6>            
        <h5>Under Task :<%=posttaskname%></h5><h5>Description :<%=postDesc%></h5>
        <img style="" src="images/post/<%= postID %>.jpg" width="250px" height="250px">
        </div>
        <div id="psotcmnt" style="border:solid black 3px">
        <form action="cmntServlet" method="post" >
            <textarea style="width:19%;resize: none" name="cmntcontent" rows="4" cols="20">
            </textarea>
                <input type="submit" value="Post" name="post" class="btn-success"  />
        </form>
        </div>
         </div>
<%
        }catch(Exception e){System.out.println(e.getMessage());}%>
    </body>
</html>
