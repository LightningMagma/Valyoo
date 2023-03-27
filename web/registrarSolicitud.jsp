<%-- 
    Document   : registrarSolicitud
    Created on : 17/03/2023, 02:58:03 PM
    Author     : APRENDIZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar solicitud</title>
        <link href="Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Registro solitud</h2>
        <form method="post" action="Solicitud">
            <label for="usuMonto">Monto del prestamo:</label>
            <input type="text" name="solMonto" placeholder="Digite el monto del prestamo" pattern="^[0-9]{6,10}$" title="Debe ingresar un monto adecuado" required>
            <label for="usuCuotas">Cuotas:</label>
            <input type="number" name="solCuotas" required placeholder="Ingrese la cantidad de cuotas" pattern="^[0-9]{1,2}$" title="Debe ingresar una cantidad valida" required> 
            <label for="usuCuotas">Persona de la solicitud</label>
            <input type="number" name="solPersona" required placeholder="Ingrese identificacion de la persona" pattern="^[0-9]{7,10}$" title="Debe ingresar un número de documento" required>           
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
        <a href="indexSolicitud.jsp">
            <button class="btn btn-primary">Volver</button>
        </a>
    </body>
</html>
