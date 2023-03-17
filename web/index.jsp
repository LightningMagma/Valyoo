<%-- 
    Document   : index
    Created on : Mar 14, 2023, 11:18:59 PM
    Author     : xJuanDa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar sesión</title>
        <link href="Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>inicio de sesion</h1>
        <form method="post" action="Usuario">
            <label for="usuLogin">Usuario:</label>
            <input type="text" id="nombre" name="usuUsuario" required maxlength=20>
            <label for="usuLogin">Contraseña:</label>
            <input type="password" id="apellido" name="usuContrasena" required maxlength=20>
            <input type="submit" value="Iniciar">
            <input type="reset" value="Limpiar">
            <input type="hidden" name="opcion" value="4">
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
