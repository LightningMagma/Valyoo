<%-- 
    Document   : registrarPersona
    Created on : 17/03/2023, 02:57:20 PM
    Author     : APRENDIZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Persona</title>
        <link href="../Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Registro de personas</h2>
        <form method="post" action="">
            <label for="perDocumento">Número de documento:</label>
            <input type="text" name="perDocumento" required maxlength=20 placeholder="Ingrese el número de documento">
            <label for="perTipoDocumento">Tipo de documento:</label>
            <select name="perTipoDocumento">
                <option>Seleccione...</option>
                <option value="Cedula de Ciudadania">Cédula de Ciudadanía</option>
                <option value="Cédula de Extranjería">Cédula de Extranjería</option>
                <option value="Pasaporte">Pasaporte</option>
            </select>
            <label for="perNombre">Nombre:</label>
            <input type="text" name="perNombre" required maxlength=30 placeholder="Ingrese el nombre">
            <label for="perApellido">Apellido:</label>
            <input type="text" name="perApellido" required maxlength=30 placeholder="Ingrese el apellido">
            <label for="perTelefono">Teléfono</label>
            <input type="text" name="perTelefono" required maxlength=15 placeholder="Ingrese el teléfono">
            <label for="perDirección">Dirección:</label>
            <input type="text" name="perDirección" required maxlength=50 placeholder="Ingrese la dirección">
            <label for="perDocumento">Número de documento:</label>
            <input type="text" name="perDocumento" required maxlength=20 placeholder="Ingrese el número de documento">
            <label for="perDocumento">Número de documento:</label>
            <input type="text" name="perDocumento" required maxlength=20 placeholder="Ingrese el número de documento">
            <label for="perDocumento">Número de documento:</label>
            <input type="text" name="perDocumento" required maxlength=20 placeholder="Ingrese el número de documento">
            <input type="submit" value="Registrar">
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
