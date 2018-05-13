<%-- 
    Document   : registerSupplier
    Created on : Apr 20, 2018, 4:14:36 PM
    Author     : Shenal Menuka
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Register</title>
        <style>
             #contain {
    max-width: 750px;}  
      
             .btn-file {
    position: relative;
    overflow: hidden;
}
.btn-file input[type=file] {
    position: absolute;
    top: 0;
    right: 0;
    min-width: 100%;
    min-height: 100%;
    font-size: 100px;
    text-align: right;
    filter: alpha(opacity=0);
    opacity: 0;
    outline: none;
    background: white;
    cursor: inherit;
    display: block;
}

#img-upload{
    width: 100%;
}
             </style>
  <script>
var check = function() {
  if (document.getElementById('password').value ==
    document.getElementById('confirm_password').value) {
    document.getElementById('message').style.color = 'green';
    document.getElementById('message').innerHTML = 'matching';
  } else {
    document.getElementById('message').style.color = 'red';
    document.getElementById('message').innerHTML = 'not matching';
  }
}
</script>               
            
    </head>
    <body>
         <jsp:include page="header.html"/>
         
         
         <div class="container" id="contain" style="margin-top:120px;margin-bottom: 60px; color: #1B85D8">
	<div class="col-lg-12 well">
	<div class="row">
				<form name="registerNM" action="userServlet" method="POST">
					<div class="col-sm-12">
						
							<div class="form-group">
								<label>Company Name</label>
								<input name="cpname" type="text" placeholder="Enter Company Name Here.." class="form-control" required  pattern="[^0123456789]+" title="Invalid input">
							</div>
											
						<div class="form-group">
							<label>Address</label>
                                                        <textarea name="address" placeholder="Enter Address Here.." rows="3" class="form-control" required></textarea>
						</div>	
						
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Contact Number</label>
                                                                <input name="contact" type="text" placeholder="Enter Contact Number Here.." class="form-control" required pattern="[0123456789]{10}" title="Enter Numbers Only!">
							</div>		
							<div class="col-sm-6 form-group">
								<label>Business Registration ID</label>
								<input name="regId" type="text" placeholder="Enter Business Registration ID Here.." class="form-control" required>
							</div>	
						</div>						
		
					<div class="form-group">
                                             <% String st = (String)request.getAttribute("status"); %>
						<label>Email Address</label>
                                                <input name="email" type="text" placeholder="Enter Email Address Here.." class="form-control" required>
                                                <%if(st!=null){%>
                                                <p style="color:red;font-size:12; "><%=st%></p><%}%>
					</div>
                                          
					<div class="form-group">
						<label>Password</label>
                                                <span id='message'></span>
						<input id="password" onkeyup='check();' name="password" type="password" placeholder="Enter Password Here.." class="form-control" required>
					</div>
                                        <div class="form-group">
						<label>Re-Enter Password</label>
                                                <input id="confirm_password" onkeyup='check();' name="confirm_password" type="password" placeholder="Re-Enter Password Here.." class="form-control" required>
                                        </div> 
                                           
   
                                            <input type="hidden" name="type" value="sup">
					<button type="submit" class="btn btn-lg btn-primary">Submit</button>					
					</div>
				</form> 
				</div>
	</div>
             
             
             
	</div>
         
         
         
         
          <jsp:include page="footer.html"/>
    </body>
</html>
