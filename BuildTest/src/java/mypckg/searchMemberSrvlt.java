/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypckg;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
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
@WebServlet(name = "searchMemberSrvlt", urlPatterns = {"/searchMemberSrvlt"})
public class searchMemberSrvlt extends HttpServlet {

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
            out.println("<title>Servlet searchMemberSrvlt</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<a href=project_list.jsp>Go Back </a>");
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
        String srchq = request.getParameter("searchq");
        String memtype = request.getParameter("memtype");
        String projid = request.getParameter("projid");System.out.println(projid+"smmmmmmmmmmmmm");
        String sqlmembfind="";
        if(memtype.equals("contr")){
           sqlmembfind  = "SELECT id from business_user where email LIKE '%"+srchq+"%' AND role='Contractor'";}
        else if(memtype.equals("archi")){
        sqlmembfind  = "SELECT id from business_user where email LIKE '%"+srchq+"%' AND role='Architect'";}
        else if(memtype.equals("intdes")){
        sqlmembfind  = "SELECT id from business_user where email LIKE '%"+srchq+"%' AND role='Interior Designer'";}
        else if(memtype.equals("qsurv")){
        sqlmembfind  = "SELECT id from business_user where email LIKE '%"+srchq+"%' AND role='Quantity Surveyor'";}
        else if(memtype.equals("carp")){
        sqlmembfind  = "SELECT id from business_user where email LIKE '%"+srchq+"%' AND role='Carpenter'";}
            
            try {
                
                ResultSet rscontrsrch = con.executeSelect(sqlmembfind);
            request.setAttribute("memtype", memtype );
                request.setAttribute("serachres", rscontrsrch );
                request.setAttribute("projid", projid );
            RequestDispatcher rd = request.getRequestDispatcher("searchmres.jsp");
             rd.forward(request, response);
            }
            catch (SQLException ex) {
                Logger.getLogger(searchMemberSrvlt.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(searchMemberSrvlt.class.getName()).log(Level.SEVERE, null, ex);
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
