<%-- 
    Document   : registrarUsuario
    Created on : 17/03/2023, 02:04:27 PM
    Author     : APRENDIZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de usuario</title>
        <link href="../Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Registro de usuario</h2>
        <form method="post" action="Usuario">
            <label for="usuUsuario">Digite su usuario:</label>
            <input type="text" name="usuUsuario" required maxlength=20 placeholder="Digite su numero de cedula">
            <label for="usuContrasena">Contraseña:</label>
            <input type="password" name="usuContrasena" required maxlength=20 placeholder="Ingrese una contraseña" >          
            <input type="submit" value="Registrar usuario">
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
