<%-- 
    Document   : consultarDocumentos
    Created on : 22/03/2023, 10:16:01 PM
    Author     : Miguel Gil
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.DocumentosDAO"%>
<%@page import="ModeloVO.DocumentosVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Documento</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    </head>
    <body>    
        <div class="col-md-12">
            <h3 class="title-5 m-b-35">Documentos </h3>
            <form method="post" action="Documentos">
                <table class="table">
                    <tr>
                        <th>
                            ID
                            <input type="text" name="docId" >
                            <input type="submit" class="au-btn au-btn-icon au-btn--green au-btn--small" value="Buscar">
                        </th>
                    </tr>
                </table>
                <input type="hidden" name="opcion" value="3">            
            </form>
            <div class="table-data__tool">
                <div class="table-data__tool-right">
                    <a href="registrarDocumentos.jsp">
                        <button class="au-btn au-btn-icon au-btn--green au-btn--small">
                            <i class="zmdi zmdi-plus"></i>Agregar documento</button>
                    </a>
                </div>
            </div>            
            <%            if (request.getAttribute("mensajeError") != null) {%>
            ${mensajeError}
            <% } else {%>
            ${mensajeExito}
            <% }
            %>
            <table class="table table-data2">
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>URL</th>
                    <th>Persona</th>
                    <th>Acciones</th>
                    <tr class="spacer"></tr>
                </tr>
                <%
                    DocumentosVO docVO = new DocumentosVO();
                    DocumentosDAO docDAO = new DocumentosDAO();
                    ArrayList<DocumentosVO> docuLista = docDAO.listar();
                    for (int i = 0; i < docuLista.size(); i++) {
                        docVO = docuLista.get(i);
                %>
                <tr class="tr-shadow">
                    <td> <%=docVO.getDocId()%> </td>
                    <td> <%=docVO.getDocNombre()%> </td>
                    <td> <%=docVO.getDocUrl()%> </td>
                    <td> <%=docVO.getDocPer()%> </td>
                    <td>
                        <form method="post" action="Documentos">
                            <input type="hidden" name="docId" value="<%=docVO.getDocId()%>">
                            <button class="btn btn-warning" name="opcion" value="3" >Editar</button>
                            <button class="btn btn-danger" name="opcion" value="4" onclick="return confirmar()">Eliminar</button>
                        </form>
                    </td>
                </tr>
                <%}%>
            </table>

        </div>
    </body>
</html>
