<%-- 
    Document   : consultarPersona
    Created on : 22/03/2023, 01:25:16 PM
    Author     : Miguel Gil
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.PersonaDAO"%>
<%@page import="ModeloVO.PersonaVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Personas</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link href="Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Personas:</h2>
        <form method="post" action="Persona">
            <table class="table">
                <tr>
                    <th>
                        Documento
                        <input type="text" name="perDocumento">
                        <input type="submit" value="Buscar">
                    </th>
                </tr>
            </table>
            <input type="hidden" name="opcion" value="3">
        </form>

        <%
            if (request.getAttribute("mensajeError") != null) {%>
        ${mensajeError}
        <% } else {%>
        ${mensajeExito}
        <% }
        %>



        <table class="table">
            <tr>
                <th>Documento</th>
                <th>Tipo de documento</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Telefono</th>
                <th>Direccion</th>
                <th>Sede</th>
                <th>Estado</th>
            </tr>
            <%
                PersonaVO perVO = new PersonaVO();
                PersonaDAO perDAO = new PersonaDAO();
                ArrayList<PersonaVO> personaLista = perDAO.listar();
                for (int i = 0; i < personaLista.size(); i++) {
                    perVO = personaLista.get(i);
            %>
            <tr>
                <td> <%=perVO.getPerDocumento()%> </td>
                <td> <%=perVO.getPerTipoDocumento()%> </td>
                <td> <%=perVO.getPerNombre()%> </td>
                <td> <%=perVO.getPerApellido()%> </td>
                <td> <%=perVO.getPerTelefono()%> </td>
                <td> <%=perVO.getPerDireccion()%> </td>
                <td> <%=perVO.getPerSede()%> </td>
                <td> <%=perVO.getPerEstado()%> </td>
            </tr>
            <%}%>
        </table>



    </body>
</html>
