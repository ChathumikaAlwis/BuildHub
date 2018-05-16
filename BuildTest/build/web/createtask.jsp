<%-- 
    Document   : createtask
    Created on : May 16, 2018, 5:23:49 PM
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
        
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/locales/bootstrap-datepicker.es.min.js"></script>

 <style>     
@import url("https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker3.css");
  </style>

        <title>JSP Page</title>
    </head>
    <body>
    <% DbConnection conn = new DbConnection();
            String pid = (String) request.getParameter("pid");
            String oid = (String) session.getAttribute("userID");          
%>
                   
            <form name="addTask" action="AddTaskServlet" method="POST">
                <input type="hidden" name="pid" value="<%=pid%>">
					<div class="col-sm-12">
						
							<div class="col-sm-12 form-group">
								<label>Task Name</label>
								<input name="tname" type="text" placeholder="Enter Task Name Here.." class="form-control" required>
							</div>
							<div class="col-sm-12 form-group">
								<label>Estimated Start Date</label>
								<div class='input-group date' id='datetimepicker1'>
                                                                    <input type='text' class="form-control" name="EstStartDate" required />
                                                                    <span class="input-group-addon">
                                                                         <span class="glyphicon glyphicon-calendar"></span>
                                                                 </span>
                                                                      </div>
							</div>
                                            
                                                        <div class="col-sm-12 form-group">
								<label>Estimated End Date</label>
								<div class='input-group date' id='datetimepicker2'>
                                                                 <input type='text' class="form-control" name="EstEndDate" required/>
                                                                    <span class="input-group-addon">
                                                                         <span class="glyphicon glyphicon-calendar"></span>
                                                                 </span>
                                                                      </div>
							</div>
                                                        
                                            
                                                    <div class="col-sm-12 form-group">
                                                        	<label>Description</label>
                                                                <textarea name="description" placeholder="Enter Description Here.." rows="3" class="form-control" required></textarea>
                                                    </div>	
						
					          <div class="row">
                                                      
                        <% 
            String contrid = null;
            String archid = null;
            String intdes = null;
            String qsurv = null;
            String carp = null;
            String sqmod="select * from project_workers where project_id="+pid+";";
            try{
                ResultSet rstsk = conn.executeSelect(sqmod);
            %>
            
            
                <%
                                        
                    rstsk.next();
                    contrid = (String)rstsk.getString(3);
                    archid = (String)rstsk.getString(4);
                    intdes = (String)rstsk.getString(5);
                    qsurv = (String)rstsk.getString(6);
                    carp = (String)rstsk.getString(7);
                    //System.out.println(rs.getString(2));
                }catch(Exception e){System.out.println("from first");}

                try{
        String archiname="n/a";String intdesname="n/a";String qsurvname="n/a";String carpname="n/a";String contname ="n/a";
                                  
        try{                                
        String sqlcontname = "SELECT fname,lname FROM business_user WHERE id="+contrid+";";
        ResultSet rscontname = conn.executeSelect(sqlcontname);
        rscontname.next(); if(rscontname.getString(2)!=null){ contname = (String)rscontname.getString(2);System.out.println(contname+"as");}
        }catch(Exception e){}

        try{
        String sqlarchiname = "SELECT fname,lname FROM business_user WHERE id="+archid+";";
        ResultSet rsarchiname = conn.executeSelect(sqlarchiname);
        rsarchiname.next(); if(rsarchiname.getString(2)!=null){ archiname = (String)rsarchiname.getString(2);System.out.println(archiname+"as");}
        }catch(Exception e){}

        try{
        String sqlintdes = "SELECT fname,lname FROM business_user WHERE id="+intdes+";";
        ResultSet rsintdesname = conn.executeSelect(sqlintdes);
        rsintdesname.next(); if(rsintdesname.getString(2)!=null){ intdesname = (String)rsintdesname.getString(2);}
        }catch(Exception e){}    

        try{
        String sqlqs = "SELECT fname,lname FROM business_user WHERE id="+qsurv+";";
        ResultSet rsqsname = conn.executeSelect(sqlqs);
        rsqsname.next(); if(rsqsname.getString(2)!=null){ qsurvname = (String)rsqsname.getString(2);}
        }catch(Exception e){}

        try{
        String sqlcarp = "SELECT fname,lname FROM business_user WHERE id="+carp+";";
        ResultSet rscarpname = conn.executeSelect(sqlcarp);
        rscarpname.next(); if(rscarpname.getString(2)!=null){ carpname = (String)rscarpname.getString(2);}
        }catch(Exception e){}
               %>    
           Select Moderator : <select name="modId">
                <option value="<%=contname%>"><%=contname%></option>
                  <option value="<%=archid%>"><%=archiname%></option>
                  <option value="<%=intdes%>"><%=intdesname%></option>
                  <option value="<%=qsurv%>"><%=qsurvname%></option>
                  <option value="<%=carp%>"><%=carpname%></option>
            </select>                                          
                <%}catch(Exception e){System.out.println(e.getMessage()+" carp"); System.out.println("from second");}
%>                                  
                                  
                                  
          </div>

                                            
                                            
                                            
                                            <div class="col-sm-12">
                                                  <button type="submit" class="btn btn-lg btn-primary" name="submit" id="submit" >Submit</button>					
					
                                            </div>
                                      
                                             
                                           </div>
				</form> 
       
    </body>
</html>
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