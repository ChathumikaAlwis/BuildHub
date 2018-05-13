/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypckg;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDateTime;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Chath
 */@MultipartConfig(maxFileSize = 16177215)
@WebServlet(name = "postsrv", urlPatterns = {"/postsrv"})
public class postsrv extends HttpServlet {

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
            out.println("<title>Servlet postsrv</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet postsrv at " + request.getContextPath() + "</h1>");
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
                        Part fpart = request.getPart("pic");
        InputStream ips = null;
        if(fpart!=null){
            System.out.println(fpart.getName());
            System.out.println(fpart.getSize());
            System.out.println(fpart.getContentType());
        ips = fpart.getInputStream();}

        Integer taskId = Integer.parseInt(request.getParameter("taskId"));
        String postname = request.getParameter("postname");
        String userid = request.getParameter("userId");
        String desc = request.getParameter("description");
        String postdt =LocalDateTime.now().toString(); 
        
        
        DbConnection con = new DbConnection();
        try {
            Connection conn = con.connect();
            System.out.println(userid);
            PreparedStatement pstmnt = conn.prepareStatement("INSERT INTO post(Photo,task_id,name,description,user_id,date_time) VALUES(?,?,?,?,?,?)");
            pstmnt.setBlob(1, ips);
            pstmnt.setInt(2,taskId );
            pstmnt.setString(3, postname);
            pstmnt.setString(4, desc);
            pstmnt.setString(5, userid);
            pstmnt.setString(6, postdt);
            
            int rcode = pstmnt.executeUpdate();
            if(rcode==0){
                System.out.println("fail");
                request.setAttribute("msg", "Error!!!!!!!!!!");
            //getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
            
            RequestDispatcher rd = request.getRequestDispatcher("imgdisplay.jsp");
                rd.forward(request, response);
            }
            else{
                System.out.println("success");
            request.setAttribute("msg", "Success!!!!!!!!!!");
            //getServletContext().getRequestDispatcher("/homepage.jsp").forward(request, response);
            request.setAttribute("username", userid);
            RequestDispatcher rd = request.getRequestDispatcher("imgdisplay.jsp");
             rd.forward(request, response);
            }           
        }
        catch(  IOException | ClassNotFoundException | SQLException | ServletException e){System.out.println(e.getMessage());} 
        catch(Exception e){System.out.println(e.getMessage());}
        
        

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
