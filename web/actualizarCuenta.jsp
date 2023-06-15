<%-- 
    Document   : actualizarCuenta
    Created on : Mar 22, 2023, 9:26:24 PM
    Author     : xJuanDa
--%>

<%@page import="ModeloVO.CuentaVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar cuenta</title>
        <link href="Estilos/Styles.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <h2>Actualizar Cuenta</h2>
        <%            CuentaVO cueVO = (CuentaVO) request.getAttribute("cuentaEncontrada");
            if (cueVO != null) {
        %>
        <form method="post" action="Cuenta">            
            <input type="hidden" name="CuNumero" maxlength="11" value="<%=cueVO.getCuNumero()%>" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1')">
            <label>Fecha registro de cuenta:</label>
            <input type="text" name="CuFechaRegistro" maxlength="10" value="<%=cueVO.getCuFechaRegistro()%>">
            <label>Deudor: </label>
            <input type="text" name="CuPersona" maxlength="11" value="<%=cueVO.getCuPersona()%>" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1')">           
            <input type="submit" class="btn btn-success" value="Actualizar">
            <a href="indexCuenta.jsp">
                <button class="btn btn-primary" type="button">Volver</button>
            </a> 
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

    </div> 
    <%@include file="footer.jsp" %>
</body>
</html>
