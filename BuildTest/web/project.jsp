<%-- 
    Document   : project
    Created on : Apr 17, 2018, 5:26:41 PM
    Author     : Shenal Menuka
--%>
<%@page import="java.sql.Blob"%>
<%@page import="mypckg.Img"%>
<%@page import="mypckg.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Project</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Rubik+Mono+One" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Boogaloo" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="header.html"/>
        
        <% 
            String projid = request.getParameter("pid");
                String oid = (String) session.getAttribute("userID");

                
//--------------------------------------------------------                
        DbConnection con = new DbConnection(); 
            System.out.println(oid);
        String sqlov = "SELECT name,status,id,start_date,end_date,est_start,est_end,location_address,description FROM project WHERE owner="+ oid +" and id="+projid+";";
        ResultSet rsov = con.executeSelect(sqlov);
       rsov.next();
       
        String pname = rsov.getString(1);
        String status = rsov.getString(2);
        String sd = rsov.getString(4);
        String ed = rsov.getString(5);
        String esd = rsov.getString(6);
        String eed = rsov.getString(7);
        String loc = rsov.getString(8);
        String desc = rsov.getString(9);
        %>        
        
        
        <div class="container-fluid" style="margin-top: 90px">
        <h1 style="font-family: 'Rubik Mono One', sans-serif;" class="text-center">Project Name: <%=pname%></h1>
        <br/>
            <ul class="nav nav-pills nav-justified col-sm-12">
    <li class="active"><a data-toggle="pill" href="#overview">OVERVIEW</a></li>
    <li><a data-toggle="pill" href="#post">POSTS</a></li>
    <li><a data-toggle="pill" href="#thread">THREADS</a></li>
    <li><a data-toggle="pill" href="#member">MEMBERS</a></li>
    <li><a data-toggle="pill" href="#task">TASKS</a></li>
  </ul>
  
            <br/><br/><br/>
            
  <div class="tab-content">
    
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
    
    
    <div id="post" class="tab-pane fade" style="background-color: #ef1a1a">
<%
 
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
        String postdt = rspost.getString(7);
        
        try{
        i =new Img();
        i.getImg(postId,img);
        }catch(Exception e){System.out.println(e.getMessage());}
        %>
        <div style="border:solid black 3px">
        <h3><%= userId %></h3><h4><%= postName %></h4><h6><%= postdt %></h6>            
        <img style="" src="images/post/<%= postId %>.jpg" width="150px" height="150px">
        <h5><%=taskId%></h5><h5><%=postDesc%></h5>
        </div>
        <%}%>
        
        
        
        
        <h3>Menu 1</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>
    
    
    <div id="thread" class="tab-pane fade" style="background-color: #0077e2">
      <h3>Menu 2</h3>
      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
    </div>
    
    
    <div id="member" class="tab-pane fade">
               <%    
        String cusid=null,contractid=null,archid=null,intdesid=null,qsurvid=null,carpid=null;
        String cusname="n/a",contname="n/a",archiname="n/a",intdesname="n/a",qsurvname="n/a",carpname="n/a";           
        String sqlmb = "SELECT * FROM project_workers WHERE project_id="+projid+";";
        
        ResultSet rsmb = con.executeSelect(sqlmb);
       
        rsmb.next();
        
        cusid = rsmb.getString(2);
        contractid = rsmb.getString(3);
        archid = rsmb.getString(4); System.out.println(archid+"arc");
        intdesid = rsmb.getString(5);
        qsurvid = rsmb.getString(6);
        carpid = rsmb.getString(7);
            
        try{
        String sqlcusname = "SELECT fname,lname FROM customer WHERE id="+cusid+";";
        ResultSet rscusname = con.executeSelect(sqlcusname);
        rscusname.next(); cusname=rscusname.getString(2);
}catch(Exception e){System.out.println(e.getMessage());}   
        
        try{
        String sqlcontname = "SELECT fname,lname FROM business_user WHERE id="+contractid+";";
        ResultSet rscontname = con.executeSelect(sqlcontname);
        rscontname.next(); contname = rscontname.getString(2);
}catch(Exception e){System.out.println(e.getMessage());}   
               
try{
        String sqlarchiname = "SELECT fname,lname FROM business_user WHERE id="+archid+";";
        ResultSet rsarchiname = con.executeSelect(sqlarchiname);
        rsarchiname.next(); if(rsarchiname.getString(2)!=null){ archiname = rsarchiname.getString(2);System.out.println(archiname+"as");}
}catch(Exception e){System.out.println(e.getMessage());}   

try{
        String sqlintdes = "SELECT fname,lname FROM business_user WHERE id="+intdesid+";";
        ResultSet rsintdesname = con.executeSelect(sqlintdes);
        rsintdesname.next(); if(rsintdesname.getString(2)!=null){ intdesname = rsintdesname.getString(2);}
}catch(Exception e){System.out.println(e.getMessage());}   
               
