package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class project_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Project</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js\"></script>\n");
      out.write("  <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.html", out, false);
      out.write("\n");
      out.write("        \n");
      out.write("<div class=\"container-fluid text-center\">    \n");
      out.write("\n");
      out.write("<div class=\"col-sm-12\" style=\"margin-top:120px\">\n");
      out.write("    \n");
      out.write("<ul class=\"nav nav-pills nav-justified\">\n");
      out.write("    <li class=\"active\"><a data-toggle=\"pill\" href=\"#projectOverview\">OVERVIEW</a></li>\n");
      out.write("    <li><a data-toggle=\"pill\" href=\"#projectPosts\">POSTS</a></li>\n");
      out.write("    <li><a data-toggle=\"pill\" href=\"#projectThreads\">THREADS</a></li>\n");
      out.write("    <li><a data-toggle=\"pill\" href=\"#projectMembers\">MEMBERS</a></li>\n");
      out.write("    <li><a data-toggle=\"pill\" href=\"#projectTasks\">TASKS</a></li>\n");
      out.write("</ul>\n");
      out.write("    \n");
      out.write("</div>\n");
      out.write(" \n");
      out.write("<div class=\"tab-content col-sm-12\">\n");
      out.write("    <div id=\"projectOverview\" class=\"tab-pane fade in active\">\n");
      out.write("        <iframe  src=\"projectOverview.jsp\" name=\"iframe\" style=\"width:100%;height:1000px; border: 0px\">   \n");
      out.write("    </iframe>\n");
      out.write("    </div>\n");
      out.write("    <div id=\"projectPosts\" class=\"tab-pane fade\">\n");
      out.write("      <iframe  src=\"projectPosts.jsp\" name=\"iframe\" style=\"width:100%;height:1000px; border: 0px\">   \n");
      out.write("    </iframe>\n");
      out.write("    </div>\n");
      out.write("    <div id=\"projectThreads\" class=\"tab-pane fade\">\n");
      out.write("      <iframe  src=\"projectThreads.jsp\" name=\"iframe\" style=\"width:100%;height:1000px; border: 0px\">   \n");
      out.write("    </iframe>\n");
      out.write("    </div>\n");
      out.write("    <div id=\"projectMembers\" class=\"tab-pane fade\">\n");
      out.write("     <iframe  src=\"projectMembers.jsp\" name=\"iframe\" style=\"width:100%;height:1000px; border: 0px\">   \n");
      out.write("    </iframe>\n");
      out.write("    </div>\n");
      out.write("    <div id=\"projectTasks\" class=\"tab-pane fade\">\n");
      out.write("      <iframe  src=\"projectTasks.jsp\" name=\"iframe\" style=\"width:100%;height:1000px; border: 0px\">   \n");
      out.write("    </iframe>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("    \n");
      out.write("    </div>\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.html", out, false);
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
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
