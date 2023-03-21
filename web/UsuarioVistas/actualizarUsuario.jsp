<%-- 
    Document   : actualizarUsuario
    Created on : Mar 20, 2023, 10:13:07 PM
    Author     : xJuanDa
--%>

<%@page import="ModeloVO.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar usuario</title>
        <link href="Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
         <h2>Actualizar usuario</h2>
        <% 
           UsuarioVO usuVO = (UsuarioVO)request.getAttribute("usuarioEncontrado");
           if(usuVO!=null){
        %>
        <form method="post" action="Usuario">
            <label for="usuUsuario">Usuario:</label>
            <input type="text" name="usuUsuario" required maxlength=20 value="<%=usuVO.getUsuUsuario()%>">           
            <label for="rolContrasena">Contraseña:</label>
            <input type="text" name="usuContrasena" required maxlength=20 value="<%=usuVO.getUsuContrasena()%>">  
            <label for="usuEstado">Estado del rol</label>
            <input type="text" name="usuEstado" required maxlength=20 value="<%=usuVO.getUsuEstado()%>">   
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
            <a href="listarUsuarios.jsp">Volver</a>
    </body>
</html>
