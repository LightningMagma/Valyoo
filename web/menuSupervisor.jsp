<%-- 
    Document   : menuSupervisor
    Created on : Mar 26, 2023, 11:23:04 PM
    Author     : xJuanDa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu supervisor</title>        
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
                                    <h2>Supervisor</h2>
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
