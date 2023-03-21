/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.UsuarioDAO;
import ModeloVO.UsuarioVO;
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
@WebServlet(name = "UsuarioControlador", urlPatterns = {"/Usuario"})
public class UsuarioControlador extends HttpServlet {

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
        String usuUsuario = request.getParameter("usuUsuario");
        String usuContrasena = request.getParameter("usuContrasena");
        String usuEstado = request.getParameter("usuEstado");
        int opcion = Integer.parseInt(request.getParameter("opcion"));

        UsuarioVO usuVO = new UsuarioVO(usuUsuario, usuContrasena, usuEstado);
        UsuarioDAO usuDAO = new UsuarioDAO(usuVO);
        switch (opcion) {
            case 1://Agrega registro
                if (usuDAO.agregarRegistro()) {
                    //Enviar atravez de un Atributo                    
                    request.setAttribute("mensajeExito", "El usuario se registro correctamente!");
                } else {
                    request.setAttribute("mensajeError", "El usuario no se registro correctamente!");
                }
                request.getRequestDispatcher("registrarUsuario.jsp").forward(request, response);
                break;
            case 2:
                if (usuDAO.actualizarRegistro()) {
                    //Enviar atravez de un Atributo
                    request.setAttribute("mensajeExito", "El usuario se actualizó correctamente!");
                } else {
                    request.setAttribute("mensajeError", "El usuario no se actualizó correctamente!");
                }
                request.getRequestDispatcher("actualizarUsuario.jsp").forward(request, response);
                break;
            case 3:
                if (usuDAO.eliminarRegistro()) {
                    //Enviar atravez de un Atributo
                    request.setAttribute("mensajeExito", "El usuario se eliminó correctamente!");
                } else {
                    request.setAttribute("mensajeError", "El usuario no se eliminó correctamente!");
                }
                request.getRequestDispatcher("eliminarUsuario.jsp").forward(request, response);
                break;
            case 4:
                if (usuDAO.iniciarSesion(usuUsuario, usuContrasena)) {
                    request.getRequestDispatcher("menu.jsp").forward(request, response);
                } else {
                    request.setAttribute("mensajeError", "No se pudo iniciar sesion");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                break;
            case 5:
                usuVO = usuDAO.consultarPorID(usuUsuario);
                if (usuVO != null) {
                    request.setAttribute("usuarioEncontrado", usuVO);
                    request.getRequestDispatcher("actualizarUsuario.jsp").forward(request, response);
                } else {
                    request.setAttribute("mensajeError", "Usuario no encontrado");
                    request.getRequestDispatcher("listarUsuario.jsp").forward(request, response);
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
