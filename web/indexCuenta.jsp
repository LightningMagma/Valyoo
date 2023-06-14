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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" >
        <link href="Estilos/formularioConsulta.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>  
        <div class="formularioConsulta">
            <h3 class="title-5 m-b-35">Cuentas </h3>        
            <form method="post" action="Cuenta">
                <table class="table">
                    <tr>
                        <th class="buscador-consulta">
                            <label>Codigo: </label>
                            <input class="cuadro-busqueda" type="text" name="CuNumero" placeholder="Ingrese numero de cuenta que desea" id="myInput" onkeyup="myFunction()" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1')">
                            <input type="submit" class="au-btn au-btn-icon au-btn--green au-btn--small" value="Consultar">
                            <input type="hidden" name="opcion" value="4">
                        </th>
                    </tr>
                </table>
            </form>
            <div class="table-data__tool">
                <div class="table-data__tool-right">
                    <a href="registrarCuenta.jsp">
                        <button class="au-btn au-btn-icon au-btn--green au-btn--small">
                            <i class="zmdi zmdi-plus"></i>Agregar cuenta</button>
                    </a>
                </div>
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
            <table class="table table-data2" id="myTable"><br>
                <tr>
                    <th>Codigo</th>
                    <th>Fecha registro</th>
                    <th>Estado</th>
                    <th>Titular</th>
                    <th></th>
                <tr class="spacer"></tr>
                </tr>
                <%
                    CuentaVO cuVO = new CuentaVO();
                    CuentaDAO cuDAO = new CuentaDAO();
                    ArrayList<CuentaVO> listaCuenta = cuDAO.listarCuenta();
                    for (int i = 0; i < listaCuenta.size(); i++) {
                        cuVO = listaCuenta.get(i);
                %>
                <tr class="tr-shadow">
                    <td><%=cuVO.getCuNumero()%></td>
                    <td><%=cuVO.getCuFechaRegistro()%></td>
                    <td><%=cuVO.getCuEstado()%></td>
                    <td><%=cuVO.getCuPersona()%></td> 
                    <td>
                        <form method="post" action="Cuenta">
                            <input type="hidden" name="CuNumero" value="<%=cuVO.getCuNumero()%>">
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
