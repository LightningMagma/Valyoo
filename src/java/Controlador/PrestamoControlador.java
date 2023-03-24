/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.PrestamosDAO;
import ModeloVO.PrestamosVO;
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
@WebServlet(name = "PrestamoControlador", urlPatterns = {"/Prestamo"})
public class PrestamoControlador extends HttpServlet {

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
        
        String PreId = request.getParameter("PreId");
        String PreFechaInicio = request.getParameter("PreFechaInicio");
        String PreFechaFin = request.getParameter("PreFechaFin");
        String PreCuotas = request.getParameter("PreCuotas");
        String PreMonto = request.getParameter("PreMonto");
        String PreInteres = request.getParameter("PreInteres");
        String PreEstado = request.getParameter("PreEstado");
        String PreCuenta = request.getParameter("PreCuenta");
        int opcion = Integer.parseInt(request.getParameter("opcion"));
        
        PrestamosVO presVO = new PrestamosVO(PreId, PreFechaInicio, PreFechaFin, PreCuotas, PreMonto, PreInteres, PreCuenta, PreEstado);
        PrestamosDAO presDAO = new PrestamosDAO(presVO);
        
        switch(opcion){
            case 1: // Agregar Registro
                if(presDAO.agregarRegistro()) {
                    request.setAttribute("MensajeExito", "¡El prestamo se registró correctamente!");
                }
                else {
                    request.setAttribute("MensajeError", "¡El prestamo NO se registró correctamente!");
                }
                request.getRequestDispatcher("indexPrestamos.jsp").forward(request, response);
                break;
            case 2: // Actualizar Registro
                if(presDAO.actualizarRegistro()) {
                    request.setAttribute("MensajeExito", "¡El prestamo se actualizó correctamente!");
                }
                else {
                    request.setAttribute("MensajeError", "¡El prestamo NO se actualizó correctamente!");
                }
                request.getRequestDispatcher("indexPrestamos.jsp").forward(request, response);
                break;
            case 3: // Eliminar Registro
                if(presDAO.eliminarRegistro()) {
                    request.setAttribute("MensajeExito", "¡El prestamo se eliminó correctamente!");
                }
                else {
                    request.setAttribute("MensajeError", "¡El prestamo NO se eliminó correctamente!");
                }
                request.getRequestDispatcher("indexPrestamos.jsp").forward(request, response);
                break;
            case 4: // Consultar Prestamos
                presVO = presDAO.consultarPrestamos();
                if (presVO != null) {
                    request.setAttribute("prestamoEncontrado", presVO);
                    request.getRequestDispatcher("actualizarPrestamos.jsp").forward(request,response);
                } else {
                    request.setAttribute("MensajeError", "¡El pago NO existe!");
                    request.getRequestDispatcher("indexPrestamos.jsp").forward(request,response);
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
