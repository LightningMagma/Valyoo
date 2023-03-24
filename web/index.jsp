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
        <link href="Estilos/styless.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="login-box">
            <h2>Inicios de sesión</h2>
            <form method="post" action="Persona">
                <div class="user-box">
                    <label for="perDocumento">Usuario</label><br>
                    <input type="text" name="perDocumento" required>
                </div>
                <div class="user-box">
                    <label for="perClave">Contraseña</label><br>
                    <input type="password" name="perClave" required>
                </div>
                <a href="#">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <input type="submit" value="Iniciar">
                    <input name="opcion" type="hidden" value="4">
                </a>
            </form>
        </div>
        <%
            if (request.getAttribute("mensajeError") != null) {%>
        <h2>${mensajeError}</h2>
        <%} else {%>
        <h2>${mensajeExito}</h2>    
        <%}
        %>
    </body>
</html>