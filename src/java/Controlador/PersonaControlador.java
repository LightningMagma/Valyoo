/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.CuentaDAO;
import ModeloDAO.PagoDAO;
import ModeloDAO.PerRolDAO;
import ModeloDAO.PersonaDAO;
import ModeloDAO.PrestamosDAO;
import ModeloVO.CuentaVO;
import ModeloVO.PagoVO;
import ModeloVO.PerRolVO;
import ModeloVO.PersonaVO;
import ModeloVO.PrestamosVO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ACER
 */
@WebServlet(name = "PersonaControlador", urlPatterns = {"/Persona"})
public class PersonaControlador extends HttpServlet {

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
        String perDocumento = request.getParameter("perDocumento");
        String perTipoDocumento = request.getParameter("perTipoDocumento");
        String perNombre = request.getParameter("perNombre");
        String perApellido = request.getParameter("perApellido");
        String perCorreo = request.getParameter("perCorreo");
        String perTelefono = request.getParameter("perTelefono");
        String perDireccion = request.getParameter("perDireccion");
        String perClave = request.getParameter("perClave");
        String perSede = request.getParameter("perSede");
        String perEstado = request.getParameter("perEstado");
        int opcion = Integer.parseInt(request.getParameter("opcion"));

        PersonaVO perVO = new PersonaVO(perDocumento, perTipoDocumento, perNombre, perApellido, perCorreo, perTelefono, perDireccion, perClave, perSede, perEstado);
        PerRolVO prVO = new PerRolVO();
        CuentaVO cuVO = new CuentaVO();
        PrestamosVO presVO = new PrestamosVO();
        PagoVO pagVO = new PagoVO();
        PersonaDAO perDAO = new PersonaDAO(perVO);
        PerRolDAO prDAO = new PerRolDAO();
        CuentaDAO cuDAO = new CuentaDAO();
        PrestamosDAO presDAO = new PrestamosDAO();
        PagoDAO pagDAO = new PagoDAO();

        switch (opcion) {
            case 1: // Agregar Registro
                if (perDAO.agregarRegistro()) {
                    request.setAttribute("MensajeExito", "¡La persona se registró correctamente!");
                } else {
                    request.setAttribute("MensajeError", "¡La persona NO se registró correctamente!");
                }
                request.getRequestDispatcher("indexPersona.jsp").forward(request, response);
                break;
            case 2: // Actualizar Registro
                if (perDAO.actualizarRegistro()) {
                    request.setAttribute("MensajeExito", "¡La persona se actualizó correctamente!");
                } else {
                    request.setAttribute("MensajeError", "¡La persona NO se actualizó correctamente!");
                }
                request.getRequestDispatcher("indexPersona.jsp").forward(request, response);
                break;
            case 3: // Listar por documento
                perVO = perDAO.consultarPorDocumento(perDocumento);
                if (perVO != null) {
                    request.setAttribute("personaEncontrada", perVO);
                    request.getRequestDispatcher("actualizarPersona.jsp").forward(request, response);
                } else {
                    request.setAttribute("mensajeError", "¡La persona no existe!");
                    request.getRequestDispatcher("indexPersona.jsp").forward(request, response);
                }
                break;
            case 4: //iniciar sesion
                if (perDAO.iniciarSesion(perDocumento, perClave)) {
                    HttpSession miSesion = request.getSession(true);
                    perVO = perDAO.consultarPorDocumento(perDocumento);
                    miSesion.setAttribute("datosPersona", perVO);
                    String personaDocumento = perVO.getPerDocumento();

                    if ((cuVO=cuDAO.listarCuPer(personaDocumento) ) != null) {                        
                        miSesion.setAttribute("datosCuenta", cuVO);
                        String numeroCuenta = cuVO.getCuNumero();
                        presVO = presDAO.listarPresPer(numeroCuenta);
                        miSesion.setAttribute("datosPrestamo", presVO);
                        String numeroPrestamo = presVO.getPreId();
                        pagVO = pagDAO.listarPagoPer(numeroPrestamo);
                        miSesion.setAttribute("datosPago", pagVO);                        
                    }                   

                    //request.getRequestDispatcher("menu.jsp").forward(request, response);
                    ArrayList<PerRolVO> listaPerRoles = prDAO.listarPerRol(perDocumento);

                    for (int i = 0; i < listaPerRoles.size(); i++) {
                        prVO = listaPerRoles.get(i);
                        if (listaPerRoles.size() > 1) {
                            request.getRequestDispatcher("menuAdministrador.jsp").forward(request, response);
                        }
                        if (prVO.getPRRol().equals("2")) {
                            request.getRequestDispatcher("menuSupervisor.jsp").forward(request, response);
                        }
                        if (prVO.getPRRol().equals("3")) {
                            request.getRequestDispatcher("menuSecretario.jsp").forward(request, response);
                        }
                        if (prVO.getPRRol().equals("4")) {
                            request.getRequestDispatcher("menuDeudor.jsp").forward(request, response);
                        }
                    }
                } else {
                    request.setAttribute("mensajeError", "Usuario o contraseña incorrectos");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                break;
            case 5: // Eliminar Registro
                if (perDAO.eliminarRegistro()) {
                    request.setAttribute("MensajeExito", "¡La persona se eliminó correctamente!");
                } else {
                    request.setAttribute("MensajeError", "¡La persona NO se eliminó correctamente!");
                }
                request.getRequestDispatcher("indexPersona.jsp").forward(request, response);
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
