<%-- 
    Document   : registrarPago
    Created on : 17/03/2023, 02:49:17 PM
    Author     : APRENDIZ
--%>

<%@page import="ModeloVO.PrestamosVO"%>
<%@page import="ModeloDAO.PrestamosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Pago</title>
        <link href="Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Registrar Pago</h2>
        <form method="post" action="Pago">
            <label>Descripción: </label>
            <input type="text" name="PagDesc" maxlength="30" placeholder="Ingresé la descripción del pago">
            <label>Valor: </label>
            <input type="text" name="PagValor" maxlength="10" placeholder="Ingresé la cantidad a pagar">
            <label>Préstamo: </label>
            <select name="PagPrestamo">
                <option>Seleccione...</option>
                <%                    PrestamosDAO presDAO = new PrestamosDAO();
                    for (PrestamosVO presVO : presDAO.listarPrestamos()) {
                %>
                <option value="<%=presVO.getPreId()%>"><%=presVO.getPreId()%></option>
                <% } %>
            </select>
            <input type="submit" value="Registrar pago">
            <input type="reset" value="Borrar">
            <input type="hidden" name="opcion" value="1">            
        </form>
        <%
                if (request.getAttribute("MensajeError") != null) { %>
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
