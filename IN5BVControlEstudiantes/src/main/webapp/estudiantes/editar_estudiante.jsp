<%-- 
    Document   : editar_estudiante
    Created on : 09-sep-2021, 16:52:08
    Author     : Daniel Marroquin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="es_GT"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="./assets/css/style.css">
        <link href="https://fonts.googleapis.com/css2?family=Cabin:ital@1&family=Comfortaa:wght@700&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/f90d3bf50d.js"></script>

        <!--Bootstrap CSS -->
        <link rel="stylesheet" href="./assets/css/bootstrap.css">

        <title>Editar Estudiantes</title>

    </head>
    <body id="body_Kinal">

        <!-- Cabecera -->
        <jsp:include page="/WEB-INF/Paginas/Comunes/Cabecera.jsp"/>

        <header id="main-header" class="py-2 bg-info text-white text-center">
            <div class="conteiner">
                <div class="row">
                    <div class="col-12 col-md-12">
                        <h1>
                            <i class="fas fa-user-edit"></i>  Editar Estudiantes
                        </h1>
                    </div>
                </div>
            </div>
        </header>
        <section id="actions" class="py-4 mb-4 bg-dark">
            <div class="conteiner">
                <div class="row">
                    <div class="col-md-3">
                        <a href="${pageContext.request.contextPath}/ServletEstudiante?accion=listar" class="btn btn-outline-info"><i class="fas fa-reply"></i>     Regresar a Estudiantes</a>
                    </div>
                </div>
            </div>
        </section>
        <main>
            <div class="conteiner">
                <div class="row">
                    <div class="col-12">
                        <div class="card bg-dark">
                            <div class="card-body">
                                <form method="POST" action="${pageContext.request.contextPath}/ServletEstudiante">
                                    <div class="form-floating mb-3">
                                        <input type="text" id="nombre" name="nombre" class="form-control" placeholder="Nombre" value="${estudiante.nombre}">
                                        <label for="nombre" class="form-label">Nombre</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="text" id="apellido" name="apellido" class="form-control" placeholder="Apellido" value="${estudiante.apellido}">
                                        <label for="apellido" class="form-label">Apellido</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="email" id="email" name="email" class="form-control" placeholder="Correo Electronico" value="${estudiante.email}">
                                        <label for="email" class="form-label">Correo Electronico</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="tel" id="telefono" name="telefono" class="form-control" placeholder="Telefono" value="${estudiante.telefono}">
                                        <label for="telefono" class="form-label">Telefono</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="number" id="saldo" name="saldo" class="form-control" step="any" placeholder="Saldo" value="${estudiante.saldo}">
                                        <label for="saldo" class="form-label">Saldo</label>
                                    </div>
                                    <input type="hidden" name="accion" value="actualizar">
                                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                                    <button type="submit" class="btn btn-primary">Guardar</button>

                                    <input type="hidden" name="idEstudiante" value="${estudiante.idEstudiante}">
                                    <input type="hidden" name="accion" value="actualizar">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>


        <!-- Pie de Pagina -->
        <jsp:include page="/WEB-INF/Paginas/Comunes/Pie-Pagina.jsp"/>

        <script src="../assets/js/jquery-3.6.0.js"></script>
        <script src="../assets/js/bootstrap.bundle.js"></script>

    </body>
</html>
