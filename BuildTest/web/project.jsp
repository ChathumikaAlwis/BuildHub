<%-- 
    Document   : project
    Created on : Apr 17, 2018, 5:26:41 PM
    Author     : Shenal Menuka
--%>

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
        
<div class="container-fluid text-center">    

<div class="col-sm-12" style="margin-top:120px">
    
<ul class="nav nav-pills nav-justified">
    <li class="active"><a data-toggle="pill" href="#projectOverview">OVERVIEW</a></li>
    <li><a data-toggle="pill" href="#projectPosts">POSTS</a></li>
    <li><a data-toggle="pill" href="#projectThreads">THREADS</a></li>
    <li><a data-toggle="pill" href="#projectMembers">MEMBERS</a></li>
    <li><a data-toggle="pill" href="#projectTasks">TASKS</a></li>
</ul>
    
</div>
 
<div class="tab-content col-sm-12">
    <div id="projectOverview" class="tab-pane fade in active">
        <iframe  src="projectOverview.jsp" name="iframe" style="width:100%;height:1000px; border: 0px">   
    </iframe>
    </div>
    <div id="projectPosts" class="tab-pane fade">
      <iframe  src="projectPosts.jsp" name="iframe" style="width:100%;height:1000px; border: 0px">   
    </iframe>
    </div>
    <div id="projectThreads" class="tab-pane fade">
      <iframe  src="projectThreads.jsp" name="iframe" style="width:100%;height:1000px; border: 0px">   
    </iframe>
    </div>
    <div id="projectMembers" class="tab-pane fade">
     <iframe  src="projectMembers.jsp" name="iframe" style="width:100%;height:1000px; border: 0px">   
    </iframe>
    </div>
    <div id="projectTasks" class="tab-pane fade">
      <iframe  src="projectTasks.jsp" name="iframe" style="width:100%;height:1000px; border: 0px">   
    </iframe>
    </div>
  </div>
    
    </div>
        <jsp:include page="footer.html"/>
    </body>
</html>



