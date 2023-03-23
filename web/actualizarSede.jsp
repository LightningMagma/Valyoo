<%-- 
    Document   : actualizarSede
    Created on : 22/03/2023, 09:47:19 PM
    Author     : ACER
--%>

<%@page import="ModeloVO.SedeVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Sede</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link href="Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Actualizar</h2>
        <%
            SedeVO sedeVO = (SedeVO) request.getAttribute("sedeEncontrada");

            if (sedeVO != null) {
        %>
        <form method="post" action="Sede">
            <label for="sedeNombre">Nombre:</label>
            <input type="text" name="sedeNombre" required maxlength=30 value="<%=sedeVO.getSedeNombre()%>">
            <label for="sedeDireccion">Dirección:</label>
            <input type="text" name="sedeDireccion" required maxlength=30 value="<%=sedeVO.getSedeDireccion()%>">
            <label for="sedeTelefono">Telefono:</label>
            <input type="text" name="sedeTelefono" required maxlength=100 value="<%=sedeVO.getSedeTelefono()%>">
            <input type="submit" value="Actualizar">
            <input type="reset" value="Limpiar">
            <input type="hidden" name="opcion" value="2">
        </form>
        <a href="consultarSede.jsp">Volver</a>
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
