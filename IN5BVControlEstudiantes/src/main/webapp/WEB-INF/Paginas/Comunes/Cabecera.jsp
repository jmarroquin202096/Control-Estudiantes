<%-- 
    Document   : Cabecera
    Created on : 01-sep-2021, 18:13:27
    Author     : Daniel Marroquin
--%>
<header id="kinal_header">
    <h1>Centro Educativo y Técnico Laboral KINAL</h1>
</header>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Menú</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/inicio.jsp"><i class="fas fa-home"></i>-Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/ServletEstudiante?accion=listar"><i class="fas fa-user"></i>-Estudiantes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="#"><i class="fas fa-book"></i>-Materias</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fas fa-calendar-alt"></i>-Inscripciones</a>
                </li>
            </ul>
            <span class="navbar-text">
                <i class="fab fa-kickstarter-k"></i>    Bienvenido a Kinal ._.
            </span>
        </div>
    </div>
</nav>