<%-- 
    Document   : project
    Created on : Apr 17, 2018, 5:26:41 PM
    Author     : RavianXReaver, Chanaka, Chathumika
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
<link href="https://fonts.googleapis.com/css?family=Contrail+One" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        
        <% 
            String projid = request.getParameter("pid");
            HttpSession ss = request.getSession(true);
            String oid = (String) session.getAttribute("userID");
            ss.setAttribute("pid", projid);
                
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
    
    
    <div id="post" class="tab-pane fade">
        
        <div class="container-fluid">
        
        <div class="col-sm-3">
            <a href="<%=request.getContextPath()%>/createPost.jsp?pid=<%= projid%>" class="btn btn-primary" role="button">Create New Post</a>
        </div>
        <br/><br/>
        
        <%      
// select taskID from tasks where 
// Select post from post where taskID = 
 
        Img i=null;
        String sqpost = "SELECT Photo,task_id,name,description,user_id,post_id,date_time FROM post where project_id="+projid+";";
        ResultSet rspost = con.executeSelect(sqpost);
        String userId1="";int it;
        
        int a=0;
        while(rspost.next()){
        a++;    
        Blob img = rspost.getBlob(1);
        int taskId = rspost.getInt(2);System.out.println(taskId+"ssssssss");
        String postName = rspost.getString(3);
        String postDesc = rspost.getString(4);       
        String userId = rspost.getString(5);
        String postId = rspost.getString(6);
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
        i.getImg(postId,img);
        }catch(Exception e){System.out.println(e.getMessage()+"img");}
        %>
        
        <%if(a%4==1)
         {%>
             <div class="row col-sm-12" style="margin-bottom: 10px">
         <%}
        %>
        
        
        <div class="col-sm-3" style="margin-bottom: 10px;">
            <div class="thumbnail text-center">
           <h2 style="font-family: 'Contrail One', cursive; color: #1B85D8"><%= postName %></h2>            
           <h4 style="font-family: 'Contrail One', cursive;">OP :<%= postuname %></h4>
           <img style="" src="images/post/<%= postId %>.jpg">
           <br/>
           <h5 style="font-family: 'Contrail One', cursive; color:#000">Posted Time :<%= postdt %></h5>
            <a href="<%=request.getContextPath()%>/seePost.jsp?postid=<%= postId%>" class="btn btn-primary text-center" role="button">See full post</a>
            </div>
        </div>
        
            <%if(a%4==0)
         {%>
             </div>
         <%}
        %>
        
        <%}%>
        
         <%if(a%4 != 0)
         {%>
             </div>
         <%}
        %>
        
        </div>
    </div>
    
    
    <div id="thread" class="tab-pane fade" style="background-color: #0077e2">
       <div id="projectlist" class="tab-pane fade in active">
       <div class="col-sm-3">
            <a href="<%=request.getContextPath()%>/createThread.jsp?pid=<%= projid%>" class="btn btn-primary" role="button">Create New Thread</a>
        </div>
        <%                  
        try
        {                                                              
            String sql3 = "SELECT * from thread WHERE Project_ID ="+projid;                      
            ResultSet r1 = con.executeSelect(sql3);
            r1.next();
                                             
            ResultSet r2 = con.executeSelect(sql3);
            while(r2.next())
            {
                String tthreadID     = r2.getString(1);
                String tprojectID    = r2.getString(2);
                String tdateTime     = r2.getString(3);
                String tdescription  = r2.getString(4);
                String ttitle        = r2.getString(5);
                String tstatus       = r2.getString(6);
                
        %>

        <div class="row col-sm-12">
                <div class="col-sm-4 text-center">
                    <h4 style="font-family: 'Contrail One', cursive;" >Thread Name: </h4>  
                    <p style="font-family: 'Contrail One', cursive; color:#000"><%= ttitle %></p>                
                </div>
                <div class="col-sm-6 text-center">
                   <h4 style="font-family: 'Contrail One', cursive;" >Description: </h4>  
                   <p style="font-family: 'Contrail One', cursive; color:#000"><%= tdescription %></p>
                </div>
                <div class="col-sm-2 text-center">      
                    <a href="<%=request.getContextPath()%>/threadDisplay.jsp?tid=<%= tthreadID%>" style="margin-top:14px" class="btn btn-primary" role="button">View Thread</a>
                </div>
            </div> 
        <%  }
        }
            catch(Exception e)
            {
                response.sendRedirect("login.jsp");
            }                    
        %>
        </div>
    </div>
    
    
    <div id="member" class="tab-pane fade">
               <%    
        String cusid=null,contractid=null,archid=null,intdesid=null,qsurvid=null,carpid=null;
        String cusname="n/a",contname="n/a",archiname="n/a",intdesname="n/a",qsurvname="n/a",carpname="n/a";           
        String sqlmb = "SELECT * FROM project_workers WHERE project_id="+projid+";";
        try{
        ResultSet rsmb = con.executeSelect(sqlmb);
       
        rsmb.next();
        
        cusid = rsmb.getString(2);
        contractid = rsmb.getString(3);
        archid = rsmb.getString(4); System.out.println(archid+"arc");
        intdesid = rsmb.getString(5);
        qsurvid = rsmb.getString(6);
        carpid = rsmb.getString(7);
        }catch(Exception e){System.out.println(e.getMessage());}
        try{
        String sqlcusname = "SELECT fname,lname FROM customer WHERE id="+cusid+";";
        ResultSet rscusname = con.executeSelect(sqlcusname);
        rscusname.next(); cusname=rscusname.getString(2);
}catch(Exception e){System.out.println(e.getMessage()+"cusid");}   
        
        try{
        String sqlcontname = "SELECT fname,lname FROM business_user WHERE id="+contractid+";";
        ResultSet rscontname = con.executeSelect(sqlcontname);
        rscontname.next(); contname = rscontname.getString(2);
}catch(Exception e){System.out.println(e.getMessage()+"contr");}   
               
