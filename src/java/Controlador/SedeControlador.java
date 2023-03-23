/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.SedeDAO;
import ModeloVO.SedeVO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ACER
 */
@WebServlet(name = "SedeControlador", urlPatterns = {"/Sede"})
public class SedeControlador extends HttpServlet {

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
        String sedeId = request.getParameter("sedeId");
        String sedeNombre = request.getParameter("sedeNombre");
        String sedeDireccion = request.getParameter("sedeDireccion");
        String sedeTelefono = request.getParameter("sedeTelefono");
        String sedeEstado = request.getParameter("sedeEstado");
        int opcion = Integer.parseInt(request.getParameter("opcion"));

        SedeVO sedeVO = new SedeVO(sedeId, sedeNombre, sedeDireccion, sedeTelefono, sedeEstado);
        SedeDAO sedeDAO = new SedeDAO(sedeVO);

        switch (opcion) {
            case 1: // Agregar Registro
                if (sedeDAO.agregarRegistro()) {
                    request.setAttribute("MensajeExito", "¡La sede se registró correctamente!");
                } else {
                    request.setAttribute("MensajeError", "¡La sede NO se registró correctamente!");
                }
                request.getRequestDispatcher("registrarSede.jsp").forward(request, response);
                break;
            case 2: // Actualizar Registro
                if (sedeDAO.actualizarRegistro()) {
                    request.setAttribute("MensajeExito", "¡La sede se actualizó correctamente!");
                } else {
                    request.setAttribute("MensajeError", "¡La sede NO se actualizó correctamente!");
                }
                request.getRequestDispatcher("actualizarSede.jsp").forward(request, response);
                break;
            case 3: // Listar por id
                sedeVO = sedeDAO.consultarPorId("sedeId");
                if (sedeVO != null) {
                    request.setAttribute("sedeEncontrada", sedeVO);
                    request.getRequestDispatcher("actualizarSede.jsp").forward(request, response);
                } else {
                    request.setAttribute("mensajeError", "¡La sede no existe!");
                    request.getRequestDispatcher("consultarSede.jsp").forward(request, response);
                }
                break;
            case 4: // Eliminar Registro
                if (sedeDAO.eliminarRegistro()) {
                    request.setAttribute("MensajeExito", "¡La sede se eliminó correctamente!");
                } else {
                    request.setAttribute("MensajeError", "¡La sede NO se eliminó correctamente!");
                }
                request.getRequestDispatcher("eliminarSede.jsp").forward(request, response);
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
