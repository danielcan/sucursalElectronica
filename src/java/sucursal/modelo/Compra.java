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
public class Compra {
   private int id;
private int idproducto;
private int idcomercio ;
private int idtarjeta ;
private int idcliente ;
private int valor;

    public Compra() {
    }

    public Compra(int id, int idproducto, int idcomercio, int idtarjeta, int idcliente, int valor) {
        this.id = id;
        this.idproducto = idproducto;
        this.idcomercio = idcomercio;
        this.idtarjeta = idtarjeta;
        this.idcliente = idcliente;
        this.valor = valor;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(int idproducto) {
        this.idproducto = idproducto;
    }

    public int getIdcomercio() {
        return idcomercio;
    }

    public void setIdcomercio(int idcomercio) {
        this.idcomercio = idcomercio;
    }

    public int getIdtarjeta() {
        return idtarjeta;
    }

    public void setIdtarjeta(int idtarjeta) {
        this.idtarjeta = idtarjeta;
    }

    public int getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(int idcliente) {
        this.idcliente = idcliente;
    }

    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }
        


}
