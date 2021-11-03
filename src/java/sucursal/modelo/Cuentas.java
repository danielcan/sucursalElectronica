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
public class Cuentas {
    private int id;
    private int saldo;
    private int idcliente;

    public Cuentas(int id, int saldo, int idcliente) {
        this.id = id;
        this.saldo = saldo;
        this.idcliente = idcliente;
    }

    public Cuentas() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSaldo() {
        return saldo;
    }

    public void setSaldo(int saldo) {
        this.saldo = saldo;
    }

    public int getIdCliente() {
        return idcliente;
    }

    public void setIdCliente(int idcliente) {
        this.idcliente = idcliente;
    }
    
    
    
}