try{
        String sqlqs = "SELECT fname,lname FROM business_user WHERE id="+qsurvid+";";
        ResultSet rsqsname = con.executeSelect(sqlqs);
        rsqsname.next(); if(rsqsname.getString(2)!=null){ qsurvname = rsqsname.getString(2);}
}catch(Exception e){System.out.println(e.getMessage());}   

try{
        String sqlcarp = "SELECT fname,lname FROM business_user WHERE id="+carpid+";";
        ResultSet rscarpname = con.executeSelect(sqlcarp);
        rscarpname.next(); if(rscarpname.getString(2)!=null){ carpname = rscarpname.getString(2);}
}catch(Exception e){System.out.println(e.getMessage());}

               %>    
                 
     <div class="row">
  <div class="col-md-3">
    <div class="thumbnail">
        <img src="images/customer.png" alt="customer" style="width:100%">
        <div class="caption">
            <h6 style="font-family: 'Rubik Mono One', sans-serif;" class="text-center">Customer</h6>  
          <h3 style="font-family: 'Rubik Mono One', sans-serif;" class="text-center"><%= cusname %></h3>
        </div>
    </div>
  </div>
  <div class="col-md-3">
    <div class="thumbnail">
        <img src="images/contractor.png" alt="contractor" style="width:100%">
        <div class="caption">
          <h6 style="font-family: 'Rubik Mono One', sans-serif;" class="text-center">Contractor</h6>   
          <h3 style="font-family: 'Rubik Mono One', sans-serif;" class="text-center"><%= contname %></h3>
        </div>
    </div>
  </div>
  <div class="col-md-3">
    <div class="thumbnail">
        <img src="images/architect.jpg" alt="architect" style="width:100%">
        <div class="caption">
            <h6 style="font-family: 'Rubik Mono One', sans-serif;" class="text-center">Architecture</h6> 
          <h3 style="font-family: 'Rubik Mono One', sans-serif;" class="text-center"><%= archiname %></h3>
        </div>
    </div>
  </div>
  <div class="col-md-3">
    <div class="thumbnail">
        <img src="images/intdesigner.png" alt="interiordesigner" style="width:100%">
        <div class="caption">
          <h6 style="font-family: 'Rubik Mono One', sans-serif;" class="text-center">Interior Designer</h6>   
          <h3 style="font-family: 'Rubik Mono One', sans-serif;" class="text-center"><%= intdesname %></h3>
        </div>
    </div>
  </div>      
</div>
        
        
        <div class="row">
  <div class="col-md-3">
    <div class="thumbnail">
        <img src="images/qsurvey.png" alt="quantitysurveyer" style="width:100%">
        <div class="caption">
           <h6 style="font-family: 'Rubik Mono One', sans-serif;" class="text-center">Quantity Surveyer</h6>  
          <h3 style="font-family: 'Rubik Mono One', sans-serif;" class="text-center"><%= qsurvname %></h3>
        </div>
    </div>
  </div>
  <div class="col-md-3">
    <div class="thumbnail">
        <img src="images/carpenter.png" alt="carpenter" style="width:100%">
        <div class="caption">
            <h6 style="font-family: 'Rubik Mono One', sans-serif;" class="text-center">Carpenter</h6> 
          <h3 style="font-family: 'Rubik Mono One', sans-serif;" class="text-center"><%= carpname %></h3>
        </div>
    </div>
  </div>
</div>


    
    
    </div>
    
    
    <div id="task" class="tab-pane fade">
        
        <table class="table table-hover">
    <thead>
      <tr>
        <th>Task Name</th>
        <th>Task Status</th>
        <th>Task Start Date</th>
        <th>Task End Date</th>
        <th>Estimated Start Date</th>
        <th>Estimated End Date</th>
        <th>Task Description</th>
        <th>Task Moderator</th>
      </tr>
    </thead>
    <tbody>
               <%    
        
        String sqltk = "SELECT name,status,start_date,end_date,est_start,est_end,description,moderator_id FROM task WHERE project_id="+projid+";";
        ResultSet rstk = con.executeSelect(sqltk);
       
        while(rstk.next())
        {
        String tname = rstk.getString(1);
        String tstatus = rstk.getString(2);
        String tsd = rstk.getString(3);
        String ted = rstk.getString(4);
        String tesd = rstk.getString(5);
        String teed = rstk.getString(6);
        String tdesc = rstk.getString(7);
        String tmodid = rstk.getString(8);

            
        String sqltmod = "SELECT fname,lname FROM business_user WHERE id="+tmodid+";";
        ResultSet rstmod = con.executeSelect(sqltmod);
rstmod.next(); String modlnm = rstmod.getString(2);

%>
        
   <tr>
        <td><%= tname %></td>
        <td><%= tstatus %></td>
        <td><%= tsd %></td>
        <td><%= ted %></td>
        <td><%= tesd %></td>
        <td><%= teed %></td>
        <td><%= tdesc %></td>
        <td><%= modlnm %></td>
      </tr>
    
    <%}%>
    
    </tbody>
  </table>
    
    </div>  
  </div>

        
        </div>   
        <jsp:include page="footer.html"/>
    </body>
</html>



