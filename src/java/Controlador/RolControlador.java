/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.RolDAO;
import ModeloVO.RolVO;
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
@WebServlet(name = "RolControlador", urlPatterns = {"/Rol"})
public class RolControlador extends HttpServlet {

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
        String rolId = request.getParameter("rolId");
        String rolNombre = request.getParameter("rolNombre");
        String rolEstado = request.getParameter("rolEstado"); 
        int opcion = Integer.parseInt(request.getParameter("opcion"));
        
        RolVO rolVO = new RolVO(rolId, rolNombre, rolEstado);        
        RolDAO rolDAO = new RolDAO(rolVO);
        
        switch(opcion){
            case 1://Agrega registro
                if(rolDAO.agregarRegistro()){
                    //Enviar atravez de un Atributo                    
                   request.setAttribute("mensajeExito","El rol se registro correctamente!");
                }else{
                   request.setAttribute("mensajeError","El rol no se registro correctamente!"); 
                }
                request.getRequestDispatcher("registrarRol.jsp").forward(request, response);                
                break;
            case 2:
                if(rolDAO.actualizarRegistro()){
                    //Enviar atravez de un Atributo
                   request.setAttribute("mensajeExito","El rol se actualizó correctamente!");
                }else{
                   request.setAttribute("mensajeError","El rol no se actualizó correctamente!"); 
                }
                request.getRequestDispatcher("actualizarRol.jsp").forward(request, response);
                break;
            case 3:
                if(rolDAO.eliminarRegistro()){
                    //Enviar atravez de un Atributo
                   request.setAttribute("mensajeExito","El rol se eliminó correctamente!");
                }else{
                   request.setAttribute("mensajeError","El rol no se eliminó correctamente!"); 
                }
                request.getRequestDispatcher("eliminarRol.jsp").forward(request, response);
                break;
            case 4:
                rolVO=rolDAO.consultarPorID(rolId);
                if (rolVO!=null) {
                    request.setAttribute("rolEncontrado", rolVO);
                    request.getRequestDispatcher("actualizarRol.jsp").forward(request, response);
                } else {
                    request.setAttribute("mensajeError","Rol no existe"); 
                    request.getRequestDispatcher("listarRol.jsp").forward(request, response); 
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
