/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sucursal.controlador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sucursal.modelo.Depositos;

/**
 *
 * @author PC-LITE
 */
public class DepositosController {
    
    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    
    public Depositos ObtenerUnDepositos(String id) {
        String sql = "select id,cantidad,cuentaEnvio,cuentaRecibido,iddeta from tbldepositos where id =" + id;
                
       // List<Carrera> tabla = new ArrayList<>();
       Depositos care = new Depositos();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                 care = new Depositos(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getInt(4),rs.getInt(5));
                //tabla.add(carrera);
            }
            rs.close();
            ps.close();
            cn.desconectar();
            return care;

        } catch (SQLException e) {
            System.out.println("error:" + e);
            return null;
        }

    }
    
     public Depositos ObtenerComercioNombre(String id) {
        String sql = "select id,cantidad,cuentaEnvio,cuentaRecibido,iddeta from tbldepositos where id='" + id + "'";
                
       // List<Carrera> tabla = new ArrayList<>();
       Depositos care = new Depositos();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                 care = new Depositos(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getInt(4),rs.getInt(5));
                //tabla.add(carrera);
            }
            rs.close();
            ps.close();
            cn.desconectar();
            return care;

        } catch (SQLException e) {
            System.out.println("error:" + e);
            return null;
        }

    }

     

    public List ObtenerDepositos() {
        String sql = "select id,cantidad,cuentaEnvio,cuentaRecibido,iddeta from tbldepositos order by id asc";
                
        List<Depositos> tabla = new ArrayList<>();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Depositos cliente = new Depositos(rs.getLong(1),rs.getInt(2),rs.getLong(3),rs.getLong(4),rs.getLong(5));
                tabla.add(cliente);
            }
            rs.close();
            ps.close();
            cn.desconectar();
            return tabla;

        } catch (SQLException e) {
            System.out.println("error:" + e);
            return null;
        }

    }
    
    
     public List ObtenerDepositostb(String id) {
       String sql = "select id,cantidad,cuentaEnvio,cuentaRecibido,iddeta from tbldepositos where iddeta =" + id + "  order by id asc";
                
        List<Depositos> tabla = new ArrayList<>();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Depositos cliente = new Depositos(rs.getLong(1),rs.getInt(2),rs.getLong(3),rs.getLong(4),rs.getLong(5));
                tabla.add(cliente);
            }
            rs.close();
            ps.close();
            cn.desconectar();
            return tabla;

        } catch (SQLException e) {
            System.out.println("error:" + e);
            return null;
        }

    } 
    
    
   
     
     public boolean eliminaDepositos(String id) throws SQLException {
        String sql;
        sql = "delete from tblcomercio WHERE id=" + id;
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            ps.close();
            cn.desconectar();

            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        ps.close();
        cn.desconectar();
        return false;
    }

    
     
     
    
}
