/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Alumnos
 */
@WebServlet(urlPatterns = {"/registro"})
public class registro extends HttpServlet {

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
            out.println("<title>Servlet login</title>");
            out.println("<link rel=\"stylesheet\" href=\"main.css\" />");
            out.println("</head>");
            out.println("<body>");
            out.println("<div class=\"caja\">");
            out.println("<form action=\"proy.jsp\" method=\"post\">");
            out.println("Nombre: <input type=\"text\" name=\"nombre\"><br>");
            out.println("Apellido: <input type=\"text\" name=\"apellido\"><br>");
            out.println("Corre: <input type=\"text\" name=\"correo\"><br>");
            out.println("Contraseña: <input type=\"password\" name=\"pass\"><br>");
            out.println("repetir contraseña: <input type=\"password\" name=\"pass\"><br>");
            out.println("Tipo de usuario:<br>");
            out.println("<input type=\"radio\" name=\"tipU\" value=\"alumno\" checked=\"true\">Alumno<br>");
            out.println("<input type=\"radio\" name=\"tipU\" value=\"universidad\">Universidad<br>");
            out.println("<input type=\"radio\" name=\"tipU\" value=\"empresa\">Empresa<br>");
            out.println("<input type=\"submit\" value=\"continuar...\" name=\"registrar\"><br>");
            out.println("</form>");
            out.println("</div>");
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
        processRequest(request, response);
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
