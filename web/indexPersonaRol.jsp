<%-- 
    Document   : indexPersonaRol
    Created on : Mar 22, 2023, 11:17:09 PM
    Author     : xJuanDa
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.PerRolDAO"%>
<%@page import="ModeloVO.PerRolVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Persona Rol</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" >
    </head>
    <body>        
        <h2>Persona rol</h2>
        <form method="post" action="PersonaRol">
            <label>Codigo: </label>
            <input type="text" name="PRID">
            <input type="submit" value="Consultar">
            <input type="hidden" name="opcion" value="3">
        </form>
        <%
            if (request.getAttribute("MensajeError") != null) { %>
        ${MensajeError}
        <%  } else { %>
        ${MensajeExito}
        <%  }
        %>        
        <table class="table"><br>
                <tr>
                    <th>Codigo</th>
                    <th>Persona</th>
                    <th>Rol</th>  
                    <th>Acciones</th>
                </tr>
                <%
                    PerRolVO prVO = new PerRolVO();
                    PerRolDAO prDAO = new PerRolDAO();
                    ArrayList<PerRolVO> listaPersonaRol = prDAO.listar();
                    for (int i = 0; i < listaPersonaRol.size(); i++) {
                        prVO = listaPersonaRol.get(i);
                %>
                <tr>
                    <td><%=prVO.getPRID()%></td>
                    <td><%=prVO.getPRPersona()%></td>
                    <td><%=prVO.getPRRol()%></td>  
                    <td>
                    <form method="post" action="PersonaRol">
                        <input type="hidden" name="PRID" value="<%=prVO.getPRID()%>">
                        <button class="btn btn-warning" name="opcion" value="3" >Editar</button>
                        <button class="btn btn-danger" name="opcion" value="4" onclick="return confirmar()">Eliminar</button>
                    </form>
                </td>
                </tr>
                <% }%>
            </table>
        
    </body>
</html>
