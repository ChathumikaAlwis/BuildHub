/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypckg;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

/**
 *
 * @author RavianXReaver
 */
@WebServlet(name = "AddProjectServlet", urlPatterns = {"/AddProjectServlet"})
public class AddProjectServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddProjectServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProjectServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        DbConnection con = new DbConnection(); 
        
 
        HttpSession s = request.getSession(true);
        
        String uid = s.getAttribute("userID").toString();
        AddProject ap = new AddProject(request.getParameter("pname"),(String)request.getParameter("StartDate"),(String)request.getParameter("EndDate"), (String)request.getParameter("location"), (String)request.getParameter("description"));
        System.out.println("UID: "+ uid);       
        String sql = "INSERT INTO project(Name,Owner,Est_Start,Est_End,Location_Address,Description) VALUES('"+ap.getName()+"',"+uid+",'"+ap.getStartDate()+"','"+ap.getEndDate()+"','"+ap.getLocationAddress()+"','"+ap.getDescription()+"')";
        int pid = -1;
        try 
        {
            Connection conn = con.connect();
            PreparedStatement ps = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            ps.executeUpdate();
            ResultSet rs2 = ps.getGeneratedKeys();
            rs2.next();
            pid = rs2.getInt(1);
            System.out.println("Project Created!");
            String sqliw = "INSERT INTO project_workers(project_id,cus_id) VALUES("+pid+","+uid+");";
            System.out.println("Project ID : "+ pid);
            con.execInsert(sqliw);          
            response.sendRedirect("project_list.jsp");   
        } 
        catch (SQLException | ClassNotFoundException ex) 
        {
            System.out.println("FAILED!");
            Logger.getLogger(AddProjectServlet.class.getName()).log(Level.SEVERE, null, ex);
        }  
        
        

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