try{
        String sqlarchiname = "SELECT fname,lname FROM business_user WHERE id="+archid+";";
        ResultSet rsarchiname = con.executeSelect(sqlarchiname);
        rsarchiname.next(); if(rsarchiname.getString(2)!=null){ archiname = rsarchiname.getString(2);System.out.println(archiname+"as");}
}catch(Exception e){System.out.println(e.getMessage()+"archi");}   

try{
        String sqlintdes = "SELECT fname,lname FROM business_user WHERE id="+intdesid+";";
        ResultSet rsintdesname = con.executeSelect(sqlintdes);
        rsintdesname.next(); if(rsintdesname.getString(2)!=null){ intdesname = rsintdesname.getString(2);}
}catch(Exception e){System.out.println(e.getMessage()+"intdesigner");}   
               
try{
        String sqlqs = "SELECT fname,lname FROM business_user WHERE id="+qsurvid+";";
        ResultSet rsqsname = con.executeSelect(sqlqs);
        rsqsname.next(); if(rsqsname.getString(2)!=null){ qsurvname = rsqsname.getString(2);}
}catch(Exception e){System.out.println(e.getMessage()+"qsurveyer");}   

try{
        String sqlcarp = "SELECT fname,lname FROM business_user WHERE id="+carpid+";";
        ResultSet rscarpname = con.executeSelect(sqlcarp);
        rscarpname.next(); if(rscarpname.getString(2)!=null){ carpname = rscarpname.getString(2);}
}catch(Exception e){System.out.println(e.getMessage()+"carp");}

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
            <form action="searchMemberSrvlt" method="POST">
                <input type="hidden" name="memtype" value="contr">
                <input type="hidden" name="projid" value="<%=projid%>">
          <h6 style="font-family: 'Rubik Mono One', sans-serif;" class="text-center">Contractor</h6>   
          <%if(contname.equalsIgnoreCase("n/a")){%>
          <div class="row">
              <div class="col-sm-8">
               <input name="searchq" type="text" placeholder="Enter Email Address.." class="form-control" required>   
              </div>
              <div class="col-sm-4">        
          <input type="submit" value="Search" class="btn btn-primary" name="srchbtn" />
              </div>
          </div>
          <% } else{ %>
          <h3 style="font-family: 'Rubik Mono One', sans-serif;" class="text-center"><%= contname %></h3>
          <%}%>
        `   </form>
        </div>
    </div>
  </div>
  <div class="col-md-3">
    <div class="thumbnail">
        <img src="images/architect.jpg" alt="architect" style="width:100%">
        <div class="caption">
            <form action="searchMemberSrvlt" method="POST">
                <input type="hidden" name="memtype" value="archi">
                <input type="hidden" name="projid" value="<%=projid%>">
                <h6 style="font-family: 'Rubik Mono One', sans-serif;" class="text-center">Architecture</h6> 
          <%if(archiname.equalsIgnoreCase("n/a")){%>
          <div class="row">
              <div class="col-sm-8">
               <input name="searchq" type="text" placeholder="Enter Email Address.." class="form-control" required>   
              </div>
              <div class="col-sm-4">        
          <input type="submit" value="Search" class="btn btn-primary" name="srchbtn" />
              </div>
          </div>
          <% } else{ %>
          <h3 style="font-family: 'Rubik Mono One', sans-serif;" class="text-center"><%= archiname %></h3>
          <%}%>
                
        </form>
        </div>
    </div>
  </div>
  <div class="col-md-3">
    <div class="thumbnail">
        <img src="images/intdesigner.png" alt="interiordesigner" style="width:100%">
        <div class="caption">
            <form action="searchMemberSrvlt" method="POST">
                                <input type="hidden" name="memtype" value="intdes">
                <input type="hidden" name="projid" value="<%=projid%>">
          <h6 style="font-family: 'Rubik Mono One', sans-serif;" class="text-center">Interior Designer</h6>   
          <%if(intdesname.equalsIgnoreCase("n/a")){%>
          <div class="row">
              <div class="col-sm-8">
               <input name="searchq" type="text" placeholder="Enter Email Address.." class="form-control" required>   
              </div>
              <div class="col-sm-4">        
          <input type="submit" value="Search" class="btn btn-primary" name="srchbtn" />
              </div>
          </div>
          <% } else{ %>
          <h3 style="font-family: 'Rubik Mono One', sans-serif;" class="text-center"><%= intdesname %></h3>
          <%}%>
          

        </form>
        </div>
    </div>
  </div>      
</div>
        
        
        <div class="row">
  <div class="col-md-3">
    <div class="thumbnail">
        <img src="images/qsurvey.png" alt="quantitysurveyer" style="width:100%">
        <div class="caption">
            <form action="searchMemberSrvlt" method="POST">
                                <input type="hidden" name="memtype" value="qsurv">
                <input type="hidden" name="projid" value="<%=projid%>">
           <h6 style="font-family: 'Rubik Mono One', sans-serif;" class="text-center">Quantity Surveyer</h6>  
          <%if(qsurvname.equalsIgnoreCase("n/a")){%>
          <div class="row">
              <div class="col-sm-8">
               <input name="searchq" type="text" placeholder="Enter Email Address.." class="form-control" required>   
              </div>
              <div class="col-sm-4">        
          <input type="submit" value="Search" class="btn btn-primary" name="srchbtn" />
              </div>
          </div>
          <% } else{ %>
          <h3 style="font-family: 'Rubik Mono One', sans-serif;" class="text-center"><%= qsurvname %></h3>
          <%}%>

           
        </form>
        </div>
    </div>
  </div>
  <div class="col-md-3">
    <div class="thumbnail">
        <img src="images/carpenter.png" alt="carpenter" style="width:100%">
        <div class="caption">
            <form action="searchMemberSrvlt" method="POST">
                                <input type="hidden" name="memtype" value="carp">
                <input type="hidden" name="projid" value="<%=projid%>">
            <h6 style="font-family: 'Rubik Mono One', sans-serif;" class="text-center">Carpenter</h6> 
          <%if(carpname.equalsIgnoreCase("n/a")){%>
          <div class="row">
              <div class="col-sm-8">
               <input name="searchq" type="text" placeholder="Enter Email Address.." class="form-control" required>   
              </div>
              <div class="col-sm-4">        
          <input type="submit" value="Search" class="btn btn-primary" name="srchbtn" />
              </div>
          </div>
          <% } else{ %>
          <h3 style="font-family: 'Rubik Mono One', sans-serif;" class="text-center"><%= carpname %></h3>
          <%}%>

            
            
        </form>
        </div>
    </div>
  </div>
</div>


    
    
    </div>
    
    
    <div id="task" class="tab-pane fade">
        <a href="<%=request.getContextPath()%>/createtask.jsp?pid=<%= projid %>" class="btn btn-primary">Add New Task</a>
        <table class="table table-hover">
    <thead>
      <tr>
        <th>Task Name</th>
        <th>Task Status</th>
        <th>Estimated Start Date</th>
        <th>Estimated End Date</th>
        <th>Task Description</th>
        <th>Task Moderator</th>
        <th>Edit</th>
      </tr>
    </thead>
    <tbody>
               <%    
        
        String sqltk = "SELECT name,status,start_date,end_date,est_start,est_end,description,moderator_id FROM task WHERE project_id="+projid+";";
       try{
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
        <td><%= tesd %></td>
        <td><%= teed %></td>
        <td><%= tdesc %></td>
        <td><%= modlnm %></td>
        <td><a href="#">Edit</a></td>
      </tr>
    
    <% 

}   }catch(Exception e){System.out.println(e.getMessage()+"modert");}%>
    
    </tbody>
  </table>
    
    </div>  
  </div>

        
        </div>   
        <jsp:include page="footer.html"/>
    </body>
</html>



