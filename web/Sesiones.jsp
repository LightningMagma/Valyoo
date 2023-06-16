<%-- 
    Document   : Sesiones
    Created on : Mar 23, 2023, 9:04:40 PM
    Author     : xJuanDa
--%>

<%@page import="ModeloDAO.PerRolDAO"%>
<%@page import="ModeloVO.PerRolVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloVO.PagoVO"%>
<%@page import="ModeloVO.PrestamosVO"%>
<%@page import="ModeloVO.PersonaVO"%>
<%@page import="ModeloVO.CuentaVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Valyoo</title>
        <link href="Estilos/estilonavland.css" rel="stylesheet" type="text/css"/>
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

        <link href="Estilos/formularioConsulta.css" rel="stylesheet" type="text/css"/>

    </style>
</head>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-control", "no-cache,no-store,must-revalidate");
    response.setDateHeader("Expires", 0);
%>

<%
    PerRolDAO prDAO = new PerRolDAO();
    PerRolVO prVO = new PerRolVO();
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
//if unificar. poner genericos. yo me entiendo. dejelo ahi, ya vuelvo. sigan viendo
            }
        }
    } else {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    ArrayList<PerRolVO> listaPerRoles = prDAO.listarPerRol(documento);
%>
<body>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    <div class="topnav" id="myTopnav">
        <a class="imagenNav" href="landingpage.jsp"><img src="Estilos/tituloValyoo.png"  alt="Título Valyoo" width="175px"></a>
            <%for (int i = 0; i < listaPerRoles.size(); i++) {
                    prVO = listaPerRoles.get(i);
                    if (prVO.getPRRol().equals("1")) {%> 
        <a href="menuAdministrador.jsp">Perfil</a>
        <a href="indexPersona.jsp">Persona</a>
        <a href="indexRol.jsp">Rol</a>
        <a href="indexSede.jsp">Sede</a>    
        <a href="indexPersonaRol.jsp">Asignacion rol</a>
        <a href="javascript:void(0);" class="icon" onclick="myFunctione()">
            <i class="fa fa-bars"></i>
        </a>       
        <%}
            if (prVO.getPRRol().equals("2")) {%>
        <a href="menuSupervisor.jsp">Perfil</a>
        <a href="indexCuenta.jsp">Cuenta</a>
        <a href="registrarPrestamos.jsp">Prestamo</a>       
        <a href="indexPago.jsp">Pago</a>
        <a href="supervisorDocumentos.jsp">Documentos</a>
        <a href="javascript:void(0);" class="icon" onclick="myFunctione()">
            <i class="fa fa-bars"></i>
        </a>       
        <%}
            if (prVO.getPRRol().equals("3")) {%>          
        <a href="menuSecretario.jsp">Perfil</a>
        <a href="indexSolicitud.jsp">Solicitud</a>
        <a href="pagoSecretario.jsp">Pago</a> 
        <a href="secretarioDocumentos.jsp">Documentos</a>
        <a href="javascript:void(0);" class="icon" onclick="myFunctione()">
            <i class="fa fa-bars"></i>
        </a>       
        <%}
            if (prVO.getPRRol().equals("4")) {%>        
        <a href="menuDeudor.jsp">Perfil</a>
        <a href="solicitudDeudor.jsp">Solicitud</a>
        <a href="javascript:void(0);" class="icon" onclick="myFunctione()">
            <i class="fa fa-bars"></i>
        </a>
        <%}
            }
        %>
    </div>
    <h4 class="nombreSesion"> Bienvenido <%= persona + " " + apellido + " Rol: " + prVO.getPRRol()%> </h4>
    <section class="botonCerrar">
        <form method="post" action="Sesiones" class="botonCerrar" style="margin-left:10%;">
            <input class="btn btn-danger cerrarSesion" type="submit" value="Cerrar Sesión" style="margin-top: 2%;">
        </form>
    </section>
    <script>
        function confirmarCambioEstado() {
            var respuesta = confirm("¿Desea cambiar el estado del registro?");
            if (respuesta == true) {
                return true;
            } else {
                return false;
            }
        }
        function confirmar() {
            var respuesta = confirm("¿Está seguro de eliminar el registro?");
            if (respuesta == true) {
                return true;
            } else {
                return false;
            }
        }
    </script>
    <script>
        function myFunction() {
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[0];
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }

        function myFunctione() {
            var x = document.getElementById("myTopnav");
            if (x.className === "topnav") {
                x.className += " responsive";
            } else {
                x.className = "topnav";
            }
        }
    </script>
</body>
</html>