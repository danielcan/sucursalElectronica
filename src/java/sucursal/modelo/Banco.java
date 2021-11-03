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
public class Banco {
    private int id;
    private String mision;
    private String vision;
    private String politicas;

    public Banco() {
    }
    

    public Banco(int id, String mision, String vision, String politicas) {
        this.id = id;
        this.mision = mision;
        this.vision = vision;
        this.politicas = politicas;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMision() {
        return mision;
    }

    public void setMision(String mision) {
        this.mision = mision;
    }

    public String getVision() {
        return vision;
    }

    public void setVision(String vision) {
        this.vision = vision;
    }

    public String getPoliticas() {
        return politicas;
    }

    public void setPoliticas(String politicas) {
        this.politicas = politicas;
    }
    
    

}
