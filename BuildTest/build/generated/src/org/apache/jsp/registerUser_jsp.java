package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class registerUser_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("        <link href='https://fonts.googleapis.com/css?family=Faster One' rel='stylesheet'>\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js\"></script>\n");
      out.write("  <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\n");
      out.write("        <title>Register User</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.html", out, false);
      out.write("\n");
      out.write("        \n");
      out.write("        <div class=\"container text-center\" style=\"margin-top: 160px; margin-bottom: 120px\">\n");
      out.write("            \n");
      out.write("            <div class=\"col-sm-12\">\n");
      out.write("\n");
      out.write("                <div class=\"col-sm-4\">\n");
      out.write("                    <img src=\"images/user1.jpg\" alt=\"normaluser\" class=\"img-responsive\" style=\"margin: 0 auto;\">\n");
      out.write("                    <h1 STYLE=\"font-family:Faster One; font-size: 33px\">GENERAL USER</h1>\n");
      out.write("                    <a href=\"registerNormalUser.jsp\"><button type=\"button\" class=\"btn btn-primary btn-lg\">REGISTER</button></a>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-sm-4\">\n");
      out.write("                    <img src=\"images/user2.png\" alt=\"businessuser\" class=\"img-responsive\" style=\"margin: 0 auto;\">\n");
      out.write("                    <h1 STYLE=\"font-family:Faster One; font-size: 33px\">BUSINESS USER</h1>\n");
      out.write("        <a href=\"registerBusinessUser.jsp\"><button type=\"button\" class=\"btn btn-primary btn-lg\">REGISTER</button></a>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-sm-4\">\n");
      out.write("                    <img src=\"images/user3.jpg\" alt=\"supplier\" class=\"img-responsive\" style=\"margin: 0 auto;\">\n");
      out.write("                    <h1 STYLE=\"font-family:Faster One; font-size: 33px\">SUPPLIER</h1>\n");
      out.write("      <a href=\"registerSupplier.jsp\"><button type=\"button\" class=\"btn btn-primary btn-lg\">REGISTER</button></a>\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.html", out, false);
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
