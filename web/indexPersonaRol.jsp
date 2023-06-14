<%-- 
    Document   : indexPersonaRol
    Created on : Mar 22, 2023, 11:17:09 PM
    Author     : xJuanDa
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.PerRolDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Persona Rol</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" >
        <link href="Estilos/formularioConsulta.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>   
        <div class="formularioConsulta">
            <h3 class="title-5 m-b-35">Persona rol</h3>
            <form method="post" action="PersonaRol">
                <label>Codigo: </label>
                <input type="text" name="PRID" placeholder="Ingrese el ID de registro" id="myInput" onkeyup="myFunction()" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1')">
                <input type="submit" value="Consultar" class="au-btn au-btn-icon au-btn--green au-btn--small" >
                <input type="hidden" name="opcion" value="3">
            </form>
            <div class="table-data__tool">
                <div class="table-data__tool-right">
                    <a href="agregarPersonaRol.jsp">
                        <button class="au-btn au-btn-icon au-btn--green au-btn--small">
                            <i class="zmdi zmdi-plus"></i>Asignar persona rol</button>
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
                    <th>Persona</th>
                    <th>Rol</th>  
                    <th></th>
                </tr>
                <%  
                    PerRolVO perRolVO = new PerRolVO();
                    PerRolDAO perRolDAO = new PerRolDAO();
                    ArrayList<PerRolVO> listarPersonaRol = perRolDAO.listar();
                    for (int i = 0; i < listarPersonaRol.size(); i++) {
                        perRolVO = listarPersonaRol.get(i);
                %>
                <tr class="tr-shadow">
                    <td><%=perRolVO.getPRID()%></td>
                    <td><%=perRolVO.getPRPersona()%></td>
                    <td><%=perRolVO.getPRRol()%></td>  
                    <td>
                        <form method="post" action="PersonaRol">
                            <input type="hidden" name="PRID" value="<%=perRolVO.getPRID()%>">
                            <button class="btn btn-warning" name="opcion" value="3" >Editar</button>
                            <button class="btn btn-danger" name="opcion" value="4" onclick="return confirmar()">Eliminar</button>
                        </form>
                    </td>
                </tr>
                <% }%>
            </table>
        </div>
    </body>
</html>
