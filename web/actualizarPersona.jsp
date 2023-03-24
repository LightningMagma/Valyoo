<%-- 
    Document   : actualizarPersona
    Created on : 22/03/2023, 02:06:09 PM
    Author     : APRENDIZ
--%>

<%@page import="ModeloVO.PersonaVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Persona</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link href="Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Actualizar Persona</h2>
        <%
            PersonaVO perVO = (PersonaVO) request.getAttribute("personaEncontrada");

            if (perVO != null) {
        %>
        <form method="post" action="Persona">
            <label for="perDocumento">Número de documento:</label>
            <input type="text" name="perDocumento" required maxlength=20 value="<%=perVO.getPerDocumento()%>">
            <label for="perTipoDocumento">Tipo de documento:</label>
            <select name="perTipoDocumento">

                <option value="Cedula de Ciudadania">C.C</option>
                <option value="Cédula de Extranjería">C.E</option>
                <option value="Pasaporte">Pasaporte</option>

            </select>

            <label for="perNombre">Nombre:</label>
            <input type="text" name="perNombre" required maxlength=30 value="<%=perVO.getPerNombre()%>">
            <label for="perApellido">Apellido:</label>
            <input type="text" name="perApellido" required maxlength=30 value="<%=perVO.getPerApellido()%>" >
            <label for="perTelefono">Teléfono</label>
            <input type="text" name="perTelefono" required maxlength=15 value="<%=perVO.getPerTelefono()%>" >
            <label for="perDireccion">Dirección:</label>
            <input type="text" name="perDireccion" required maxlength=50 value="<%=perVO.getPerDireccion()%>" >
            <label for="perClave">Contraseña:</label>
            <input type="text" name="perClave" required maxlength=20 value="<%=perVO.getPerClave()%>">
            <input type="submit" value="Actualizar">
            <input type="reset" value="Limpiar">
            <input type="hidden" name="opcion" value="2">
        </form>
        
        <%}%>
        <%
                if (request.getAttribute("MensajeError") != null) {%>
        ${MensajeError}
        <% } else {%>
        ${MensajeExito}
        <% }
        %>
        <a href="indexPersona.jsp">
            <button class="btn btn-primary">Volver</button>
        </a>
    </body>
</html>
