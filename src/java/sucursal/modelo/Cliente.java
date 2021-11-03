/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sucursal.modelo;

/**
 *
 * @author AdminCis
 */
public class Cliente {
    private int id;
    private String nombreC;
    private String fechaIngreso;
    private String telefono;
    private String identidad;
    

    public Cliente() {
    }

    public Cliente(int id, String nombreC, String fechaIngreso, String telefono, String identidad) {
        this.id = id;
        this.nombreC = nombreC;
        this.fechaIngreso = fechaIngreso;
        this.telefono = telefono;
        this.identidad = identidad;
       
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombreC() {
        return nombreC;
    }

    public void setNombreC(String nombreC) {
        this.nombreC = nombreC;
    }

    public String getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(String fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getIdentidad() {
        return identidad;
    }

    public void setIdentidad(String identidad) {
        this.identidad = identidad;
    }

    
}
