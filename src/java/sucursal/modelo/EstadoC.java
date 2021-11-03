/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sucursal.modelo;

/**
 *
 * @author PC-LITE
 */
public class EstadoC {
private int id; 
private int subtotal; 
private int total; 
private String fecha; 
private int idcliente;

    public EstadoC() {
    }

    public EstadoC(int id, int subtotal, int total, String fecha, int idcliente) {
        this.id = id;
        this.subtotal = subtotal;
        this.total = total;
        this.fecha = fecha;
        this.idcliente = idcliente;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(int subtotal) {
        this.subtotal = subtotal;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(int idcliente) {
        this.idcliente = idcliente;
    }

    
    

}
