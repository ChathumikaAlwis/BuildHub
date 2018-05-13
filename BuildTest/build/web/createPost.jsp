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
        <title>JSP Page</title>
    </head>
    <body><form name="createPost" action="postsrv" method="POST" enctype="multipart/form-data">
            <% DbConnection conn = new DbConnection();
            String pid = (String) request.getParameter("pid");
            String oid = (String) session.getAttribute("userID");
            String sqltsk="select task_id,name from task where status='ongoing' and project_id="+pid+";";
            try{ResultSet rstsk = conn.executeSelect(sqltsk);
            %>
            
            <select name="taskI"><%
                while(rstsk.next()){
                    //System.out.println(rs.getString(2));
                %>
                  <option value="<%=rstsk.getString(1)%>"><%=rstsk.getString(2)%></option><%}%> 
            </select>
            <input type="hidden" name="taskId" value="1">
            <input type="hidden" name="userId" value="<%=oid%>">
            <%
            rstsk.close();
            } catch(Exception e){System.out.println(e.getMessage()+"eeeeee");}

            String sqlprj="select id,name from project where status='ongoing' and owner="+oid+";";
            try{ResultSet rsprj = conn.executeSelect(sqlprj); %>
            
            <select name="projId"><%
                while(rsprj.next()){
                    //System.out.println(rs.getString(2));
                %>
                  <option value="<%=rsprj.getString(1)%>"><%=rsprj.getString(2)%></option><%}%> 
            </select>
            <%
            rsprj.close();
            conn.close();
            } catch(Exception e){System.out.println(e.getMessage()+"eeeeee");}

            %>
            Post Name : <input name="postname" type="text"  value="" size="10" />
            Description : <input name="description" type="text"  value="" size="10" />
            
            <br/><br/>
            <input type="file" name="pic"/>
        <input type="submit" value="submit" />
        </form>
        
    </body>
</html>
