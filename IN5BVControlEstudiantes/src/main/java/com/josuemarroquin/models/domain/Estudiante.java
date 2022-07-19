/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.josuemarroquin.models.domain;

/**
 *
 * @author Josué Daniel Marroquín Hernández <jmarroquin-2020296@kinal.edu.gt>
 * @date 19-ago-2021
 * @time 17:04:03
 * Codigo Tecnico: IN5BV
 * Carnet: 2020296
 */
public class Estudiante {
    
    /* Declaracion de Variables */
    private int idEstudiante;
    private String nombre;
    private String apellido;
    private String email;
    private String telefono;
    private double saldo;

    /* Constructor Vacio o Nulo */
    public Estudiante() {
    }

    /* Constructor solo Id */
    public Estudiante(int idEstudiante) {
        this.idEstudiante = idEstudiante;
    }
    
    /* Constructor con Variables Necesarias */
    public Estudiante(String nombre, String apellido, String email, String telefono, double saldo) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.telefono = telefono;
        this.saldo = saldo;
    }

    /* Constructor con Todas las Variable */
    public Estudiante(int idEstudiante, String nombre, String apellido, String email, String telefono, double saldo) {
        this.idEstudiante = idEstudiante;
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.telefono = telefono;
        this.saldo = saldo;
    }

    /* Metodos GET y SET */
    public int getIdEstudiante() {
        return idEstudiante;
    }

    public void setIdEstudiante(int idEstudiante) {
        this.idEstudiante = idEstudiante;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public double getSaldo() {
        return saldo;
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }
    
    /* Metodo ToString */
    @Override
    public String toString() {
        return "Estudiante{" + "idEstudiante=" + idEstudiante + ", nombre=" + nombre + ", apellido=" + apellido + ", email=" + email + ", telefono=" + telefono + ", saldo=" + saldo + '}';
    }
    
}
