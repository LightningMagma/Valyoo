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
        <link href="Estilos/formularioConsulta.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="formularioConsulta">
            <h3 class="title-5 m-b-35">Solicitud</h3>
            <form method="post" action="Solicitud">
                <table class="table">
                    <tr>
                        <th>
                            Id de la solicitud:
                            <input type="text" name="solId" placeholder="Ingrese ID de la solicitud" id="myInput" onkeyup="myFunction()" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1')">
                            <input type="submit" class="au-btn au-btn-icon au-btn--green au-btn--small" value="Consultar">               
                            <input type="hidden" name="opcion" value="4">  
                        </th>
                    </tr>
                </table>               

            </form>

            <div class="table-data__tool">
                <div class="table-data__tool-right">
                    <a href="registrarSolicitud.jsp">
                        <button class="au-btn au-btn-icon au-btn--green au-btn--small">
                            <i class="zmdi zmdi-plus"></i>Agregar solicitud</button>
                    </a>
                </div>
            </div>
            <%if (request.getAttribute("MensajeError") != null) { %>
            <div class="alert alert-danger" role="alert">
                ${MensajeError}
            </div>            
            <%  } else { %>
            <div class="alert alert-success" role="alert">
                ${MensajeExito}
            </div>            
            <%}%>
            <table class="table table-data2" id="myTable">
                <tr>
                    <th>Id Solicitud</th>
                    <th>Monto</th>
                    <th>Cuotas</th>  
                    <th>Estado</th> 
                    <th>Persona</th>  
                    <th></th>
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
                            <button class="btn btn-danger" name="opcion" value="3" onclick="return confirmar()">Cambiar Estado</button>
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
    </body>
</html>
