<%-- 
    Document   : menuDeudor
    Created on : 24/03/2023, 12:53:06 AM
    Author     : jpgar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="Estilos/profile.css" >
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
                <div class="col-md-4 mt-1">
                    <div class="card text-center sidebar">
                        <div class="card-body">
                            <img src="img/perfil.png" class="rounded-circle" width="150">
                            <div class="mt-3">
                                <h2>Deudor</h2>
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
                <div class="col-md-8 -mt-1">
                    <div class="card mb-3 content">
                        <h1 class="m-3 pt-3">Crédito</h1>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-3">
                                    <h5>No. Crédito</h5>
                                </div>
                                <div class="col-md-9 text-secondary">
                                    <%=nuPrestamo%>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-md-3">
                                    <h5>Cuotas</h5>
                                </div>
                                <div class="col-md-9 text-secondary">
                                    <%=cuotasPrestamo%>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-md-3">
                                    <h5>Monto</h5>
                                </div>
                                <div class="col-md-9 text-secondary">
                                    <%=montoPrestamo%>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-md-3">
                                    <h5>Intereses</h5>
                                </div>
                                <div class="col-md-9 text-secondary">
                                    <%=interesPrestamo%>%
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card mb-3 content">
                        <h1 class="m-3">Último Pago</h1>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-3">
                                    <h5>Descripción</h5>
                                </div>
                                <div class="col-md-9 text-secondary">
                                    <%=descripcionPago%>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-md-3">
                                    <h5>Valor</h5>
                                </div>
                                <div class="col-md-9 text-secondary">
                                    <%=valorPago%>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-md-3">
                                    <h5>Fecha y hora</h5>
                                </div>
                                <div class="col-md-9 text-secondary">
                                    <%=fechaPago%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>