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
        <% 
        DbConnection con = new DbConnection();
        String memtype= (String) request.getAttribute("memtype");
        String projid= (String) request.getAttribute("projid");System.out.println(projid);
        ResultSet srchres = (ResultSet)request.getAttribute("serachres") ;
        while(srchres.next())
        {
            String res = srchres.getString(1);
            String sqlusname = "SELECT fname,lname,id,Contact_No,Address,Last_Login,Role,Description FROM business_user WHERE id="+res+";";
            ResultSet rsusname = con.executeSelect(sqlusname);
            rsusname.next(); 
            String userfname = rsusname.getString(1);
            String userlname = rsusname.getString(2);
            String userid = rsusname.getString(3);
            String usercontact = rsusname.getString(4);
            String useraddress = rsusname.getString(5);
            String userlastlogin = rsusname.getString(6);
            String userrole = rsusname.getString(7);
            String userdescription = rsusname.getString(8);      
        %>
        
        
         <div class="container" id="contain" style="margin-top:100px;margin-bottom: 40px; color: #1B85D8">
	<div class="col-lg-12 well"> 
            <form action="addmem" method="POST">
              <h4 style="font-family: 'Contrail One', cursive;" class="text-right">Last Login: <%=userlastlogin%></h4>  
              <div >   
                  <img src="images/profile.png" alt="profile" class="thumbnail" style="  margin: 0 auto; ">
              </div>
              <h2 style="font-family: 'Contrail One', cursive;" class="text-center"><%=userfname%> <%=userlname%></h2>  
               <div class="row">
                   <div class="col-sm-6">
                       <h4 style="font-family: 'Contrail One', cursive;" class="text-center">Contact: <%=usercontact%></h4>
                   </div> 
                   <div class="col-sm-6">
                       <h4 style="font-family: 'Contrail One', cursive;" class="text-center">Occupation: <%=userrole%></h4>
                   </div> 
               </div>
               <div class="row">
                   <div class="col-sm-6">
                       <h4 style="font-family: 'Contrail One', cursive;" class="text-center">Address: <%=useraddress%></h4>
                   </div> 
                   <div class="col-sm-6">
                       <h4 style="font-family: 'Contrail One', cursive;" class="text-center">Description: <%=userdescription%></h4>
                   </div> 
               </div> 
                   
                   <input type="hidden" name="memtype" value="<%= memtype %>">
        <input type="hidden" name="userId" value="<%= userid %>">
        <input type="hidden" name="projid" value="<%= projid %>"><%System.out.println(projid);%>
        <input type="submit" value="Add" class="btn btn-primary" name="addbtn" />
                
            </form>
            
        </div>
         </div><hr>
            <% }
        %>
        <jsp:include page="footer.html"/> 
    </body>
</html>
