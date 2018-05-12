package mypckg;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.sun.corba.se.spi.protocol.RequestDispatcherDefault;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mypckg.EncryptPw;
import mypckg.User;


/**
 *
 * @author Chath
 */
@WebServlet(urlPatterns = {"/userServlet"})
public class userServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */


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
        
        String status ="-3";
        String regId,cpname,username; String password,utype;
        int tele; String fname; String lname; String addr; String NIC;  String email;String llogin; String role; String desc;
        String rdate;
         utype = request.getParameter("type");
         addr = request.getParameter("address");
         tele =  Integer.parseInt(request.getParameter("contact"));         
        email = request.getParameter("email");
        password = request.getParameter("password");
        rdate = LocalDate.now().toString();       
        llogin = LocalDateTime.now().toString();
 
        //Encrtpt password
        EncryptPw encrypt = new EncryptPw();
        encrypt.setPw(password);
        try {
            password=encrypt.enc();
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(userServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
         User u = new User();
        u.setPassword(password);
        u.setEmail(email);
        u.setAddr(addr);
        u.setTele(tele);        
        u.setRegDate(rdate);
        u.setLastLogin(llogin);
        
        
        
         //add normal user---------------------------------------------------------------------------------------------------------
        if(utype.equals("nmu")){
        
        fname = request.getParameter("fname");
        lname = request.getParameter("lname");
        NIC = request.getParameter("nic");

        
        u.setFirstname(fname);
        u.setLastname(lname);
        u.setNIC(NIC);
            
            try {
                status = u.addNMUser();//----------------------------------------------
            } catch (SQLException | ClassNotFoundException ex) {
                   System.out.println(ex.getMessage());
                Logger.getLogger(userServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        //add business user-----------------------------------------------------------------------------------------------------
        else if(utype.equals("bsu")){        
        fname = request.getParameter("fname");
        lname = request.getParameter("lname");
        NIC = request.getParameter("NIC");
        role = request.getParameter("role");
        desc = request.getParameter("desc");        
        
        
        
        //add encrypted pw and username to db    
        u.setFirstname(fname);
        u.setLastname(lname);
        u.setRegDate(rdate);
        u.setNIC(NIC);
        u.setDesc(desc);
        u.setRole(role);
            try {
                status = u.addBSUser();//----------------------------------------------
            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(userServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        
        //add supplier--------------------------------------------------------------------------------------------------
        else if(utype=="sup"){
        
        cpname = request.getParameter("cpname");
        regId = request.getParameter("regId");
        
        
        u.setCPName(cpname);
        u.setRegId(regId);
        try {
                status = u.addSupplier();//----------------------------------------------
            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(userServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        
        if (Integer.parseInt(status)>0) {
            //start session
            HttpSession s = request.getSession(true);
            request.setAttribute("status", "Inserted successfully!");
            s.setAttribute("username", email);
            System.out.println(status);
            RequestDispatcher rd = request.getRequestDispatcher("homepage.jsp");
            rd.forward(request, response);        } 
        
        else if(Integer.parseInt(status)==-153)
        {
            request.setAttribute("status", "An account with this email already exists!" );
            RequestDispatcher rd = request.getRequestDispatcher("registerNormalUser.jsp");
            rd.forward(request, response);
        }
        
        else{
            request.setAttribute("status", status);
            //show status
            RequestDispatcher rd = request.getRequestDispatcher("registerNormalUser.jsp");
            rd.forward(request, response);}//            PrintWriter out = response.getWriter();
//            out.println(status);
        
            
    }
    
}
