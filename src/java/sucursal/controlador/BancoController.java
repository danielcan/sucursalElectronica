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
import sucursal.modelo.Banco;
/**
 *
 * @author PC-LITE
 */
public class BancoController {
    
    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    
    public Banco ObtenerUnBanco(String id) {
        String sql = "select id,mision,vision,politicas from banco where id = " + id;
                
       // List<Carrera> tabla = new ArrayList<>();
       Banco care = new Banco();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                 care = new Banco(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getString(4));
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
    
     public Banco ObtenerBancoNombre(String namecliente) {
        String sql = "select id,mision,vision,politicas from banco where id= '" + namecliente + "'";
                
       // List<Carrera> tabla = new ArrayList<>();
       Banco care = new Banco();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                 care = new Banco(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getString(4));
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
    

    public List ObtenerBanco() {
        String sql = "select id,mision,vision,politicas from banco order by id asc";
                
        List<Banco> tabla = new ArrayList<>();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Banco banco = new Banco(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getString(4));
                tabla.add(banco);
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
    
    
     public boolean eliminaBanco(String id) throws SQLException {
        String sql;
        sql = "delete from tblbanco WHERE id=" + id;
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
