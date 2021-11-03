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
public class Tarjetas {
    private int id;
    private String nombre;
    private String fechaVen;
    private String numero;
    private int tipo;
    private int cuenta;

    public Tarjetas() {
    }

    
    
    public Tarjetas(int id, String nombre, String fechaVen, String numero, int tipo, int cuenta) {
        this.id = id;
        this.nombre = nombre;
        this.fechaVen = fechaVen;
        this.numero = numero;
        this.tipo = tipo;
        this.cuenta = cuenta;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getFechaVen() {
        return fechaVen;
    }

    public void setFechaVen(String fechaVen) {
        this.fechaVen = fechaVen;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public int getCuenta() {
        return cuenta;
    }

    public void setCuenta(int cuenta) {
        this.cuenta = cuenta;
    }
    
    
}
