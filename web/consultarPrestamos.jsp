<%-- 
    Document   : consultarPrestamos
    Created on : 21/03/2023, 03:25:19 PM
    Author     : APRENDIZ
--%>

<%@page import="ModeloDAO.PrestamosDAO"%>
<%@page import="ModeloVO.PrestamosVO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cosultar Prestamos</title>
    </head>
    <body>
        <h2>Prestamos</h2>
        <form method="post" action="Prestamo">
            <label>Codigo: </label>
            <input type="text" name="PreId">
            <input type="submit" value="Consultar">
            <input type="hidden" name="opcion" value="4">
        </form>
        <%
            if (request.getAttribute("MensajeError") != null) { %>
        ${MensajeError}
        <%  } else { %>
        ${MensajeExito}
        <%  }
        %>
        <form method="post" action="Prestamo">
            <table border="1"><br>
                <tr>
                    <th>CODIGO</th>
                    <th>FECHA INICIO</th>
                    <th>FECHA FIN</th>
                    <th>CUOTAS</th>
                    <th>MONTO</th>
                    <th>INTERESES</th>
                    <th>CUENTA</th>
                </tr>
                <%
                    PrestamosVO presVO = new PrestamosVO();
                    PrestamosDAO presDAO = new PrestamosDAO();
                    ArrayList<PrestamosVO> listarPrestamos = presDAO.listarPrestamos();
                    for (int i = 0; i < listarPrestamos.size(); i++) {
                        presVO = listarPrestamos.get(i);
                %>
                <tr>
                    <td><%=presVO.getPreId()%></td>
                    <td><%=presVO.getPreFechaInicio()%></td>
                    <td><%=presVO.getPreFechaFin()%></td>
                    <td><%=presVO.getPreCuotas()%></td>
                    <td><%=presVO.getPreMonto()%></td>
                    <td><%=presVO.getPreInteres()%></td>
                    <td><%=presVO.getPreCuenta()%></td>
                </tr>
                <% }%>
            </table>
        </form>
    </body>
</html>
