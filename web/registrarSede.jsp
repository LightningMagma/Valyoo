<%-- 
    Document   : registrarSede
    Created on : 20/03/2023, 02:24:22 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <label for="sedeId">ID sede:</label>
            <input type="text" name="sedeId" required maxlength=20 placeholder="Ingrese el ID de la sede">            
            <label for="sedeDireccion">Dirección</label>
            <input type="text" name="sedeDireccion" required maxlength=30 placeholder="Ingrese la dirección">
            <label for="sedeTelefono">Telefono:</label>
            <input type="text" name="sedeTelefono" required maxlength=100 placeholder="Ingrese el teléfono de la sede">
            <label for="sedeEstado">Estado:</label>
            <input type="text" name="sedeEstado" required maxlength=15 placeholder="Ingrese el estado">
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
    </body>
</html>
