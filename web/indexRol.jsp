<%-- 
    Document   : listarRol
    Created on : 17/03/2023, 04:47:33 PM
    Author     : APRENDIZ
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.RolDAO"%>
<%@page import="ModeloVO.RolVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de roles</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link href="Estilos/formularioConsulta.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="formularioConsulta">
            <h3 class="title-5 m-b-35">Roles</h3>
            <form method="post" action="Rol">               

                <table class="table">
                    <tr>
                        <th>
                            Nombre rol:
                            <input type="text" name="rolId" placeholder="Ingrese nombre del rol" id="myInput" onkeyup="myFunction()" oninput="this.value = this.value.replace(/^([0-9]+)@([\da-z\.-]+)\.([a-z\.]/g, '').replace(/(\..*)\./g, '$1')">
                            <input type="hidden" name="opcion" value="4">
                        </th>
                    </tr>
                </table> 
            </form>       
            <div class="table-data__tool">
                <div class="table-data__tool-right">
                    <a href="registrarRol.jsp">
                        <button class="au-btn au-btn-icon au-btn--green au-btn--small">
                            <i class="zmdi zmdi-plus"></i>Agregar rol</button>
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
                    <th>Nombre de rol</th>
                    <th>Estado del rol</th>     
                    <th></th>
                </tr>
                <%
                    RolVO rolVO = new RolVO();
                    RolDAO rolDAO = new RolDAO();
                    ArrayList<RolVO> listaRol = rolDAO.listarRol();
                    for (int i = 0; i < listaRol.size(); i++) {
                        rolVO = listaRol.get(i);

                %>
                <tr class="tr-shadow">                   
                    <td><%=rolVO.getRolNombre()%> </td>
                    <td><%=rolVO.getRolEstado()%> </td>   
                    <td>
                        <form method="post" action="Rol">
                            <input type="hidden" name="rolId" value="<%=rolVO.getRolId()%>">
                            <button class="btn btn-warning" name="opcion" value="4" >Editar</button>
                            <button class="btn btn-danger" name="opcion" value="3" onclick="return confirmarCambioEstado()">Cambiar Estado</button>
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
