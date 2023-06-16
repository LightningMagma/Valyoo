<%-- 
    Document   : Generador_Reporte
    Created on : 26/05/2023, 08:23:29 AM
    Author     : APRENDIZ
--%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.ConexionDB"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Estilos/logoValyoo.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            File reporte = new File(application.getRealPath("factura.jasper"));
            Map<String,Object> parametros = new HashMap<String,Object>();
            ConexionDB conexion =new ConexionDB();
            Connection conexionDB = conexion.obtenerConexion();
            
            byte[] bytes = JasperRunManager.runReportToPdf(reporte.getPath(), parametros,conexionDB);
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            response.setHeader("Content-Disposition","attachment; filename=\"reporte.pdf\";");
            ServletOutputStream salida = response.getOutputStream();
            salida.write(bytes, 0, bytes.length);
            salida.flush();
            salida.close();
        %>
    </body>
</html>
