/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.CuentaDAO;
import ModeloVO.CuentaVO;
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
@WebServlet(name = "CuentaControlador", urlPatterns = {"/Cuenta"})
public class CuentaControlador extends HttpServlet {

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

        String CuNumero = request.getParameter("CuNumero");
        String CuFechaRegistro = request.getParameter("CuFechaRegistro");
        String CuEstado = request.getParameter("CuEstado");
        String CuPersona = request.getParameter("CuPersona");
        int opcion = Integer.parseInt(request.getParameter("opcion"));

        CuentaVO cuVO = new CuentaVO(CuNumero, CuFechaRegistro, CuEstado, CuPersona);

        CuentaDAO cuDAO = new CuentaDAO(cuVO);

        switch (opcion) {
            case 1: // Agregar Registro
                if (cuDAO.agregarRegistro()) {
                    request.setAttribute("MensajeExito", "¡La cuenta se registró correctamente!");
                } else {
                    request.setAttribute("MensajeError", "¡La cuenta NO se registró correctamente!");
                }
                request.getRequestDispatcher("indexCuenta.jsp").forward(request, response);
                break;
            case 2: // Actualizar Registro
                if (cuDAO.actualizarRegistro()) {
                    request.setAttribute("MensajeExito", "¡La cuenta se actualizó correctamente!");
                } else {
                    request.setAttribute("MensajeError", "¡La cuenta NO se actualizó correctamente!");
                }
                request.getRequestDispatcher("indexCuenta.jsp").forward(request, response);
                break;
            case 3: // Cambiar Estado
                if (cuDAO.eliminarRegistro()) {
                    request.setAttribute("MensajeExito", "¡El estado de la cuenta se cambió correctamente!");
                } else {
                    request.setAttribute("MensajeError", "¡El estado de la cuenta NO se cambió correctamente!");
                }
                request.getRequestDispatcher("indexCuenta.jsp").forward(request, response);
                break;
            case 4: // Consultar Prestamos
                cuVO = cuDAO.consultarCuenta();
                if (cuVO != null) {
                    request.setAttribute("cuentaEncontrada", cuVO);
                    request.getRequestDispatcher("actualizarCuenta.jsp").forward(request, response);
                } else {
                    request.setAttribute("MensajeError", "¡La cuenta NO existe!");
                    request.getRequestDispatcher("indexCuenta.jsp").forward(request, response);
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
