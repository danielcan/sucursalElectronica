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
import sucursal.modelo.Tarjetas;
/**
 *
 * @author PC-LITE
 */
public class TarjetasController {
      Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    
    public Tarjetas ObtenerUnTarjeta(String idcliente) {
        String sql = "select id,nombre,fechaVen,numero,tipo,cuenta from tbltarjeta where id =" + idcliente;
                
       // List<Carrera> tabla = new ArrayList<>();
       Tarjetas care = new Tarjetas();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                 care = new Tarjetas(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5),rs.getInt(6));
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
    
     public Tarjetas ObtenerClienteNombre(String namecliente) {
        String sql = "select id,nombre,fechaVen,numero,tipo,cuenta from tbltarjeta where id='" + namecliente + "'";
                
       // List<Carrera> tabla = new ArrayList<>();
       Tarjetas care = new Tarjetas();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                 care = new Tarjetas(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5),rs.getInt(6));
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

    public List ObtenerTarjetas() {
        String sql = "select id,nombre,fechaVen,numero,tipo,cuenta from tbltarjeta order by id asc";
                
        List<Tarjetas> tabla = new ArrayList<>();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Tarjetas cliente = new Tarjetas(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5),rs.getInt(6));
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
    
   
     public boolean eliminaTarjetas(String id) throws SQLException {
        String sql;
        sql = "delete from tbltarjeta WHERE id = " + id;
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
