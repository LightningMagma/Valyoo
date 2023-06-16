<%-- 
    Document   : solicitudDeudor
    Created on : 15/06/2023, 07:31:54 PM
    Author     : Miguel Gil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Solicitud</title>
        <link href="Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Registro solicitud</h2>
        <form method="post" action="Solicitud">
            <label for="usuMonto">Monto del prestamo:</label>
            <input type="text" name="solMonto" maxlength="7" placeholder="Digite el monto del prestamo" title="Debe ingresar un monto adecuado"  oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1')">
            <label for="usuCuotas">Cuotas:</label>
            <input type="number" name="solCuotas" maxlength="2" required placeholder="Ingrese la cantidad de cuotas" title="Debe ingresar una cantidad valida" required oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1')"> 
            <input type="hidden" name="solPersona" required placeholder="Ingrese identificacion de la persona" value="<%=documento%>"title="Debe ingresar un número de documento" required oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1')">
            <input type="submit" class="btn btn-success" value="Registrar solicitud">
            <input type="reset" class="btn btn-danger"  value="Limpiar">
            <a href="menuDeudor.jsp">
                <button class="btn btn-primary" type="button">Volver</button>
            </a>
            <input type="hidden" name="opcion" value="1">
        </form>

    </body>
</html>
