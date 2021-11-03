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
import sucursal.modelo.Productos;
/**
 *
 * @author PC-LITE
 */
public class ProductosController {
     Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    
    public Productos ObtenerUnProducto(String id) {
        String sql = "select id,nombre,comercio from tblproducto where id=" + id;
                
       // List<Carrera> tabla = new ArrayList<>();
       Productos care = new Productos();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                 care = new Productos(rs.getInt(1), rs.getString(2),rs.getInt(3));
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
    
     public Productos ObtenerProductoNombre(String namecliente) {
        String sql = "select id,nombre,comercio from tblproducto where idcliente='" + namecliente + "'";
                
       // List<Carrera> tabla = new ArrayList<>();
       Productos care = new Productos();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                 care = new Productos(rs.getInt(1), rs.getString(2),rs.getInt(3));
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


    public List ObtenerProductos() {
        String sql = "select id,nombre,comercio from tblproducto order by id asc";
                
        List<Productos> tabla = new ArrayList<>();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Productos cliente = new Productos(rs.getInt(1), rs.getString(2),rs.getInt(3));
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
    
    
     
     public boolean eliminaProductos(String id) throws SQLException {
        String sql;
        sql = "delete from tblproducto WHERE id=" + id;
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
