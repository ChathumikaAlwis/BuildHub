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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Chath
 */
@WebServlet(name = "AddTaskServlet", urlPatterns = {"/AddTaskServlet"})
public class AddTaskServlet extends HttpServlet {

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
            out.println("<title>Servlet AddTaskServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddTaskServlet at " + request.getContextPath() + "</h1>");
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
                           String tname = (String)request.getParameter("tname");
            String esd = (String)request.getParameter("EstStartDate");System.out.println(esd);
            String eed = (String)request.getParameter("EstEndDate");System.out.println(esd);
            String desc =(String)request.getParameter("description"); System.out.println(esd);
               String modid = (String)request.getParameter("modId");System.out.println(esd);
             String pid = (String)request.getParameter("pid");System.out.println(esd);
             
            try{
                DbConnection con = new DbConnection();    
    String sql = "INSERT INTO task(project_id,name,est_start,est_end,description,moderator_id) VALUES("+pid+",'"+tname+"','"+esd+"','"+eed+"','"+desc+"',"+modid+");";
    String r = con.execInsert(sql);
        System.out.println(r+"blaaaaa");
    if(Integer.parseInt(r)>0){
                request.setAttribute("status", 1);
                System.out.println();
            RequestDispatcher rd = request.getRequestDispatcher("/project.jsp?pid="+ pid);
             rd.forward(request, response);

    }
    else{
                request.setAttribute("status", -1);
            RequestDispatcher rd = request.getRequestDispatcher("/project.jsp?pid="+ pid);
             rd.forward(request, response);
    }
        
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(cmntServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch(Exception e){System.out.println(e.getMessage());}

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
