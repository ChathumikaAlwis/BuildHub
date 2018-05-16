<%-- 
    Document   : addProject
    Created on : May 13, 2018, 7:27:08 PM
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
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/locales/bootstrap-datepicker.es.min.js"></script>
        <title>Add Project</title>
        <style>
        @import url("https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker3.css");  
            <% 
                String uid  = (String) session.getAttribute("userID");

                if(uid == null)
                    {
                       response.sendRedirect("login.jsp"); 
                    }                  
            %>
            
    
      #contain {
    max-width: 750px;} 
        </style>
    </head>
    <body>
        
        <jsp:include page="header.jsp"/>
        
       
         <div class="container" id="contain" style="margin-top:120px;margin-bottom: 40px; color: #1B85D8">
	<div class="col-lg-12 well">
	<div class="row">
            
            <form name="addProject" action="AddProjectServlet" method="POST">
            
					<div class="col-sm-12">
						
							<div class="col-sm-12 form-group">
								<label>Project Name</label>
								<input name="pname" type="text" placeholder="Enter Project Name Here.." class="form-control" required>
							</div>
							<div class="col-sm-12 form-group">
								<label>Estimated Start Date</label>
								<div class='input-group date' id='datetimepicker1'>
                                                                    <input type='text' class="form-control" name="StartDate" required />
                                                                    <span class="input-group-addon">
                                                                         <span class="glyphicon glyphicon-calendar"></span>
                                                                 </span>
                                                                      </div>
							</div>
                                            
                                                        <div class="col-sm-12 form-group">
								<label>Estimated End Date</label>
								<div class='input-group date' id='datetimepicker2'>
                                                                 <input type='text' class="form-control" name="EndDate" required/>
                                                                    <span class="input-group-addon">
                                                                         <span class="glyphicon glyphicon-calendar"></span>
                                                                 </span>
                                                                      </div>
							</div>
                                                        
                                                        <div class="col-sm-12 form-group">
								<label>Location</label>
								<input name="location" type="text" placeholder="Enter Location Here.." class="form-control" required>
							</div>
                                            
                                                    <div class="col-sm-12 form-group">
                                                        	<label>Description</label>
                                                                <textarea name="description" placeholder="Enter Description Here.." rows="3" class="form-control" required></textarea>
                                                    </div>	
						
					
                                            <div class="col-sm-12">
                                                  <button type="submit" class="btn btn-lg btn-primary" name="submit" id="submit" >Submit</button>					
					
                                            </div>
                                      
                                             
                                           </div>
				</form> 
				</div>
	</div>  
	</div>

<jsp:include page="footer.html"/>
    </body>
</html>
 <%--script for datepicker--%>
    <script >
    $(function () {
        $('#datetimepicker1').datepicker({
            format: "yyyy-mm-dd",
            language: "en",
            autoclose: true,
            todayHighlight: true
        });
    });
</script>
<%--script for datepicker--%>
    <script >
    $(function () {
        $('#datetimepicker2').datepicker({
            format: "yyyy-mm-dd",
            language: "en",
            autoclose: true,
            todayHighlight: true
        });
    });
</script>