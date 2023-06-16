<%-- 
    Document   : actualizarDocumentos
    Created on : 22/03/2023, 10:16:18 PM
    Author     : Miguel Gil
--%>

<%@page import="ModeloVO.DocumentosVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Estilos/logoValyoo.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Documentos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link href="Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Actualizar documentos</h2>
        <%            DocumentosVO docVO = (DocumentosVO) request.getAttribute("documentoEncontrado");

            if (docVO != null) {
        %>
        <form method="post" action="Documentos">

            <input type="hidden" name="docId" required maxlength=30 value="<%=docVO.getDocId()%>">
            <label for="docNombre">Nombre:</label>
            <input type="text" name="docNombre" required maxlength=30 value="<%=docVO.getDocNombre()%>" oninput="this.value = this.value.replace(/[^0-9A-Za-Z ]/g, '').replace(/(\..*)\./g, '$1')">
            <label for="docUrl">URL:</label>
            <input type="text" name="docUrl" required maxlength=100 value="<%=docVO.getDocUrl()%>">
            <label for="docPer">Persona:</label>
            <input type="text" name="docPer" required maxlength=15 value="<%=docVO.getDocPer()%>" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1')">
            <input class="btn btn-success" type="submit" value="Actualizar">            
            <a href="indexDocumentos.jsp">
                <button class="btn btn-primary" type="button">Volver</button>
            </a>
            <input type="hidden" name="opcion" value="2">
        </form>

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
