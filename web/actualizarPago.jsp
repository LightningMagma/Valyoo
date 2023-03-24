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
        <h1>Actualizar Pago</h1>
        <%
            PagoVO pagVO = (PagoVO) request.getAttribute("pagoEncontrado");
            if (pagVO != null) {
        %>
        <form method="post" action="Pago">
            <table>
                <label>Descripcion: </label><br>
                <input type="text" name="PagDesc" value="<%=pagVO.getPagDesc()%>">
                <label>Valor: </label><br>
                <input type="text" name="PagValor" value="<%=pagVO.getPagValor()%>">
                <label>Prestamo abonado: </label><br>
                <input type="text" name="PagPrestamo" value="<%=pagVO.getPagPres()%>">
                <input type="submit" value="Actualizar">
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
        <a href="indexPago.jsp">
            <button class="btn btn-primary">Volver</button>
        </a>
    </body>
</html>
