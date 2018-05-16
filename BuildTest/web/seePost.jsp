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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Contrail+One" rel="stylesheet">

        <title>JSP Page</title>
        
        <style>
            #contain {
    max-width: 700px; }
            </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        
       <% String status = "-100";
               status =request.getParameter("status");
        if(status!=null){%>
            <h1><%=status%></h1> 
 <%}%>
           
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
          
        <div class="container" id="contain" style="margin-top:100px;margin-bottom: 40px; color: #1B85D8">
	<div class="col-lg-12 well">  
        
        <div class="thumbnail">
            
             <h6 class="text-right" style="font-family: 'Contrail One', cursive;">Post Date :<%= postdt %></h6>   
             <h4 style="font-family: 'Contrail One', cursive;" class="text-right">Posted By :<%= postuname %></h4>
             <h4 style="font-family: 'Contrail One', cursive;" class="text-right">Under Task :<%=posttaskname%></h4>
        
             <h2 class="text-center" style="font-family: 'Contrail One', cursive;">Post Name :<%= postName %></h2>
 
             <h4 style="font-family: 'Contrail One', cursive;" class="text-center">Description :<%=postDesc%></h4>    
             <img  src="images/post/<%= postID %>.jpg" class="text-center" width="60%">
             <br/>
        </div>
          
             <div id="psotcmnt">
                  <!--String status=(String)request.getAttribute("status");
          if(Integer.parseInt(status)==-1){ status="unsuccessful!"; }  
        if(status!=null){ %>
        <p><= status%></p> <}% -->
                  <form action="cmntServlet" method="post" >
                  <div class="form-group">
                      <textarea class="form-control" rows="2" name="cmntcontent" id="comment" required></textarea>
                    </div>    
                   <input type="hidden" name="postId" value="<%=postID%>"> 
                   <%System.out.println(postID+"asdsdadasd");  %>
                   <input type="hidden" name="userId" value="<%=oid%>"><%System.out.println("oiddddddddddd   "+oid);%>
                   <input type="submit" value="Post" name="post" class="btn btn-primary"  />
                  </form>    
             </div>
                   <br/>
                   
                   
        <div id="viewcmnt">
           
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
                <div style="background-color: #FDFDFD;border-left: 6px solid #1B85D8; padding: 20px; margin-bottom: 15px; box-shadow: 5px 5px 5px #E1E1E1;">
                    
                    <div>
                            <h6 style="font-family: 'Contrail One', cursive;" class="text-left">User <%=cmntername%> says:</h6>
                            <h6 style="font-family: 'Contrail One', cursive;" class="text-left">Posted on: <%=cmntdt%></h6>
                        </div>
                        <div>
                        <h4 style="font-family: 'Contrail One', cursive;" class="text-center"><%=commcontent%></h4>
                    </div>
                </div>
                    
                <%}%>
                
         </div>     
             
        </div>
        </div>        

        <%} catch(Exception e){System.out.println(e.getMessage());}%>
        
        <jsp:include page="footer.html"/>
    </body>
</html>
