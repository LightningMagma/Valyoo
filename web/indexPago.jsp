<%-- 
    Document   : consultarPago
    Created on : 19/03/2023, 01:35:54 PM
    Author     : jpgar
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.PagoDAO"%>
<%@page import="ModeloVO.PagoVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Pago</title>
        <link href="Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Pago</h2>
        <form method="post" action="Pago">
            <label>Codigo: </label>
            <input type="text" name="PagId">
            <input type="submit" value="Consultar">
            <input type="hidden" name="opcion" value="4">
        </form>
        <%            if (request.getAttribute("MensajeError") != null) { %>
        ${MensajeError}
        <%  } else { %>
        ${MensajeExito}
        <%  }
        %>
        <form method="post" action="Pago">
            <table border="1"><br>
                <tr>
                    <th>Codigo</th>
                    <th>Descripcion</th>
                    <th>Valor</th>
                    <th>Prestamo abonado</th>
                    <th>Fecha</th>
                    <th>Acciones</th>
                </tr>
                <%
                    PagoVO pagVO = new PagoVO();
                    PagoDAO pagDAO = new PagoDAO();
                    ArrayList<PagoVO> listaPago = pagDAO.listarPago();
                    for (int i = 0; i < listaPago.size(); i++) {
                        pagVO = listaPago.get(i);
                %>
                <tr>
                    <td><%=pagVO.getPagId()%></td>
                    <td><%=pagVO.getPagDesc()%></td>
                    <td><%=pagVO.getPagValor()%></td>
                    <td><%=pagVO.getPagFecha()%></td>
                    <td><%=pagVO.getPagPres()%></td>
                    <td>
                        <form method="post" action="Pago">
                            <input type="hidden" name="PagId" value="<%=pagVO.getPagId()%>">
                            <button class="btn btn-warning" name="opcion" value="4" >Editar</button>
                            <button class="btn btn-danger" name="opcion" value="3" onclick="return confirmar()">Eliminar</button>
                        </form>
                    </td>
                </tr>
                <% }%>
            </table>
        </form>
    </body>
</html>
