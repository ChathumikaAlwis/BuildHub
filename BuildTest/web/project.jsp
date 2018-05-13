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
        <div class="container-fluid" style="margin-top: 140px">
                
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
      <h3>HOME</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
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
      <h3>Menu 3</h3>
      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
    </div>
    <div id="task" class="tab-pane fade" style="background-color: #0077e2">
      <h3>Menu 3</h3>
      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
    </div>  
  </div>

        
        </div>   
        <jsp:include page="footer.html"/>
    </body>
</html>



