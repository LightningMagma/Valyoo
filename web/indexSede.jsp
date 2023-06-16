<%-- 
    Document   : consultarSede
    Created on : 22/03/2023, 09:38:33 PM
    Author     : Miguel Gil
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.SedeDAO"%>
<%@page import="ModeloVO.SedeVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Estilos/logoValyoo.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Sede</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link href="Estilos/formularioConsulta.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>  
        <div class="formularioConsulta">
            <h3 class="title-5 m-b-35">Sedes</h3>
            <form method="post" action="Sede">
                <table class="table">
                    <tr>
                        <th>
                            Nombre sede:
                            <input type="text" id="myInput" onkeyup="myFunction()" name="sedeId" placeholder="Ingrese nombre de sede" maxlength="20" oninput="this.value = this.value.replace(/[^A-Za-z ]/g, '').replace(/(\..*)\./g, '$1')" >
                            <input type="submit" value="Consultar" class="au-btn au-btn-icon au-btn--green au-btn--small">
                        </th>
                    </tr>
                </table>
                <input type="hidden" name="opcion" value="3">            
            </form>       
            <div class="table-data__tool">
                <div class="table-data__tool-right">
                    <a href="registrarSede.jsp">
                        <button class="au-btn au-btn-icon au-btn--green au-btn--small">
                            <i class="zmdi zmdi-plus"></i>Agregar sede</button>
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
                    <th>Nombre</th>
                    <th>Dirección</th>
                    <th>Teléfono</th>
                    <th>Estado</th>
                    <th></th>
                </tr>
                <%
                    SedeVO sedeVO = new SedeVO();
                    SedeDAO sedeDAO = new SedeDAO();
                    ArrayList<SedeVO> sedeLista = sedeDAO.listar();
                    for (int i = 0; i < sedeLista.size(); i++) {
                        sedeVO = sedeLista.get(i);
                %>
                <tr class="tr-shadow">                    
                    <td> <%=sedeVO.getSedeNombre()%> </td>
                    <td> <%=sedeVO.getSedeDireccion()%> </td>
                    <td> <%=sedeVO.getSedeTelefono()%> </td>
                    <td> <%=sedeVO.getSedeEstado()%> </td>
                    <td>
                        <form method="post" action="Sede">
                            <input type="hidden" name="sedeId" value="<%=sedeVO.getSedeId()%>">
                            <button class="btn btn-warning" name="opcion" value="3" >Editar</button>
                            <button class="btn btn-danger" name="opcion" value="4" onclick="return confirmarCambioEstado()">Cambiar Estado</button>
                        </form>
                    </td>
                </tr>
                <%}%>
            </table>

        </div>
    </body>
</html>
