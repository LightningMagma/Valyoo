<%-- 
    Document   : actualizarRol
    Created on : Mar 20, 2023, 9:11:09 PM
    Author     : xJuanDa
--%>

<%@page import="ModeloVO.RolVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Rol</title>
        <link href="Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Actualizar rol</h2>
        <% 
           RolVO rolVO = (RolVO)request.getAttribute("rolEncontrado");
           if(rolVO!=null){
        %>
        <form method="post" action="Rol">
            <label for="rolNombre">ID rol</label>
            <input type="text" name="rolId" required maxlength=20 placeholder="Ingrese el nombre del rol" value="<%=rolVO.getRolId()%>">           
            <label for="rolNombre">Nombre del rol:</label>
            <input type="text" name="rolNombre" required maxlength=20 placeholder="Ingrese el nombre del rol" value="<%=rolVO.getRolNombre()%>">  
            <label for="rolEstado">Estado del rol</label>
            <input type="text" name="rolEstado" required maxlength=20 placeholder="Ingrese el nombre del rol" value="<%=rolVO.getRolEstado()%>">   
            <input type="submit" value="Actualizar">           
            <input type="hidden" name="opcion" value="2">
        </form>
            
            <%
                }%>
                <%
            if (request.getAttribute("MensajeError") != null) { %>
            ${MensajeError}
            <%} else {%>
            ${MensajeExito}
            <%}
            %>
            <a href="listarRol.jsp">Volver</a>
    </body>
</html>
