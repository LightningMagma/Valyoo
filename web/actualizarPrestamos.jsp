<%-- 
    Document   : actualizarPrestamos
    Created on : 22/03/2023, 03:04:51 PM
    Author     : APRENDIZ
--%>

<%@page import="ModeloVO.CuentaVO"%>
<%@page import="ModeloDAO.CuentaDAO"%>
<%@page import="ModeloVO.PrestamosVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Préstamo</title>
        <link href="Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Actualizar Préstamo</h2>
        <%            PrestamosVO presVO = (PrestamosVO) request.getAttribute("prestamoEncontrado");
            if (presVO != null) {
        %>
        <form method="post" action="Prestamo">
            <label>Codigo préstamo: </label>
            <input disabled="" type="text" name="PreId" maxlength="6" value="<%=presVO.getPreId()%>" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1')">
            <label>Fecha inicio: </label>
            <input type="date" name="PreFechaInicio" maxlength="10" value="<%=presVO.getPreFechaInicio()%>">
            <label>Fecha fin: </label>
            <input type="date" name="PreFechaFin" maxlength="10" value="<%=presVO.getPreFechaFin()%>">
            <label>Cuotas: </label>
            <input type="text" name="PreCuotas" maxlength="2" value="<%=presVO.getPreCuotas()%>"oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1')" >
            <label>Monto: </label>
            <input type="text" name="PreMonto" maxlength="10" value="<%=presVO.getPreMonto()%>" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1')">
            <label>Intereses: </label>
            <input type="text" name="PreInteres" maxlength="2" value="<%=presVO.getPreInteres()%>" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1')">
            <label>Cuenta: </label>
            <input disabled="" type="text" name="PreCuenta" maxlength="2" value="<%=presVO.getPreCuenta()%>" oninput="this.value = this.value.replace(/[^0-9]/g,'').replace(/(\..*)\./g, '$1')">
            <input type="submit" class="btn btn-success" value="Actualizar">
            <a href="indexPrestamos.jsp">
                <button class="btn btn-primary" type="button">Volver</button></a>
            <input type="hidden" name="opcion" value="2">
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
