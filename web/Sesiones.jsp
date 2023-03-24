<%-- 
    Document   : Sesiones
    Created on : Mar 23, 2023, 9:04:40 PM
    Author     : xJuanDa
--%>

<%@page import="ModeloVO.PersonaVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <%
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-control", "no-cache,no-store,must-revalidate");
        response.setDateHeader("Expires", 0);
    %>

    <%
        String persona = "";
        HttpSession buscarSesion = (HttpSession) request.getSession();
        if (buscarSesion.getAttribute("datosPersona") != null) {

            PersonaVO perVO = (PersonaVO) buscarSesion.getAttribute("datosPersona");
            persona = perVO.getPerNombre();
        } else {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }

    %>
    <body>
        <div>
            <h2>Bienvenido <%=persona%></h2>
            <form method="post" action="Sesiones">
                <input type="submit" value="Cerra Sesion">
            </form>
        </div>
        <div class="container">
            
                    <a href="indexCuenta.jsp">Cuenta</a>
                    <a href="indexSede.jsp">Sede</a>
                    <a href="indexPersona.jsp">Persona</a>              
                    <a href="indexDocumentos.jsp">Documentos</a>               
                    <a href="indexPago.jsp">Pago</a></li>                
                    <a href="indexPersonaRol.jsp">Asignacion rol</a>               
                    <a href="indexPrestamos.jsp">Prestamo</a>
                    <a href="indexRol.jsp">Rol</a></li>
                    <a href="indexSolicitud.jsp">Solicitud</a>               
               
        </div> 
        <script>
            function confirmar() {
                var respuesta = confirm("¿Desea eliminar el registro");
                if (respuesta == true) {
                    return true;
                } else {
                    return false;
                }
            }
        </script>
    </body>

</html>
