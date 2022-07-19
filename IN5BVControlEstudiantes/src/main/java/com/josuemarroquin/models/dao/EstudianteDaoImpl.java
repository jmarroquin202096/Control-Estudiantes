/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.josuemarroquin.models.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.josuemarroquin.db.Conexion;
import com.josuemarroquin.models.domain.Estudiante;
import com.josuemarroquin.models.idao.IEstudianteDao;

/**
 *
 * @author Josué Daniel Marroquín Hernández <jmarroquin-2020296@kinal.edu.gt>
 * @date 19-ago-2021
 * @time 17:30:41 Codigo Tecnico: IN5BV Carnet: 2020296
 */
public class EstudianteDaoImpl implements IEstudianteDao {

    private static final String SQL_SELECT = "SELECT id_estudiante, nombre, apellido, email, telefono, saldo FROM estudiante";
    private static final String SQL_DELETE = "DELETE FROM estudiante WHERE id_estudiante = ?";
    private static final String SQL_INSERT = "INSERT INTO estudiante(nombre, apellido, email, telefono, saldo) VALUES (?, ?, ?, ?, ?)";
    private static final String SQL_SELECT_BY_ID = "SELECT id_estudiante, nombre, apellido, email, telefono, saldo FROM estudiante WHERE id_estudiante = ?";
    private static final String SQL_UPDATE = "UPDATE estudiante SET nombre = ?, apellido = ?, email = ?, telefono = ?, saldo = ? WHERE id_estudiante = ?";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Estudiante estudiante = null;
    List<Estudiante> listaEstudiantes = new ArrayList<>();

    @Override
    public List<Estudiante> listar() {

        try {
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_SELECT);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int idEstudiante = rs.getInt("id_estudiante");
                String nombre = rs.getString("nombre");
                String apellido = rs.getString("apellido");
                String email = rs.getString("email");
                String telefono = rs.getString("telefono");
                double saldo = rs.getDouble("saldo");

                estudiante = new Estudiante(idEstudiante, nombre, apellido, email, telefono, saldo);
                listaEstudiantes.add(estudiante);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(pstmt);
            Conexion.close(conn);
        }
        return listaEstudiantes;
    }

    @Override
    public Estudiante encontrar(Estudiante estudiante) {
        try {
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_SELECT_BY_ID);
            pstmt.setInt(1, estudiante.getIdEstudiante());
            System.out.println(pstmt.toString());
            rs = pstmt.executeQuery();

            while (rs.next()) {

                String nombre = rs.getString("nombre");
                String apellido = rs.getString("apellido");
                String email = rs.getString("email");
                String telefono = rs.getString("telefono");
                double saldo = rs.getDouble("saldo");

                /*utilizar metodos Set*/
                estudiante.setNombre(nombre);
                estudiante.setApellido(apellido);
                estudiante.setEmail(email);
                estudiante.setTelefono(telefono);
                estudiante.setSaldo(saldo);

                listaEstudiantes.add(estudiante);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(pstmt);
            Conexion.close(conn);
        }
        return estudiante;
    }

    @Override
    public int insertar(Estudiante estudiante) {

        int rows = 0;

        try {
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_INSERT);
            pstmt.setString(1, estudiante.getNombre());
            pstmt.setString(2, estudiante.getApellido());
            pstmt.setString(3, estudiante.getEmail());
            pstmt.setString(4, estudiante.getTelefono());
            pstmt.setDouble(5, estudiante.getSaldo());
            System.out.println(pstmt.toString());
            rows = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(pstmt);
            Conexion.close(conn);
        }

        return rows;
    }

    @Override
    public int actualizar(Estudiante estudiante) {
        int rows = 0;

        try {
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_UPDATE);
            pstmt.setString(1, estudiante.getNombre());
            pstmt.setString(2, estudiante.getApellido());
            pstmt.setString(3, estudiante.getEmail());
            pstmt.setString(4, estudiante.getTelefono());
            pstmt.setDouble(5, estudiante.getSaldo());
            pstmt.setInt(6, estudiante.getIdEstudiante());
            System.out.println(pstmt.toString());
            rows = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(pstmt);
            Conexion.close(conn);
        }

        return rows;
    }

    @Override
    public int eliminar(Estudiante estudiante) {
        int rows = 0;
        try {
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_DELETE);
            pstmt.setInt(1, estudiante.getIdEstudiante());
            System.out.println(pstmt.toString());
            rows = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conexion.close(pstmt);
            Conexion.close(conn);
        }
        return rows;
    }

}
