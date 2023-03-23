<%-- 
    Document   : actualizarDocumentos
    Created on : 22/03/2023, 10:16:18 PM
    Author     : Miguel Gil
--%>

<%@page import="ModeloVO.DocumentosVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Documentos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link href="Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Actualizar</h2>
        <%
            DocumentosVO docVO = (DocumentosVO) request.getAttribute("documentoEncontrado");

            if (docVO != null) {
        %>
        <form method="post" action="Documentos">
            <label for="docNombre">Nombre:</label>
            <input type="text" name="docNombre" required maxlength=30 placeholder="Ingrese el nombre del documento">
            <label for="docUrl">URL:</label>
            <input type="text" name="docUrl" required maxlength=100 placeholder="Ingrese la URL del documento">
            <label for="docPer">Persona:</label>
            <input type="text" name="docPer" required maxlength=15 placeholder="Ingrese la persona">
            <input type="submit" value="Actualizar">
            <input type="reset" value="Limpiar">
            <input type="hidden" name="opcion" value="2">
        </form>
        <a href="indexDocumentos.jsp">Volver</a>
        <%}%>
        <%
            if (request.getAttribute("MensajeError") != null) {%>
        ${MensajeError}
        <% } else {%>
        ${MensajeExito}
        <% }
        %>
    </body>
</html>
