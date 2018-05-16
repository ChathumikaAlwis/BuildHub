/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypckg;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author RavianXReaver
 */
@WebServlet(name = "CreateThread", urlPatterns = {"/CreateThread"})
public class CreateThread extends HttpServlet {

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
            out.println("<title>Servlet CreateThread</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateThread at " + request.getContextPath() + "</h1>");
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
       
         HttpSession s = request.getSession(true);
         DbConnection con = new DbConnection();
         String uID = (String)s.getAttribute("userID");
         String userGroup = (String)s.getAttribute("usergroup");
         String pID = (String)s.getAttribute("pid");
         String title = request.getParameter("title");
         String description = request.getParameter("description");
         DateTimeFormatter dateTime = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");  
         LocalDateTime now = LocalDateTime.now();  
         String sql = "INSERT INTO thread(Project_ID, Date_Time, Description, Title, Status) VALUES("+pID+",'"+dateTime.format(now)+"','"+description+"','"+title+"','0')";                                       
         RequestDispatcher rd;
         try {
            con.execInsert(sql);
            if(userGroup.equals("Customer"))
            rd = request.getRequestDispatcher("/project.jsp?pid="+ pID); 
            else
            rd = request.getRequestDispatcher("/project_BU.jsp?pid="+ pID);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CreateThread.class.getName()).log(Level.SEVERE, null, ex);
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
