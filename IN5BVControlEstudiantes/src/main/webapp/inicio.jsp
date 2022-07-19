<%-- 
    Document   : Index
    Created on : 25-ago-2021, 14:20:28
    Author     : Daniel Marroquin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./assets/css/style.css">
        <link href="https://fonts.googleapis.com/css2?family=Cabin:ital@1&family=Comfortaa:wght@700&display=swap" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://kit.fontawesome.com/f90d3bf50d.js"></script>
        <!--Bootstrap CSS -->
        <link rel="stylesheet" href="./assets/css/bootstrap.css">
        <title>Control Estudiante - Inicio</title>
    </head>
    <body id="body_Kinal">
        
                            <!-- Cabecera -->
        <jsp:include page="/WEB-INF/Paginas/Comunes/Cabecera.jsp"/>
        
        <main>
            <section id = "contenido">
                <p class = "descripcion">
                    Kinal es un Centro Educativo privado, no lucrativo, dirigido a la formación técnica profesional de
                    jóvenes y adultos, de beneficio colectivo y asistencia social en favor de los sectores más necesitados
                    de la comunidad.
                </p>

                <img id="kinal_img_principal" src="./assets/images/principal.png">

                <p class = "descripcion">
                    Nuestro valor fundamental es enseñar a realizar el trabajo bien hecho, que sea la base de la
                    superación de alumnos y el medio para servir a los demás.
                </p>

                <br>
            </section>
        </main>
        
                            <!-- Pie de Pagina -->
         <jsp:include page="/WEB-INF/Paginas/Comunes/Pie-Pagina.jsp"/>

        <script src="../assets/js/jquery-3.6.0.js"></script>
        <script src="../assets/js/bootstrap.bundle.js"></script>

    </body>
</html>
