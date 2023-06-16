<%-- 
    Document   : administradorPersona
    Created on : 16/06/2023, 12:04:23 AM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Persona</title>
        <link href="Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Registro de persona</h2>
        <form method="post" action="Persona">
            <label for="perDocumento">Documento:</label>
            <input type="text" name="perDocumento" maxlength="10" minlength="3" title="Debe ingresar un número de documento" required placeholder="Número de documento" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');">

            <label for="perTipoDocumento">Tipo de documento:</label>
            <select name="perTipoDocumento">
                <option>Tipo de documento...</option>
                <option value="Cedula de Ciudadania">C.C</option>
                <option value="Cedula de Extranjeria">C.E</option>
                <option value="Pasaporte">Pasaporte</option>
            </select>

            <label for="perNombre">Nombre:</label>
            <input type="text" name="perNombre" maxlength="30" title="Debe ingresar un nombre" required placeholder="Nombre" oninput="this.value = this.value.replace(/[^A-Za-z ]/g, '').replace(/(\..*)\./g, '$1');">

            <label for="perApellido">Apellido:</label>
            <input type="text" name="perApellido" maxlength="30" title="Debe ingresar un apellido" required placeholder="Apellido" oninput="this.value = this.value.replace(/[^A-Za-z ]/g, '').replace(/(\..*)\./g, '$1');">

            <label for="perCorreo">Correo:</label>
            <input type="email" name="perCorreo" maxlength="40" title="Debe ingresar un correo electrónico" required placeholder="Correo electrónico" oninput="this.value = this.value.replace(/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]/g, '').replace(/(\..*)\./g, '$1');">

            <label for="perTelefono">Teléfono:</label>
            <input type="text" name="perTelefono" title="Debe ingresar un número telefónico" required placeholder="Teléfono" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');">

            <label for="perDireccion">Dirección:</label>
            <input type="text" name="perDireccion" title="No ingrese * / + _ ? u otros caracteres especiales" required placeholder="Dirección" oninput="this.value = this.value.replace(/[^A-Za-z0-9 #-]/g, '').replace(/(\..*)\./g, '$1')">

            <label for="perClave">Contraseña:</label>
            <input type="password" name="perClave" required placeholder="Ingrese la contraseña" >


            <input type="submit" class="btn btn-success" value="Registrar">
            <input type="reset" class="btn btn-danger"  value="Limpiar">
            <a href="indexPersona.jsp">
                <button class="btn btn-primary" type="button">Volver</button>
            </a>
            <input type="hidden" name="docreg" value="<%=documento%>">
            <input type="hidden" name="opcion" value="1">
        </form>

        <%
            if (request.getAttribute("MensajeError") != null) { %>
        ${MensajeError}
        <%} else {%>
        ${MensajeExito}
        <%}
        %>
    </body>
</html>
