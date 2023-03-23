<%-- 
    Document   : consultarCuenta
    Created on : 21/03/2023, 09:57:26 PM
    Author     : jpgar
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.CuentaDAO"%>
<%@page import="ModeloVO.CuentaVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar cuenta</title>
        <link href="Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="menu.jsp" />
        <h2>Cuenta</h2>
        <form method="post" action="Cuenta">
            <label>Codigo: </label>
            <input type="text" name="CuNumero">
            <input type="submit" value="Consultar">
            <input type="hidden" name="opcion" value="4">
        </form>
        <%
            if (request.getAttribute("MensajeError") != null) { %>
        ${MensajeError}
        <%  } else { %>
        ${MensajeExito}
        <%  }
        %>
        <form method="post" action="Cuenta">
            <table border="1"><br>
                <tr>
                    <th>CODIGO</th>
                    <th>FECHA REGISTRO</th>
                    <th>ESTADO</th>
                    <th>PERSONA</th>
                </tr>
                <%
                    CuentaVO cuVO = new CuentaVO();
                    CuentaDAO cuDAO = new CuentaDAO();
                    ArrayList<CuentaVO> listaCuenta = cuDAO.listarCuenta();
                    for (int i = 0; i < listaCuenta.size(); i++) {
                        cuVO = listaCuenta.get(i);
                %>
                <tr>
                    <td><%=cuVO.getCuNumero()%></td>
                    <td><%=cuVO.getCuFechaRegistro()%></td>
                    <td><%=cuVO.getCuEstado()%></td>
                    <td><%=cuVO.getCuPersona()%></td>                 
                </tr>
                <% }%>
            </table>
        </form>
    </body>
</html>
