<%-- 
    Document   : actualizarPersona
    Created on : 22/03/2023, 02:06:09 PM
    Author     : APRENDIZ
--%>

<%@page import="ModeloVO.PersonaVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Persona</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link href="Estilos/Styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Actualizar Persona</h2>
        <%            PersonaVO perVO = (PersonaVO) request.getAttribute("personaEncontrada");

            if (perVO != null) {
        %>
        <section>
            <div class="color"></div>
            <div class="color"></div>
            <div class="color"></div>
            <div class="box">
                <div class="fondo" style="--i:0;"></div>
                <div class="fondo" style="--i:1;"></div>
                <div class="fondo" style="--i:2;"></div>
                <div class="fondo" style="--i:3;"></div>
                <div class="fondo" style="--i:4;"></div>
                <div class="fondo" style="--i:5;"></div>
                <div class="contenedor">
                    <div class="formulario">

                        <h2>Registro de persona</h2>
                        <form action="Persona" method="post">
                            <img src="Estilos/tituloValyooConSlogan.png" alt="" width="70%"/>
                            <div class="input">
                                <input type="text" name="perDocumento" pattern="^[0-9]{7,10}*$" title="Debe ingresar un número de documento" required placeholder="<%=perVO.getPerDocumento()%>">
                            </div>
                            <div class="input">
                                <select name="perTipoDocumento">
                                    <option>Tipo de documento...</option>
                                    <option value="Cedula de Ciudadania">C.C</option>
                                    <option value="Cedula de Extranjeria">C.E</option>
                                    <option value="Pasaporte">Pasaporte</option>
                                </select>
                            </div>
                            <div class="input">
                                <input type="text" name="perNombre" pattern="^[A-Za-z]{3,30}*$" title="Debe ingresar un nombre" required placeholder="<%=perVO.getPerNombre()%>">
                            </div>
                            <div class="input">
                                <input type="text" name="perApellido" pattern="^[A-Za-z]{3,30}*$" title="Debe ingresar un apellido" required placeholder="<%=perVO.getPerApellido()%>">
                            </div>
                            <div class="input">
                                <input type="text" name="perTelefono" pattern="^[0-9]{7,15}*$" title="Debe ingresar un número telefónico" required placeholder="<%=perVO.getPerTelefono()%>">
                            </div>
                            <div class="input">
                                <input type="text" name="perDirección" pattern="^[^*/+?\¡¿!$%&().,:;_=<>^" title="No ingrese * / + _ ? u otros caracteres especiales" required placeholder="<%=perVO.getPerDireccion()%>">
                            </div>
                            <div class="input">
                                <input type="password" name="perClave" pattern="^[0-9]{2,10}*$" required placeholder="<%=perVO.getPerDocumento()%>">
                            </div>
                            <div class="input">
                                <input type="submit" value="Actualizar">
                                <input name="opcion" type="hidden" value="2">
                            </div>
                        </form>
                        <a href="indexPersona.jsp">
                            <button class="btn btn-primary">Volver</button>
                        </a>
                    </div>
                </div>
            </div>
        </section>

        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

        <%}%>
        <%
            if (request.getAttribute("MensajeError") != null) {%>
        ${MensajeError}
        <% } else {%>
        ${MensajeExito}
        <% }
        %>
    </body>
</html>
