<%-- 
    Document   : consultarPersona
    Created on : 22/03/2023, 01:25:16 PM
    Author     : Miguel Gil
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.PersonaDAO"%>
<%@page import="ModeloVO.PersonaVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Personas</title>
        <link href="Estilos/formularioConsulta.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="formularioConsulta">
            <h3 class="title-5 m-b-35">Personas</h3> 
            <form method="post" action="Persona">
                <table class="table">
                    <tr>
                        <th>
                            Documento persona:
                            <input type="text" name="perDocumento" id="myInput" onkeyup="myFunction()" placeholder="Ingrese número de documento" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1')" >
                            <input type="submit" class="au-btn au-btn-icon au-btn--green au-btn--small" value="Consultar">
                            <input type="hidden" name="opcion" value="3">  
                        </th>
                    </tr>
                </table>

            </form>
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
            <div class="table-data__tool">
                <div class="table-data__tool-right">
                    <a href="registrarPersona.jsp">
                        <button class="au-btn au-btn-icon au-btn--green au-btn--small">
                            <i class="zmdi zmdi-plus"></i>Agregar persona</button>
                    </a>
                </div>
            </div>
            <table class="table table-data2" id="myTable"><br>              
                    <tr >
                        <th >Documento</th>
                        <th>Tipo de documento</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Correo</th>
                        <th>Teléfono</th>
                        <th>Dirección</th>
                        <th>Sede</th>
                        <th>Estado</th>
                        <th></th>
                    <tr class="spacer"></tr>
                    </tr>                    
               
                <%
                    PersonaVO perVO = new PersonaVO();
                    PersonaDAO perDAO = new PersonaDAO();
                    ArrayList<PersonaVO> personaLista = perDAO.listar();
                    for (int i = 0; i < personaLista.size(); i++) {
                        perVO = personaLista.get(i);
                %>
                
                    <tr class="tr-shadow" >
                        <td> <%=perVO.getPerDocumento()%> </td>
                        <td> <%=perVO.getPerTipoDocumento()%> </td>
                        <td> <%=perVO.getPerNombre()%> </td>
                        <td> <%=perVO.getPerApellido()%> </td>
                        <td> <%=perVO.getPerCorreo()%> </td>
                        <td> <%=perVO.getPerTelefono()%> </td>
                        <td> <%=perVO.getPerDireccion()%> </td>
                        <td> <%=perVO.getPerSede()%> </td>
                        <td> <%=perVO.getPerEstado()%> </td>
                        <td>
                            <form method="post" action="Persona">
                                <input type="hidden" name="perDocumento" value="<%=perVO.getPerDocumento()%>">
                                <button class="btn btn-warning" name="opcion" value="3" >Editar</button>
                                <button class="btn btn-danger" name="opcion" value="5" onclick="return confirmarCambioEstado()">Cambiar Estado</button>
                            </form>
                        </td>
                    </tr>                                 
               
                <% }%>
            </table>

        </div>
    </body>
</html>
