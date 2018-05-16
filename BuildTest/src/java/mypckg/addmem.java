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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Chath
 */
@WebServlet(name = "addmem", urlPatterns = {"/addmem"})
public class addmem extends HttpServlet {

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
            out.println("<title>Servlet addmem</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addmem at " + request.getContextPath() + "</h1>");
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
            String memtype = (String)request.getParameter("memtype");
            String userId = (String)request.getParameter("userId");
            String projid = request.getParameter("projid");System.out.println(projid);
            String userGroup = (String)s.getAttribute("usergroup");
            
            
            

    String sqlins="";        
            try{
                DbConnection con = new DbConnection();
                System.out.println("memtype-----------"+memtype); 
                if(memtype.equals("contr")){System.out.println("contrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");   
                    System.out.println(projid+"pid");System.out.println(userId+"user");
     sqlins = "UPDATE project_workers SET Contractor_Id="+userId+" WHERE Project_id="+projid+";";}
                else if(memtype.equals("archi")){
     sqlins = "UPDATE project_workers SET Architect_Id="+userId+" WHERE Project_id="+projid+";";}
                else if(memtype.equals("intdes")){
     sqlins = "UPDATE project_workers SET IntDesigner_Id="+userId+" WHERE Project_id="+projid+";";}
                else if(memtype.equals("qsurv")){
     sqlins = "UPDATE project_workers SET Quantity_surv_Id="+userId+" WHERE Project_id="+projid+";";}
                else if(memtype.equals("carp")){
     sqlins = "UPDATE project_workers SET Carpenter_Id="+userId+" WHERE Project_id="+projid+";";}
                
    String r = con.execInsert(sqlins);
        System.out.println(r+"rrrrrrrrrrrrr");
    if(Integer.parseInt(r)>0){
                request.setAttribute("status", 1);
                System.out.println();
            RequestDispatcher rd = request.getRequestDispatcher("/project.jsp?pid="+ projid);
             rd.forward(request, response);

    }
    else{
                request.setAttribute("status", -1);
            RequestDispatcher rd = request.getRequestDispatcher("/project_list.jsp");
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
