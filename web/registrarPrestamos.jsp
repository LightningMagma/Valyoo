<%-- 
    Document   : registrarPrestamos
    Created on : 21/03/2023, 02:51:02 PM
    Author     : APRENDIZ
--%>

<%@page import="ModeloVO.CuentaVO"%>
<%@page import="ModeloDAO.CuentaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Prestamo</title>
        <link href="Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Registrar Prestamo</h2>
        <form method="post" action="Prestamo">
            <label>Fecha inicio: </label>
            <input type="date" name="PreFechaInicio" maxlength="10" placeholder="0000-00-00">
            <label>Fecha fin: </label>
            <input type="date" name="PreFechaFin" maxlength="10" placeholder="0000-00-00">
            <label>Cuotas: </label>
            <input type="text" name="PreCuotas" maxlength="2" placeholder="Ingrese las cuotas del pestamo" required pattern="[0-9]{1,2}" title="Debe ingresar una cantidad valida" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1')">
            <label>Monto: </label>
            <input type="text" name="PreMonto" maxlength="10" placeholder="Ingresé el monto" required pattern="[0-9]{6,10}" title="Debe ingresar un monto adecuado"  oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1')">
            <label>Intereses: </label>
            <input type="text" name="PreInteres" maxlength="4" placeholder="Ingresé los intereses" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1')">
            <label>Cuenta: </label>
            <select name="PreCuenta">
                <option>Seleccione...</option>
                <%                    CuentaDAO cuDAO = new CuentaDAO();
                    for (CuentaVO cuVO : cuDAO.listarCuentasActivas()) {
                %>
                <option value="<%=cuVO.getCuNumero()%>"><%="Numero de cuenta: " + cuVO.getCuNumero() + " Titular: " + cuVO.getCuPersona()%></option>
                <% }%>
            </select>
            <input type="submit" class="btn btn-success" value="Registrar prestamo">
            <input type="reset" class="btn btn-danger" value="Borrar">
            <a href="indexPrestamos.jsp">
                <button class="btn btn-primary" type="button">Volver</button>
            </a>
            <input type="hidden" name="docreg" value="<%=documento%>">
            <input type="hidden" name="opcion" value="1">
            <%
                if (request.getAttribute("MensajeError") != null) { %>
            ${MensajeError}
            <%  } else { %>
            ${MensajeExito}
            <%  }
            %>
        </form>

    </body>
</html>
