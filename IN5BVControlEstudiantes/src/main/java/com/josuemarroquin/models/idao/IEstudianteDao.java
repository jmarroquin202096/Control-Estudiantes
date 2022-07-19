/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.josuemarroquin.models.idao;

import java.util.List;
import com.josuemarroquin.models.domain.Estudiante;

/**
 *
 * @author Daniel Marroquin
 */
public interface IEstudianteDao {
    
    //Declaracion de los Metodos para Acceder a la Base de Datos (CRUD)
    public List<Estudiante> listar();
    public Estudiante encontrar(Estudiante estudiante);
    public int insertar(Estudiante estudiante);
    public int actualizar(Estudiante estudiante);
    public int eliminar(Estudiante estudiante);
}
