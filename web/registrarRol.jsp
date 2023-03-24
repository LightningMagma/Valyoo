<%-- 
    Document   : registrarRol
    Created on : Mar 15, 2023, 9:38:15 PM
    Author     : xJuanDa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar rol</title>
        <link href="../Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Registro de rol</h2>
        <form method="post" action="Rol">
            <label for="rolNombre">Nombre del rol:</label>
            <input type="text" name="rolNombre" required maxlength=20 placeholder="Ingrese el nombre del rol">            
            <input type="submit" value="Registrar">
            <input type="reset" value="Limpiar">
            <input type="hidden" name="opcion" value="1">
        </form>
        <%            if (request.getAttribute("mensajeError") != null) {%>
        <h2>${mensajeError}</h2>
        <%} else {%>
        <h2>${mensajeExito}</h2>    
        <%}
        %>
        <a href="indexSede.jsp">
            <button class="btn btn-primary">Volver</button>
        </a>
    </body>
</html>
