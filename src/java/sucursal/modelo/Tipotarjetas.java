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
public class Tipotarjetas {
    
    private int id;
    private String tipo;

    public Tipotarjetas() {
    }

    
    
    public Tipotarjetas(int id, String tipo) {
        this.id = id;
        this.tipo = tipo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    
    
}
