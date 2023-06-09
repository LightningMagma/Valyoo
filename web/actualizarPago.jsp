<%-- 
    Document   : actualizarPago
    Created on : 21/03/2023, 01:15:24 PM
    Author     : APRENDIZ
--%>

<%@page import="ModeloVO.PagoVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Pago</title>
        <link href="Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Actualizar Pago</h2>
        <%            PagoVO pagVO = (PagoVO) request.getAttribute("pagoEncontrado");
            if (pagVO != null) {
        %>
        <form method="post" action="Pago">
            <table>                
                <input type="hidden" name="PagId" value="<%=pagVO.getPagId()%>">
                <label>Descripcion: </label>
                <input type="text" name="PagDesc" value="<%=pagVO.getPagDesc()%>" oninput="this.value = this.value.replace(/[^A-Za-z0-9 ]/g, '').replace(/(\..*)\./g, '$1')">
                <label>Valor: </label>
                <input type="text" name="PagValor" value="<%=pagVO.getPagValor()%>" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1')">
                <label>Prestamo abonado: </label>
                <input type="text" name="PagPrestamo" value="<%=pagVO.getPagPres()%>" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1')">
                <input type="submit" class="btn btn-success" value="Actualizar">
                <a href="indexPago.jsp">
                    <button class="btn btn-primary" type="button">Volver</button>
                </a>
                <input type="hidden" name="opcion" value="2">
            </table>
        </form>
        <% } %>
        <%
            if (request.getAttribute("mensajeError") != null) {%>
        ${MensajeError}
        <%  } else { %>
        ${MensajeExito}
        <%  }
        %>

    </body>
</html>
