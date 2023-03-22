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
        
    </head>
    <body>
        <h2>Personas:</h2>
        <form method="post" action="Persona">
            <table class="table">
                <tr>
                    <th>
                        Documento
                        <input type="text" name="perDocumento" >
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
                <th>Acciones</th>
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
                <td>
                    <form method="post" action="Persona">
                        <input type="hidden" name="perDocumento" value="<%=perVO.getPerDocumento()%>">
                        <button class="btn btn-warning" name="opcion" value="3" >Editar</button>
                        <button class="btn btn-danger" name="opcion" value="4" onclick="return confirmar()">Eliminar</button>
                    </form>
                </td>
            </tr>
            <%}%>
        </table>

   
    <script>
        function confirmar(){
            var respuesta=confirm("¿Desea eliminar el registro");
            if(respuesta==true){
                return true;
            }else{
                return false;
            }
            
        }
    </script>
    

    </body>
</html>
