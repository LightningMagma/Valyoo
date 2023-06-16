<%-- 
    Document   : generarFactura
    Created on : 26/05/2023, 11:10:55 AM
    Author     : APRENDIZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Generar Factura</title>
    </head>
    <body>
        <h1>Generar factura</h1>
        <form method="post" action="Generador_Reporte.jsp" target="_blank">
            <input type="submit" value="Generar PDF">
        </form>
    </body>
</html>
