<%-- 
    Document   : createPost
    Created on : May 13, 2018, 10:47:30 PM
    Author     : Chath
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
        <link href="https://fonts.googleapis.com/css?family=Contrail+One" rel="stylesheet">
        <title>JSP Page</title>
        <style>
            #contain {
    max-width: 700px; }
            
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
        
        <jsp:include page="header.jsp"/>  
        
        <form name="createPost" action="postsrv" method="POST" enctype="multipart/form-data">
            <% DbConnection conn = new DbConnection();
            String pid = (String) request.getParameter("pid");
            String oid = (String) session.getAttribute("userID");
            String sqltsk="select task_id,name from task where status='ongoing' and project_id="+pid+";";
            try{ResultSet rstsk = conn.executeSelect(sqltsk);
            %>
            
             <div class="container" id="contain" style="margin-top:100px;margin-bottom: 40px; color: #1B85D8">
	<div class="col-lg-12 well"> 
           <h2 style="font-family: 'Contrail One', cursive;" class="text-center">Create Post</h2>
           <br/>
            <div class="row">
                <div class="col-sm-4">
            <label>Task:</label>
            <select class="form-control" name="taskId">
                <%
                while(rstsk.next()){
                    //System.out.println(rs.getString(2));
                %>
             <option value="<%=rstsk.getString(1)%>"><%=rstsk.getString(2)%></option>
             <%}%>
            </select>
                </div>    
                
            <input type="hidden" name="userId" value="<%=oid%>">
            <%
            rstsk.close();
            } catch(Exception e){System.out.println(e.getMessage()+"eeeeee");} %>

            <input type="hidden" name="projid" value="<%=pid%>">
            
                <div class="col-sm-4">                    
                    <div class="form-group">
                         <label>Post Name:</label>
                         <input type="text" name="postname" class="form-control" required>
                    </div>
                </div>    
                
                <div class="col-sm-4">
                    <div class="form-group">
                         <label>Description:</label>
                         <input type="text" name="description" class="form-control" required>
                    </div>
                </div>    
            </div>  
            
            <div class="form-group">
                 <label>Upload Image</label>
                     <div class="input-group">
                        <span class="input-group-btn">
                        <span class="btn btn-default btn-file">
                            Browse… <input type="file" name="pic" accept="image/png, image/jpeg, image/gif" id="imgInp">
                        </span>
                        </span>
                        <input id='urlname'type="text" class="form-control" readonly>
                    </div>
                <img id='img-upload'/>
            </div>
            
            <div> 
                  <input type="submit" class="btn btn-primary"  value="submit" />
            </div>   
            
        </div>
             </div>
        
       <!--     String sqlprj="select id,name from project where status='ongoing' and owner="+oid+";";
//            try{ResultSet rsprj = conn.executeSelect(sqlprj); 
//            
//            <select name="projId"><!--
//                while(rsprj.next()){
//                    //System.out.println(rs.getString(2));
//                %>
//                  <option value="<!--=rsprj.getString(1)%>"><!--rsprj.getString(2)%></option><}%> 
//            </select>
//            <
//            rsprj.close();
//            conn.close();
//            } catch(Exception e){System.out.println(e.getMessage()+"eeeeee");}

            -->
 
        </form>
        <jsp:include page="footer.html"/> 
    </body>
</html>
