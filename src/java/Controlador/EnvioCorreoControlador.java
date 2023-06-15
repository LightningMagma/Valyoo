/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.PropiedadesCorreo;

/**
 *
 * @author xJuanDa
 */
@WebServlet(name = "EnvioCorreoControlador", urlPatterns = {"/EnvioCorreo"})
public class EnvioCorreoControlador extends HttpServlet {

    private String servidor, puerto, usuario, clave;

    public void init() {

        ServletContext context = getServletContext();
        servidor = context.getInitParameter("servidor");
        puerto = context.getInitParameter("puerto");
        usuario = context.getInitParameter("usuario");
        clave = context.getInitParameter("clave");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String destino = request.getParameter("destino");
        String asunto = request.getParameter("asunto");
        String mensaje = request.getParameter("mensaje");

        String resultadoMensaje = "";

        try {
            PropiedadesCorreo.envioCorreo(servidor, puerto, usuario, clave, destino, asunto, mensaje);
            resultadoMensaje = "Mensaje enviado correctamente";
        } catch (Exception e) {
            e.printStackTrace();
            resultadoMensaje = "Error al enviar al correo" + e.getMessage();
        } finally {
            request.setAttribute("EstadoMensaje", resultadoMensaje);
            getServletContext().getRequestDispatcher("/resultado.jsp").forward(request, response);

        }
    }

}
