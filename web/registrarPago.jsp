<%-- 
    Document   : registrarPago
    Created on : 17/03/2023, 02:49:17 PM
    Author     : APRENDIZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Pago</title>
        <link href="Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Registrar Pago</h2>
        <form method="post" action="Pago">
            <label>Descripción: </label>
            <input type="text" name="PagDesc" maxlength="30" placeholder="Ingresé la descripción del pago">
            <label>Valor: </label>
            <input type="text" name="PagValor" maxlength="10" placeholder="Ingresé la cantidad a pagar">
            <label>Préstamo: </label>
            <input type="text" name="PagPres" maxlength="2" placeholder="Ingresé el préstamo a abonar">
            <input type="submit" value="Registrar pago">
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
