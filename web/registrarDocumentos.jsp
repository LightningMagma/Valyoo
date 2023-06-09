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
            <input type="text" name="docNombre" required maxlength=30 placeholder="Ingrese el nombre del documento" pattern="^[A-Za-z ]{6,30}$" title="Debe la descipcion del documento" required oninput="this.value = this.value.replace(/[^0-9A-Za-Z ]/g, '').replace(/(\..*)\./g, '$1')">
            <label for="docUrl">URL:</label>
            <!--<input type="file" name="docUrl" id="docUrl" required style="display: none;">
            <button> <label for="docUrl">Selecciona un archivo</label> </button>-->
            <input type="text" name="docUrl" required placeholder="Ingrese la URL del documento" title="Debe la descipcion del pago">
            <label for="docPer">Persona:</label>
            <input type="text" name="docPer" required maxlength=15 placeholder="Ingrese la persona" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1')">
            <input type="submit" class="btn btn-success" value="Registrar">
            <input type="reset" class="btn btn-danger" value="Limpiar">
            <a href="indexDocumentos.jsp">
                <button class="btn btn-primary" type="button">Volver</button>
            </a>
            <input type="hidden" name="opcion" value="1">
        </form>
        <%            if (request.getAttribute("MensajeError") != null) { %>
        ${MensajeError}
        <%} else {%>
        ${MensajeExito}
        <%}
        %>

    </body>
</html>
