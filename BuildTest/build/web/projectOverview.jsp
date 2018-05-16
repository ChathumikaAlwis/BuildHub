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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Rubik+Mono+One" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Boogaloo" rel="stylesheet">
        <title>ProjectOverview</title>
    </head>
    <body style="background-color: #0077e2">

        <%  
        String projid = (String)request.getParameter("pid");    
        DbConnection con = new DbConnection(); 
        System.out.println("Project ID : "+projid);
        String sql = "SELECT name,status,start_date,end_date,est_start,est_end,Location_address,description FROM project WHERE ID="+ projid +";";
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
        
        <div id="overview" class="tab-pane fade in active">
              
       <!--Project Name : <h6><%=pname%></h6>
       Project Status : <h6><%=status%></h6>
       Project Start Date: <h6><%=sd%></h6>
       Project End Date: <h6><%=ed%></h6>
       Project Estimated Start Date: <h6><%=esd%></h6>
       Project Estimated End Date:<h6><%=eed%></h6>
       Location :<h6><%=loc%></h6>
       Description : <h6><%=desc%></h6> -->
        
        <div class="row">
            <div class="col-sm-6">
                <h3 style="font-family: 'Rubik Mono One', sans-serif;" >Project Name: <%=pname%></h3>
            </div>
            <div class="col-sm-6">
                <%if(status.equals("ongoing"))
                {%>
                <div class="row">
                    <div class="col-sm-12 text-right">
                      <h3 style="font-family: 'Rubik Mono One', sans-serif; color:red;" >Status: <%=status%></h3>  
                    </div>
                </div>    
                <%}
                else
                {%>
                <div class="row">
                    <div class="col-sm-12 text-right">
                      <h3 style="font-family: 'Rubik Mono One', sans-serif; color:green;" >Status: <%=status%></h3>  
                    </div>
                </div>  
                <%}%>
                
            </div>
       </div>  
                
                
       <div class="row">
           <div class="col-sm-3">
               <h3 style="font-family: 'Boogaloo', cursive;" >Start Date: <%=sd%></h3>
           </div>
           <div class="col-sm-3">
               <h3 style="font-family: 'Boogaloo', cursive;" >End Date: <%=ed%></h3>
           </div>
           <div class="col-sm-3">
               <h3 style="font-family: 'Boogaloo', cursive;" >Estimated Start Date: <%=esd%></h3>
           </div>
           <div class="col-sm-3">
               <h3 style="font-family: 'Boogaloo', cursive;" >Estimated End Date: <%=eed%></h3>
           </div>
       </div>
       
      
           <div class="col-sm-12">
               <h2 style="font-family: 'Boogaloo', cursive;" >Description : <%=desc%></h2>
           </div>
           <div class="col-sm-12">
               <h2 style="font-family: 'Boogaloo', cursive;" >Location: <%=loc%></h2>
           </div>
                     
    </div>
     
    </body>
</html>
