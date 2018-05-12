package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class registerNormalUser_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js\"></script>\n");
      out.write("  <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\n");
      out.write("        <title>Register</title>\n");
      out.write("        <style>\n");
      out.write("             #contain {\n");
      out.write("    max-width: 750px;}  \n");
      out.write("      \n");
      out.write("             .btn-file {\n");
      out.write("    position: relative;\n");
      out.write("    overflow: hidden;\n");
      out.write("}\n");
      out.write(".btn-file input[type=file] {\n");
      out.write("    position: absolute;\n");
      out.write("    top: 0;\n");
      out.write("    right: 0;\n");
      out.write("    min-width: 100%;\n");
      out.write("    min-height: 100%;\n");
      out.write("    font-size: 100px;\n");
      out.write("    text-align: right;\n");
      out.write("    filter: alpha(opacity=0);\n");
      out.write("    opacity: 0;\n");
      out.write("    outline: none;\n");
      out.write("    background: white;\n");
      out.write("    cursor: inherit;\n");
      out.write("    display: block;\n");
      out.write("}\n");
      out.write("\n");
      out.write("#img-upload{\n");
      out.write("    width: 100%;\n");
      out.write("}\n");
      out.write("             </style>\n");
      out.write("             \n");
      out.write("             <script>\n");
      out.write("                 $(document).ready( function() {\n");
      out.write("    \n");
      out.write("    \t$(document).on('change', '.btn-file :file', function() {\n");
      out.write("\t\tvar input = $(this),\n");
      out.write("\t\t\tlabel = input.val().replace(/\\\\/g, '/').replace(/.*\\//, '');\n");
      out.write("\t\tinput.trigger('fileselect', [label]);\n");
      out.write("\t\t});\n");
      out.write("\n");
      out.write("\t\t$('.btn-file :file').on('fileselect', function(event, label) {\n");
      out.write("\t\t    \n");
      out.write("\t\t    var input = $(this).parents('.input-group').find(':text'),\n");
      out.write("\t\t        log = label;\n");
      out.write("\t\t    \n");
      out.write("\t\t    if( input.length ) {\n");
      out.write("\t\t        input.val(log);\n");
      out.write("\t\t    } else {\n");
      out.write("\t\t        if( log ) alert(log);\n");
      out.write("\t\t    }\n");
      out.write("\t    \n");
      out.write("\t\t});\n");
      out.write("\t\t\n");
      out.write("\t\tfunction readURL(input) {\n");
      out.write("\t\t    if (input.files && input.files[0]) {\n");
      out.write("\t\t        var reader = new FileReader();\n");
      out.write("\t\t        \n");
      out.write("\t\t        reader.onload = function (e) {\n");
      out.write("\t\t            $('#img-upload').attr('src', e.target.result);\n");
      out.write("\t\t        }\n");
      out.write("\t\t        \n");
      out.write("\t\t        reader.readAsDataURL(input.files[0]);\n");
      out.write("\t\t    }\n");
      out.write("\t\t}\n");
      out.write("\n");
      out.write("\t\t$(\"#imgInp\").change(function(){\n");
      out.write("\t\t    readURL(this);\n");
      out.write("\t\t});\n");
      out.write("\t\t\n");
      out.write("\t\t$(\"#clear\").click(function(){\n");
      out.write("\t\t    $('#img-upload').attr('src','');\n");
      out.write("\t\t    $('#urlname').val('');\n");
      out.write("\t\t});\n");
      out.write("\t});\n");
      out.write("                 </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("         ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.html", out, false);
      out.write("\n");
      out.write("         \n");
      out.write("         \n");
      out.write("         <div class=\"container\" id=\"contain\" style=\"margin-top:120px;margin-bottom: 60px; color: #1B85D8\">\n");
      out.write("\t<div class=\"col-lg-12 well\">\n");
      out.write("\t<div class=\"row\">\n");
      out.write("            <form name=\"registerNM\" action=\"reguser\" method=\"POST\">\n");
      out.write("            \n");
      out.write("\t\t\t\t\t<div class=\"col-sm-12\">\n");
      out.write("\t\t\t\t\t\t<div class=\"row\">\n");
      out.write("\t\t\t\t\t\t\t<div class=\"col-sm-6 form-group\">\n");
      out.write("\t\t\t\t\t\t\t\t<label>First Name</label>\n");
      out.write("\t\t\t\t\t\t\t\t<input name=\"fname\" type=\"text\" placeholder=\"Enter First Name Here..\" class=\"form-control\">\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t<div class=\"col-sm-6 form-group\">\n");
      out.write("\t\t\t\t\t\t\t\t<label>Last Name</label>\n");
      out.write("\t\t\t\t\t\t\t\t<input name=\"lname\" type=\"text\"  placeholder=\"Enter Last Name Here..\" class=\"form-control\">\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t</div>\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t<div class=\"form-group\">\n");
      out.write("\t\t\t\t\t\t\t<label>Address</label>\n");
      out.write("\t\t\t\t\t\t\t<textarea name=\"address\" placeholder=\"Enter Address Here..\" rows=\"3\" class=\"form-control\"></textarea>\n");
      out.write("\t\t\t\t\t\t</div>\t\n");
      out.write("\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t<div class=\"row\">\n");
      out.write("\t\t\t\t\t\t\t<div class=\"col-sm-6 form-group\">\n");
      out.write("\t\t\t\t\t\t\t\t<label>Contact Number</label>\n");
      out.write("\t\t\t\t\t\t\t\t<input name=\"contact\" type=\"text\" placeholder=\"Enter Contact Number Here..\" class=\"form-control\">\n");
      out.write("\t\t\t\t\t\t\t</div>\t\t\n");
      out.write("\t\t\t\t\t\t\t<div class=\"col-sm-6 form-group\">\n");
      out.write("\t\t\t\t\t\t\t\t<label>NIC</label>\n");
      out.write("\t\t\t\t\t\t\t\t<input name=\"nic\" type=\"text\" placeholder=\"Enter National ID Number Here..\" class=\"form-control\">\n");
      out.write("\t\t\t\t\t\t\t</div>\t\n");
      out.write("\t\t\t\t\t\t</div>\t\t\t\t\t\t\n");
      out.write("\t\t\n");
      out.write("\t\t\t\t\t<div class=\"form-group\">\n");
      out.write("\t\t\t\t\t\t<label>Email Address</label>\n");
      out.write("\t\t\t\t\t\t<input name=\"email\" type=\"text\" placeholder=\"Enter Email Address Here..\" class=\"form-control\">\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("                                          \n");
      out.write("\t\t\t\t\t<div class=\"form-group\">\n");
      out.write("\t\t\t\t\t\t<label>Password</label>\n");
      out.write("\t\t\t\t\t\t<input name=\"password\" type=\"password\" placeholder=\"Enter Password Here..\" class=\"form-control\">\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("                                        <div class=\"form-group\">\n");
      out.write("\t\t\t\t\t\t<label>Re-Enter Password</label>\n");
      out.write("                                                <input name=\"confirmpassword\" type=\"password\" placeholder=\"Re-Enter Password Here..\" class=\"form-control\">\n");
      out.write("\t\t\t\t\t</div>  \n");
      out.write("                             \n");
      out.write("                                            <div class=\"form-group\">\n");
      out.write("                                                 <label>Upload Image</label>\n");
      out.write("                                                       <div class=\"input-group\">\n");
      out.write("                                                         <span class=\"input-group-btn\">\n");
      out.write("                                                           <span class=\"btn btn-default btn-file\">\n");
      out.write("                                                               Browse… <input name=\"image\" type=\"file\" accept=\"image/png, image/jpeg, image/gif\" id=\"imgInp\">\n");
      out.write("                                                           </span>\n");
      out.write("                                                         </span>\n");
      out.write("                                                        <input id='urlname'type=\"text\" class=\"form-control\" readonly>\n");
      out.write("                                                        </div>\n");
      out.write("                                                    <img id='img-upload'/>\n");
      out.write("                                              </div>\n");
      out.write("   \n");
      out.write("                                            \n");
      out.write("\t\t\t\t\t<button type=\"button\" class=\"btn btn-lg btn-primary\">Submit</button>\t\t\t\t\t\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t</form> \n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t</div>\n");
      out.write("             \n");
      out.write("             \n");
      out.write("             \n");
      out.write("\t</div>\n");
      out.write("         \n");
      out.write("         \n");
      out.write("         \n");
      out.write("         \n");
      out.write("          ");
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
