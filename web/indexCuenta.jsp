<%-- 
    Document   : consultarCuenta
    Created on : 21/03/2023, 09:57:26 PM
    Author     : jpgar
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.CuentaDAO"%>
<%@page import="ModeloVO.CuentaVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar cuenta</title>
        
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    </head>
    <body>        
        <h2>Cuenta</h2>
        <form method="post" action="Cuenta">
            <label>Codigo: </label>
            <input type="text" name="CuNumero">
            <input type="submit" value="Consultar">
            <input type="hidden" name="opcion" value="4">
        </form>
        <a href="registrarCuenta.jsp">
            <button class="btn btn-success">Agregar cuenta</button>
        </a> 

        <%            if (request.getAttribute("MensajeError") != null) { %>
        ${MensajeError}
        <%  } else { %>
        ${MensajeExito}
        <%  }
        %>       
            <table class="table"><br>
                <tr>
                    <th>Codigo</th>
                    <th>Fecha registro</th>
                    <th>Estado</th>
                    <th>Persona</th>
                    <th>Acciones</th>
                </tr>
                <%
                    CuentaVO cuVO = new CuentaVO();
                    CuentaDAO cuDAO = new CuentaDAO();
                    ArrayList<CuentaVO> listaCuenta = cuDAO.listarCuenta();
                    for (int i = 0; i < listaCuenta.size(); i++) {
                        cuVO = listaCuenta.get(i);
                %>
                <tr>
                    <td><%=cuVO.getCuNumero()%></td>
                    <td><%=cuVO.getCuFechaRegistro()%></td>
                    <td><%=cuVO.getCuEstado()%></td>
                    <td><%=cuVO.getCuPersona()%></td> 
                    <td>
                        <form method="post" action="Cuenta">
                            <input type="hidden" name="CuNumero" value="<%=cuVO.getCuNumero()%>">
                            <button class="btn btn-warning" name="opcion" value="4" >Editar</button>
                            <button class="btn btn-danger" name="opcion" value="3" onclick="return confirmar()">Eliminar</button>
                        </form>
                    </td>
                </tr>
                <% }%>
            </table>        
    </body>
</html>
