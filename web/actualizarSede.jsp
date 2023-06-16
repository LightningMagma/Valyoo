<%-- 
    Document   : actualizarSede
    Created on : 22/03/2023, 09:47:19 PM
    Author     : ACER
--%>

<%@page import="ModeloVO.SedeVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Sede</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link href="Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Actualizar sede</h2>
        <%            SedeVO sedeVO = (SedeVO) request.getAttribute("sedeEncontrada");

            if (sedeVO != null) {
        %>
        <form method="post" action="Sede">            
            <input type="hidden" name="sedeId" required maxlength=30 value="<%=sedeVO.getSedeId()%>" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1')">
            <label for="sedeNombre">Nombre:</label>
            <input type="text" name="sedeNombre" required maxlength=30 value="<%=sedeVO.getSedeNombre()%>" oninput="this.value = this.value.replace(/[^A-Za-z ]/g, '').replace(/(\..*)\./g, '$1')">
            <label for="sedeDireccion">Dirección:</label>
            <input type="text" name="sedeDireccion" required maxlength=30 value="<%=sedeVO.getSedeDireccion()%>" oninput="this.value = this.value.replace(/[^A-Za-z0-9 ]/g, '').replace(/(\..*)\./g, '$1')">
            <label for="sedeTelefono">Teléfono:</label>
            <input type="text" name="sedeTelefono" required maxlength=100 value="<%=sedeVO.getSedeTelefono()%>"oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1')">
            <input type="submit" class="btn btn-success" value="Actualizar">            
            <a href="indexSede.jsp">
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
