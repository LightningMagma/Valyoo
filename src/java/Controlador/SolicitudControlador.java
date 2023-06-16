/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.PerRolDAO;
import ModeloDAO.PersonaDAO;
import ModeloDAO.SolicitudDAO;
import ModeloVO.PerRolVO;
import ModeloVO.PersonaVO;
import ModeloVO.SolicitudVO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author xJuanDa
 */
@WebServlet(name = "SolicitudControlador", urlPatterns = {"/Solicitud"})
public class SolicitudControlador extends HttpServlet {

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
        String solId = request.getParameter("solId");
        String solMonto = request.getParameter("solMonto");
        String solCuotas = request.getParameter("solCuotas");
        String solEstado = request.getParameter("solEstado");
        String solPersona = request.getParameter("solPersona");
        int opcion = Integer.parseInt(request.getParameter("opcion"));

        SolicitudVO solVO = new SolicitudVO(solId, solMonto, solCuotas, solEstado, solPersona);
        SolicitudDAO solDAO = new SolicitudDAO(solVO);

        switch (opcion) {
            case 1://Agrega registro
                if (solDAO.agregarRegistro()) {
                    //Enviar a través de un Atributo                    
                    request.setAttribute("MensajeExito", "La solicitud se registro correctamente!");
                } else {
                    request.setAttribute("MensajeError", "La solicitud no se registro correctamente!");
                }
                PerRolDAO prDAO = new PerRolDAO();
                PerRolVO prVO = new PerRolVO();
                ArrayList<PerRolVO> listaPerRoles = prDAO.listarPerRol(solPersona);
                for (int i = 0; i < listaPerRoles.size(); i++) {
                    prVO = listaPerRoles.get(i);
                    if (prVO.getPRRol().equals("3")) {
                        request.getRequestDispatcher("indexSolicitud.jsp").forward(request, response);
                    }
                    if (prVO.getPRRol().equals("4")) {
                        request.getRequestDispatcher("menuDeudor.jsp").forward(request, response);
                    }
                }
                break;

            case 2:
                if (solDAO.actualizarRegistro()) {
                    //Enviar atravez de un Atributo
                    request.setAttribute("MensajeExito", "La solicitud se actualizó correctamente!");
                } else {
                    request.setAttribute("MensajeError", "La solicitud no se actualizó correctamente!");
                }
                request.getRequestDispatcher("indexSolicitud.jsp").forward(request, response);
                break;
            case 3:
                if (solDAO.eliminarRegistro()) {
                    //Enviar atravez de un Atributo
                    request.setAttribute("MensajeExito", "¡El estado de la solicitud se cambió correctamente!");
                } else {
                    request.setAttribute("MensajeError", "¡El estado de la solicitud NO se cambió correctamente!");
                }
                request.getRequestDispatcher("indexSolicitud.jsp").forward(request, response);
                break;
            case 4:
                solVO = solDAO.consultarPorID(solId);
                if (solVO != null) {
                    request.setAttribute("solicitudEncontrada", solVO);
                    request.getRequestDispatcher("actualizarSolicitud.jsp").forward(request, response);
                } else {
                    request.setAttribute("MensajeError", "Solicitud no encontrado");
                    request.getRequestDispatcher("indexSolicitud.jsp").forward(request, response);
                }
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
