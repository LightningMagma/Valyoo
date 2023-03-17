<%-- 
    Document   : registrarSolicitud
    Created on : 17/03/2023, 02:58:03 PM
    Author     : APRENDIZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar solicitud</title>
    </head>
    <body>
        <h2>Registro solitud</h2>
        <form method="post" action="Solicitud">
            <label for="usuMonto">Monto del prestamo:</label>
            <input type="number" name="solMonto" required maxlength=20 placeholder="Digite el monto del prestamo">
            <label for="usuCuotas">Cuotas:</label>
            <input type="number" name="solCuotas" required maxlength=20 placeholder="Ingrese la cantidad de cuotas" > 
            <input type="hidden" name="solInteres" value="4">
            <input type="submit" value="Registrar solicitud">
            <input type="reset" value="Limpiar">
            <input type="hidden" name="opcion" value="1">
        </form>
        <%
            if (request.getAttribute("mensajeError") != null) {%>
        <h2>${mensajeError}</h2>
        <%} else {%>
        <h2>${mensajeExito}</h2>    
        <%}
        %>
    </body>
</html>
