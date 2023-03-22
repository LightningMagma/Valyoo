<%-- 
    Document   : registrarPrestamos
    Created on : 21/03/2023, 02:51:02 PM
    Author     : APRENDIZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Prestamo</title>
        <link href="Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Registrar Prestamo</h2>
        <form method="post" action="Prestamo">
            <label>Codigo: </label>
            <input type="text" name="PreId" maxlength="3" placeholder="Ingrese el codigo que va a tener el prestamo">
            <label>Fecha inicio: </label>
            <input type="text" name="PreFechaInicio" maxlength="10" placeholder="0000-00-00">
            <label>Fecha fin: </label>
            <input type="text" name="PreFechaFin" maxlength="10" placeholder="0000-00-00">
            <label>Cuotas: </label>
            <input type="text" name="PreCuotas" maxlength="2" placeholder="Ingrese las cuotas del pestamo">
            <label>Monto: </label>
            <input type="text" name="PreMonto" maxlength="10" placeholder="Ingresé el monto">
            <label>Intereses: </label>
            <input type="text" name="PreInteres" maxlength="2" placeholder="Ingresé los intereses">
            <label>Estado: </label>
            <input type="text" name="PreInteres" maxlength="2" placeholder="Ingresé los intereses">
            <label>Cuenta: </label>
            <input type="text" name="PreCuenta" maxlength="2" placeholder="A que cuenta se le va asignar el prestamo">
            <input type="submit" value="Registrar prestamo">
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
