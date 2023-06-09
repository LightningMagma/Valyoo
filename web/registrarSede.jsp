<%-- 
    Document   : registrarSede
    Created on : 20/03/2023, 02:24:22 PM
    Author     : Miguel Gil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Sede</title>
        <link href="Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Registro de sede</h2>
        <form method="post" action="Sede">
            <label for="sedeNombre">Nombre:</label>
            <input type="text" name="sedeNombre" required maxlength=30 placeholder="Ingrese el nombre" pattern="[a-zA-Z ]{7,30}$" title="Debe un nombre valido" required placeholder="Ingrese nombre de documento" oninput="this.value = this.value.replace(/[^A-Za-z ]/g, '').replace(/(\..*)\./g, '$1')">
            <label for="sedeDireccion">Dirección:</label>
            <input type="text" name="sedeDireccion" maxlength=50 placeholder="Ingrese la dirección" pattern="^[^*/+?\¡¿!$%&().,:;_=<>^" title="No ingrese * / + _ ? u otros caracteres especiales" required oninput="this.value = this.value.replace(/[^A-Za-z0-9 #-]/g, '').replace(/(\..*)\./g, '$1')">
            <label for="sedeTelefono">Telefono:</label>
            <input type="text" name="sedeTelefono"  maxlength=100 placeholder="Ingrese el teléfono de la sede" pattern="^[0-9]{7,15}$" title="Debe ingresar un número telefónico" required oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1')">
            <input type="submit" class="btn btn-success" value="Registrar">
            <input type="reset" class="btn btn-danger"  value="Limpiar">
            <a href="indexSede.jsp">
                <button class="btn btn-primary" type="button">Volver</button>
            </a>
            <input type="hidden" name="opcion" value="1">
        </form>
        <%            if (request.getAttribute("MensajeError") != null) { %>
        ${MensajeError}
        <%} else {%>
        ${MensajeExito}
        <%}
        %>

    </body>
</html>
