<%-- 
    Document   : Sesiones
    Created on : Mar 23, 2023, 9:04:40 PM
    Author     : xJuanDa
--%>

<%@page import="ModeloVO.PagoVO"%>
<%@page import="ModeloVO.PrestamosVO"%>
<%@page import="ModeloVO.PersonaVO"%>
<%@page import="ModeloVO.CuentaVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="Estilos/css/font-face.css" rel="stylesheet" media="all">
        <link href="Estilos/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
        <link href="Estilos/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
        <link href="Estilos/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
        <link href="Estilos/botones.css" rel="stylesheet" type="text/css"/>
        <!-- Bootstrap CSS-->
        <link href="Estilos/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" type="text/css"/>

        <!-- Vendor CSS-->
        <link href="Estilos/vendor/animsition/animsition.min.css" rel="stylesheet" type="text/css"/>
        <link href="Estilos/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
        <link href="Estilos/vendor/wow/animate.css" rel="stylesheet" media="all">
        <link href="Estilos/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
        <link href="Estilos/vendor/slick/slick.css" rel="stylesheet" media="all">
        <link href="Estilos/vendor/select2/select2.min.css" rel="stylesheet" media="all">
        <link href="Estilos/vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

        <!-- Main CSS-->
        <link href="Estilos/css/theme.css" rel="stylesheet" media="all">
    </head>
    <%
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-control", "no-cache,no-store,must-revalidate");
        response.setDateHeader("Expires", 0);
    %>

    <%
        String persona = "";
        String documento = "";
        String apellido = "";
        String nuCuenta = "";
        String fechaInicio = "";
        String nuPrestamo = "";
        String cuotasPrestamo = "";
        String montoPrestamo = "";
        String interesPrestamo = "";
        String descripcionPago = "";
        String valorPago = "";
        String fechaPago = "";
        HttpSession buscarSesion = (HttpSession) request.getSession();
        if (buscarSesion.getAttribute("datosPersona") != null) {
            PersonaVO perVO = (PersonaVO) buscarSesion.getAttribute("datosPersona");
            persona = perVO.getPerNombre();
            apellido = perVO.getPerApellido();
            documento = perVO.getPerDocumento();

            if (buscarSesion.getAttribute("datosCuenta") != null) {
                CuentaVO cuVO = (CuentaVO) buscarSesion.getAttribute("datosCuenta");
                nuCuenta = cuVO.getCuNumero();
                fechaInicio = cuVO.getCuFechaRegistro();

                if (buscarSesion.getAttribute("datosPrestamo") != null) {
                    PrestamosVO presVO = (PrestamosVO) buscarSesion.getAttribute("datosPrestamo");
                    nuPrestamo = presVO.getPreId();
                    cuotasPrestamo = presVO.getPreCuotas();
                    montoPrestamo = presVO.getPreMonto();
                    interesPrestamo = presVO.getPreInteres();

                    if (buscarSesion.getAttribute("datosPago") != null) {
                        PagoVO pagVO = (PagoVO) buscarSesion.getAttribute("datosPago");
                        descripcionPago = pagVO.getPagDesc();
                        valorPago = pagVO.getPagValor();
                        fechaPago = pagVO.getPagFecha();
                    }
                }
            }
        } else {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }

    %>
    <body>
        <div>
            <h2>Bienvenido <%=persona%></h2>
            <form method="post" action="Sesiones">
                <input type="submit" value="Cerra Sesion">
            </form>
        </div>
        <div class="container">

            <a href="indexCuenta.jsp">Cuenta</a>
            <a href="indexSede.jsp">Sede</a>
            <a href="indexPersona.jsp">Persona</a>              
            <a href="indexDocumentos.jsp">Documentos</a>               
            <a href="indexPago.jsp">Pago</a>
            <a href="indexPersonaRol.jsp">Asignacion rol</a>               
            <a href="indexPrestamos.jsp">Prestamo</a>
            <a href="indexRol.jsp">Rol</a>
            <a href="indexSolicitud.jsp">Solicitud</a>               

        </div> 
        <script>
            function confirmar() {
                var respuesta = confirm("¿Desea eliminar el registro");
                if (respuesta == true) {
                    return true;
                } else {
                    return false;
                }
            }
        </script>
    </body>

</html>