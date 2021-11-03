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
public class Depositos {
    private long id;
    private int cantidad;
    private long cuentaEnvio;
    private long cuentaRecibido;
    private long iddeta;

    public Depositos(long id, int cantidad, long cuentaEnvio, long cuentaRecibido, long iddeta) {
        this.id = id;
        this.cantidad = cantidad;
        this.cuentaEnvio = cuentaEnvio;
        this.cuentaRecibido = cuentaRecibido;
        this.iddeta = iddeta;
    }

    public Depositos() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public long getCuentaEnvio() {
        return cuentaEnvio;
    }

    public void setCuentaEnvio(long cuentaEnvio) {
        this.cuentaEnvio = cuentaEnvio;
    }

    public long getCuentaRecibido() {
        return cuentaRecibido;
    }

    public void setCuentaRecibido(long cuentaRecibido) {
        this.cuentaRecibido = cuentaRecibido;
    }

    public long getIddeta() {
        return iddeta;
    }

    public void setIddeta(long iddeta) {
        this.iddeta = iddeta;
    }

   
    
    
    
}
