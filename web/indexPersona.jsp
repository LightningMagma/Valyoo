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


    </head>
    <body>
        <div class="col-md-12">
            <h3 class="title-5 m-b-35">Personas</h3> 
            <form method="post" action="Persona">
                <table class="table">
                    <tr>
                        <th>
                            Documento
                            <input type="text" name="perDocumento">
                            <input type="submit" class="au-btn au-btn-icon au-btn--green au-btn--small" value="Consultar">
                            <input type="hidden" name="opcion" value="3">  
                        </th>
                    </tr>
                </table>

            </form>
            <%            if (request.getAttribute("mensajeError") != null) {%>
            <h1 class="title-5 m-b-35">${mensajeError}</h1>
            <% } else {%>
            <h1 class="title-5 m-b-35">${mensajeExito}</h1>
            <% }
            %>
            <div class="table-data__tool">
                <div class="table-data__tool-right">
                    <a href="registrarPersona.jsp">
                        <button class="au-btn au-btn-icon au-btn--green au-btn--small">
                            <i class="zmdi zmdi-plus"></i>Agregar persona</button>
                    </a>
                </div>
            </div>
            <table class="table table-data2">
                <thead>
                    <tr>
                        <th>Documento</th>
                        <th>Tipo de documento</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Correo</th>
                        <th>Teléfono</th>
                        <th>Dirección</th>
                        <th>Sede</th>
                        <th>Estado</th>
                    </tr>
                    <tr class="spacer"></tr>
                </thead>
                <%
                    PersonaVO perVO = new PersonaVO();
                    PersonaDAO perDAO = new PersonaDAO();
                    ArrayList<PersonaVO> personaLista = perDAO.listar();
                    for (int i = 0; i < personaLista.size(); i++) {
                        perVO = personaLista.get(i);
                %>
                <tbody>
                    <tr class="tr-shadow">
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
                                <button class="btn btn-danger" name="opcion" value="5" onclick="return confirmar()">Eliminar</button>
                            </form>
                        </td>
                    </tr>
                    <tr class="spacer"></tr>                    
                </tbody>
                <% }%>
            </table>

        </div>
    </body>
</html>
