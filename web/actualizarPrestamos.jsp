<%-- 
    Document   : actualizarPrestamos
    Created on : 22/03/2023, 03:04:51 PM
    Author     : APRENDIZ
--%>

<%@page import="ModeloVO.CuentaVO"%>
<%@page import="ModeloDAO.CuentaDAO"%>
<%@page import="ModeloVO.PrestamosVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Prestamo</title>
        <link href="Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Actualizar Prestamo</h1>
        <%
            PrestamosVO presVO = (PrestamosVO) request.getAttribute("prestamoEncontrado");
            if (presVO != null) {
        %>
        <form method="post" action="Prestamo">
            <label>Codigo prestamo: </label>
            <input type="text" name="PreId" maxlength="2" value="<%=presVO.getPreId()%>">
            <label>Fecha inicio: </label>
            <input type="text" name="PreFechaInicio" maxlength="10" value="<%=presVO.getPreFechaInicio()%>">
            <label>Fecha fin: </label>
            <input type="text" name="PreFechaFin" maxlength="10" value="<%=presVO.getPreFechaFin()%>">
            <label>Cuotas: </label>
            <input type="text" name="PreCuotas" maxlength="2" value="<%=presVO.getPreCuotas()%>">
            <label>Monto: </label>
            <input type="text" name="PreMonto" maxlength="10" value="<%=presVO.getPreMonto()%>">
            <label>Intereses: </label>
            <input type="text" name="PreInteres" maxlength="2" value="<%=presVO.getPreInteres()%>">
            <label>Cuenta: </label>
            <input type="text" name="PreCuenta" maxlength="2" value="<%=presVO.getPreCuenta()%>">
            <input type="submit" value="Actualizar">
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
        <a href="indexPrestamos.jsp">Volver</a>
    </body>
</html>
