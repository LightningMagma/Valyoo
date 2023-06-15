
<%-- 
    Document   : index
    Created on : Mar 14, 2023, 11:18:59 PM
    Author     : xJuanDa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar sesión</title>
        <link href="Estilos/style.css" rel="stylesheet" type="text/css"/>
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
                                <input type="password" name="perClave" pattern="^[a-z0-9_-]{3,18}$" required placeholder="Ingrese la contraseña">
                            </div>
                            <div class="input">
                                <input type="submit" value="Login">
                                <input name="opcion" type="hidden" value="4">
                            </div>
                            <p class="registrar">¿No tienes una cuenta? <a href="registrarPersona.jsp">Regístrate</a></p>
                            <%
                                if (request.getAttribute("mensajeError") != null) {%>
                            <h2>${mensajeError}</h2>
                            <%} else {%>
                            <h2>${mensajeExito}</h2>    
                            <%}
                            %>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <h1>Correo con javaMail</h1>
        <form method="post" action="EnvioCorreo">
            <table>
                <tr>
                    <td>Destino</td>
                    <td><input type="email" name="destino"></td>
                </tr>
                <tr>
                    <td>Asunto</td>
                    <td><input type="text" name="asunto"></td>
                </tr>
                <tr>
                    <td>Mensaje</td>
                    <td><textarea rows="10" name="mensaje"></textarea></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Enviar"> </td>
                </tr>
            </table>


        </form>

        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>