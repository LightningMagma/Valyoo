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
    </head>
    <body>
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
              
               
            %>
            <tr>
                <td> </td>
                <td> </td>
                <td> </td>                
            </tr>
            <%
            %>
        </table>
    </body>
</html>
