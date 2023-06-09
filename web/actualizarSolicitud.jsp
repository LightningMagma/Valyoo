<%-- 
    Document   : actualizarSolicitud
    Created on : Mar 20, 2023, 10:47:49 PM
    Author     : xJuanDa
--%>

<%@page import="com.sun.prism.shader.Solid_TextureYV12_Loader"%>
<%@page import="ModeloVO.SolicitudVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar solicitud</title>
        <link href="Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Actualizar solicitud</h2>
        <%            SolicitudVO solVO = (SolicitudVO) request.getAttribute("solicitudEncontrada");
            if (solVO != null) {
        %>
        <form method="post" action="Solicitud">            
            <input type="hidden" name="solId" required maxlength=20 value="<%=solVO.getSolId()%>">           
            <label for="solMonto">Monto:</label>
            <input type="text" name="solMonto" required value="<%=solVO.getSolMonto()%>">  
            <label for="solCuotas">Cuotas:</label>
            <input type="text" name="solCuotas" required value="<%=solVO.getSolCuotas()%>"> 
            <label for="solInteres">Solicitud persona:</label>
            <input type="text" name="solPersona" required value="<%=solVO.getSolPersona()%>"> 
            <label for="solEstado">Estado solicitud:</label>
            <input type="text" name="solEstado" required value="<%=solVO.getSolEstado()%>"> 

            <input type="submit" class="btn btn-success" value="Actualizar"> 
            <a href="indexSolicitud.jsp">
                <button class="btn btn-primary" type="button">Volver</button>
            </a>
            <input type="hidden" name="opcion" value="2">
        </form>

        <%}%>
        <%
                if (request.getAttribute("mensajeError") != null) {%>
        <h2>${mensajeError}</h2>
        <%} else {%>
        <h2>${mensajeExito}</h2>    
        <%}
        %>
        
    </body>
</html>
