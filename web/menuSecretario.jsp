<%-- 
    Document   : menuSecretario
    Created on : Mar 23, 2023, 11:27:48 PM
    Author     : xJuanDa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Estilos/logoValyoo.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menú Secretario</title>
    </head>
    <body>
        <%            if (request.getAttribute("MensajeError") != null) { %>
        <div class="alert alert-danger" role="alert">
            ${MensajeError}
        </div>            
        <%  } else { %>
        <div class="alert alert-success" role="alert">
            ${MensajeExito}
        </div>            
        <%  }
        %> 
        <div class="container">
            <div class="main">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card text-center sidebar">
                            <div class="card-body">
                                <img src="img/perfil.png" class="rounded-circle" width="150">
                                <div class="mt-3">
                                    <h2>Secretario</h2>
                                    <hr>
                                    <h3><%=persona%> <%=apellido%></h3>
                                    <hr>
                                    <h2>Documento</h2>
                                    <hr>
                                    <h3><%=documento%></h3>
                                </div>
                            </div>
                        </div>
                    </div>                
                </div>
            </div>
        </div>
    </body>
</html>
