/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.DocumentosDAO;
import ModeloDAO.PerRolDAO;
import ModeloVO.DocumentosVO;
import ModeloVO.PerRolVO;
import ModeloVO.PersonaVO;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Miguel Gil
 */
@WebServlet(name = "DocumentosControlador", urlPatterns = {"/Documentos"})
@MultipartConfig
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
        PrintWriter out = response.getWriter();
        /* TODO output your page here. You may use following sample code. */
        String nom = request.getParameter("Nombre");
        Part arc = request.getPart("docUrl");
        InputStream is = arc.getInputStream();
        File f = new File("D:\\Documentos\\NetBeansProjects\\Valyoo\\web\\Documentos/" + nom);
        FileOutputStream ous = new FileOutputStream(f);
        int dato = is.read();
        while (dato != -1) {
            ous.write(dato);
            dato = is.read();
        }
        ous.close();
        is.close();
        String docId = request.getParameter("docId");
        String docNombre = request.getParameter("docNombre");
        String docUrl = String.valueOf(f);
        String docPer = request.getParameter("docPer");
        String docreg=request.getParameter("docreg");
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
                PerRolDAO prDAO = new PerRolDAO();
                PerRolVO prVO = new PerRolVO();
                PersonaVO perVO = new PersonaVO();
                request.setAttribute("personaEncontrada", perVO);
                ArrayList<PerRolVO> listaPerRoles = prDAO.listarPerRol(docreg);
                for (int i = 0; i < listaPerRoles.size(); i++) {
                    prVO = listaPerRoles.get(i);
                    if (prVO.getPRRol().equals("3")) {
                        request.getRequestDispatcher("menuSecretario.jsp").forward(request, response);
                    }
                    if (prVO.getPRRol().equals("1")) {
                        request.getRequestDispatcher("indexDocumentos.jsp").forward(request, response);
                    }
                }
                break;
            case 2: // Actualizar Registro
                if (docDAO.actualizarRegistro()) {
                    request.setAttribute("MensajeExito", "¡El documento se actualizó correctamente!");
                } else {
                    request.setAttribute("MensajeError", "¡El documento NO se actualizó correctamente!");
                }
                request.getRequestDispatcher("indexDocumentos.jsp").forward(request, response);
                break;
            case 3: // Listar por id
                docVO = docDAO.consultarPorId(docId);
                if (docVO != null) {
                    request.setAttribute("documentoEncontrado", docVO);
                    request.getRequestDispatcher("actualizarDocumentos.jsp").forward(request, response);
                } else {
                    request.setAttribute("MensajeError", "¡El documento NO existe!");
                    request.getRequestDispatcher("indexDocumentos.jsp").forward(request, response);
                }
                break;
            case 4: // Eliminar Registro
                if (docDAO.eliminarRegistro()) {
                    request.setAttribute("MensajeExito", "¡El documento se eliminó correctamente!");
                } else {
                    request.setAttribute("MensajeError", "¡El documento NO se eliminó correctamente!");
                }
                request.getRequestDispatcher("indexDocumentos.jsp").forward(request, response);
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
