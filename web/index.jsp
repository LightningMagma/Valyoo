<%-- 
    Document   : landingpage
    Created on : 24/03/2023, 08:03:34 AM
    Author     : Miguel Gil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="h-100">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.84.0">
        <title>Valyoo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" >
        <link href="Estilos/landingPage.css" rel="stylesheet" type="text/css"/>
        <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/cover/">



        <!-- Bootstrap core CSS -->
        <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
        </style>    
        <!-- Custom styles for this template -->
        <link href="cover.css" rel="stylesheet">
    </head>
    <body class="d-flex h-100 text-center text-white bg-dark">

        <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
            <header class="mb-auto">
                <div>
                    <h3><img src="Estilos/tituloValyoo.png" alt="Título Valyoo" width="175px"></h3>
                    <h3 class="float-md-start mb-0">Valyoo</h3>
                    <nav class="nav nav-masthead justify-content-center float-md-end">
                        <a class="nav-link active" aria-current="page" href="index.jsp">Inicio</a>
                        <a class="nav-link" href="login.jsp">Iniciar Sesión</a>
                        <a class="nav-link" href="registrarPersona.jsp">Registrarse</a>
                    </nav>
                </div>
            </header>
            <main class="px-3">
                <h1>Bienvenido a Valyoo</h1>
                <p class="lead">Somos una empresa dedicada a brindar soluciones para tu negocio.</p>
                <p class="lead">
                    <a href="#" class="btn btn-lg btn-secondary fw-bold border-white bg-white">Descubre más</a>
                </p>
            </main>

            <footer class="mt-auto text-white-50">
                <p>Cover template for <a href="https://getbootstrap.com/" class="text-white">Valyoo</a></p>
            </footer>
        </div>
    </body>
</html>

