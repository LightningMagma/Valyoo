<%-- 
    Document   : registrarCuenta
    Created on : 21/03/2023, 09:45:10 PM
    Author     : jpgar
--%>

<%@page import="ModeloVO.PersonaVO"%>
<%@page import="ModeloDAO.PersonaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
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
            <label>Fecha Registro: </label>
            <input type="date" name="CuFechaRegistro" maxlength="10" placeholder="0000-00-00">
            <label>Persona: </label>
            <select name="CuPersona">
                <option>Seleccione...</option>
                <%                    PersonaDAO perDAO = new PersonaDAO();
                    for (PersonaVO perVO : perDAO.listar()) {
                %>
                <option value="<%=perVO.getPerDocumento()%>" name="CuPersona"><%=perVO.getPerNombre()+" "+perVO.getPerApellido()%></option>
                <% } %>
            </select>
            <input type="submit" class="btn btn-success" value="Registrar Cuenta">
            <input type="reset" class="btn btn-danger " value="Borrar">
            <a href="indexCuenta.jsp">
                <button class="btn btn-primary">Volver</button>
            </a>
            <input type="hidden" name="opcion" value="1"><br>
            <%if (request.getAttribute("MensajeError") != null) { %>
            ${MensajeError}
            <%  } else { %>
            ${MensajeExito}
            <%  }
            %>

        </form>

    </body>
</html>
