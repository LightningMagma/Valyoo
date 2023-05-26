<%-- 
    Document   : consultarPrestamos
    Created on : 21/03/2023, 03:25:19 PM
    Author     : APRENDIZ
--%>

<%@page import="ModeloDAO.PrestamosDAO"%>
<%@page import="ModeloVO.PrestamosVO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Prestamos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" >
        <link href="Estilos/formularioConsulta.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="formularioConsulta">
        <h3 class="title-5 m-b-35">Prestamos</h3>
        <form method="post" action="Prestamo">
            <label>Codigo: </label>
            <input type="text" name="PreId">
            <input type="submit" class="au-btn au-btn-icon au-btn--green au-btn--small" value="Consultar">
            <input type="hidden" name="opcion" value="4">
        </form>
        <div class="table-data__tool">
            <div class="table-data__tool-right">
                <a href="registrarPrestamos.jsp">
                    <button class="au-btn au-btn-icon au-btn--green au-btn--small">
                        <i class="zmdi zmdi-plus"></i>Agregar prestamo</button>
                </a>
            </div>
        </div>
        <%            if (request.getAttribute("MensajeError") != null) { %>
        ${MensajeError}
        <%  } else { %>
        ${MensajeExito}
        <%  }
        %>
        <table class="table table-data2"><br>
            <tr>
                <th>Codigo</th>
                <th>Fecha inicio</th>
                <th>Fecha fin</th>
                <th>Cuotas</th>
                <th>Monto</th>
                <th>Estado</th>
                <th>Deudor</th>
                <th>Acciones</th>
            </tr>
            <%
                PrestamosVO presVO = new PrestamosVO();
                PrestamosDAO presDAO = new PrestamosDAO();
                ArrayList<PrestamosVO> listarPrestamos = presDAO.listarPrestamos();
                for (int i = 0; i < listarPrestamos.size(); i++) {
                    presVO = listarPrestamos.get(i);
            %>
            <tr class="tr-shadow">
                <td><%=presVO.getPreId()%></td>
                <td><%=presVO.getPreFechaInicio()%></td>
                <td><%=presVO.getPreFechaFin()%></td>
                <td><%=presVO.getPreCuotas()%></td>
                <td><%=presVO.getPreMonto()%></td>
                <td><%=presVO.getPreEstado()%></td>
                <td><%=presVO.getPreCuenta()%></td>
                <td>
                    <form method="post" action="Prestamo">
                        <input type="hidden" name="PreId" value="<%=presVO.getPreId()%>">
                        <button class="btn btn-warning" name="opcion" value="4" >Editar</button>
                        <button class="btn btn-danger" name="opcion" value="3" onclick="return confirmar()">Cambiar Estado</button>
                    </form>
                </td>
            </tr>
            <% }%>
        </table>
        </div>
    </body>
</html>
