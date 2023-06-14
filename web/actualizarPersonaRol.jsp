<%-- 
    Document   : actualizarPersonaRol
    Created on : Mar 22, 2023, 11:23:33 PM
    Author     : xJuanDa
--%>

<%@page import="ModeloVO.RolVO"%>
<%@page import="ModeloDAO.RolDAO"%>
<%@page import="ModeloVO.PersonaVO"%>
<%@page import="ModeloDAO.PersonaDAO"%>
<%@page import="ModeloVO.PerRolVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar persona rol</title>
        <link href="Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Actualizar Persona Rol</h2>
        <%  
            prVO = (PerRolVO)request.getAttribute("personarolEncontrada");
            if (prVO != null) {
             PersonaDAO perDAO = new PersonaDAO();
             PersonaVO perVO = perDAO.consultarPorDocumento(prVO.getPRPersona());
        %>
        <form method="post" action="PersonaRol">            
            <input type="hidden" name="PRID" required maxlength=20 value="<%=prVO.getPRID()%>">   
            <label for="prPersona">Documento de persona:</label>
            <input type="text" name="prPersona" required maxlength=30 value="<%=prVO.getPRPersona()+" "+perVO.getPerNombre()+" "+perVO.getPerApellido()%>" disabled="">
            <label for="prRol">Seleccione rol:</label>
            <select name="prRol">
                <option>Seleccione...</option>
                <%
                    RolDAO rolDAO = new RolDAO();
                    for (RolVO rolVO : rolDAO.listarRol()) {
                %>
                <option value="<%=rolVO.getRolId()%>"><%=rolVO.getRolNombre()%></option>
                <% } %>
            </select>          
            <input type="submit" class="btn btn-success" value="Actualizar">  
            <a href="indexPersonaRol.jsp">
                <button class="btn btn-primary" type="button">Volver</button>
            </a>
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
    </body>
</html>
