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
        <title>Registrar Personas</title>
        <link href="Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Registro de personas</h2>
        <form method="post" action="Persona">
            <label for="perDocumento">Número de documento:</label>
            <input type="text" name="perDocumento" required maxlength=20 placeholder="Ingrese el número de documento">
            <label for="perTipoDocumento">Tipo de documento:</label>
            <select name="perTipoDocumento">
                <option>Seleccione...</option>
                <option value="Cedula de Ciudadania">C.C</option>
                <option value="Cédula de Extranjería">C.E</option>
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
            <label for="perUsuario">Usuario:</label>
            <input type="text" name="perUsuario" required maxlength=20 placeholder="Ingrese el usuario">
            <label for="perSede">Sede:</label>
            <input type="text" name="perSede" required maxlength=70 placeholder="Ingrese la sede">
            <input type="hidden" name="perEstado" value="">
            <input type="submit" value="Registrar">
            <input type="reset" value="Limpiar">
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
