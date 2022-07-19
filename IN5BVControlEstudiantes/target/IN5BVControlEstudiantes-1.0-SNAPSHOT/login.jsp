<%-- 
    Document   : login
    Created on : 13-sep-2021, 19:09:22
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
        <title>Login</title>
    </head>
    <body id="body_Kinal">
        <header id="kinal_header">
            <h1>Centro Educativo y Técnico Laboral KINAL</h1>
        </header>
        <section>
            <div class="row g-0">
                <div class="col-sm-7 d-none d-sm-block">
                    <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
                            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
                        </div>
                        <div class="carousel-inner">
                            <div class="carousel-item active" data-bs-interval="10000">
                                <img src="assets/images/kinalcar1.png" class="d-block w-100" alt="...">
                                <div class="carousel-caption d-none d-md-block">
                                    <h5 class="font-weight-bold">Centro Educativo y Laboral Kinal</h5>
                                    <a class="text-muted text-decoration-none">Trabajo Bien Hecho!</a>
                                </div>
                            </div>
                            <div class="carousel-item" data-bs-interval="2000">
                                <img src="assets/images/kinalcar2.png" class="d-block w-100" alt="...">
                                <div class="carousel-caption d-none d-md-block">
                                    <h5 class="font-weight-bold">Centro Educativo y Laboral Kinal</h5>
                                    <a class="text-muted text-decoration-none">Trabajo Bien Hecho!</a>
                                </div>
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
                <div class="col-lg-5 bg-dark d-flex flex-column align-items-end min-vh-100">
                    <div class="align-self-center w-100 px-lg-5 py-lg-4 p-4">
                        <div class="card bg-transparent">
                            <div class="card-header">
                                <h1 class="text-white text-center"><i class="fas fa-user-circle"></i>  Login</h1>
                            </div>
                            <div class="card-body">
                                <div class="form-floating mb-3">
                                    <input type="text" id="user" name="user" class="form-control" placeholder="Username">
                                    <label for="user" class="form-label">Username</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="password" class="form-control" id="password" class="form-control" placeholder="Password">
                                    <label for="password" class="form-label">Password</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked">
                                    <label class="form-check-label text-white" for="flexSwitchCheckChecked">Recordar Usuario</label>
                                </div>
                                <div class="d-grid gap-5 col-6 mx-auto">
                                    <a href="${pageContext.request.contextPath}/inicio.jsp" class="btn btn-outline-info"><i class="fas fa-sign-in-alt"></i>    Login</a>
                                </div>
                            </div>
                            <div class="card-footer text-muted text-center">
                                Para Poder Ingresar Debes Logearte
                            </div>
                        </div>
                    </div>
                </div>
        </section>

        <!-- Pie de Pagina -->
        <jsp:include page="/WEB-INF/Paginas/Comunes/Pie-Pagina.jsp"/>

        <script src="../assets/js/jquery-3.6.0.js"></script>
        <script src="../assets/js/bootstrap.bundle.js"></script>
    </body>
</html>
