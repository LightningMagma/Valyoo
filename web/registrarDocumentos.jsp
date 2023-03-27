<%-- 
    Document   : registrarDocumentos
    Created on : 20/03/2023, 02:04:00 PM
    Author     : Miguel Gil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Documentos</title>
        <link href="Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Registro de documento</h2>
        <form method="post" action="Documentos">
            <label for="docNombre">Nombre:</label>
            <input type="text" name="docNombre" required maxlength=30 placeholder="Ingrese el nombre del documento" pattern="^[A-Za-z]{10,30}$" title="Debe la descipcion del documento" required >
            <label for="docUrl">URL:</label>
            <input type="text" name="docUrl" required maxlength=100 placeholder="Ingrese la URL del documento" pattern="^[A-Za-z0-9]{10,100}$" title="Debe la descipcion del pago" required>
            <label for="docPer">Persona:</label>
            <input type="text" name="docPer" required maxlength=15 placeholder="Ingrese la persona">
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
        <a href="indexDocumentos.jsp">
            <button class="btn btn-primary">Volver</button>
        </a>
    </body>
</html>
