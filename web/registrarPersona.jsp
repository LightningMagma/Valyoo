<%-- 
    Document   : registrarPersona
    Created on : 17/03/2023, 02:57:20 PM
    Author     : Miguel Gil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Personas</title>
        <link href="Estilos/style.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
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

                        <h2>Registro de persona</h2>
                        <form action="Persona" method="post">
                            <img src="Estilos/tituloValyooConSlogan.png" alt="" width="70%"/>
                            <div class="input">
                                <input type="text" name="perDocumento" pattern="^[0-9]{7,10}" maxlength="10" minlength="3" title="Debe ingresar un número de documento" required placeholder="Número de documento" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');">
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
                                <input type="text" name="perNombre" pattern="[A-Za-z \s]+{3,30}" maxlength="30" title="Debe ingresar un nombre" required placeholder="Nombre" oninput="this.value = this.value.replace(/[^A-Za-z ]/g, '').replace(/(\..*)\./g, '$1');">
                            </div>
                            <div class="input">
                                <input type="text" name="perApellido" pattern="[a-zA-Z \s]+{3,30}" maxlength="30" title="Debe ingresar un apellido" required placeholder="Apellido" oninput="this.value = this.value.replace(/[^A-Za-z ]/g, '').replace(/(\..*)\./g, '$1');">
                            </div>
                            <div class="input">
                                <input type="email" name="perCorreo" maxlength="40" title="Debe ingresar un correo electrónico" required placeholder="Correo electrónico" oninput="this.value = this.value.replace(/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]/g, '').replace(/(\..*)\./g, '$1');">
                            </div>
                            <div class="input">
                                <input type="text" name="perTelefono" pattern="^[0-9]{7,15}$" title="Debe ingresar un número telefónico" required placeholder="Teléfono" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');">
                            </div>
                            <div class="input">
                                <input type="text" name="perDirección" pattern="^[^*/+?\¡¿!$%&().,:;_=<>^" title="No ingrese * / + _ ? u otros caracteres especiales" required placeholder="Dirección">
                            </div>
                            <div class="input">
                                <input type="password" name="perClave" pattern="^[A-Za-z0-9]{2,10}$" required placeholder="Ingrese la contraseña" >
                            </div>
                            <div class="input">
                                <input type="submit" value="Registrar">
                                <input name="opcion" type="hidden" value="1">
                            </div>

                            <%
                                if (request.getAttribute("mensajeError") != null) {%>
                            <h2>${mensajeError}</h2>
                            <%} else {%>
                            <h2>${mensajeExito}</h2>    
                            <%}
                            %>
                        </form>
                        <a href="landingpage.jsp">
                            <button class="btn btn-primary">Volver</button>
                        </a>
                    </div>
                </div>
            </div>
        </section>

        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <%
            if (request.getAttribute("MensajeError") != null) { %>
        ${MensajeError}
        <%} else {%>
        ${MensajeExito}
        <%}
        %>
    </body>
</html>
