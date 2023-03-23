/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.DocumentosDAO;
import ModeloVO.DocumentosVO;
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
@WebServlet(name = "DocumentosControlador", urlPatterns = {"/Documentos"})
public class DocumentosControlador extends HttpServlet {

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
        String docId = request.getParameter("docId");
        String docNombre = request.getParameter("docNombre");
        String docUrl = request.getParameter("docUrl");
        String docPer = request.getParameter("docPer");
        int opcion = Integer.parseInt(request.getParameter("opcion"));

        DocumentosVO docVO = new DocumentosVO(docId, docNombre, docUrl, docPer);
        DocumentosDAO docDAO = new DocumentosDAO(docVO);

        switch (opcion) {
            case 1: // Agregar Registro
                if (docDAO.agregarRegistro()) {
                    request.setAttribute("MensajeExito", "¡El documento se registró correctamente!");
                } else {
                    request.setAttribute("MensajeError", "¡El documento NO se registró correctamente!");
                }
                request.getRequestDispatcher("registrarDocumentos.jsp").forward(request, response);
                break;
            case 2: // Actualizar Registro
                if (docDAO.actualizarRegistro()) {
                    request.setAttribute("MensajeExito", "¡El documento se actualizó correctamente!");
                } else {
                    request.setAttribute("MensajeError", "¡El documento NO se actualizó correctamente!");
                }
                request.getRequestDispatcher("actualizarDocumentos.jsp").forward(request, response);
                break;
            case 3: // Listar por id
                docVO = docDAO.consultarPorId("docId");
                if (docVO != null) {
                    request.setAttribute("documentoEncontrado", docVO);
                    request.getRequestDispatcher("actualizarDocumentos.jsp").forward(request, response);
                } else {
                    request.setAttribute("mensajeError", "¡El documento no existe!");
                    request.getRequestDispatcher("consultarDocumentos.jsp").forward(request, response);
                }
                break;
            case 4: // Eliminar Registro
                if (docDAO.eliminarRegistro()) {
                    request.setAttribute("MensajeExito", "¡El documento se eliminó correctamente!");
                } else {
                    request.setAttribute("MensajeError", "¡El documento NO se eliminó correctamente!");
                }
                request.getRequestDispatcher("eliminarDocumentos.jsp").forward(request, response);
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
