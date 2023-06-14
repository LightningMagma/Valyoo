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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" >
        <link href="Estilos/formularioConsulta.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="formularioConsulta">
            <h3 class="title-5 m-b-35">Pago</h3>
            <form method="post" action="Pago">
                <label>Codigo: </label>
                <input type="text" name="PagId" placeholder="Ingrese el ID del pago" id="myInput" onkeyup="myFunction()" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1')">
                <input type="submit" class="au-btn au-btn-icon au-btn--green au-btn--small"  value="Consultar">
                <input type="hidden" name="opcion" value="4">
            </form>
            <div class="table-data__tool">
                <div class="table-data__tool-right">
                    <a href="registrarPago.jsp">
                        <button class="au-btn au-btn-icon au-btn--green au-btn--small">
                            <i class="zmdi zmdi-plus"></i>Agregar pago</button>
                    </a>                    
                </div>
                <form method="post" action="Generador_Reporte.jsp" target="_blank">
                    <input type="submit"  class="btn btn-primary btn-lg" value="Generar reporte de pagos">
                </form>
            </div>         
            <%            if (request.getAttribute("MensajeError") != null) { %>
            <div class="alert alert-danger" role="alert">
                ${MensajeError}
            </div>            
            <%  } else { %>
            <div class="alert alert-success" role="alert">
                ${MensajeExito}
            </div>            
            <%  }
            %> 
            <table class="table table-data2" id="myTable">
                <tr>
                    <th>Codigo</th>
                    <th>Descripcion</th>
                    <th>Valor</th>
                    <th>Deudor</th>
                    <th>Fecha</th>
                    <th></th>
                </tr>
                <%
                    PagoVO pagVO = new PagoVO();
                    PagoDAO pagDAO = new PagoDAO();
                    ArrayList<PagoVO> listaPago = pagDAO.listarPago();
                    for (int i = 0; i < listaPago.size(); i++) {
                        pagVO = listaPago.get(i);
                %>
                <tr class="tr-shadow">
                    <td><%=pagVO.getPagId()%></td>
                    <td><%=pagVO.getPagDesc()%></td>
                    <td><%=pagVO.getPagValor()%></td>
                    <td><%=pagVO.getPagPres()%></td>
                    <td><%=pagVO.getPagFecha()%></td>
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
        </div>
    </body>
</html>
