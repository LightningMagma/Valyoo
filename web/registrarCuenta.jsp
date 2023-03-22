<%-- 
    Document   : registrarCuenta
    Created on : 21/03/2023, 09:45:10 PM
    Author     : jpgar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Cuenta</title>
        <link href="Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Registrar Cuenta</h2>
        <form method="post" action="Cuenta">
            <label>Codigo: </label>
            <input type="text" name="CuNumero" maxlength="2" placeholder="Ingrese el codigo de cuenta">
            <label>Fecha Registro: </label>
            <input type="text" name="CuFechaRegistro" maxlength="10" placeholder="0000-00-00">
            <label>Estado: </label>
            <input type="text" name="CuEstado" maxlength="10" placeholder="Activo o inactivo">
            <label>Persona: </label>
            <input type="text" name="CuPersona" maxlength="2" placeholder="Ingrese la persona a la cual se le va asigar la cuenta">
            <input type="submit" value="Registrar Cuenta">
            <input type="reset" value="Borrar">
            <input type="hidden" name="opcion" value="1">
            <%
            if (request.getAttribute("MensajeError") != null) { %>
            ${MensajeError}
            <%  } else { %>
            ${MensajeExito}
            <%  }
            %>
        </form>
    </body>
</html>
