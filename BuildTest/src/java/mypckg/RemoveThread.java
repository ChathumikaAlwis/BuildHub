/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypckg;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
@WebServlet(name = "RemoveThread", urlPatterns = {"/RemoveThread"})
public class RemoveThread extends HttpServlet {

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
            out.println("<title>Servlet RemoveThread</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RemoveThread at " + request.getContextPath() + "</h1>");
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
        
        String tid = request.getParameter("tid");
        DbConnection con = new DbConnection();
        System.out.println(tid + " THREAD ID");
        String sql = "UPDATE thread SET Status= 0 WHERE Thread_ID ="+tid;
        RequestDispatcher rd;
        HttpSession s = request.getSession(true);
        String userGroup = (String)s.getAttribute("usergroup");
        String pID = (String)s.getAttribute("pid");
        try 
        {
            con.execUpdate(sql);
            if(userGroup.equals("Customer"))
            {
                rd = request.getRequestDispatcher("/project.jsp?pid="+ pID); 
                rd.forward(request, response);
            }  
            else
            {
                rd = request.getRequestDispatcher("/project_BU.jsp?pid="+ pID);
                rd.forward(request, response);
            }
        } 
        catch (SQLException | ClassNotFoundException ex) 
        {
            Logger.getLogger(RemoveThread.class.getName()).log(Level.SEVERE, null, ex);
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
