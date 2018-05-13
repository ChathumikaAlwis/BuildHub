<%-- 
    Document   : project
    Created on : Apr 17, 2018, 5:26:41 PM
    Author     : Shenal Menuka
--%>
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
        
        
        <div class="container-fluid" style="margin-top: 140px">
        <h3><%=pname%></h3>        
            <ul class="nav nav-pills nav-justified col-sm-12">
    <li class="active"><a data-toggle="pill" href="#overview">OVERVIEW</a></li>
    <li><a data-toggle="pill" href="#post">POSTS</a></li>
    <li><a data-toggle="pill" href="#thread">THREADS</a></li>
    <li><a data-toggle="pill" href="#member">MEMBERS</a></li>
    <li><a data-toggle="pill" href="#task">TASKS</a></li>
  </ul>
  
            <br/>
            
  <div class="tab-content">
    
    <div id="overview" class="tab-pane fade in active" style="background-color: #0077e2">
              
       Project Name : <h6><%=pname%></h6>
       Project Status : <h6><%=status%></h6>
       Project Start Date: <h6><%=sd%></h6>
       Project End Date: <h6><%=ed%></h6>
       Project Estimated Start Date: <h6><%=esd%></h6>
       Project Estimated End Date:<h6><%=eed%></h6>
       Location :<h6><%=loc%></h6>
       Description : <h6><%=desc%></h6>
    </div>
    
    
    <div id="post" class="tab-pane fade" style="background-color: #ef1a1a">

        
        
        
        
        <h3>Menu 1</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>
    
    
    <div id="thread" class="tab-pane fade" style="background-color: #0077e2">
      <h3>Menu 2</h3>
      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
    </div>
    
    
    <div id="member" class="tab-pane fade" style="background-color: #ef1a1a">
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
        String sqlintdes = "SELECT fname,lname FROM business_user WHERE id="+intdesid+";";System.out.println(intdesid);
        ResultSet rsintdesname = con.executeSelect(sqlintdes);
        rsintdesname.next(); if(rsintdesname.getString(2)!=null){ intdesname = rsintdesname.getString(2);}
}catch(Exception e){System.out.println(e.getMessage());}   
               
try{
        String sqlqs = "SELECT fname,lname FROM business_user WHERE id="+qsurvid+";";System.out.println(intdesid);
        ResultSet rsqsname = con.executeSelect(sqlqs);
        rsqsname.next(); if(rsqsname.getString(2)!=null){ qsurvname = rsqsname.getString(2);}
}catch(Exception e){System.out.println(e.getMessage());}   

try{
        String sqlcarp = "SELECT fname,lname FROM business_user WHERE id="+carpid+";";System.out.println(intdesid);
        ResultSet rscarpname = con.executeSelect(sqlcarp);
        rscarpname.next(); if(rscarpname.getString(2)!=null){ carpname = rscarpname.getString(2);}
}catch(Exception e){System.out.println(e.getMessage());}

               %>    
               
               
               
               
        
    <h5>Customer Name : <%= cusname %></h5>    
    <h5>Contractor Name : <%= contname %></h5>   
    <h5>Architecture Name : <%= archiname %></h5>   
    <h5>Interior Designer Name :<%= intdesname %></h5>
    <h5>Interior Designer Name :<%= qsurvname %></h5>
    <h5>Interior Designer Name :<%= carpname %></h5>

    
    
    </div>
    
    
    <div id="task" class="tab-pane fade" style="background-color: #0077e2">
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
        
        
       Task Name : <h5><%= tname %></h5>
       Task Status : <h5><%= tstatus %></h5>
      Task Start Date : <h5><%= tsd %></h5>
      Task End Date : <h5><%= ted %></h5>
      Task Estimated Start Date : <h5><%= tesd %></h5>
      Task Estimated Start Date :<h5><%= teed %></h5>
      Task Description :<h5><%= tdesc %></h5>
      Task Moderator :<h5><%= modlnm %></h5>
   
    
    <%}%>
    
    </div>  
  </div>

        
        </div>   
        <jsp:include page="footer.html"/>
    </body>
</html>



