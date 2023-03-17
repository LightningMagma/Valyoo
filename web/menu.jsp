<%-- 
    Document   : menu
    Created on : 17/03/2023, 02:37:57 PM
    Author     : APRENDIZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
        <link href="Estilos/MenuPrincipal.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
    <header>
      <div class="container">
        <nav>
          <ul>
            <li><a href="#">Inicio</a></li>
            <li><a href="#">Acerca de</a></li>
            <li><a href="#">Contacto</a></li>
          </ul>
        </nav>
      </div>
      <div class="hero">
        <h1>Mi página principal</h1>
        <p>En esta página podrás encontrar información sobre mí y mis intereses.</p>
      </div>
    </header>
    <main>
      <div class="container">
        <section>
          <h2>¿Quién soy?</h2>
          <p>Soy un desarrollador web apasionado por la creación de experiencias digitales increíbles.</p>
        </section>
        <section>
          <h2>Mis proyectos</h2>
          <ul>
            <li>
              <h3>Proyecto 1</h3>
              <p>Descripción del proyecto 1.</p>
            </li>
            <li>
              <h3>Proyecto 2</h3>
              <p>Descripción del proyecto 2.</p>
            </li>
            <li>
              <h3>Proyecto 3</h3>
              <p>Descripción del proyecto 3.</p>
            </li>
          </ul>
        </section>
        <section>
          <h2>Contáctame</h2>
          <form>
            <label for="nombre">Nombre</label>
            <input type="text" id="nombre" name="nombre" required>
            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>
            <label for="mensaje">Mensaje</label>
            <textarea id="mensaje" name="mensaje" required></textarea>
            <button type="submit">Enviar</button>
          </form>
        </section>
      </div>
    </main>
    <footer>
      <div class="container">
        <p>Derechos reservados © 2023</p>
      </div>
    </footer>
  </body>
    </body>
</html>
