<%-- 
    Document   : agregarPersonaRol
    Created on : Mar 22, 2023, 10:58:24 PM
    Author     : xJuanDa
--%>

<%@page import="ModeloVO.RolVO"%>
<%@page import="ModeloDAO.RolDAO"%>
<%@page import="ModeloVO.PersonaVO"%>
<%@page import="ModeloDAO.PersonaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Estilos/logoValyoo.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Asignar Persona Rol</title>
        <link href="Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Asignación persona y rol</h2>
        <form method="post" action="PersonaRol">
            <label>Persona:</label>
            <select name="prPersona">
                <option>Seleccione...</option>
                <%                    
                    PersonaDAO perDAO = new PersonaDAO();
                    for (PersonaVO perVO : perDAO.listar()) {
                %>
                <option value="<%=perVO.getPerDocumento()%>"><%=perVO.getPerDocumento()+" Nombres: "+perVO.getPerNombre()+" "+perVO.getPerApellido()%></option>
                <% } %>
            </select>
            <label>Rol: </label>
            <select name="prRol">
                <option>Seleccione...</option>
                <%
                    RolDAO rolDAO = new RolDAO();
                    for (RolVO rolVO : rolDAO.listarRol()) {
                %>
                <option value="<%=rolVO.getRolId()%>"><%=rolVO.getRolNombre()%></option>
                <% } %>
            </select>
            <input type="submit" class="btn btn-success" value="Asignar rol">
            <input type="reset" class="btn btn-danger" value="Borrar">
            <a href="indexPersonaRol.jsp">
                <button class="btn btn-primary" type="button">Volver</button>
            </a>

            <input type="hidden" name="opcion" value="1">            
        </form>
        <%
                if (request.getAttribute("MensajeError") != null) { %>
        ${MensajeError}
        <%  } else { %>
        ${MensajeExito}
        <%  }
        %>

    </body>
</html>
