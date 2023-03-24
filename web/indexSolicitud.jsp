<%-- 
    Document   : listarSolicitud
    Created on : Mar 20, 2023, 10:26:58 PM
    Author     : xJuanDa
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.SolicitudDAO"%>
<%@page import="ModeloVO.SolicitudVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar solicitud</title>        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <h2>Solicitud</h2>
        <form method="post" action="Solicitud">
            <label for="solId">Id de la solicitud</label>
            <input type="text" name="solId" placeholder="Ingrese ID de la solicitud">
            <input type="submit" class="au-btn au-btn-icon au-btn--green au-btn--small" value="Consultar solicitud">               
            <input type="hidden" name="opcion" value="4">
        </form>
        <a href="registrarSolicitud.jsp">
            <button class="btn btn-success">Agregar solicitud</button>
        </a> 
        <div class="table-data__tool">
                <div class="table-data__tool-right">
                    <a href="registrarSolicitud.jsp">
                        <button class="au-btn au-btn-icon au-btn--green au-btn--small">
                            <i class="zmdi zmdi-plus"></i>Agregar solicitud</button>
                    </a>
                </div>
            </div>
        <%

            if (request.getAttribute("mensajeError") != null) {%>
        ${mensajeError}

        <%} else {%>
        ${mensajeExito}
        <%}%>
        <table class="table table-data2">
            <tr>
                <th>Id Solicitud</th>
                <th>Monto</th>
                <th>Cuotas</th>  
                <th>Estado</th> 
                <th>Persona</th>  
                <th>Acciones</th>
            </tr>
            <%
                SolicitudVO solVO = new SolicitudVO();
                SolicitudDAO solDAO = new SolicitudDAO();
                ArrayList<SolicitudVO> listaSolicitud = solDAO.listarUsuarios();
                for (int i = 0; i < listaSolicitud.size(); i++) {
                    solVO = listaSolicitud.get(i);

            %>
            <tr class="tr-shadow">
                <td><%=solVO.getSolId()%> </td>
                <td><%=solVO.getSolMonto()%></td>
                <td><%=solVO.getSolCuotas()%></td>   
                <td><%=solVO.getSolEstado()%> </td>  
                <td><%=solVO.getSolPersona()%></td>  
                <td>
                        <form method="post" action="Solicitud">
                            <input type="hidden" name="solId" value="<%=solVO.getSolId()%>">
                            <button class="btn btn-warning" name="opcion" value="4" >Editar</button>
                            <button class="btn btn-danger" name="opcion" value="3" onclick="return confirmar()">Eliminar</button>
                        </form>
                    </td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
