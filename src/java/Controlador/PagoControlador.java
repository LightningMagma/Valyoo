/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.PagoDAO;
import ModeloVO.PagoVO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author APRENDIZ
 */
@WebServlet(name = "PagoControlador", urlPatterns = {"/Pago"})
public class PagoControlador extends HttpServlet {

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

        String PagId = request.getParameter("PagId");
        String PagDesc = request.getParameter("PagDesc");
        String PagValor = request.getParameter("PagValor");
        String PagFecha = request.getParameter("PagFecha");
        String PagPres = request.getParameter("PagPres");
        int opcion = Integer.parseInt(request.getParameter("opcion"));

        PagoVO pagVO = new PagoVO(PagId, PagDesc, PagValor, PagFecha, PagPres);

        PagoDAO pagDAO = new PagoDAO(pagVO);

        switch (opcion) {
            case 1: // Agregar Pago
                if (pagDAO.agregarRegistro()) {
                    request.setAttribute("MensajeExito", "¡El pago se registró correctamente!");
                } else {
                    request.setAttribute("MensajeError", "¡El pago NO se registró correctamente!");
                }
                request.getRequestDispatcher("registrarPago.jsp").forward(request, response);
                break;
            case 2: // Actualizar Pago
                if (pagDAO.actualizarRegistro()) {
                    request.setAttribute("MensajeExito", "¡El pago se actualizó correctamente!");
                } else {
                    request.setAttribute("MensajeError", "¡El pago NO se actualizó correctamente!");
                }
                request.getRequestDispatcher("actualizarPago.jsp").forward(request, response);
                break;
            case 3: // Eliminar Pago
                if (pagDAO.eliminarRegistro()) {
                    request.setAttribute("MensajeExito", "¡El pago se actualizó correctamente!");
                } else {
                    request.setAttribute("MensajeError", "¡El pago NO se actualizó correctamente!");
                }
                request.getRequestDispatcher("eliminarPago.jsp").forward(request, response);
                break;
            case 4: // Consultar Pago
                pagVO = pagDAO.consultarPago();
                if (pagVO != null) {
                    request.setAttribute("pagoEncontrado", pagVO);
                    request.getRequestDispatcher("actualizarPago.jsp").forward(request,response);
                } else {
                    request.setAttribute("MensajeError", "¡El pago NO existe!");
                    request.getRequestDispatcher("consultarPago.jsp").forward(request,response);
                }
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
