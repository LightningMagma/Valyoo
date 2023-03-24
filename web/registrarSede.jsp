<%-- 
    Document   : registrarSede
    Created on : 20/03/2023, 02:24:22 PM
    Author     : Miguel Gil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Sede</title>
        <link href="Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Registro de sede</h2>
        <form method="post" action="Sede">
            <label for="sedeNombre">Nombre:</label>
            <input type="text" name="sedeNombre" required maxlength=30 placeholder="Ingrese el nombre">
            <label for="sedeDireccion">Dirección:</label>
            <input type="text" name="sedeDireccion" required maxlength=30 placeholder="Ingrese la dirección">
            <label for="sedeTelefono">Telefono:</label>
            <input type="text" name="sedeTelefono" required maxlength=100 placeholder="Ingrese el teléfono de la sede">
            <input type="submit" value="Registrar">
            <input type="reset" value="Limpiar">
            <input type="hidden" name="opcion" value="1">
        </form>
        <%
            if (request.getAttribute("MensajeError") != null) { %>
        ${MensajeError}
        <%} else {%>
        ${MensajeExito}
        <%}
        %>
        <a href="indexSede.jsp">
            <button class="btn btn-primary">Volver</button>
        </a>
    </body>
</html>
