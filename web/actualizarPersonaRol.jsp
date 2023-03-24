<%-- 
    Document   : actualizarPersonaRol
    Created on : Mar 22, 2023, 11:23:33 PM
    Author     : xJuanDa
--%>

<%@page import="ModeloVO.RolVO"%>
<%@page import="ModeloDAO.RolDAO"%>
<%@page import="ModeloVO.PerRolVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Actualizar Persona Rol</h2>
        <%
            PerRolVO prVO = (PerRolVO) request.getAttribute("personaEncontrada");

            if (prVO != null) {
        %>
        <form method="post" action="PersonaRol">
            <label for="PRID">Codigo de registro:</label>
            <input type="text" name="PRID" required maxlength=20 value="<%=prVO.getPRID()%>">   
            <label for="prPersona">Documento de persona:</label>
            <input type="text" name="prPersona" required maxlength=30 value="<%=prVO.getPRPersona()%>">
            <select name="prRol">
                <option>Seleccione...</option>
                <%
                    RolDAO rolDAO = new RolDAO();
                    for (RolVO rolVO : rolDAO.listarRol()) {
                %>
                <option value="<%=rolVO.getRolId()%>"><%=rolVO.getRolNombre()%></option>
                <% } %>
            </select>          
            <input type="submit" value="Actualizar">
            <input type="reset" value="Limpiar">
            <input type="hidden" name="opcion" value="2">
        </form>
        <a href="indexPersonaRol.jsp">
            <button class="btn btn-primary">Volver</button>
        </a>
        <%}%>
        <%
                if (request.getAttribute("MensajeError") != null) {%>
        ${MensajeError}
        <% } else {%>
        ${MensajeExito}
        <% }
        %>
    </body>
</html>
