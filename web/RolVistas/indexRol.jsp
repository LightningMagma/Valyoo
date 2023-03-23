<%-- 
    Document   : listarRol
    Created on : 17/03/2023, 04:47:33 PM
    Author     : APRENDIZ
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.RolDAO"%>
<%@page import="ModeloVO.RolVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de roles</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link href="Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Roles</h2>
        <form method="post" action="Rol">
            <label for="RolId">Rol</label>
            <input type="text" name="rolId" placeholder="Ingrese ID rol">
            <input type="submit" value="Consultar Rol">               
            <input type="hidden" name="opcion" value="4">
        </form>
        <%

            if (request.getAttribute("mensajeError") != null) {%>
        ${mensajeError}

        <%} else {%>
        ${mensajeExito}
        <%}%>
        <table class="table">
            <tr>
                <th>ID Rol</th>
                <th>Nombre de rol</th>
                <th>Estado del rol</th>                
            </tr>
            <%
                RolVO rolVO = new RolVO();
                RolDAO rolDAO = new RolDAO();
                ArrayList<RolVO> listaRol = rolDAO.listarRol();
                for (int i = 0; i < listaRol.size(); i++) {
                    rolVO = listaRol.get(i);

            %>
            <tr>
                <td><%=rolVO.getRolId()%> </td>
                <td><%=rolVO.getRolNombre()%> </td>
                <td><%=rolVO.getRolEstado()%> </td>                
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
