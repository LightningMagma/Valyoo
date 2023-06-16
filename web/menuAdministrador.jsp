<%-- 
    Document   : menuAdministrador
    Created on : Mar 27, 2023, 12:17:33 AM
    Author     : xJuanDa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menú administrador</title>
        <%@include file="Sesiones.jsp" %>
    </head>
    <body>
        <div class="container">
        <div class="main">
            <div class="row">
                <div class="col-md-12">
                    <div class="card text-center sidebar">
                        <div class="card-body">
                            <img src="img/perfil.png" class="rounded-circle" width="150">
                            <div class="mt-3">
                                <h2>Administrador</h2>
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
