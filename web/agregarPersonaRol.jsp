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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Asignar Persona Rol</title>
        <link href="Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Asignasion persona y rol</h2>
        <form method="post" action="PersonaRol">
            <label>Persona:</label>
            <select name="prPersona">
                <option>Seleccione...</option>
                <%
                    PersonaDAO perDAO = new PersonaDAO();
                    for (PersonaVO perVO : perDAO.listar()) {
                %>
                <option value="<%=perVO.getPerDocumento()%>"><%=perVO.getPerDocumento()%></option>
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
            <input type="submit" value="Asignar rol">
            <input type="reset" value="Borrar">
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
