<%-- 
    Document   : estudiante
    Created on : 25-ago-2021, 15:11:10
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
        <link rel="stylesheet" href="../assets/css/style.css">
        <link href="https://fonts.googleapis.com/css2?family=Cabin:ital@1&family=Comfortaa:wght@700&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/f90d3bf50d.js"></script>

        <!--Bootstrap CSS -->
        <link rel="stylesheet" href="../assets/css/bootstrap.css">

        <title>Lista Estudiantes</title>

    </head>
    <body id="body_Kinal">

        <!-- Cabecera -->
        <jsp:include page="/WEB-INF/Paginas/Comunes/Cabecera.jsp"/>

        <header id="main-header" class="py-2 bg-info text-white text-center">
            <div class="conteiner">
                <div class="row">
                    <div class="col-12 col-md-12">
                        <h1>
                            <i class="fas fa-user-cog"></i>  Control Estudiantes
                        </h1>
                    </div>
                </div>
            </div>
        </header>
        <section id="acciones" class="py-4 mb-4">
            <div class="conteiner">
                <div class="row">
                    <div class="col-12">
                        <a class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#agregar_estudiante_Modal">
                            <i class="fas fa-user-plus"></i>  Agregar
                        </a>
                    </div>
                </div>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="agregar_estudiante_Modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header text-white bg-dark">
                            <h5 class="modal-title" id="exampleModalLabel">Agregar Nuevo Registro</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form method="POST" action="${pageContext.request.contextPath}/ServletEstudiante">
                            <div class="modal-body bg-dark text-dark">
                                <div class="form-floating mb-3">
                                    <input type="text" id="nombre" name="nombre" class="form-control" placeholder="Nombre">
                                    <label for="nombre" class="form-label">Nombre</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="text" id="apellido" name="apellido" class="form-control" placeholder="Apellido">
                                    <label for="apellido" class="form-label">Apellido</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="email" id="email" name="email" class="form-control" placeholder="Correo Electronico">
                                    <label for="email" class="form-label">Correo Electronico</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="tel" id="telefono" name="telefono" class="form-control" placeholder="Telefono">
                                    <label for="telefono" class="form-label">Telefono</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="number" id="saldo" name="saldo" class="form-control" step="any" placeholder="Saldo">
                                    <label for="saldo" class="form-label">Saldo</label>
                                </div>
                                <input type="hidden" name="accion" value="insertar">
                            </div>
                            <div class="modal-footer bg-dark">
                                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                                <button type="submit" class="btn btn-primary">Guardar</button>
                            </div>

                        </form>

                    </div>
                </div>
            </div>

        </section>
        <section id="estudiantes">
            <div class="conteiner">
                <div class="row">
                    <div class="col-12 col-md-9">
                        <table class="table table-dark table-hover table-borderless table-sm">
                            <thead class="text-white">
                                <tr>
                                    <th>#</th>
                                    <th>Nombre Completo</th>
                                    <th>Saldo</th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="estudiante" items="${listaEstudiantes}">
                                    <tr>
                                        <td>${estudiante.idEstudiante}</td>
                                        <td>${estudiante.nombre} ${estudiante.apellido}</td>
                                        <td>${estudiante.saldo}</td>
                                        <td>
                                            <a class="btn btn-outline-info" href="${pageContext.request.contextPath}/ServletEstudiante?accion=eliminar&idEstudiante=${estudiante.idEstudiante}">
                                                <i class="fas fa-user-times"></i>  Eliminar</a>
                                        </td>
                                        <td>
                                            <a class="btn btn-outline-info"" href="${pageContext.request.contextPath}/ServletEstudiante?accion=editar&idEstudiante=${estudiante.idEstudiante}">
                                                <i class="fas fa-user-edit"></i>  Editar</a>
                                        </td>
                                        <td></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-12 col-md-3">
                        <div class="row">
                            <div class="card text-center bg-transparent text-info mb-3">
                                <div class="card-body">
                                    <h3>Saldo Total</h3>
                                    <h4 class="display-4">
                                        <fmt:formatNumber value="${saldoTotal}" type="currency"/>     
                                    </h4>
                                </div>
                            </div>
                            <div class="card text-center bg-transparent text-info mb-3">
                                <div class="card-body">
                                    <div class="row">
                                        <h3>Cantidad Estudiantes</h3>
                                        <h4 class="display-4">
                                            <a id="i_iconos">
                                                <i class="fas fa-users"></i>
                                                ${cantidadEstudiantes}</a>
                                        </h4>
                                    </div>
                                </div>
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
