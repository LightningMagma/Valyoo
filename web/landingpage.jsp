<%-- 
    Document   : landingpage
    Created on : 24/03/2023, 08:03:34 AM
    Author     : Miguel Gil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Estilos/landing.css" type="text/css">
    <title>Valyoo</title>
</head>
<body>
    <header>
        <div class="container">
            <h3><img src="Estilos/tituloValyoo.png" alt="Título Valyoo" width="175px"></h3>
            <ul>
                <a href="index.jsp"><li>Iniciar Sesión</li></a>
                <a href="registrarPersona.jsp"><li>Registrarse</li></a>
            </ul>
        </div>
    </header>
    <section class="hero">
        <h1>Bienvenido a mi Landing Page</h1>
        <p>Descubre nuestros servicios y lo que podemos hacer por ti.</p>
      </section>
      
      <section class="services">
        <h2>Servicios</h2>
        <ul>
          <li>
            <h3>Control Documental</h3>
          </li>
          <li>
            <h3>Automatización de procesos</h3>
          </li>
          <li>
            <h3>Almacenamiento de datos</h3>
          </li>
        </ul>
      </section>
      
      <section class="about">
        <h2>Acerca de nosotros</h2>
        <p>Somos una empresa dedicada a brindar soluciones para tu negocio.</p>
        <p>Contamos con un equipo altamente capacitado para ofrecerte los mejores servicios.</p>
      </section>
      
      <footer>
        <p>Derechos reservados &copy; 2023</p>
      </footer>
</body>
</html>
