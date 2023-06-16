<%-- 
    Document   : recuperarContra
    Created on : Jun 16, 2023, 2:24:42 AM
    Author     : xJuanDa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recuperar contraseña</title>
        <link href="Estilos/style.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" >
    </head>
    <body>
        <section>
            <div class="color"></div>
            <div class="color"></div>
            <div class="color"></div>
            <div class="box">                
                <div class="contenedor">
                    <div class="formulario">
                        <h2>Recuperar contraseña</h2>
                        <form method="post" action="EnvioCorreo">
                            <img src="Estilos/tituloValyooConSlogan.png" alt="" width="70%"/>
                            <div class="input">
                                <input type="email" name="destino" title="Debe ingresar un correo electronico" required placeholder="Correo electronico" oninput="this.value = this.value.replace(/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]/g, '').replace(/(\..*)\./g, '$1');">
                            </div>                            
                            <div class="input">
                                <input type="submit" value="Recuperar">
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
                        <a href="index.jsp">
                            <button class="btn btn-primary">Volver</button>
                        </a>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
