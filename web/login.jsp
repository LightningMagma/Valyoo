
<%-- 
    Document   : index
    Created on : Mar 14, 2023, 11:18:59 PM
    Author     : xJuanDa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <link rel="icon" href="Estilos/logoValyoo.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar sesión</title>
        <link href="https://cdn.jsdelivr.net/npm/remixicon@2.2.0/fonts/remixicon.css" rel="stylesheet">
        <link href="Estilos/style.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" >
    </head>
    <body>
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

                        <h2>Inicio de sesión</h2>
                        <form action="Persona" method="post">
                            <img src="Estilos/tituloValyooConSlogan.png" alt="" width="70%"/>
                            <div class="input">
                                <input type="text" name="perDocumento" pattern="^[0-9]{7,10}*$" title="Debe ingresar un número de documento" required placeholder="Número de documento" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1')">
                            </div>
                            <div class="input">
                                <input type="password" id="password" name="perClave" pattern="^[a-z0-9_-]{3,18}$" required placeholder="Ingrese la contraseña">
                                <span class="input-icon-container">
                                    <i class="input-icon ri-eye-off-line" id="input-icon"></i>
                                </span>
                            </div>
                            <div class="input">
                                <input type="submit" value="Login">
                                <input name="opcion" type="hidden" value="4">
                            </div>
                            <p class="registrar">¿No tienes una cuenta? <a href="registrarPersona.jsp">Regístrate</a></p>
                            <p class="registrar">¿Olvidaste tu contraseña? <a href="recuperarContra.jsp">Recuperar</a></p>
                            <%
                                if (request.getAttribute("mensajeError") != null) {%>
                            <h2>${mensajeError}</h2>
                            <%} else {%>
                            <h2>${mensajeExito}</h2>    
                            <%}
                            %>
                        </form>
                        <a href="index.jsp">
                            <button class="btn btn-primary">Volver</button>
                        </a>
                    </div>
                </div>
            </div>
        </section>   
                        
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="main.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>