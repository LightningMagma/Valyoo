<%-- 
    Document   : listarUsuarios
    Created on : Mar 20, 2023, 9:59:39 PM
    Author     : xJuanDa
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.UsuarioDAO"%>
<%@page import="ModeloVO.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar usuarios</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link href="Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
         <h2>Usuarios</h2>
        <form method="post" action="Usuario">

            <label for="usuUsuario">Usuario ID</label>
            <input type="text" name="usuUsuario" placeholder="Ingrese ID del usuario">
            <input type="submit" value="Consultar usuario">               
            <input type="hidden" name="opcion" value="5">
        </form>
        <%

            if (request.getAttribute("mensajeError") != null) {%>
        ${mensajeError}

        <%} else {%>
        ${mensajeExito}
        <%}%>
        <table class="table">
            <tr>
                <th>Usuario</th>
                <th>Contraseña</th>
                <th>Estado del usuario</th>                
            </tr>
            <%
                UsuarioVO usuVO = new UsuarioVO();
                UsuarioDAO usuDAO = new UsuarioDAO();
                ArrayList<UsuarioVO> listaUsuarios = usuDAO.listarUsuarios();
                for (int i = 0; i < listaUsuarios.size(); i++) {
                    usuVO = listaUsuarios.get(i);

            %>
            <tr>
                <td><%=usuVO.getUsuUsuario()%> </td>
                <td><%=usuVO.getUsuContrasena()%> </td>
                <td><%=usuVO.getUsuEstado()%> </td>                
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
