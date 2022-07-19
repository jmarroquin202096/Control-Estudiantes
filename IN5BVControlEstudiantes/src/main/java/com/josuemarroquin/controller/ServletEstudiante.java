/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.josuemarroquin.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import java.util.List;
import com.josuemarroquin.models.dao.EstudianteDaoImpl;
import com.josuemarroquin.models.domain.Estudiante;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Josué Daniel Marroquín Hernández <jmarroquin-2020296@kinal.edu.gt>
 * @date 25-ago-2021
 * @time 13:54:26 Codigo Tecnico: IN5BV Carnet: 2020296
 */
@WebServlet("/ServletEstudiante")
public class ServletEstudiante extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        System.out.println("\nDoPost");
        String accion = request.getParameter("accion");

        System.out.println("Accion:" + accion);

        if (accion != null) {
            switch (accion) {
                case "insertar": {
                    try {
                        insertarEstudiante(request, response);
                    } catch (SQLException ex) {
                        Logger.getLogger(ServletEstudiante.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                break;
                case "actualizar":
                {
                    try {
                        actualizarEstudiante(request, response);
                    } catch (SQLException ex) {
                        Logger.getLogger(ServletEstudiante.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                    break;

            }
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        /*List<Estudiante> listaEstudiante;
        listaEstudiante = new EstudianteDaoImpl().listar();
        for (Estudiante estudiante : listaEstudiante) {
            System.out.println(estudiante);
        }*/

        String accion = request.getParameter("accion");
        if (accion != null) {
            switch (accion) {
                case "listar": {
                    try {
                        listarEstudiante(request, response);
                    } catch (SQLException ex) {
                        Logger.getLogger(ServletEstudiante.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                break;

                case "editar": {
                    editarEstudiante(request, response);
                }
                break;

                case "eliminar": {
                    try {
                        eliminarEstudiante(request, response);
                    } catch (SQLException ex) {
                        Logger.getLogger(ServletEstudiante.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                break;

            }
        }
    }

    private void listarEstudiante(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        List<Estudiante> listaEstudiante = new EstudianteDaoImpl().listar();

        HttpSession seccion = request.getSession();

        seccion.setAttribute("listaEstudiantes", listaEstudiante);
        seccion.setAttribute("saldoTotal", getsaldoTotal());
        seccion.setAttribute("cantidadEstudiantes", getcantEstudiantes());

        response.sendRedirect("estudiantes/estudiante.jsp");

    }

    public double getsaldoTotal() throws SQLException {

        List<Estudiante> listaEstudiante = new EstudianteDaoImpl().listar();

        double saldoTotal = 0;

        for (Estudiante e : listaEstudiante) {
            saldoTotal = saldoTotal + e.getSaldo();
        }

        return saldoTotal;
    }

    public int getcantEstudiantes() {

        List<Estudiante> listaEstudiante = new EstudianteDaoImpl().listar();

        int cantEstudiantes = listaEstudiante.size();

        return cantEstudiantes;
    }

    private void eliminarEstudiante(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        //Recuperar Id Estudiante eliminado
        int idEstudiante = Integer.parseInt(request.getParameter("idEstudiante"));

        //Crear objeto tipo Estudiante
        Estudiante estudiante = new Estudiante(idEstudiante);

        int registroEliminados = new EstudianteDaoImpl().eliminar(estudiante);
        System.out.println("Cantidad de registros eliminados: " + registroEliminados);

        //Llamar al Metodo Listar Estudiante
        listarEstudiante(request, response);
    }

    private void insertarEstudiante(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        System.out.println("\nInsertar");
        /*Primera Opcion para Ingresar datos como en JavaFX*/
        /*Estudiante estudiante = new Estudiante();
        estudiante.setNombre(request.getParameter("nombre"));
        estudiante.setApellido(request.getParameter("apellido"));
        estudiante.setEmail(request.getParameter("email"));
        estudiante.setTelefono(request.getParameter("telefono"));

        if ((request.getParameter("saldo") != null) && (!request.getParameter("saldo").equals(""))) {

            estudiante.setSaldo(Double.parseDouble(request.getParameter("saldo")));
        }

        System.out.println(estudiante);

        int resgistrosIngresados = new EstudianteDaoImpl().insertar(estudiante);

        System.out.println("registors insertados" + resgistrosIngresados);

        listarEstudiante(request, response);
         */

        /*Segunda Opcion para Ingresar Datos*/
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String telefono = request.getParameter("telefono");
        String saldoStr = request.getParameter("saldo");
        double saldo = 0;
        if ((saldoStr != null) && (!saldoStr.equals(""))) {
            saldo = Double.parseDouble(saldoStr);
        }

        /*Crear el Objeto Estudiante utilizanco el Bean*/
        Estudiante estrudiante2 = new Estudiante(nombre, apellido, email, telefono, saldo);
        System.out.println(estrudiante2);

        /*Ingresar el Nuevo Registro en la Base de Datos*/
        int registrosIngresados = new EstudianteDaoImpl().insertar(estrudiante2);

        /*Imprimir Datos en Consola*/
        System.out.println("registors insertados" + registrosIngresados);

        /*Listar Estudiantes*/
        listarEstudiante(request, response);
    }

    private void editarEstudiante(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Recuperar Id Estudiante Editado
        int idEstudiante = Integer.parseInt(request.getParameter("idEstudiante"));

        /*Crear Objeto Estudiante*/
        Estudiante estudiante = new EstudianteDaoImpl().encontrar(new Estudiante(idEstudiante));

        request.setAttribute("estudiante", estudiante);
        request.getRequestDispatcher("estudiantes/editar_estudiante.jsp").forward(request, response);

    }

    private void actualizarEstudiante(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        //Recuperar Id Estudiante Editado
        int idEstudiante = Integer.parseInt(request.getParameter("idEstudiante"));
                
        /*Actualizar Datos*/
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String telefono = request.getParameter("telefono");
        String saldoStr = request.getParameter("saldo");
        double saldo = 0;
        if ((saldoStr != null) && (!saldoStr.equals(""))) {
            saldo = Double.parseDouble(saldoStr);
        }
        Estudiante estrudiante2 = new Estudiante(idEstudiante, nombre, apellido, email, telefono, saldo);
        System.out.println(estrudiante2);
        
        /*Crear Objeto Estudiante*/
        int registroActualizado = new EstudianteDaoImpl().actualizar(estrudiante2);

        listarEstudiante(request, response);
    }
}
