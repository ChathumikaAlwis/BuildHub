<%-- 
    Document   : register
    Created on : Apr 18, 2018, 12:35:16 PM
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
                 $(document).ready( function() {
    
    	$(document).on('change', '.btn-file :file', function() {
		var input = $(this),
			label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
		input.trigger('fileselect', [label]);
		});

		$('.btn-file :file').on('fileselect', function(event, label) {
		    
		    var input = $(this).parents('.input-group').find(':text'),
		        log = label;
		    
		    if( input.length ) {
		        input.val(log);
		    } else {
		        if( log ) alert(log);
		    }
	    
		});
		
		function readURL(input) {
		    if (input.files && input.files[0]) {
		        var reader = new FileReader();
		        
		        reader.onload = function (e) {
		            $('#img-upload').attr('src', e.target.result);
		        }
		        
		        reader.readAsDataURL(input.files[0]);
		    }
		}

		$("#imgInp").change(function(){
		    readURL(this);
		});
		
		$("#clear").click(function(){
		    $('#img-upload').attr('src','');
		    $('#urlname').val('');
		});
	});
                 </script>
    </head>
    <body>
         <jsp:include page="header.html"/>
         
         
         <div class="container" id="contain" style="margin-top:120px;margin-bottom: 60px; color: #1B85D8">
	<div class="col-lg-12 well">
	<div class="row">
            
            <form name="registerNM" action="userServlet" method="POST">
            
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>First Name</label>
								<input name="fname" type="text" placeholder="Enter First Name Here.." class="form-control">
							</div>
							<div class="col-sm-6 form-group">
								<label>Last Name</label>
								<input name="lname" type="text"  placeholder="Enter Last Name Here.." class="form-control">
							</div>
						</div>					
						<div class="form-group">
							<label>Address</label>
							<textarea name="address" placeholder="Enter Address Here.." rows="3" class="form-control"></textarea>
						</div>	
						
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Contact Number</label>
								<input name="contact" type="text" placeholder="Enter Contact Number Here.." class="form-control">
							</div>		
							<div class="col-sm-6 form-group">
								<label>NIC</label>
								<input name="nic" type="text" placeholder="Enter National ID Number Here.." class="form-control">
							</div>	
						</div>						
		
					<div class="form-group">
                                            <% String st = (String)request.getAttribute("status"); %>
						<label>Email Address</label>
						<input name="email" type="text" placeholder="Enter Email Address Here.." class="form-control">
                                                <%if(st!=null){%>
                                                <p style="color:red;font-size:12; "><%=st%></p><%}%>
                                        </div>
                                          
					<div class="form-group">
						<label>Password</label>
						<input name="password" type="password" placeholder="Enter Password Here.." class="form-control">
					</div>
                                        <div class="form-group">
						<label>Re-Enter Password</label>
                                                <input name="confirmpassword" type="password" placeholder="Re-Enter Password Here.." class="form-control">
					</div>  
                             
                                            <div class="form-group">
                                                 <label>Upload Image</label>
                                                       <div class="input-group">
                                                         <span class="input-group-btn">
                                                           <span class="btn btn-default btn-file">
                                                               Browse… <input name="image" type="file" accept="image/png, image/jpeg, image/gif" id="imgInp">
                                                           </span>
                                                         </span>
                                                        <input id='urlname'type="text" class="form-control" readonly>
                                                        </div>
                                                    <img id='img-upload'/>
                                              </div>
   
                                             <input type="hidden" name="type" value="nmu">
					<button type="submit" class="btn btn-lg btn-primary">Submit</button>					
					</div>
				</form> 
				</div>
	</div>
             
             
             
	</div>
         
         
         
         
          <jsp:include page="footer.html"/>
    </body>
</html>
