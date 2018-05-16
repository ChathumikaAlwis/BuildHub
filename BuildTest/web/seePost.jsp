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
        <jsp:include page="header.html"/>
        
       <% String status = "-100";
               status =request.getParameter("status");
        if(status!=null){%>
            <p><%=status%></p> 
 <%}%>
           <div id="post" class="tab-pane fade" style="background-color: #d2d1d1">
<%      
// select taskID from tasks where 
// Select post from post where taskID = 
DbConnection con = new DbConnection();
            String oid = (String) session.getAttribute("userID");

            
String postID = request.getParameter("postid");System.out.println(postID+"pstid");
            Img i=null;
        String sqpost = "SELECT Photo,task_id,name,description,user_id,project_id,date_time FROM post where post_id="+postID+";";
        System.out.println("seeeeeeeeeeeeeeeeeee");
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
        String sqlpostuname = "SELECT fname,lname FROM customer WHERE id="+userId+";";
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
        <img  src="images/post/<%= postID %>.jpg" width="250px" height="250px">
        </div>
        
        
        <div id="psotcmnt" style="border:solid black 3px">
        <!--String status=(String)request.getAttribute("status");
          if(Integer.parseInt(status)==-1){ status="unsuccessful!"; }  
        if(status!=null){ %>
        <p><= status%></p> <}% -->
            <form action="cmntServlet" method="post" >
            <textarea style="width:19%;resize: none" name="cmntcontent" rows="4" cols="20">
            </textarea>
            <input type="hidden" name="postId" value="<%=postID%>">
            <%System.out.println(postID+"asdsdadasd");  %>
            <input type="hidden" name="userId" value="<%=oid%>"><%System.out.println("oiddddddddddd   "+oid);%>
                <input type="submit" value="Post" name="post" class="btn-success"  />
        </form>
        </div>
        
        <div id="viewcmnt" style="border:solid black 3px">
                <%
        String sqlcmntview = "SELECT content,user_id,date_time FROM comments WHERE post_id="+postID+";";
        ResultSet rscmntview = con.executeSelect(sqlcmntview);
       
        while(rscmntview.next())
        {
        String commcontent = rscmntview.getString(1);
        String cmntuser_id = rscmntview.getString(2);
        String cmntdt = rscmntview.getString(3);


        String sqlcmnter = "SELECT fname,lname FROM customer WHERE id="+cmntuser_id+";";
        ResultSet rstcmnter = con.executeSelect(sqlcmnter);
        rstcmnter.next(); String cmntername = rstcmnter.getString(2);

                %>
                <div style="border: solid black 1px">
        <p><%=cmntername%></p>
        <p style="font-size:5"><%=cmntdt%></p>               
        <p><%=commcontent%></p></div>
                <%}%>
                
         </div>
<%
        }catch(Exception e){System.out.println(e.getMessage());}%>
    </body>
</html>
