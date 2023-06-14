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
            <input type="text" name="PagDesc" maxlength="30" placeholder="Ingresé la descripción del pago" title="Debe la descipcion del pago" required oninput="this.value = this.value.replace(/[^A-Za-z0-9 ]/g, '').replace(/(\..*)\./g, '$1')"> 
            <label>Valor: </label>
            <input type="text" name="PagValor" maxlength="10" placeholder="Ingresé la cantidad a pagar" pattern="^[0-9]{5,10}$" title="Debe ingresar un monto adecuado" required oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1')">
            <label>Préstamo: </label>
            <select name="PagPrestamo">
                <option>Seleccione...</option>
                <%                    PrestamosDAO presDAO = new PrestamosDAO();
                    for (PrestamosVO presVO : presDAO.listarPrestamosActivos()) {
                %>
                <option value="<%=presVO.getPreId()%>"><%="Numero de prestamo: "+presVO.getPreId()+" Deudor: "+presVO.getPreCuenta()%></option>
                <% } %>
            </select>
            <input type="submit" class="btn btn-success" value="Registrar pago">
            <input type="reset" class="btn btn-danger" value="Borrar">
            <a href="indexPago.jsp">
                <button class="btn btn-primary" type="button">Volver</button>
            </a>
            <input type="hidden" name="opcion" value="1">            
        </form>
        <%
            if (request.getAttribute("MensajeError") != null) { %>
        ${MensajeError}
        <%  } else { %>
        ${MensajeExito}
        <%  }
        %>

    </body>
</html>
