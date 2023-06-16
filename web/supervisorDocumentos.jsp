<%-- 
    Document   : supervisorDocumentos
    Created on : 15/06/2023, 08:41:34 PM
    Author     : Miguel Gil
--%>

<%@page import="ModeloDAO.DocumentosDAO"%>
<%@page import="ModeloVO.DocumentosVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Estilos/logoValyoo.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Documentos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link href="Estilos/formularioConsulta.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="formularioConsulta">
            <h3 class="title-5 m-b-35">Documentos</h3>
            <form method="post" action="Documentos">
                <table class="table">
                    <tr>
                        <th>
                            Nombre persona:
                            <input type="text" id="myInput" onkeyup="myFunction()" name="docId" placeholder="Ingrese nombre de documento" oninput="this.value = this.value.replace(/[^A-Za-z ]/g, '').replace(/(\..*)\./g, '$1')">
                            <input type="submit" class="au-btn au-btn-icon au-btn--green au-btn--small" value="Consultar">
                        </th>
                    </tr>
                </table>
                <input type="hidden" name="opcion" value="3">            
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
            <table class="table table-data2" id="myTable">
                <tr>
                    <th>Persona</th>
                    <th>Nombre</th>
                    <th>URL</th>                    
                    <th></th>
                </tr>
                <%
                    DocumentosVO docVO = new DocumentosVO();
                    DocumentosDAO docDAO = new DocumentosDAO();
                    ArrayList<DocumentosVO> docuLista = docDAO.listar();
                    for (int i = 0; i < docuLista.size(); i++) {
                        docVO = docuLista.get(i);
                %>
                <tr class="tr-shadow">
                    <td> <%=docVO.getDocPer()%> </td>                    
                    <td> <%=docVO.getDocNombre()%> </td>
                    <td> <%=docVO.getDocUrl()%> </td>                    
                    <td>
                        <form method="post" action="Documentos">
                            <input type="hidden" name="docId" value="<%=docVO.getDocId()%>">
                        </form>
                    </td>
                </tr>
                <%}%>
            </table>

        </div>
    </body>
</html>
