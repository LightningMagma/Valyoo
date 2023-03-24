/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.PerRolDAO;
import ModeloVO.PerRolVO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author xJuanDa
 */
@WebServlet(name = "PerRolControlador", urlPatterns = {"/PersonaRol"})
public class PerRolControlador extends HttpServlet {

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
        String PRID = request.getParameter("PRID");
        String PRPersona = request.getParameter("prPersona");
        String PRRol = request.getParameter("prRol");
        int opcion = Integer.parseInt(request.getParameter("opcion"));
        
        PerRolVO prVO = new PerRolVO(PRID, PRPersona, PRRol);
        PerRolDAO prDAO = new PerRolDAO(prVO);
         switch (opcion) {
            case 1: // Agregar Registro
                if (prDAO.agregarRegistro()) {
                    request.setAttribute("MensajeExito", "¡Rol asignado!");
                } else {
                    request.setAttribute("MensajeError", "¡Rol no asignado!");
                }
                request.getRequestDispatcher("indexPersonaRol.jsp").forward(request, response);
                break;
            case 2: // Actualizar Registro
                if (prDAO.actualizarRegistro()) {
                    request.setAttribute("MensajeExito", "¡El rol se actualizó correctamente!");
                } else {
                    request.setAttribute("MensajeError", "¡El rol NO se actualizó correctamente!");
                }
                request.getRequestDispatcher("indexPersonaRol.jsp").forward(request, response);
                break;
            case 3: // Listar por documento
                prVO=prDAO.consultarPorID(PRID);
                if (prVO!=null) {
                    request.setAttribute("personaEncontrada",prVO);
                    request.getRequestDispatcher("actualizarPersonaRol.jsp").forward(request, response);
                } else {
                    request.setAttribute("mensajeError", "¡La persona no existe!");
                    request.getRequestDispatcher("indexPersonaRol.jsp").forward(request, response);
                }
                break;
            case 4: // Eliminar Registro
                if (prDAO.eliminarRegistro()) {
                    request.setAttribute("MensajeExito", "¡Registro se eliminó correctamente!");
                } else {
                    request.setAttribute("MensajeError", "¡Registro NO se eliminó correctamente!");
                }
                request.getRequestDispatcher("indexPersonaRol.jsp").forward(request, response);
                break;
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
